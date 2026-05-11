import json
from transformers import AutoTokenizer, AutoModelForCausalLM
import torch

# 1. The list of items:
items = [
    "Console Table",
    "Display Shelf",
    "Seating Area",
    "False ceiling",
    "Sofa set",
    "Centre Table",
    "TV Wall Unit",
    "Display Shelf",
    "Storage Unit",
    "Bar Unit",
    "Book Shelf",
    "Partition",
    "False ceiling",
    "TV Base Unit",
    "Pooja Unit With Shutter",
    "Pooja Unit Without Shutter",
    "Crockery unit",
    "Display Shelf",
    "Storage Unit",
    "Bar Unit",
    "Partition",
    "Vanity unit -Sink Area",
    "Bottom unit -Base unit",
    "Tall Unit Pullout - SS",
    "False ceiling",
    "Tambor Unit -Storage Unit",
    "Wall Sliding Unit",
    "Loft Storage - Top Storage",
    "Wooden Cutlery Tray",
    "Under Sink Organiser",
    "Plain Basket",
    "Cup & Saucer Basket",
    "Thali Basket",
    "Double Bottle Pullout",
    "Tall Unit",
    "PVC Cutlery tray",
    "Magic Corner",
    "Wall mounted Plate Holder",
    "Wicker Basket",
    "Tandem Drawers",
    "Counter top - Fixing",
    "Dado tile - Fixing",
    "3 Tier Base Unit Pullout",
    "Wall Unit",
    "Bed",
    "Bed Bench",
    "Bed side table",
    "Wardrobe",
    "TV Wall Unit",
    "Loft Storage - Top Storage",
    "Dressing Unit",
    "Study Unit",
    "Display Shelf",
    "False Ceiling",
    "TV Base Unit",
    "Vanity Unit - Sink Area",
    "Bathroom Cabinet",
    "False ceiling",
    "Shoe Rack",
    "TV Base Unit",
    "TV Wall Unit",
    "TV Area Wall Panelling",
    "Partition",
    "Kitchen Bottom Unit",
    "Kitchen Wall Unit",
    "Pantry Unit",
    "Tall Unit",
    "Loft",
    "Utility Unit",
    "Wardrobe",
    "Bedroom TV Unit Base",
    "Bedroom TV Unit Top",
    "Dressing Unit",
    "Storage Unit",
    "Study Table",
    "Bed / Cot",
    "Side Table",
    "Wall Panelling",
    "Rafters",
    "Counter - Bottom Unit",
    "Wall Unit",
    "Counter top - Fixing",
    "Storage Cabinet",
    "Seating - Table & Chair",
    "Painting",
    "Electrical Work",
    "Debris Removal",
    "Demolition",
    "Plumbing works",
    "Wooden flooring",
    "Tiling",
    "Counter top Installation",
    "Wallpaper",
    "Glass Partition",
]

# 2. Load the model & tokenizer
model_name = "sarvamai/sarvam-1"
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(model_name, torch_dtype=torch.bfloat16).to("cuda" if torch.cuda.is_available() else "cpu")

# 3. Function to prompt the model for translations (native + roman)
def get_translations(item, languages):
    """
    Given an English item name, ask the model to translate into each language with
    native script + romanized form. Returns dictionary of language code → {native, roman}.
    Example languages list: [("hindi", "हिंदी"), ("marathi", "मराठी"), ...]
    """
    prompt = f"""Translate the following item into these Indian languages: {', '.join([lang for lang, _ in languages])}.
For each language, provide two parts: native script translation and romanized transliteration.
Item: "{item}"
Output JSON with keys as language codes (e.g., hindi, marathi, bengali, tamil, telugu, kannada, malayalam, gujarati, punjabi, urdu) and each value an object: {{ "native": "...", "roman": "..." }}."""
    inputs = tokenizer(prompt, return_tensors="pt").to(model.device)
    outputs = model.generate(**inputs, max_new_tokens=200, temperature=0.7)
    text_out = tokenizer.decode(outputs[0], skip_special_tokens=True)
    # attempt to parse as JSON
    try:
        data = json.loads(text_out.strip())
    except json.JSONDecodeError:
        print(f"Warning: could not parse JSON for item '{item}'. Raw output:\n{text_out}")
        data = {}
    return data

# 4. Define languages we want
languages = [
    ("hindi", "हिंदी"),
    ("marathi", "मराठी"),
    ("bengali", "বাংলা"),
    ("tamil", "தமிழ்"),
    ("telugu", "తెలుగు"),
    ("kannada", "ಕನ್ನಡ"),
    ("malayalam", "മലയാളം"),
    ("gujarati", "ગુજરાતી"),
    ("punjabi", "ਪੰਜਾਬੀ"),
    ("urdu", "اردو"),
]

# 5. Build the full JSON
output = {}
for item in items:
    key = item.strip().lower().replace(" ", "_").replace("-", "_").replace("/", "_")
    try:
        translations = get_translations(item, languages)
    except Exception as e:
        print(f"Error for item {item}: {e}")
        translations = {}
    output[key] = translations

# 6. Write to file
with open("translations.json", "w", encoding="utf-8") as f:
    json.dump(output, f, ensure_ascii=False, indent=4)

print("Done – translations.json written.")
