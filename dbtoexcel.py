import mysql.connector
import streamlit as st
import re

def get_schema(host, user, password, database):
    conn = mysql.connector.connect(
        host=host, user=user, password=password, database=database
    )
    cursor = conn.cursor(dictionary=True)

    # Get all tables
    cursor.execute("SHOW TABLES")
    tables = [row[f"Tables_in_{database}"] for row in cursor.fetchall()]

    schema = {}

    for table in tables:
        cursor.execute(f"SHOW FULL COLUMNS FROM {table}")
        columns = cursor.fetchall()

        cursor.execute(f"""
            SELECT 
                COLUMN_NAME, 
                REFERENCED_TABLE_NAME, 
                REFERENCED_COLUMN_NAME
            FROM information_schema.KEY_COLUMN_USAGE
            WHERE TABLE_SCHEMA = %s AND TABLE_NAME = %s AND REFERENCED_TABLE_NAME IS NOT NULL
        """, (database, table))
        fks = cursor.fetchall()

        schema[table] = {"columns": columns, "fks": fks}

    conn.close()
    return schema


def clean_type(col_type: str) -> str:
    """Remove unsupported keywords like unsigned from MySQL column type"""
    return re.sub(r"\s+unsigned", "", col_type, flags=re.IGNORECASE)


def schema_to_dbml(schema):
    """Convert MySQL schema to DBML format without unsigned"""
    dbml_lines = []
    for table, details in schema.items():
        dbml_lines.append(f"Table {table} {{")
        for col in details["columns"]:
            # Clean column type
            col_type = clean_type(col["Type"])
            col_def = f"  {col['Field']} {col_type}"

            # Build [] options
            options = []

            if col["Null"] == "NO":
                options.append("not null")

            if col["Default"] is not None:
                if isinstance(col["Default"], str):
                    options.append(f'default: "{col["Default"]}"')
                else:
                    options.append(f"default: {col['Default']}")

            if col["Comment"]:
                options.append(f'note: "{col["Comment"]}"')

            if options:
                col_def += " [" + ", ".join(options) + "]"

            dbml_lines.append(col_def)

        dbml_lines.append("}\n")

        # Add foreign keys
        for fk in details["fks"]:
            dbml_lines.append(
                f"Ref: {table}.{fk['COLUMN_NAME']} > {fk['REFERENCED_TABLE_NAME']}.{fk['REFERENCED_COLUMN_NAME']}"
            )

    return "\n".join(dbml_lines)


# --- Streamlit Dashboard ---
st.set_page_config(page_title="MySQL → DBML Exporter", layout="wide")

st.title("📊 MySQL Schema → DBML Exporter")

with st.sidebar:
    st.header("🔑 DB Credentials")
    host = st.text_input("Host", "localhost")
    user = st.text_input("User", "root")
    password = st.text_input("Password", type="password")
    database = st.text_input("Database")
    connect_btn = st.button("Connect & Generate DBML")

if connect_btn and database:
    try:
        schema = get_schema(host, user, password, database)
        dbml = schema_to_dbml(schema)

        st.success(f"✅ Loaded schema for `{database}`")

        # Show DBML output
        st.code(dbml, language="sql")

        # Download DBML
        st.download_button(
            label="📥 Download DBML",
            data=dbml,
            file_name=f"{database}_schema.dbml",
            mime="text/plain",
        )

    except Exception as e:
        st.error(f"❌ Error: {e}")
