# Voice Translator (Python)

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)
![Docker: Ready](https://img.shields.io/badge/Infrastructure-Docker%20%2F%20Compose-blue?style=flat-square&logo=docker)
![Python: 3.13](https://img.shields.io/badge/Python-3.13-blue?style=flat-square&logo=python)
![Security: Non-Root](https://img.shields.io/badge/Security-Non--Root%20Container-green?style=flat-square)

An asynchronous **Speech-to-Speech translation system** built with Python. The application captures live audio, performs real-time translation between **Polish and English**, and synthesizes the result using high-fidelity **Neural AI voices**. It features a hands-free, voice-controlled interface designed for low-latency interaction.

## Tech Stack & Infrastructure

* **Language:** Python 3.13 (Asyncio for non-blocking I/O).
* **Speech Recognition:** Google Speech API (via `SpeechRecognition`).
* **Neural TTS:** Microsoft Edge Neural TTS (`edge-tts`).
* **Audio Engine:** `Pygame` mixer for high-quality MP3 playback and `PyAudio` for capture.
* **Infrastructure:** Docker (Slim-build), Docker Compose.
* **Security:** Non-privileged container execution (`appuser`).

## DevOps & Containerization Features

* **Hardware Passthrough:** Configured Docker Compose with `--device /dev/snd` and `group_add: audio` to allow containerized access to host microphone and speakers.
* **Production-Ready Base:** Utilizes `python:3.13-slim` to minimize image footprint while providing necessary ALSA/PortAudio system dependencies.
* **Security-First Approach:** Adheres to the principle of least privilege by executing as a non-root `appuser` with restricted system access.

## System Features

* **Speech-to-Speech Pipeline:** Fully automated flow: Capture → Recognize → Translate → Synthesize → Playback.
* **Neural AI Voices:** Utilizes state-of-the-art neural synthesis for human-like intonation (`pl-PL-MarekNeural` & `en-US-GuyNeural`).
* **Voice Control:** Fully operated via voice commands (*polski*, *angielski*, *wyjdź*, *stop*) for a seamless hands-free experience.
* **Ambient Noise Adaptation:** Automatic microphone calibration to filter background noise for higher recognition accuracy.
* **Resource Management:** Automated cleanup of temporary audio artifacts and proper hardware release upon termination.

## Quick Start - Docker (Recommended)

1.  **Build and start the application:**
    ```sh
    docker compose up --build
    ```
2.  **Interact:**
    Follow the on-screen prompts. Choose your source language by speaking, then provide the phrase you wish to translate.

## Local Development - Manual Setup

### 1. Requirements
Ensure you have `PortAudio` installed on your system (required for `PyAudio`):
* **Ubuntu/Debian:** `sudo apt install portaudio19-dev`
* **Windows:** Usually handled by `pip install pyaudio`
* **macOS:** `brew install portaudio`

### 2. Installation
Install Python dependencies:
```sh
pip install -r requirements.txt
