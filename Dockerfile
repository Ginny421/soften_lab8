FROM python:3.13-slim

# ติดตั้ง dependencies สำหรับระบบและ Chromium
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    && apt-get clean

# ติดตั้ง Robot Framework และ SeleniumLibrary
RUN pip install --no-cache-dir \
    robotframework \
    robotframework-seleniumlibrary \
    selenium

# ตั้งค่า Path สำหรับ Chromium
ENV PATH="/usr/bin/chromium:${PATH}"

WORKDIR /app
