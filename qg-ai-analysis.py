import json
import os
import mysql.connector
import pandas as pd
import ollama
import chromadb
from chromadb.utils import embedding_functions
import streamlit as st
from dataclasses import dataclass, asdict
import re
from fuzzywuzzy import fuzz

# -------------------
# MySQL Configurations
# -------------------
MYSQL_HOST = "localhost"
MYSQL_PORT = 3306
MYSQL_USER = "root"
MYSQL_PASSWORD = "Chayan@1340"
MYSQL_DATABASE = "vishanti"

# -------------------
# Attributes Map 
# -------------------
ATTRIBUTE_MAP = {
    "RPSF_LBR_WD_ATTR": "Rate per Sqft",
    "RAT_WD_ATTR": "Rate",
    "RAT_OTH_ATTR": "Rate",
    "RAT_FC_ATTR": "Rate",
    "QNT_ACCS_ATTR": "Quantity",
    "QUA_LF_ATTR": "Quantity",
    "PPU_ACCS_ATTR": "Price/Unit",
    "PPU_LF_ATTR": "Price/Unit",
    "PRI_LBR_WD_ATTR": "Price",
    "MES_WD_ATTR": "Measurement",
    "MES_OTH_ATTR": "Measurement",
    "MES_FC_ATTR": "Measurement",
    "MAT_WD_ATTR": "Material",
    "FIN_WD_ATTR": "Finish",
    "DES_ACCS_ATTR": "Description",
    "DES_FC_ATTR": "Description",
    "DES_LF_ATTR": "Description",
    "DES_WD_ATTR": "Description",
    "DES_OTH_ATTR": "Description",
    "BRD_ACCS_ATTR": "Brand",
}

# -------------------
# DTO
# -------------------
@dataclass
class EstimatorDTO:
    user_id: str
    estimator_id: str
    room_name: str
    item_name: str
    amount: float
    area: str
    project_name: str
    attributes: dict[str, any]
    item_identifier: str

# -------------------
# Fetch data into DTO
# -------------------
def fetch_estimator_dtos() -> list[EstimatorDTO]:
    conn = mysql.connector.connect(
        host=MYSQL_HOST,
        port=MYSQL_PORT,
        user=MYSQL_USER,
        password=MYSQL_PASSWORD,
        database=MYSQL_DATABASE,
        auth_plugin="mysql_native_password"
    )

    query = """
        SELECT  
            e.id AS estimator_id, 
            r.name AS room_name, 
            i.name AS item_name, 
            e.amount AS estimator_amount,
            i.id,
            i.amount AS amount, 
            a.city AS area,
            p.name AS project_name,
            i.attributes,
            i.identifier as item_identifier ,
            e.user_id
        FROM vishanti.item i
        JOIN vishanti.room r ON r.id = i.room_id
        JOIN vishanti.estimator e ON e.id = r.estimator_id
        JOIN zeus.project p ON e.project_id = p.id
        JOIN zeus.address a ON a.project_id = p.id
        Left JOIN shield.internal_users iu on e.user_id = iu.user_id
        where iu.user_id is NULL;
    """

    cursor = conn.cursor(dictionary=True)
    cursor.execute(query)
    rows = cursor.fetchall()
    conn.close()

    dtos = []
    for row in rows:
        parsed_attrs = parse_item_attributes(row.get("attributes"))
        dto = EstimatorDTO(
            user_id=str(row.get("user_id", "")),
            estimator_id=str(row["estimator_id"] or ""),
            room_name=str(row["room_name"] or ""),
            item_name=str(row["item_name"] or ""),
            amount=float(row["amount"] or 0),
            area=str(row["area"] or ""),
            project_name=str(row["project_name"] or ""),
            item_identifier=str(row.get("item_identifier", "")),
            attributes=parsed_attrs
        )
        dtos.append(dto)

    return dtos

# -------------------
# Parse Attributes
# -------------------
def parse_item_attributes(attr_json: str) -> dict:
    try:
        attrs = json.loads(attr_json or "{}")
    except Exception:
        return {}

    parsed = {}
    for key, val in attrs.items():
        label = ATTRIBUTE_MAP.get(key, key)
        if isinstance(val, dict):
            if key.startswith("MES_"):
                width = val.get("width")
                length = val.get("length")
                unit = val.get("selectedOption", "")
                if width and length:
                    parsed[label] = f"{width}x{length} {unit}".strip()
                elif unit:
                    parsed[label] = unit
            elif "value" in val and "selectedOption" in val:
                parsed[label] = f"{val['value']} {val['selectedOption']}".strip()
            elif "value" in val:
                parsed[label] = str(val["value"])
            elif "selectedOption" in val:
                parsed[label] = str(val["selectedOption"])
            else:
                parsed[label] = " ".join(f"{k}:{v}" for k, v in val.items() if v not in (None, "", "null"))
        else:
            if val not in (None, "", "null"):
                parsed[label] = str(val)

    return parsed

def attributes_to_text(attrs: dict) -> str:
    return ", ".join(f"{k} {v}" for k, v in attrs.items()) if attrs else ""

