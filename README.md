# TTZ.KT AI Platform 2025

**Local AI Document Assistant - 100% Private, 100% Free**

A production-ready RAG (Retrieval-Augmented Generation) system for document analysis and question-answering. All processing runs locally on your computer with no internet required after initial setup.

---

## Features

- **24 AI Models** - One included in setup, download additional models on demand
- **Multi-Format Support** - PDF, DOCX, XLSX, Images with OCR, JSON, XML, YAML
- **Complete Privacy** - All data processing occurs locally, no external API calls
- **Zero Cost** - No subscription fees or API charges
- **GPU Acceleration** - Automatic NVIDIA GPU detection with CPU fallback
- **Conversation Memory** - Maintains context across multiple queries
- **Vision Capabilities** - Four models available for image analysis
- **Hot Model Switching** - Change models without re-processing documents
- **Automated Launch** - Smart startup script handles all dependencies
- **Automatic Port Detection** - Finds available port (8501-8510) automatically

---

## System Requirements

### Minimum Configuration
- Operating System: Windows 10/11 (64-bit), macOS 10.15+, or Linux
- CPU: 4 cores
- RAM: 8 GB
- Storage: 20 GB available space

### Recommended Configuration
- CPU: 8+ cores
- RAM: 16 GB or more
- GPU: NVIDIA GPU with 4+ GB VRAM (optional, provides 3-5x performance boost)
- Storage: 50 GB or more (for multiple models)

### GPU Support
The system automatically detects NVIDIA GPUs with CUDA support. If no GPU is available, the system operates in CPU mode with no configuration required.

For GPU support on Windows/Linux, ensure NVIDIA drivers are installed: https://www.nvidia.com/drivers

---

## What You Need

### Required
- **Docker Desktop** - Containerization platform (includes all dependencies)
- **Internet Connection** - For initial setup only (approximately 7GB download)
  - Docker images: ~2GB
  - Default AI model: 4.7GB
  - Python dependencies: ~500MB

### NOT Required
The following are NOT needed on your host machine (everything runs inside Docker):
- Python installation
- Ollama installation
- CUDA/PyTorch installation
- Conda/virtual environments
- API keys or accounts

---

## Installation

### Step 1: Install Docker Desktop

**Windows and macOS:**
1. Download Docker Desktop: https://www.docker.com/products/docker-desktop
2. Run the installer
3. Restart your computer
4. Launch Docker Desktop and wait for it to start (green icon in system tray)

**Linux:**
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl start docker
sudo systemctl enable docker
```

**Verification:**
```bash
docker --version
docker compose version
```

Both commands should return version numbers.

---

### Step 2: Configure Docker DNS (Required)

This prevents network errors during build process.

**Windows/macOS:**
1. Open Docker Desktop
2. Click Settings (gear icon)
3. Select "Docker Engine"
4. Add the following to the JSON configuration:

```json
{
  "dns": ["8.8.8.8", "8.8.4.4", "1.1.1.1"],
  "dns-opts": ["ndots:0"]
}
```

5. Click "Apply & Restart"
6. Wait 30 seconds for Docker to restart

**Linux:**
Create or edit `/etc/docker/daemon.json`:
```bash
sudo nano /etc/docker/daemon.json
```

Add:
```json
{
  "dns": ["8.8.8.8", "8.8.4.4", "1.1.1.1"],
  "dns-opts": ["ndots:0"]
}
```

Save and restart Docker:
```bash
sudo systemctl restart docker
```

**Enable Auto-Start (Recommended):**
- Docker Desktop > Settings > General > Enable "Start Docker Desktop when you log in"

---

### Step 3: Get Project Files

**Option A - Clone with Git:**
```bash
git clone https://github.com/TTZ-KT/TTZ-Ready-To-Go.git
cd TTZ-Ready-To-Go
```

**Option B - Download ZIP:**
1. Visit: https://github.com/TTZ-KT/TTZ-Ready-To-Go.git
2. Click green "Code" button
3. Select "Download ZIP"
4. Extract to your preferred location
5. Open terminal/command prompt and navigate to extracted directory

---

### Step 4: First-Time Setup

**Windows Users (Automated):**
```cmd
setup-windows.bat
```

This script automatically:
- Validates Docker installation and configuration
- Detects GPU capabilities
- Builds application containers (15-30 minutes)
- Downloads default AI model - qwen2.5:7b (5-15 minutes, 4.7 GB)
- Starts all services
- Opens browser at http://localhost:8501

**Total Setup Time:** 20-40 minutes

**macOS and Linux Users:**
```bash
docker compose build
docker compose up -d
docker compose exec ollama ollama pull qwen2.5:7b
```

---

### Step 5: Verify Installation

After setup completes:

**1. Check containers are running:**
```bash
docker compose ps
```
Expected: Both `ttz-ollama` and `ttz-ai-platform` should show "running"

**2. Check model downloaded:**
```bash
docker compose exec ollama ollama list
```
Expected: `qwen2.5:7b` should appear in the list

**3. Access web interface:**
Open browser: http://localhost:8501

Expected: TTZ.KT AI Platform interface loads within 30-60 seconds

---

## Daily Usage

### Starting the Application

**Windows (Automated - Recommended):**
```cmd
start.bat
```

This intelligent script:
- Checks if Docker Desktop is running
- Starts Docker Desktop automatically if needed
- Waits for Docker to be ready (up to 2 minutes)
- Scans ports 8501-8510 for availability
- Automatically configures application to use available port
- Starts all services
- Opens browser automatically to the correct port

Startup time:
- Docker already running: 10-20 seconds
- Docker needs to start: 45-90 seconds

**macOS and Linux:**
```bash
docker compose up -d
```
Then open browser: http://localhost:8501

If port 8501 is in use, manually edit `docker-compose.yml` to change port:
```yaml
ports:
  - "8502:8501"  # Change 8501 to any available port
