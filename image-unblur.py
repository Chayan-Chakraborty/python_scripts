# deblurgan_dashboard.py

import streamlit as st
from PIL import Image
import torch
import torchvision.transforms as transforms
from huggingface_hub import hf_hub_download
import torch.nn as nn
from MPRNet import mprnet

# ------------------------------
# Define DeblurGANv2 Generator (ResNet)
# ------------------------------
class ResidualBlock(nn.Module):
    def __init__(self, channels):
        super().__init__()
        self.block = nn.Sequential(
            nn.Conv2d(channels, channels, 3, 1, 1, bias=False),
            nn.InstanceNorm2d(channels, affine=True),
            nn.ReLU(inplace=True),
            nn.Conv2d(channels, channels, 3, 1, 1, bias=False),
            nn.InstanceNorm2d(channels, affine=True),
        )

    def forward(self, x):
        return x + self.block(x)

model = torch.hub.load(
    'TAMU-VITA/DeblurGANv2',   # repo
    'deblurganv2_resnet',      # model name
    pretrained=True,           # auto-download weights
    force_reload=False
).eval()

class GeneratorResnet(nn.Module):
    def __init__(self, in_channels=3, out_channels=3, num_residual_blocks=9):
        super().__init__()
        model = [
            nn.Conv2d(in_channels, 64, 7, 1, 3, bias=False),
            nn.InstanceNorm2d(64, affine=True),
            nn.ReLU(inplace=True),
        ]

        in_features = 64
        out_features = in_features * 2
        for _ in range(2):
            model += [
                nn.Conv2d(in_features, out_features, 3, 2, 1, bias=False),
                nn.InstanceNorm2d(out_features, affine=True),
                nn.ReLU(inplace=True),
            ]
            in_features = out_features
            out_features = in_features * 2

        for _ in range(num_residual_blocks):
            model += [ResidualBlock(in_features)]

        out_features = in_features // 2
        for _ in range(2):
            model += [
                nn.ConvTranspose2d(in_features, out_features, 3, 2, 1, 1, bias=False),
                nn.InstanceNorm2d(out_features, affine=True),
                nn.ReLU(inplace=True),
            ]
            in_features = out_features
            out_features = in_features // 2

        model += [
            nn.Conv2d(64, out_channels, 7, 1, 3),
            nn.Tanh(),
        ]

        self.model = nn.Sequential(*model)

    def forward(self, x):
        return self.model(x)

# ------------------------------
# Load Model + Weights
# ------------------------------
def load_model():
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = GeneratorResnet()
    ckpt = torch.load("weights/deblurganv2_resnet.pth", map_location=device)
    model.load_state_dict(ckpt["generator"])
    model.to(device).eval()
    return model, device

def deblur_image(model, image: Image.Image, device):
    transform = transforms.ToTensor()
    img_t = transform(image).unsqueeze(0).to(device)
    with torch.no_grad():
        output = model(img_t)
    out_img = output.squeeze(0).cpu().clamp(0, 1)
    return transforms.ToPILImage()(out_img)

# ------------------------------
# Streamlit UI
# ------------------------------
st.set_page_config(page_title="AI Deblurrer", layout="wide")
st.title("📷 Deblur Images with DeblurGANv2 (no repo needed)")

uploaded_file = st.file_uploader("Upload a blurred image", type=["jpg","jpeg","png"])

if uploaded_file:
    image = Image.open(uploaded_file).convert("RGB")

    col1, col2 = st.columns(2)
    with col1:
        st.subheader("Original Image")
        st.image(image, use_column_width=True)

    model, device = load_model()
    with st.spinner("Deblurring..."):
        deblurred = deblur_image(model, image, device)

    with col2:
        st.subheader("Deblurred Image")
        st.image(deblurred, use_column_width=True)
        st.download_button(
            "Download Result",
            data=deblurred.tobytes(),
            file_name="deblurred.png",
            mime="image/png"
        )

def load_mprnet():
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = mprnet()
    weights_path = hf_hub_download("cszn/MPRNet", "mprnet_deblurring.pth")
    ckpt = torch.load(weights_path, map_location=device)
    model.load_state_dict(ckpt)
    model.to(device).eval()
    return model, device

