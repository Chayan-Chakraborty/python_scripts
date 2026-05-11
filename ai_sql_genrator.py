import streamlit as st
from langchain_ollama import OllamaLLM
from langchain.chains import SQLDatabaseChain
from langchain.sql_database import SQLDatabase

# Initialize Ollama model (runs locally)
llm = OllamaLLM(model="mistral")   # you can also try "llama2" or "gemma"

# Connect to MySQL (update credentials & DB name!)
db = SQLDatabase.from_uri("mysql+pymysql://root:password@localhost:3306/your_db")

# Build SQL chain
db_chain = SQLDatabaseChain.from_llm(llm, db, verbose=True)

# Streamlit UI
st.title("🗄️ Local AI SQL Chatbot (Ollama)")

query = st.text_input("Ask something about your database:")

if query:
    with st.spinner("Thinking..."):
        response = db_chain.run(query)
        st.success(response)