```

### Stopping the Application

**Windows:**
```cmd
stop.bat
```

**All Platforms:**
```bash
docker compose down
```

---

## Using the Platform

### 1. Select AI Model
Navigate to sidebar and choose your preferred model from the dropdown. Default model (qwen2.5:7b) provides balanced performance.

### 2. Upload Documents
- Click "Choose files" in sidebar
- Select one or multiple documents (batch upload supported)
- Supported formats: PDF, DOCX, XLSX, PNG/JPG (OCR), JSON, XML, YAML
- Click "Process All Files"
- Processing time: 10-60 seconds

### 3. Ask Questions
Enter questions in chat interface. AI answers based on uploaded documents with source citations.

Example queries:
- "Summarize the main points from this document"
- "What are the key findings in the uploaded report?"
- "Compare data across the Excel sheets"
- "Extract all action items mentioned"
- "What does this image contain?"

### 4. Chat Without Documents
You can also use the platform for general conversation without uploading documents. The AI will respond in chat mode.

### 5. Switch Models Anytime
Change models using dropdown menu without re-uploading documents. All processed document data is preserved.

---

## Available AI Models

**Default Model (Included):** qwen2.5:7b (4.7 GB)
**Additional Models Available:** 23 models across multiple categories

### Qwen 3 Family (Latest Generation)

**qwen3:latest**
- Size: 4.7 GB
- RAM: 12 GB
- Performance: High quality, moderate speed
- Use case: General-purpose tasks, conversation

```bash
docker compose exec ollama ollama pull qwen3:latest
```

**qwen3:8b**
- Size: 4.9 GB
- RAM: 12-16 GB
- Performance: Enhanced reasoning capabilities
- Use case: Complex queries, detailed analysis

```bash
docker compose exec ollama ollama pull qwen3:8b
```

**qwen3-coder:latest**
- Size: 4.7 GB
- RAM: 12 GB
- Performance: Code-optimized
- Use case: Source code analysis, technical documentation

```bash
docker compose exec ollama ollama pull qwen3-coder:latest
```

### Qwen 2.5 Family (Stable)

**qwen2.5:latest**
- Size: 4.7 GB
- RAM: 12 GB
- Performance: Production-stable
- Use case: Enterprise deployments

```bash
docker compose exec ollama ollama pull qwen2.5:latest
```

**qwen2.5:7b** (DEFAULT - Pre-installed)
- Size: 4.7 GB
- RAM: 12 GB
- Performance: Balanced quality and speed
- Use case: Recommended for most users

**qwen2.5:3b**
- Size: 1.9 GB
- RAM: 4-6 GB
- Performance: Fast, resource-efficient
- Use case: Low-RAM systems, rapid responses

```bash
docker compose exec ollama ollama pull qwen2.5:3b
```

**qwen2.5-coder:latest**
- Size: 4.7 GB
- RAM: 12 GB
- Performance: Software development optimized
- Use case: Code generation, debugging, documentation

```bash
docker compose exec ollama ollama pull qwen2.5-coder:latest
```

### DeepSeek Family (Advanced Reasoning)

**deepseek-r1:latest**
- Size: 14.8 GB
- RAM: 24+ GB
- Performance: Maximum reasoning capability
- Use case: Complex analysis, research papers
- Requirements: High-end hardware

```bash
docker compose exec ollama ollama pull deepseek-r1:latest
```

**deepseek-r1:8b**
- Size: 4.9 GB
- RAM: 12-16 GB
- Performance: Strong reasoning, compact
- Use case: Advanced reasoning on standard hardware

```bash
docker compose exec ollama ollama pull deepseek-r1:8b
```

### Llama Family (Meta)

**llama3.2:latest**
- Size: 2.0 GB
- RAM: 4-6 GB
- Performance: Fast execution
- Use case: Quick queries, general chat

```bash
docker compose exec ollama ollama pull llama3.2:latest
```

**llama3.1:latest**
- Size: 4.7 GB
- RAM: 8-12 GB
- Performance: Balanced performance
- Use case: Standard document processing

```bash
docker compose exec ollama ollama pull llama3.1:latest
```

### Mistral

**mistral:latest**
- Size: 4.1 GB
- RAM: 8-10 GB
- Performance: Efficient processing
- Use case: Business documents, professional content

```bash
docker compose exec ollama ollama pull mistral:latest
```

### Gemma Family (Google)

**gemma3:latest**
- Size: 2.0 GB
- RAM: 4-6 GB
- Performance: Lightweight, fast
- Use case: Quick processing tasks

```bash
docker compose exec ollama ollama pull gemma3:latest
```

**gemma2:latest**
- Size: 5.4 GB
- RAM: 12 GB
- Performance: Enhanced context window
- Use case: Long documents, extended analysis

```bash
docker compose exec ollama ollama pull gemma2:latest
```

### Phi Family (Microsoft)

**phi4:latest**
- Size: 7.9 GB
- RAM: 16 GB
- Performance: State-of-the-art reasoning
- Use case: Advanced analysis tasks

```bash
docker compose exec ollama ollama pull phi4:latest
```

**phi3.5:latest**
- Size: 3.8 GB
- RAM: 8 GB
- Performance: Balanced capabilities
- Use case: General document processing

```bash
docker compose exec ollama ollama pull phi3.5:latest
```

**phi3:latest**
- Size: 2.3 GB
- RAM: 4-6 GB
- Performance: Rapid processing
- Use case: Resource-constrained environments

```bash
docker compose exec ollama ollama pull phi3:latest
```

### GPT-OSS (Open Source GPT Alternative)

**gpt-oss:latest**
- Size: 5.0 GB
- RAM: 10-12 GB
- Performance: Open-source GPT alternative
- Use case: General-purpose tasks

```bash
docker compose exec ollama ollama pull gpt-oss:latest
```

**gpt-oss:20b**
- Size: 12 GB
- RAM: 20+ GB
- Performance: Enhanced GPT-OSS variant
- Use case: Advanced processing tasks
- Requirements: High-end hardware

```bash
docker compose exec ollama ollama pull gpt-oss:20b
```

### Vision Models (Image Analysis)

**llama3.2-vision:latest**
- Size: 7.9 GB
- RAM: 16 GB
- Performance: Latest vision capabilities
- Capabilities: Image analysis, OCR, chart interpretation, visual question-answering

```bash
docker compose exec ollama ollama pull llama3.2-vision:latest
```

**llava:latest**
- Size: 4.7 GB
- RAM: 12 GB
- Performance: Standard vision processing
- Capabilities: Image description, visual Q&A

```bash
docker compose exec ollama ollama pull llava:latest
```

**llava:13b**
- Size: 8 GB
- RAM: 16+ GB
- Performance: Enhanced vision analysis
- Capabilities: Detailed image description, complex visual reasoning

```bash
docker compose exec ollama ollama pull llava:13b
```

**bakllava:latest**
- Size: 4.7 GB
- RAM: 12 GB
- Performance: Alternative vision model
- Capabilities: Image understanding, visual Q&A

```bash
docker compose exec ollama ollama pull bakllava:latest
```

### Model Management Commands

```bash
# List all downloaded models
docker compose exec ollama ollama list

