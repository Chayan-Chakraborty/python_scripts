import json
import re
from dataclasses import dataclass, asdict
import mysql.connector
import pandas as pd
import streamlit as st

# --- Voice to Text ---
import speech_recognition as sr
from streamlit_webrtc import webrtc_streamer, WebRtcMode

# --- Embeddings / Semantic Search ---
import chromadb
from chromadb.utils import embedding_functions

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
    attributes: dict
    item_identifier: str

# -------------------
# Fetch data
# -------------------
def fetch_estimator_dtos() -> list[EstimatorDTO]:
    conn = mysql.connector.connect(
        host=MYSQL_HOST,
        port=MYSQL_PORT,
        user=MYSQL_USER,
        password=MYSQL_PASSWORD,
        database=MYSQL_DATABASE,
        auth_plugin="mysql_native_password",
    )
    query = """
        SELECT  
            e.id AS estimator_id, 
            r.name AS room_name, 
            i.name AS item_name,
            i.id,
            i.amount AS amount, 
            a.city AS area,
            p.name AS project_name,
            i.attributes,
            i.identifier as item_identifier,
            e.user_id
        FROM vishanti.item i
        JOIN vishanti.room r ON r.id = i.room_id
        JOIN vishanti.estimator e ON e.id = r.estimator_id
        JOIN zeus.project p ON e.project_id = p.id
        JOIN zeus.address a ON a.project_id = p.id
        LEFT JOIN shield.internal_users iu on e.user_id = iu.user_id
        WHERE iu.user_id IS NULL;
    """
    cur = conn.cursor(dictionary=True)
    cur.execute(query)
    rows = cur.fetchall()
    conn.close()

    dtos: list[EstimatorDTO] = []
    for row in rows:
        parsed_attrs = parse_item_attributes(row.get("attributes"))
        dtos.append(
            EstimatorDTO(
                user_id=str(row.get("user_id", "")),
                estimator_id=str(row["estimator_id"] or ""),
                room_name=str(row["room_name"] or ""),
                item_name=str(row["item_name"] or ""),
                amount=float(row["amount"] or 0),
                area=str(row["area"] or ""),
                project_name=str(row["project_name"] or ""),
                item_identifier=str(row.get("item_identifier", "")),
                attributes=parsed_attrs,
            )
        )
    return dtos

# -------------------
# Parse Attributes
# -------------------
def parse_item_attributes(attr_json: str) -> dict:
    if not attr_json or attr_json in ("null", "NULL"):
        return {}
    try:
        attrs = json.loads(attr_json)
        if not isinstance(attrs, dict):
            return {}
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
                parsed[label] = " ".join(
                    f"{k}:{v}" for k, v in val.items() if v not in (None, "", "null")
                )
        else:
            if val not in (None, "", "null"):
                parsed[label] = str(val)
    return parsed

# -------------------
# Measurement to SqFt
# -------------------
def measurement_to_sqft(measurement) -> float:
    if measurement is None:
        return 0.0
    if isinstance(measurement, (int, float)):
        return float(measurement)
    s = str(measurement).lower()
    is_inches = "inch" in s
    s = s.replace("feet", "").replace("ft", "").replace("inches", "").replace("inch", "")
    m = re.match(r"(\d+(\.\d+)?)x(\d+(\.\d+)?)", s)
    if m:
        w = float(m.group(1))
        l = float(m.group(3))
        if is_inches:
            w /= 12
            l /= 12
        return w * l
    try:
        return float(s)
    except Exception:
        return 0.0

