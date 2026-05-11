from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
from langdetect import detect, DetectorFactory
import time

# Set seed for language detection consistency
DetectorFactory.seed = 0

# Load models and tokenizers
def load_model(model_name: str):
    print(f"Loading model {model_name}...")
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForSeq2SeqLM.from_pretrained(model_name)
    return tokenizer, model

# Define model names for translation
M2M100_MODEL_NAME = "facebook/m2m100_418M"  # Multilingual model, supports various languages
NLLB_MODEL_NAME = "facebook/nllb-200-distilled-600M"  # NLLB-200 model for low-resource languages

# Load M2M100 and NLLB models
m2m100_tokenizer, m2m100_model = load_model(M2M100_MODEL_NAME)
nllb_tokenizer, nllb_model = load_model(NLLB_MODEL_NAME)

# Utility function to detect language of text
def detect_language(text: str) -> str:
    try:
        lang = detect(text)
        print(f"Detected language: {lang}")
        return lang
    except Exception as e:
        print(f"Error in language detection: {e}")
        return "unknown"

# Function for translation using M2M100 model
def translate_m2m100(text: str, src_lang: str = None) -> str:
    inputs = m2m100_tokenizer(text, return_tensors="pt", truncation=True, max_length=512)
    if src_lang:
        m2m100_tokenizer.src_lang = src_lang
    en_id = m2m100_tokenizer.get_lang_id("en")
    generated_tokens = m2m100_model.generate(**inputs, forced_bos_token_id=en_id, max_length=512)
    return m2m100_tokenizer.batch_decode(generated_tokens, skip_special_tokens=True)[0]

# Function for translation using NLLB model
def translate_nllb(text: str, src_lang: str) -> str:
    try:
        inputs = nllb_tokenizer(text, return_tensors="pt", truncation=True, max_length=512)
        gen_tokens = nllb_model.generate(
            **inputs,
            forced_bos_token_id=nllb_tokenizer.lang_code_to_id.get(src_lang, nllb_tokenizer.lang_code_to_id["eng_Latn"]),
            max_length=512
        )
        return nllb_tokenizer.batch_decode(gen_tokens, skip_special_tokens=True)[0]
    except Exception as e:
        print(f"Error in translation with NLLB: {e}")
        return ""

# Main function to process and translate text
def translate_to_english(text: str, prefer: str) -> str:
    text = text.strip()
    if not text:
        return ""

    # Detect the language of the text
    detected_lang = detect_language(text)

    # If the detected language is already English, return the same text
    if detected_lang == "en":
        return text

    # Prepare translation based on the language
    if prefer == "m2m100":
        translation = translate_m2m100(text, src_lang=detected_lang)
    else:
        translation = translate_nllb(text, src_lang=detected_lang)

    # Return the translation or the original if failed
    return translation if translation else text

if __name__ == "__main__":
    print(translate_to_english("bichhana", "m2m1"))