# Download a specific model
docker compose exec ollama ollama pull MODEL_NAME

# Remove a model to free space
docker compose exec ollama ollama rm MODEL_NAME
```

### Quick Download Examples

```bash
# Download multiple models at once
docker compose exec ollama ollama pull qwen3:latest
docker compose exec ollama ollama pull phi3:latest
docker compose exec ollama ollama pull llama3.2-vision:latest
```

---

## Supported File Formats

**Documents:**
- PDF (.pdf)
- Microsoft Word (.docx, .doc)
- Plain Text (.txt)
- Rich Text Format (.rtf)
- Markdown (.md)

**Spreadsheets:**
- CSV (.csv)
- Microsoft Excel (.xlsx, .xls)
- OpenDocument Spreadsheet (.ods)

**Images (with OCR):**
- PNG (.png)
- JPEG (.jpg, .jpeg)
- Bitmap (.bmp)
- TIFF (.tiff)
- GIF (.gif)

**Data Formats:**
- JSON (.json)
- XML (.xml)
- YAML (.yaml, .yml)

---

## Project Structure

```
ttz.kt-thws-ready-to-go-rag-based-ai-platform/
│
├── app.py                      # Streamlit web interface
│                               # Handles UI, file uploads, model selection
│
├── rag_engine_enhanced.py      # Core RAG engine
│                               # Document processing, chunking, embeddings, retrieval
│
├── requirements.txt            # Python dependencies
│
├── Dockerfile                  # Container build configuration
│
├── docker-compose.yml          # Multi-container orchestration
│                               # Defines app and Ollama containers, volumes, networks
│
├── setup-windows.bat           # Automated Windows setup
│                               # One-click installation with GPU detection
│
├── start.bat                   # Smart Windows startup
│                               # Auto-detects available ports (8501-8510)
│                               # Starts Docker if needed, opens browser
│
├── stop.bat                    # Shutdown script
│
├── .env                        # Environment variables (if needed)
│
├── .gitignore                  # Git exclusion rules
│
├── .dockerignore               # Docker build exclusions
│
├── daemon.json                 # Docker daemon DNS configuration reference
│
├── README.md                   # This documentation
│
├── __pycache__/                # Python bytecode cache (auto-generated)
│   └── *.pyc                   # Compiled Python files for faster loading
│
└── vectors/                    # Vector database storage (auto-created)
    └── faiss_index/            # FAISS vector indices
                                # Created when processing first document