# -------------------
# Semantic Index
# -------------------
class SemanticIndex:
    def __init__(self):
        self.client = chromadb.Client()
        self.collection = None
        self.embedding_fn = embedding_functions.SentenceTransformerEmbeddingFunction(
            model_name="sentence-transformers/paraphrase-multilingual-MiniLM-L12-v2"
        )

    def build(self, df: pd.DataFrame, batch_size: int = 5000):
        if "estimators" in [c.name for c in self.client.list_collections()]:
            self.client.delete_collection("estimators")
        self.collection = self.client.create_collection(
            name="estimators", embedding_function=self.embedding_fn
        )

        docs, metadatas, ids = [], [], []
        for i, row in df.iterrows():
            attrs_text = " ; ".join([f"{k}: {v}" for k, v in row.get("attributes", {}).items()])
            embedding_text = " | ".join(
                filter(
                    None,
                    [
                        f"Project: {row.get('project_name','')}",
                        f"Room: {row.get('room_name','')}",
                        f"Item: {row.get('item_name','')}",
                        f"City: {row.get('area','')}",
                        f"Amount: {row.get('amount','')}",
                        attrs_text,
                    ],
                )
            )
            docs.append(embedding_text)
            metadatas.append({"idx": int(i)})
            ids.append(str(i))
            if len(docs) >= batch_size:
                self.collection.add(documents=docs, metadatas=metadatas, ids=ids)
                docs, metadatas, ids = [], [], []
        if docs:
            self.collection.add(documents=docs, metadatas=metadatas, ids=ids)

    def query(self, text: str, n_results: int = 100) -> set[int]:
        if not text.strip() or self.collection is None:
            return set()
        res = self.collection.query(query_texts=[text], n_results=n_results)
        metas = res.get("metadatas", [[]])[0]
        return {int(m["idx"]) for m in metas if "idx" in m}

# -------------------
# Stats
# -------------------
def min_max_avg_by_item_city(df: pd.DataFrame) -> pd.DataFrame:
    if df.empty:
        return pd.DataFrame(columns=["item_name", "area", "Min_Amount", "Max_Amount", "Avg_Amount"])
    return (
        df.groupby(["item_name", "area"])
        .agg(
            Min_Amount=("amount", "min"),
            Max_Amount=("amount", "max"),
            Avg_Amount=("amount", "mean"),
        )
        .reset_index()
    )

# -------------------
# Voice to Text helper
# -------------------
def capture_voice_to_text():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        st.info("🎤 Listening... speak now")
        audio = r.listen(source, timeout=5, phrase_time_limit=10)
        try:
            text = r.recognize_google(audio)
            st.success(f"🗣️ You said: {text}")
            return text
        except sr.UnknownValueError:
            st.warning("Could not understand audio.")
        except sr.RequestError as e:
            st.error(f"Speech recognition error: {e}")
    return ""

# -------------------
# Streamlit UI
# -------------------
def show_dashboard(dtos):
    st.set_page_config(page_title="NLP Estimator Search", page_icon="🌍", layout="wide")
    st.title("🌍 **NLP Estimator Search**")
    st.markdown("### Use **voice** or **text** to find estimators")

    df = pd.DataFrame([{**asdict(dto)} for dto in dtos])
    df["Measurement"] = df["attributes"].apply(lambda a: (a or {}).get("Measurement"))
    df["Measurement_SqFt"] = df["Measurement"].apply(measurement_to_sqft)

    if "semantic_idx" not in st.session_state:
        with st.spinner("🔄 Building semantic index..."):
            st.session_state.semantic_idx = SemanticIndex()
            st.session_state.semantic_idx.build(df)

    # Voice input button
    st.sidebar.header("🎤 Voice Search")
    if st.sidebar.button("🎙️ Capture Voice"):
        voice_text = capture_voice_to_text()
        if voice_text:
            st.session_state["query_text"] = voice_text

    # Text input area
    query_text = st.text_area(
        "🔍 Ask in natural language",
        placeholder="e.g., cheapest modular kitchen in Hyderabad under 50k",
        value=st.session_state.get("query_text", "")
    )

    if st.button("Run NLP Search 🚀"):
        with st.spinner("🔎 Searching..."):
            idxs = st.session_state.semantic_idx.query(query_text, n_results=200)
            filtered = df.loc[sorted(list(idxs))].copy() if idxs else pd.DataFrame()

        st.subheader("🎯 Results")
        if filtered.empty:
            st.warning("No matching results.")
        else:
            attrs_df = filtered["attributes"].apply(pd.Series)
            out = pd.concat(
                [filtered[["project_name", "room_name", "item_name", "area", "amount", "Measurement_SqFt"]], attrs_df],
                axis=1,
            )
            st.dataframe(out, use_container_width=True, height=400)

            st.markdown("### 📊 Min / Max / Avg Amount per Item per City")
            stats = min_max_avg_by_item_city(filtered)
            st.bar_chart(stats.set_index("item_name")[["Min_Amount", "Max_Amount", "Avg_Amount"]])

# -------------------
# Main
# -------------------
def main():
    dtos = fetch_estimator_dtos()
    show_dashboard(dtos)

if __name__ == "__main__":
    main()
