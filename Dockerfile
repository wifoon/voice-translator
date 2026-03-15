FROM python:3.13-slim

RUN apt-get update && apt-get install -y \
    portaudio19-dev \
    python3-all-dev \
    gcc \
    alsa-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

ARG UID=10001
RUN adduser \
    --disable-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser \
    usermod -aG audio appuser

COPY . .

RUN chown -R appuser:appuser /app

USER appuser

CMD ["python", "main.py"]