# 🐋 Docker Deployment Package - TTZ.KT AI Platform

## 📦 What's Included

This package contains everything you need to deploy the TTZ.KT AI Platform using Docker on Windows.

---

## 📄 Files Overview

### **Core Docker Files** (Required)

1. **`Dockerfile`** (1.6 KB)
   - Defines how to build the app container
   - Installs Python, dependencies, and application code
   - Don't modify unless you know what you're doing

2. **`docker-compose.yml`** (1.5 KB)
   - Orchestrates both Ollama and App containers
   - Configures networking, ports, and volumes
   - Edit this to change ports or resource limits

3. **`.dockerignore`** (800 bytes)
   - Tells Docker what files to ignore during build
   - Speeds up build process
   - No need to edit

---

### **Setup & Automation** (Windows)

4. **`setup-windows.bat`** (4.4 KB)
   - **⭐ START HERE!**
   - Automated setup script for Windows
   - Checks Docker, builds images, starts services
   - Downloads default AI model
   - **Just double-click to run!**

---

### **Documentation**

5. **`WINDOWS_SETUP.md`** (12 KB)
   - **📖 Complete step-by-step guide**
   - Install Docker Desktop from scratch
   - Download project, build, and run
   - Troubleshooting section
   - **Read this if you're new to Docker**

6. **`WINDOWS_QUICK_REFERENCE.md`** (4.2 KB)
   - **⚡ Quick commands cheat sheet**
   - Common docker-compose commands
   - Model management
   - Daily workflow
   - **Print and keep handy!**

7. **`SETUP_CHECKLIST.md`** (5.9 KB)
   - **✅ Step-by-step checklist**
   - Track your progress
   - Success criteria
   - Troubleshooting quick fixes
   - **Perfect for first-time setup**

8. **`DOCKER_README.md`** (11 KB)
   - **🔧 Advanced Docker guide**
   - Architecture explanation
   - Container details
   - Advanced configurations
   - GPU support, multiple instances
   - **For experienced users**

---

## 🚀 Quick Start for Absolute Beginners

### **If you've NEVER used Docker:**

1. **Read:** `WINDOWS_SETUP.md` (start to finish)
2. **Follow:** Every step carefully
3. **Run:** `setup-windows.bat` when ready
4. **Check off:** Items in `SETUP_CHECKLIST.md`

**Estimated time:** 30-45 minutes

---

### **If you've used Docker before:**

1. **Place files:** Copy all files to your project root
2. **Run:**
   ```cmd
   docker-compose build
   docker-compose up -d
   docker-compose exec ollama ollama pull qwen2.5:7b
   ```
3. **Open:** http://localhost:8501

**Estimated time:** 10-15 minutes

---

## 📁 Where to Put These Files

Copy ALL these Docker files to your project root:

```
TTZ-AI-Platform/                    ← Your project folder
├── app.py                          ← Existing files
├── rag_engine.py                   ← Existing files
├── rag_engine_enhanced.py          ← Existing files
├── requirements.txt                ← Existing files
├── README.md                       ← Existing files
├── INSTALL.md                      ← Existing files
│
├── Dockerfile                      ← NEW: Copy here
├── docker-compose.yml              ← NEW: Copy here
├── .dockerignore                   ← NEW: Copy here
├── setup-windows.bat               ← NEW: Copy here
├── WINDOWS_SETUP.md                ← NEW: Copy here
├── WINDOWS_QUICK_REFERENCE.md      ← NEW: Copy here
├── SETUP_CHECKLIST.md              ← NEW: Copy here
└── DOCKER_README.md                ← NEW: Copy here
```

---

## 🎯 Usage Scenarios

### **Scenario 1: First Time Installation**

**Your situation:** Never installed anything, complete beginner

**Steps:**
1. Download and extract project to `C:\Users\YourName\Documents\TTZ-AI-Platform`
2. Open and read `WINDOWS_SETUP.md`
3. Follow instructions to install Docker Desktop
4. Double-click `setup-windows.bat`
5. Wait and done!

**Time:** 30-45 minutes

---

### **Scenario 2: Docker Already Installed**

**Your situation:** Have Docker Desktop already

**Steps:**
1. Extract project files
2. Open Command Prompt in project folder
3. Run: `setup-windows.bat`
4. Wait for build and model download

**Time:** 15-20 minutes

---

### **Scenario 3: Quick Rebuild**

**Your situation:** Already set up, need to update/rebuild

**Steps:**
1. Open Command Prompt in project folder
2. Run:
   ```cmd
   docker-compose down
   docker-compose build
   docker-compose up -d
   ```

**Time:** 5-10 minutes

---

### **Scenario 4: Daily Use**

**Your situation:** Just want to use it

**Morning:**
```cmd
docker-compose up -d
```
Open: http://localhost:8501