# -------------------
# Generate AI Description
# -------------------
def generate_ai_desc(dto: EstimatorDTO) -> str:
    prompt = f"""
Generate a short, human-readable description of the estimator item. only description 
DO NOT add any introductory phrases like "Here is a description" or "The item is".
Only provide the description itself.
Estimator ID: {dto.estimator_id}
Project: {dto.project_name}
Room: {dto.room_name}
Item: {dto.item_name}
Amount: {dto.amount}
Area: {dto.area}
Attributes: {attributes_to_text(dto.attributes)}
"""
    try:
        response = ollama.chat(model="llama3", messages=[{"role": "user", "content": prompt}])
        desc = response["message"]["content"].strip()
        return desc
    except Exception as e:
        return f"{dto.item_name} in {dto.room_name} (description generation failed)"

# -------------------
# AI Filter
# -------------------

def ai_filter(df, query: str, threshold: int = 50):
    """
    Filters the DataFrame using fuzzy matching for string columns.
    Returns rows where the query matches sufficiently with any string column.
    
    Parameters:
        df: pd.DataFrame
        query: str, user search query
        threshold: int, minimum match score (0-100) to consider a match
    """
    try:
        # Ensure numeric columns are numeric
        if 'amount' in df.columns:
            df['amount'] = pd.to_numeric(df['amount'], errors='coerce')

        string_cols = df.select_dtypes(include='object').columns.tolist()
        st.write("Fields considered for fuzzy matching:", string_cols)

        # Compute max fuzzy match score across all string columns
        mask = df[string_cols].apply(
            lambda row: max(fuzz.partial_ratio(str(val).lower(), query.lower()) for val in row),
            axis=1
        ) >= threshold

        filtered_df = df[mask]

        return filtered_df.reset_index(drop=True)

    except Exception as e:
        st.error(f"AI filter parsing failed: {e}")
        return pd.DataFrame()

def prepare_df_for_ai(df: pd.DataFrame) -> pd.DataFrame:
    df = df.copy()
    
    # Convert all dict columns to string
    for col in df.columns:
        if df[col].apply(lambda x: isinstance(x, dict)).any():
            df[col] = df[col].apply(lambda x: json.dumps(x, ensure_ascii=False) if isinstance(x, dict) else x)
    
    # Ensure numeric columns are numeric
    if 'amount' in df.columns:
        df['amount'] = pd.to_numeric(df['amount'], errors='coerce')
    
    return df

def get_min_max_prices(df: pd.DataFrame, group_by: str = "area"):
    """
    Returns a DataFrame with min and max prices per item_identifier,
    grouped by the selected attribute (area/city or measurement).
    
    Parameters:
        df: DataFrame containing item data
        group_by: "area" or "Measurement"
    """
    if group_by not in df.columns:
        st.warning(f"Column '{group_by}' not found. Defaulting to 'area'.")
        group_by = "area"

    # Ensure amount is numeric
    df['amount'] = pd.to_numeric(df['amount'], errors='coerce')

    # Group by item_identifier + selected column
    grouped = df.groupby(['item_identifier', group_by]).agg(
        min_price=('amount', 'min'),
        max_price=('amount', 'max')
    ).reset_index()

    return grouped


# -------------------
# Dashboard
# -------------------
def show_dashboard(dtos, client):
    st.title("📊 Estimator Dashboard with AI Search")

    # -------------------
    # Prepare DataFrame
    # -------------------
    raw_df = pd.DataFrame([{**asdict(dto), **dto.attributes} for dto in dtos])
    df = prepare_df_for_ai(raw_df)

    # Add AI-generated description column once
    if "ai_desc" not in df.columns:
        df["ai_desc"] = [generate_ai_desc(dto) for dto in dtos]

    # -------------------
    # AI Search
    # -------------------
    st.sidebar.header("🔍 Search")
    query = st.sidebar.text_input("Enter search query", key="search_query")
    run_search = st.sidebar.button("Run Search")

    search_results = pd.DataFrame()  # default empty
    if run_search and query:
        search_results = ai_filter(df, query)
        if not search_results.empty:
            # Optional: drop duplicates
            search_results = search_results.drop_duplicates(subset=["user_id", "estimator_id", "item_name", "amount"])
            st.subheader(f"Search Results for: '{query}'")
            st.dataframe(search_results)
        else:
            st.warning("⚠️ No matching results found.")

    # -------------------
    # Min/Max Price Analysis
    # -------------------
    st.sidebar.header("📊 Price Analysis")
    group_option = st.sidebar.selectbox(
        "Group min/max prices by:",
        options=["area", "Measurement"]
    )
    run_price_analysis = st.sidebar.button("Compute Min/Max Prices")

    if run_price_analysis:
        price_df = get_min_max_prices(df, group_by=group_option)
        st.subheader(f"Min/Max Prices grouped by '{group_option}'")
        st.dataframe(price_df)

    # -------------------
    # Raw Data
    # -------------------
    st.subheader("📑 All Estimators (Raw Data)")
    st.dataframe(df)

# -------------------
# Main
# -------------------
def main():
    dtos = fetch_estimator_dtos()
    chroma_client = chromadb.Client()
    # Optionally ingest
    # ingest_dtos_to_chroma(dtos, chroma_client)
    show_dashboard(dtos, chroma_client)

if __name__ == "__main__":
    main()
