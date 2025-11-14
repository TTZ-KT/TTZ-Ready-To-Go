# 🪟 TTZ.KT AI Platform - Complete Windows Setup Guide
## From Scratch to Running in 30 Minutes

**📌 What You'll Get:**
- ✅ Fully containerized AI platform
- ✅ One-click start/stop
- ✅ No manual Python/dependency installation needed
- ✅ Clean, isolated environment
- ✅ Easy to update and manage

---

## 📋 **Table of Contents**

1. [Prerequisites Check](#prerequisites-check)
2. [Install Docker Desktop](#install-docker-desktop)
3. [Download Project Files](#download-project-files)
4. [Quick Start (3 Commands)](#quick-start)
5. [Download AI Models](#download-ai-models)
6. [Using the Application](#using-the-application)
7. [Common Commands](#common-commands)
8. [Troubleshooting](#troubleshooting)
9. [Stopping & Starting](#stopping-starting)

---

## 🔍 **Prerequisites Check**

Before starting, verify your Windows system:

### **Minimum Requirements:**
- ✅ **Windows 10 64-bit** (version 1903 or higher) or **Windows 11**
- ✅ **8GB RAM** (16GB recommended)
- ✅ **20GB free disk space**
- ✅ **Internet connection** (for initial setup only)

### **Check Your Windows Version:**

1. Press `Windows + R`
2. Type `winver` and press Enter
3. Make sure you have **Windows 10 version 1903+** or **Windows 11**

---

## 🐋 **Install Docker Desktop**

### **Step 1: Download Docker Desktop**

1. Go to: https://www.docker.com/products/docker-desktop/
2. Click **"Download for Windows"**
3. Save the file: `Docker Desktop Installer.exe`

### **Step 2: Install Docker Desktop**

1. **Run the installer** (double-click `Docker Desktop Installer.exe`)
2. **Important:** Check the box for **"Use WSL 2 instead of Hyper-V"** (recommended)
3. Click **"OK"** and wait for installation (5-10 minutes)
4. Click **"Close and restart"** when prompted
5. **Your computer will restart** - this is normal

### **Step 3: Start Docker Desktop**

After restart:

1. Docker Desktop will start automatically (whale icon in system tray)
2. If not, search for **"Docker Desktop"** in Start menu and open it
3. Wait for the message: **"Docker Desktop is running"**
4. You'll see a **whale icon** 🐳 in your taskbar (bottom-right)

### **Step 4: Verify Installation**

1. Open **Command Prompt** or **PowerShell**:
   - Press `Windows + R`
   - Type `cmd` and press Enter

2. Run this command:
```cmd
docker --version
```

3. You should see something like:
```
Docker version 24.0.x, build xxxxx
```

4. Test Docker is working:
```cmd
docker run hello-world
```

5. If you see "Hello from Docker!", you're ready! ✅

---

## 📥 **Download Project Files**

### **Option A: Download ZIP (Easiest)**

1. Go to your project on GitHub
2. Click the green **"Code"** button
3. Click **"Download ZIP"**
4. Extract the ZIP file to a folder like:
   ```
   C:\Users\YourName\Documents\TTZ-AI-Platform
   ```

### **Option B: Using Git**

If you have Git installed:

1. Open Command Prompt
2. Navigate to where you want the project:
```cmd
cd C:\Users\YourName\Documents
```

3. Clone the repository:
```cmd
git clone https://github.com/YOUR_USERNAME/TTZ_ready_to_go-olama.git
cd TTZ_ready_to_go-olama
```

---

## 🚀 **Quick Start (3 Commands)**

Now let's start everything!

### **Step 1: Open Command Prompt in Project Folder**

**Method 1 (Easy):**
1. Open File Explorer
2. Navigate to your project folder
3. Click on the address bar
4. Type `cmd` and press Enter
5. Command Prompt opens in that folder ✅

**Method 2:**
1. Open Command Prompt
2. Navigate to your project:
```cmd
cd C:\Users\YourName\Documents\TTZ-AI-Platform
```

### **Step 2: Build the Docker Images**

Run this command (first time takes 5-10 minutes):

```cmd
docker-compose build
```

You'll see:
```
[+] Building...
=> pulling image...
=> installing dependencies...
```

☕ **Grab a coffee! This downloads everything needed.**

### **Step 3: Start All Services**

```cmd
docker-compose up -d
```

You'll see:
```
[+] Running 3/3
✔ Network ttz-network        Created
✔ Container ttz-ollama       Started
✔ Container ttz-ai-platform  Started
```

### **Step 4: Wait for Services to Start**

Wait 30-60 seconds for everything to initialize.

Check if running:
```cmd
docker-compose ps
```

You should see both services as **"Up"** or **"healthy"**.

---

## 🤖 **Download AI Models**

Now you need to download at least one AI model.

### **Download Default Model (Recommended)**

```cmd
docker-compose exec ollama ollama pull qwen2.5:7b
```

This downloads the best balanced model (4.7 GB, takes 5-10 minutes).

You'll see:
```
pulling manifest
pulling layers...
██████████████████ 100%
success
```

### **Download Additional Models (Optional)**

**Fast & Lightweight:**
```cmd
docker-compose exec ollama ollama pull llama3.2
docker-compose exec ollama ollama pull phi3
```

**Best Quality:**
```cmd
docker-compose exec ollama ollama pull deepseek-r1:8b
```

**Vision AI (for images):**
```cmd
docker-compose exec ollama ollama pull llama3.2-vision
```

### **Check Downloaded Models**

```cmd
docker-compose exec ollama ollama list
```

---

## 🎉 **Using the Application**

### **Step 1: Open the App**

Open your web browser and go to:
```
http://localhost:8501
```

🎊 **You should see the TTZ.KT AI Platform!**

### **Step 2: Select Your Model**

1. Look at the **sidebar** (left side)
2. Under **"Select AI Model"**, choose your downloaded model
3. Example: Select **"Qwen 2.5: qwen2.5:7b"**

### **Step 3: Upload Documents**

1. In the sidebar, click **"Choose files"**
2. Select your documents (PDF, DOCX, Excel, etc.)
3. Click **"🚀 Process All Files"**
4. Wait for processing (usually 10-30 seconds)

### **Step 4: Start Chatting!**

1. Type your question in the chat box at the bottom
2. Examples:
   - "What is this document about?"
   - "Summarize the main points"
   - "List all questions in the PDF"
   - "What are the key findings?"

---

## 📝 **Common Commands**

Save these for daily use!

### **Start the Application**
```cmd
docker-compose up -d
```

### **Stop the Application**
```cmd
docker-compose down
```

### **View Logs (if something's wrong)**
```cmd
docker-compose logs -f
```
Press `Ctrl+C` to exit logs.

### **Restart Everything**
```cmd
docker-compose restart
```

### **Check Status**
```cmd
docker-compose ps
```

### **Stop and Remove Everything**
```cmd
docker-compose down -v
```
⚠️ This removes downloaded models! Use only if starting fresh.

### **Download a New Model**
```cmd
docker-compose exec ollama ollama pull MODEL_NAME
```

Replace `MODEL_NAME` with:
- `qwen2.5:7b`
- `llama3.2`
- `phi3`
- `deepseek-r1:8b`
- etc.

### **Remove a Model**
```cmd
docker-compose exec ollama ollama rm MODEL_NAME
```

---

## 🔧 **Troubleshooting**

### **Problem: "docker-compose: command not found"**

**Solution:**
Docker Compose might be integrated into Docker Desktop. Try:
```cmd
docker compose up -d
```
(Note: `docker compose` instead of `docker-compose`)

---

### **Problem: "Cannot connect to Docker daemon"**

**Solution:**
1. Open Docker Desktop
2. Wait for it to show "Docker Desktop is running"
3. Look for the whale icon 🐳 in taskbar
4. Try the command again

---

### **Problem: "Port 8501 is already in use"**

**Solution:**

**Option 1 - Find and close the app using port 8501:**
```cmd
netstat -ano | findstr :8501
taskkill /PID <PID_NUMBER> /F
```

**Option 2 - Use a different port:**

Edit `docker-compose.yml`, change:
```yaml
ports:
  - "8502:8501"  # Changed from 8501:8501
```

Then access at: `http://localhost:8502`

---

### **Problem: "Port 11434 is already in use"**

**Solution:**

This means Ollama is already running outside Docker.

**Option 1 - Use existing Ollama:**
Edit `docker-compose.yml` and remove the `ollama` service.

**Option 2 - Stop external Ollama:**
```cmd
taskkill /F /IM ollama.exe
```

---

### **Problem: Docker is slow / running out of memory**

**Solution:**

1. Open **Docker Desktop**
2. Click the **Settings** ⚙️ icon
3. Go to **Resources**
4. Increase:
   - **Memory** to at least **8GB** (12GB recommended)
   - **CPUs** to at least **4 cores**
5. Click **"Apply & Restart"**

---

### **Problem: "Building" takes forever**

**Solution:**

This is normal for the first time. It's downloading:
- Base Python image (~500 MB)
- All Python libraries (~2 GB)
- System dependencies

**Expected times:**
- Fast internet: 5-10 minutes
- Slow internet: 15-30 minutes

Just let it run! ☕

---

### **Problem: App shows "Initializing..." forever**

**Solution:**

1. Check if Ollama is running:
```cmd
docker-compose exec ollama ollama list
```

2. Restart services:
```cmd
docker-compose restart
```

3. Check logs:
```cmd
docker-compose logs ttz-app
```

---

### **Problem: "Model not found" error in app**

**Solution:**

Download the model:
```cmd
docker-compose exec ollama ollama pull qwen2.5:7b
```

Then refresh the browser page.

---

## 🔄 **Stopping & Starting**

### **Daily Use:**

**Start when you need it:**
```cmd
cd C:\Users\YourName\Documents\TTZ-AI-Platform
docker-compose up -d
```

**Open browser:**
```
http://localhost:8501
```

**Stop when done:**
```cmd
docker-compose down
```

### **Quick Restart:**
```cmd
docker-compose restart
```

### **Complete Clean Restart:**
```cmd
docker-compose down
docker-compose up -d
```

---

## 🎯 **Create Desktop Shortcuts**

### **Start Shortcut**

1. Right-click on Desktop → New → Text Document
2. Name it: `Start-TTZ-AI.bat`
3. Edit it and paste:

```batch
@echo off
echo ========================================
echo   Starting TTZ.KT AI Platform...
echo ========================================
echo.

cd C:\Users\YourName\Documents\TTZ-AI-Platform
docker-compose up -d

echo.
echo Waiting for services to start...
timeout /t 15 /nobreak > nul

echo.
echo ========================================
echo   TTZ.KT AI Platform is READY!
echo ========================================
echo.
echo Opening browser...
start http://localhost:8501

echo.
echo Press any key to close this window...
pause > nul
```

4. **Replace** `C:\Users\YourName\Documents\TTZ-AI-Platform` with your actual path
5. Double-click to start!

### **Stop Shortcut**

Create `Stop-TTZ-AI.bat` with:

```batch
@echo off
echo ========================================
echo   Stopping TTZ.KT AI Platform...
echo ========================================
echo.

cd C:\Users\YourName\Documents\TTZ-AI-Platform
docker-compose down

echo.
echo ========================================
echo   TTZ.KT AI Platform stopped!
echo ========================================
echo.
pause
```

---

## 📊 **System Resource Usage**

**What Docker will use:**

| Component | RAM | Disk | CPU |
|-----------|-----|------|-----|
| Docker Base | 1 GB | 2 GB | Low |
| Ollama Service | 2-4 GB | 5-20 GB | Medium |
| Streamlit App | 500 MB | 1 GB | Low |
| **Total** | **~6 GB** | **~10-25 GB** | **25-50%** |

**Model Storage:**
- Each 7B model: ~5 GB
- Each 3B model: ~2 GB
- Vision models: ~5-7 GB

---

## 🆘 **Getting Help**

If you're stuck:

1. Check the logs:
```cmd
docker-compose logs -f
```

2. Restart everything:
```cmd
docker-compose down
docker-compose up -d
```

3. Make sure Docker Desktop is running (whale icon in taskbar)

4. Check system resources in Docker Desktop → Settings → Resources

---

## ✅ **Installation Complete!**

You now have:
- ✅ Docker Desktop installed and running
- ✅ TTZ.KT AI Platform containerized
- ✅ Ollama AI engine running
- ✅ At least one AI model downloaded
- ✅ Web interface accessible at http://localhost:8501

**🎉 Enjoy your private, local AI assistant! 🎉**

---

**Made with ❤️ for Windows users**