FROM python:3.11-slim as base

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_DEFAULT_TIMEOUT=300 \
    PIP_RETRIES=5

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    libmagic1 \
    poppler-utils \
    tesseract-ocr \
    libreoffice \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates

WORKDIR /app

FROM base AS builder

COPY requirements.txt .

RUN echo "Installing PyTorch..." && \
    pip install --user --no-cache-dir \
        torch==2.2.0 \
        torchvision==0.17.0 \
        --index-url https://download.pytorch.org/whl/cpu \
    && echo "PyTorch installed"

RUN echo "Installing AI libraries..." && \
    pip install --user --no-cache-dir \
        transformers==4.41.0 \
        sentence-transformers==3.0.1 \
        faiss-cpu==1.7.4 \
    && echo "AI libraries installed"

RUN echo "Installing remaining packages..." && \
    grep -v "^torch" requirements.txt | \
    grep -v "^transformers" | \
    grep -v "^sentence-transformers" | \
    grep -v "^faiss-cpu" > requirements_remaining.txt && \
    pip install --user --no-cache-dir \
        --retries 5 \
        --timeout 300 \
        -r requirements_remaining.txt \
    && echo "All packages installed"

FROM base

COPY --from=builder /root/.local /root/.local

ENV PATH=/root/.local/bin:$PATH

COPY app.py .
COPY rag_engine.py .
COPY rag_engine_enhanced.py .
COPY README.md .

RUN mkdir -p vectors/faiss_index && \
    chmod -R 755 vectors

EXPOSE 8501

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:8501/_stcore/health || exit 1

CMD ["streamlit", "run", "app.py", \
     "--server.address", "0.0.0.0", \
     "--server.port", "8501", \
     "--server.headless", "true", \
     "--browser.gatherUsageStats", "false"]