```

### Key Files Explained

**app.py** - Frontend interface using Streamlit. Renders UI, handles uploads, displays chat.

**rag_engine_enhanced.py** - Backend engine. Loads documents, creates embeddings, stores in FAISS, retrieves relevant chunks, generates answers.

**start.bat** - Intelligent Windows launcher with these features:
- Checks if Docker Desktop is running
- Starts Docker Desktop if not running (waits up to 2 minutes)
- Scans ports 8501-8510 to find available port
- Updates docker-compose.yml with available port
- Starts services and opens browser automatically

**docker-compose.yml** - Orchestrates two services:
- `ttz-ollama`: Ollama LLM runtime
- `ttz-ai-platform`: Streamlit application
- Configures GPU passthrough, persistent volumes, DNS, health checks

**vectors/** - Created automatically when you process your first document. Stores FAISS vector indices for fast document retrieval.

**__pycache__/** - Python bytecode cache (auto-generated). Speeds up application startup. Safe to delete - Python regenerates as needed.

---

## Data Storage

**Local Storage (Host Machine):**
- `vectors/` - Document embeddings and FAISS indices
  - Size: ~100-200MB per 100 documents
  - Preserved between sessions
  - Backup recommended before major updates

**Docker Volumes:**
- `ollama_data` - Downloaded AI models
  - Size: 2-15GB per model
  - Persistent across container restarts
  - No backup needed (models are re-downloadable)

**Temporary Storage:**
- Browser session: Conversation history (cleared when browser closes)
- Docker memory: Active model state (cleared on container restart)

### Backup Procedure
```bash
# Backup vector database
cp -r vectors/ backup/vectors-$(date +%Y%m%d)/

# No backup needed for:
# - AI models (re-downloadable)
# - Docker images (re-buildable)
# - Application code (in Git)
```

---

## Common Operations

### Application Management
```bash
# Start
docker compose up -d

# Stop
docker compose down

# Restart
docker compose restart

# View running containers
docker compose ps

# View logs (all services)
docker compose logs -f

# View app logs only
docker compose logs -f ttz-app

# View Ollama logs only
docker compose logs -f ollama
```

### System Maintenance
```bash
# Update to latest version
git pull
docker compose down
docker compose build
docker compose up -d

# Free up disk space
docker system prune -a