**Evening:**
```cmd
docker-compose down
```

**Time:** 10 seconds to start, 5 seconds to stop

---

## 🗂️ File Dependencies

```
setup-windows.bat
    ↓ needs
docker-compose.yml
    ↓ needs
Dockerfile
    ↓ needs
.dockerignore
```

**All 4 core files must be in the same folder!**

---

## 📚 Which Document to Read?

### **"I've never used Docker"**
→ Read: `WINDOWS_SETUP.md` (complete guide)

### **"I want a checklist to follow"**
→ Use: `SETUP_CHECKLIST.md` (step-by-step)

### **"I need quick commands"**
→ Use: `WINDOWS_QUICK_REFERENCE.md` (cheat sheet)

### **"I want to understand how it works"**
→ Read: `DOCKER_README.md` (architecture)

### **"Just get me started!"**
→ Run: `setup-windows.bat` (automated)

---

## ⚙️ Configuration Options

### **Change App Port** (if 8501 is taken)

Edit `docker-compose.yml`:
```yaml
ttz-app:
  ports:
    - "8502:8501"  # Change 8501 to 8502 (or any free port)
```

Then access at: http://localhost:8502

---

### **Allocate More Resources**

Edit `docker-compose.yml`:
```yaml
ollama:
  deploy:
    resources:
      limits:
        cpus: '8'      # Increase for faster processing
        memory: 16G    # Increase for larger models
```

---

### **Use External Ollama**

If you already have Ollama installed locally (not in Docker):

1. Edit `docker-compose.yml`
2. Remove the entire `ollama:` service section
3. Change in `ttz-app`:
   ```yaml
   environment:
     - OLLAMA_HOST=http://host.docker.internal:11434
   ```

---

## 🔧 Troubleshooting

### **"Docker not found"**
→ Install Docker Desktop from https://www.docker.com/

### **"Port already in use"**
→ Edit `docker-compose.yml` to use different port

### **"Out of disk space"**
→ Run: `docker system prune -a`

### **"Too slow"**
→ Increase RAM in Docker Desktop → Settings → Resources

### **"Can't download models"**
→ Check internet connection, try smaller model first

---

## 🎯 Success Checklist

You're fully set up when:

- ✅ Docker Desktop installed and running
- ✅ All 8 files in project folder
- ✅ `docker-compose ps` shows 2 running containers
- ✅ http://localhost:8501 loads the app
- ✅ At least one model downloaded
- ✅ Can upload documents and chat

---

## 📊 System Requirements

### **Minimum:**
- Windows 10 64-bit (1903+) or Windows 11
- 8 GB RAM
- 20 GB free disk space
- Internet (for initial setup)

### **Recommended:**
- Windows 11
- 16 GB RAM
- 50 GB free disk space
- SSD for better performance

---

## 🆘 Getting Help

1. **Check logs:**
   ```cmd
   docker-compose logs -f
   ```

2. **Read troubleshooting:**
   - `WINDOWS_SETUP.md` → Troubleshooting section
   - `DOCKER_README.md` → Debugging section

3. **Restart everything:**
   ```cmd
   docker-compose down
   docker-compose up -d
   ```

4. **Still stuck?**
   - Create GitHub Issue
   - Include error messages
   - Include output of: `docker-compose logs`

---

## 🔄 Updating

When new version is released:

```cmd
git pull
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

Models are preserved automatically.

---

## 🗑️ Uninstalling

### **Remove Application:**
```cmd
docker-compose down -v
```

### **Remove Docker Images:**
```cmd
docker system prune -a
```

### **Uninstall Docker Desktop:**
Windows Settings → Apps → Docker Desktop → Uninstall

---

## 📞 Support

- **Documentation:** Read the included `.md` files
- **GitHub Issues:** Report bugs and ask questions
- **Logs:** Always check `docker-compose logs` first

---

## ✨ What Makes This Better Than Manual Setup?

| Aspect | Manual Install | Docker Setup |
|--------|---------------|--------------|
| Python install | Required | Not needed |
| Dependencies | Manual pip install | Automated |
| Conflicts | Possible | Isolated |
| Setup time | 30+ minutes | 15 minutes |
| Cleanup | Messy | One command |
| Portability | None | High |
| Updates | Manual | Simple rebuild |

---

## 🎉 Ready to Start?

**Complete beginners:**
1. Read `WINDOWS_SETUP.md`
2. Run `setup-windows.bat`
3. Use `SETUP_CHECKLIST.md` to track progress

**Experienced users:**
1. Run `setup-windows.bat`
2. Or manually: `docker-compose up -d`

**Everyone:**
- Keep `WINDOWS_QUICK_REFERENCE.md` handy
- Bookmark http://localhost:8501

---

**🚀 Let's containerize your AI platform! 🚀**

Questions? Start with `WINDOWS_SETUP.md`!