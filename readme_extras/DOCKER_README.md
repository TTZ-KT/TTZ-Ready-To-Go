# 🐋 Docker Deployment - TTZ.KT AI Platform

## 🚀 Why Docker?

**Benefits of using Docker:**
- ✅ **No Python installation needed** - Everything runs in containers
- ✅ **No dependency conflicts** - Isolated environment
- ✅ **One-command deployment** - Simple setup
- ✅ **Easy updates** - Just rebuild and restart
- ✅ **Portable** - Same setup on any computer
- ✅ **Clean uninstall** - No leftover files

---

## 📋 What You Get

This Docker setup includes:

1. **Ollama Container** - Local AI model runtime
2. **Streamlit App Container** - Web interface
3. **Automatic networking** - Services talk to each other
4. **Persistent storage** - Models and data saved between restarts
5. **Health checks** - Automatic recovery if something fails

---

## 🎯 Quick Start (Windows)

### **Prerequisites:**
- Windows 10/11 (64-bit)
- 8GB+ RAM (16GB recommended)
- 20GB+ free disk space

### **Installation (3 Steps):**

1. **Install Docker Desktop**
   - Download from: https://www.docker.com/products/docker-desktop/
   - Install and restart your computer
   - Start Docker Desktop

2. **Download this project**
   - Extract to: `C:\Users\YourName\Documents\TTZ-AI-Platform`

3. **Run setup script**
   ```cmd
   setup-windows.bat
   ```

**That's it!** 🎉

Open browser: http://localhost:8501

---

## 📖 Detailed Guides

- **Windows Users:** See [WINDOWS_SETUP.md](WINDOWS_SETUP.md) for complete step-by-step guide
- **Quick Reference:** See [WINDOWS_QUICK_REFERENCE.md](WINDOWS_QUICK_REFERENCE.md) for commands
- **Linux/Mac:** See instructions below

---

## 🐧 Linux / macOS Setup

### **Prerequisites:**
```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### **Quick Start:**
```bash
# Clone project
git clone <your-repo-url>
cd TTZ_ready_to_go-olama

# Build and start
docker-compose build
docker-compose up -d

# Download default model
docker-compose exec ollama ollama pull qwen2.5:7b

# Open browser
open http://localhost:8501  # macOS
xdg-open http://localhost:8501  # Linux
```

---

## 🏗️ Architecture

```
┌─────────────────────────────────────┐
│   Your Computer (Host)              │
│                                     │
│  ┌───────────────────────────────┐ │
│  │  Docker Network (ttz-network) │ │
│  │                               │ │
│  │  ┌──────────────────────┐    │ │
│  │  │  TTZ App Container   │    │ │
│  │  │  (Streamlit)         │    │ │
│  │  │  Port: 8501          │◄───┼─┼─── Browser: localhost:8501
│  │  └──────────┬───────────┘    │ │
│  │             │                 │ │
│  │             │ talks to        │ │
│  │             ↓                 │ │
│  │  ┌──────────────────────┐    │ │
│  │  │  Ollama Container    │    │ │
│  │  │  (AI Models)         │    │ │
│  │  │  Port: 11434         │    │ │
│  │  └──────────────────────┘    │ │
│  │             │                 │ │
│  │             ↓                 │ │
│  │  ┌──────────────────────┐    │ │
│  │  │  Volume: ollama_data │    │ │
│  │  │  (Models Storage)    │    │ │
│  │  └──────────────────────┘    │ │
│  └───────────────────────────────┘ │
└─────────────────────────────────────┘
```

---

## 📦 Containers Explained

### **1. Ollama Container**
- **Purpose:** Runs AI models locally
- **Port:** 11434 (internal communication)
- **Storage:** `ollama_data` volume (~5-20 GB per model)
- **Resources:** 2-6 GB RAM, uses CPU/GPU

### **2. TTZ App Container**
- **Purpose:** Web interface (Streamlit)
- **Port:** 8501 (access via browser)
- **Storage:** `./vectors` folder (document embeddings)
- **Resources:** 500 MB - 2 GB RAM

---

## ⚙️ Configuration

### **docker-compose.yml**

Key settings you can customize:

```yaml
services:
  ollama:
    deploy:
      resources:
        limits:
          cpus: '4'      # Max CPU cores
          memory: 8G     # Max RAM

  ttz-app:
    ports:
      - "8501:8501"      # Change left number to use different port
    volumes:
      - ./vectors:/app/vectors  # Persistent storage
```

### **Change Port:**

Edit `docker-compose.yml`:
```yaml
ports:
  - "8502:8501"  # Now access at localhost:8502
```

### **Resource Limits:**

Adjust based on your system:
```yaml
deploy:
  resources:
    limits:
      cpus: '6'      # More cores = faster
      memory: 12G    # More RAM = bigger models
