import streamlit as st
from sqlalchemy import create_engine, inspect
from eralchemy import render_er
import ollama
import os

st.set_page_config(page_title="ER Diagram Dashboard", layout="wide")

# ---------------------------
# Streamlit UI
# ---------------------------
st.title("📊 AI-Powered ER Diagram Dashboard (Free & Local)")

db_type = st.selectbox("Select DB Type", ["mysql", "postgresql"])
host = st.text_input("Host", "localhost")
port = st.text_input("Port", "3306" if db_type == "mysql" else "5432")
user = st.text_input("Username")
password = st.text_input("Password", type="password")
dbname = st.text_input("Database Name")

print("Password --------------------------------------------")
print(password)

if st.button("Generate ER Diagram"):
    try:
        # ---------------------------
        # Step 1: Connect to Database
        # ---------------------------
        if db_type == "mysql":
            conn_str = f"mysql+pymysql://{user}:{password}@{host}:{port}/{dbname}"
        else:
            conn_str = f"postgresql://{user}:{password}@{host}:{port}/{dbname}"

        print(conn_str)
        engine = create_engine(conn_str)
        inspector = inspect(engine)

        # ---------------------------
        # Step 2: Extract Schema Info
        # ---------------------------
        tables = inspector.get_table_names()
        schema_summary = []
        for table in tables:
            cols = inspector.get_columns(table)
            pks = inspector.get_pk_constraint(table).get("constrained_columns", [])
            fks = inspector.get_foreign_keys(table)
            schema_summary.append({
                "table": table,
                "columns": [c["name"] for c in cols],
                "primary_keys": pks,
                "foreign_keys": [{fk["constrained_columns"][0]: fk["referred_table"]} for fk in fks]
            })

        # ---------------------------
        # Step 3: Generate ER Diagram
        # ---------------------------
        output_file = "er_diagram.png"
        render_er(conn_str, output_file)
        st.image(output_file, caption="Entity Relationship Diagram", use_container_width=True)

        # ---------------------------
        # Step 4: AI Schema Summary (Ollama - Free Model)
        # ---------------------------
        schema_text = "\n".join([str(item) for item in schema_summary])

        with st.spinner("🤖 Analyzing schema with Mistral (via Ollama)..."):
            response = ollama.chat(
                model="mistral",
                messages=[
                    {"role": "system", "content": "You are a database expert."},
                    {"role": "user", "content": f"Explain this database schema in simple terms:\n{schema_text}"}
                ]
            )

        ai_summary = response["message"]["content"]
        st.subheader("🧠 AI Schema Analysis (Free Model - Mistral via Ollama)")
        st.write(ai_summary)

    except Exception as e:
        st.error(f"Error: {e}")