# Clean Python cache (if import errors occur)
find . -type d -name "__pycache__" -exec rm -rf {} +
find . -type f -name "*.pyc" -delete

# Complete rebuild
docker compose down -v
docker compose build --no-cache
docker compose up -d
```

---

## Troubleshooting

### Setup Failed: Docker Not Running

**Symptoms:** Setup script exits or shows "Cannot connect to Docker daemon"

**Solution:**
1. Launch Docker Desktop
2. Wait for green icon in system tray
3. Re-run setup script

### Setup Failed: Build Timeout or Network Error

**Cause:** Network connectivity or DNS issues

**Solution:**
1. Verify Docker DNS configuration (Installation Step 2)
2. Check internet connection
3. Re-run build (Docker resumes from last successful stage):
```bash
docker compose build
```

### Port Already in Use

**Windows:** `start.bat` automatically finds available port (8501-8510)

**Manual Fix:**
Edit `docker-compose.yml`:
```yaml
ports:
  - "8502:8501"  # Change to any available port
```

Then restart:
```bash
docker compose down
docker compose up -d
```

Access at: http://localhost:8502

### Performance Issues: Slow Responses

**Solutions:**
1. Switch to smaller model (`phi3:latest` or `qwen2.5:3b`)
2. Close resource-intensive applications
3. Check GPU usage:
```bash
docker compose logs ttz-app | grep "Device:"
```
Should show: "CUDA" (GPU) or "CPU"

### GPU Not Detected

**Verify GPU:**
```bash
nvidia-smi
```

**Solution:**
1. Install/update NVIDIA drivers: https://www.nvidia.com/drivers
2. Restart computer
3. Restart containers:
```bash
docker compose restart
```

**Note:** Application works in CPU mode if GPU unavailable (slower but functional)

### File Upload Failed

**Checklist:**
- File format supported
- File size under 200MB
- File not password-protected or corrupted

**Solution:**
```bash
docker compose restart ttz-app
```

### Model Download Failed

**Symptoms:** `ollama pull` hangs or fails

**Solutions:**
1. Check internet connection
2. Verify Docker DNS configuration
3. Try smaller model first:
```bash
docker compose exec ollama ollama pull qwen2.5:3b
```
4. Restart Ollama:
```bash
docker compose restart ollama
```

### Import Errors After Update

**Cause:** Stale Python bytecode cache

**Solution:**
```bash
docker compose down
rm -rf __pycache__/
docker compose build
docker compose up -d
```

### Out of Memory Error

**Docker Memory Settings:**
1. Docker Desktop > Settings > Resources
2. Increase memory: 12-16GB
3. Increase CPU: 4-6 cores
4. Click "Apply & Restart"

**Alternative:** Use lighter model:
```bash
docker compose exec ollama ollama pull phi3:latest
```

### Application Shows Old Behavior After Code Changes

**Cause:** Docker using cached image or stale bytecode

**Solution:**
```bash
docker compose down
rm -rf __pycache__/
docker compose build --no-cache
docker compose up -d
```

---

## Privacy and Security

### Privacy Guarantees
- **100% Local Processing:** All computations on your hardware
- **No External API Calls:** Zero data sent to cloud
- **No Telemetry:** No analytics or data collection
- **No Cloud Storage:** All data stays on your computer
- **No Registration:** No API keys or accounts required
- **Offline Operation:** Works completely offline after setup

### Data Handling
- **Uploaded Documents:** Processed in memory, deleted immediately after
- **Vector Embeddings:** Stored locally in `vectors/`, never transmitted
- **Conversation History:** Browser session only, cleared on close
- **AI Models:** Downloaded once, cached locally in Docker volume

### Network Requirements
Internet required ONLY for:
- Initial Docker and dependency downloads
- AI model downloads
- Application updates

After setup: 100% offline operation, no internet dependency.

---

## Technical Specifications

### Architecture
- **Framework:** LangChain
- **Vector Database:** FAISS (Facebook AI Similarity Search)
- **Embedding Model:** sentence-transformers/all-MiniLM-L6-v2 (384 dimensions)
- **Web Interface:** Streamlit
- **LLM Runtime:** Ollama
- **Containerization:** Docker + Docker Compose

### RAG Configuration
- **Chunk Size:** 1200 characters (optimized for context preservation)
- **Chunk Overlap:** 300 characters (prevents content splitting)
- **Retrieval Method:** Similarity Search
- **Retrieved Chunks:** 6 chunks per query
- **Context Window:** 4096-8192 tokens (model-dependent)

### Resource Utilization
- **GPU:** Automatic CUDA acceleration when NVIDIA GPU detected
- **CPU:** Multi-threaded processing with automatic fallback
- **Memory:** Dynamic allocation based on active model size
- **Storage:** Incremental growth for vector database

---

## Performance Optimization

### Model Selection by Hardware

**8GB RAM Systems:**
- `phi3:latest` (2.3GB)
- `llama3.2:latest` (2.0GB)
- `qwen2.5:3b` (1.9GB)

**12-16GB RAM Systems:**
- `qwen2.5:7b` (4.7GB) - Default
- `qwen3:latest` (4.7GB)
- `mistral:latest` (4.1GB)

**16GB+ RAM Systems:**
- `phi4:latest` (7.9GB)
- `deepseek-r1:8b` (4.9GB)
- `llama3.2-vision:latest` (7.9GB)

**32GB+ RAM Systems:**
- `deepseek-r1:latest` (14.8GB)
- `gpt-oss:20b` (12GB)
- `llava:13b` (8GB)

### Best Practices

**Document Processing:**
- Upload related documents together for cross-referencing
- Use clean, well-formatted source files
- Batch process multiple files rather than one-by-one

**Query Optimization:**
- Ask specific, targeted questions
- Use follow-up questions to refine answers
- Rephrase if initial response isn't satisfactory
- Try different models to compare quality

**Performance Notes:**
- First query after restart: Slower (model loading)
- Subsequent queries: Faster (model cached in RAM)
- Vision models: Require additional memory and processing time
- Larger models: Better quality but slower responses

---

## Updating

### Update Application
```bash
cd ttz.kt-thws-ready-to-go-rag-based-ai-platform
git pull
docker compose down
docker compose build
docker compose up -d
```

### Update AI Models
```bash
docker compose exec ollama ollama pull MODEL_NAME
```

### Update Docker Base Images
```bash
docker compose pull
docker compose up -d
```

---

## Uninstallation

### Remove Application
```bash
# Stop and remove containers
docker compose down