```

---

## 🔧 Common Commands

### **Essential Commands:**

```bash
# Start everything
docker-compose up -d

# Stop everything
docker-compose down

# Restart
docker-compose restart

# View logs
docker-compose logs -f

# Check status
docker-compose ps

# See resource usage
docker stats
```

### **Model Management:**

```bash
# Download model
docker-compose exec ollama ollama pull qwen2.5:7b

# List models
docker-compose exec ollama ollama list

# Remove model
docker-compose exec ollama ollama rm MODEL_NAME

# Check model details
docker-compose exec ollama ollama show MODEL_NAME
```

### **Maintenance:**

```bash
# Update app
git pull
docker-compose build
docker-compose up -d

# Clean rebuild
docker-compose down
docker-compose build --no-cache
docker-compose up -d

# Clear all data and restart fresh
docker-compose down -v
docker-compose up -d
```

---

## 🐛 Troubleshooting

### **Containers won't start:**
```bash
# Check Docker is running
docker ps

# View logs
docker-compose logs

# Restart Docker Desktop (Windows)
# or: sudo systemctl restart docker (Linux)
```

### **Out of memory:**
```bash
# Check usage
docker stats

# Increase limits in docker-compose.yml
# Or: Docker Desktop → Settings → Resources
```

### **Port conflicts:**
```bash
# Windows
netstat -ano | findstr :8501

# Linux/Mac
lsof -i :8501

# Change port in docker-compose.yml
```

### **Network issues:**
```bash
# Test connection between containers
docker-compose exec ttz-app curl http://ollama:11434

# Recreate network
docker-compose down
docker network prune
docker-compose up -d
```

### **Can't download models:**
```bash
# Check internet in container
docker-compose exec ollama ping -c 3 google.com

# Try pulling directly
docker-compose exec ollama ollama pull qwen2.5:7b --insecure
```

---

## 🧹 Cleanup

### **Remove unused data:**
```bash
# Remove stopped containers
docker container prune

# Remove unused images
docker image prune -a

# Remove unused volumes
docker volume prune

# Complete cleanup (WARNING: removes ALL Docker data)
docker system prune -a --volumes
```

### **Disk space check:**
```bash
# See what's using space
docker system df -v

# Check volume sizes
docker volume ls
docker volume inspect ollama_data
```

---

## 🔐 Security Notes

### **Network Isolation:**
- Containers are isolated from host
- Only exposed ports are accessible
- Internal communication over private network

### **Data Privacy:**
- All processing happens locally
- No data sent to internet
- Models stored in Docker volumes

### **Best Practices:**
- Don't expose port 11434 to internet
- Keep Docker Desktop updated
- Use strong passwords if exposing publicly

---

## 📊 Resource Requirements

### **Minimum (Small Models):**
- **CPU:** 4 cores
- **RAM:** 8 GB
- **Disk:** 15 GB (OS + Docker + 1 model)

### **Recommended (Medium Models):**
- **CPU:** 8 cores
- **RAM:** 16 GB
- **Disk:** 30 GB (OS + Docker + 3 models)

### **Optimal (Large Models):**
- **CPU:** 12+ cores or GPU
- **RAM:** 32 GB
- **Disk:** 50+ GB (OS + Docker + 5+ models)

---

## 🚀 Advanced Usage

### **GPU Support (Linux only):**

Install NVIDIA Container Toolkit:
```bash
# Add Docker GPUs support
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
```

Update `docker-compose.yml`:
```yaml
ollama:
  deploy:
    resources:
      reservations:
        devices:
          - driver: nvidia
            count: 1
            capabilities: [gpu]
```

### **Multiple Instances:**

Run multiple platforms on different ports:
```bash
# Copy project
cp -r TTZ-AI-Platform TTZ-AI-Platform-2

# Edit docker-compose.yml in copy:
# Change ports to 8502:8501
# Change container names

# Run both
cd TTZ-AI-Platform
docker-compose up -d

cd ../TTZ-AI-Platform-2
docker-compose up -d
```

### **Custom Models:**

Add your own models to Ollama:
```bash
# Create Modelfile
docker-compose exec ollama bash
cat > Modelfile << EOF
FROM qwen2.5:7b
PARAMETER temperature 0.8
SYSTEM You are a helpful assistant.
EOF

# Create custom model
ollama create my-custom-model -f Modelfile
```

---

## 📚 Additional Resources

- **Docker Documentation:** https://docs.docker.com/
- **Ollama Models:** https://ollama.ai/library
- **Streamlit Docs:** https://docs.streamlit.io/
- **LangChain Docs:** https://python.langchain.com/

---

## 🎉 You're All Set!

**To start using:**
1. Run: `docker-compose up -d`
2. Open: http://localhost:8501
3. Upload documents and chat!

**To stop:**
```bash
docker-compose down
```

**Questions?** Check troubleshooting section above!

---

**Made with ❤️ for Docker users**