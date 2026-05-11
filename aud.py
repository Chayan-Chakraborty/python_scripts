# filename: whisper_dashboard.py

import streamlit as st
import whisper
from pathlib import Path
import tempfile

# Load Whisper model
@st.cache_resource
def load_model():
    return whisper.load_model("small")  # choose "tiny", "base", "small", "medium", "large"

model = load_model()

st.title("Whisper AI - Audio Transcription & Translation Dashboard")
st.markdown("Upload an audio file and get its transcription in English.")

# File uploader
uploaded_file = st.file_uploader("Upload an audio file", type=["mp3", "wav", "m4a", "ogg"])

if uploaded_file:
    with tempfile.NamedTemporaryFile(delete=False, suffix=Path(uploaded_file.name).suffix) as temp_file:
        temp_file.write(uploaded_file.read())
        temp_path = temp_file.name

    st.audio(temp_path, format='audio/wav')

    st.info("Transcribing audio...")

    # Transcribe audio
    result = model.transcribe(temp_path, task="translate")  # task="translate" gives English translation

    st.success("Transcription complete!")

    st.subheader("Transcribed Text:")
    st.text_area("Text Output", value=result['text'], height=200)