# Remove application images
docker rmi $(docker images -q ttz*)

# Remove model data
docker volume rm ttz-ready-to-go_ollama_data

# Delete application folder
cd ..
rm -rf ttz.kt-thws-ready-to-go-rag-based-ai-platform
```

### Remove Docker Desktop
- **Windows:** Settings > Apps > Docker Desktop > Uninstall
- **macOS:** Move Docker.app to Trash
- **Linux:**
```bash
sudo apt remove docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker
```

### Backup Before Uninstall
Save `vectors/` directory to preserve processed document embeddings:
```bash
cp -r vectors/ ~/Documents/ttz-backup/
```

---

## Quick Reference

### First-Time Setup (20-40 minutes)
1. Install Docker Desktop
2. Configure Docker DNS
3. Clone/download repository
4. Run setup:
   - Windows: `setup-windows.bat`
   - Mac/Linux: `docker compose build && docker compose up -d && docker compose exec ollama ollama pull qwen2.5:7b`
5. Access: http://localhost:8501

### Daily Usage
**Windows:**
- Start: `start.bat` (auto-detects port, opens browser)
- Stop: `stop.bat`

**Mac/Linux:**
- Start: `docker compose up -d`
- Stop: `docker compose down`
- Access: http://localhost:8501

### Model Operations
```bash
# List models
docker compose exec ollama ollama list

# Download model
docker compose exec ollama ollama pull MODEL_NAME

# Remove model
docker compose exec ollama ollama rm MODEL_NAME
```

---

## License

MIT License

Copyright (c) 2025 TTZ.KT AI Platform

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED.

---

## Acknowledgments

Built with open-source technologies:

- **Ollama** - https://ollama.ai/ - Local LLM runtime
- **LangChain** - https://www.langchain.com/ - LLM application framework
- **Streamlit** - https://streamlit.io/ - Web application framework
- **FAISS** - https://github.com/facebookresearch/faiss - Vector similarity search
- **HuggingFace** - https://huggingface.co/ - Embedding models
- **PyTorch** - https://pytorch.org/ - Machine learning framework

---

**TTZ.KT AI Platform v9.0 - November 2025**

**Production-Ready - 24 AI Models - 100% Local Processing - 100% Private**

**GitHub:** https://github.com/tharunkumarkorinepalli/ttz.kt-thws-ready-to-go-rag-based-ai-platform

For issues, questions, or contributions, please open an issue on GitHub.
