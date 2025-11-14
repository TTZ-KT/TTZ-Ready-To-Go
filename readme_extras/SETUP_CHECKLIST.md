# ✅ Setup Checklist - TTZ.KT AI Platform (Windows)

Print this page and check off each step as you complete it!

---

## 📋 Phase 1: Install Docker Desktop

- [ ] Go to https://www.docker.com/products/docker-desktop/
- [ ] Download `Docker Desktop Installer.exe`
- [ ] Run installer
- [ ] Check "Use WSL 2 instead of Hyper-V"
- [ ] Click OK and wait for installation
- [ ] Click "Close and restart"
- [ ] Computer restarts (wait for this)
- [ ] Docker Desktop starts automatically
- [ ] See whale icon 🐳 in system tray (bottom-right)

---

## 📋 Phase 2: Verify Docker

- [ ] Open Command Prompt (Windows + R, type `cmd`, press Enter)
- [ ] Type: `docker --version` and press Enter
- [ ] See Docker version displayed
- [ ] Type: `docker run hello-world` and press Enter
- [ ] See "Hello from Docker!" message ✅

---

## 📋 Phase 3: Download Project

Choose ONE option:

### Option A: Download ZIP
- [ ] Go to GitHub project page
- [ ] Click green "Code" button
- [ ] Click "Download ZIP"
- [ ] Extract ZIP to: `C:\Users\YourName\Documents\TTZ-AI-Platform`
- [ ] Remember this location!

### Option B: Use Git (if installed)
- [ ] Open Command Prompt
- [ ] Type: `cd C:\Users\YourName\Documents`
- [ ] Type: `git clone <your-repo-url>`
- [ ] Type: `cd TTZ_ready_to_go-olama`

---

## 📋 Phase 4: Place Docker Files

- [ ] Copy ALL these files to your project folder:
  - `Dockerfile`
  - `docker-compose.yml`
  - `.dockerignore`
  - `setup-windows.bat`
  - `WINDOWS_SETUP.md`
  - `WINDOWS_QUICK_REFERENCE.md`
  - `DOCKER_README.md`

Your folder should now contain:
```
TTZ-AI-Platform/
├── app.py
├── rag_engine.py
├── rag_engine_enhanced.py
├── requirements.txt
├── README.md
├── INSTALL.md
├── Dockerfile               ← NEW
├── docker-compose.yml       ← NEW
├── .dockerignore           ← NEW
├── setup-windows.bat       ← NEW
├── WINDOWS_SETUP.md        ← NEW
├── WINDOWS_QUICK_REFERENCE.md  ← NEW
└── DOCKER_README.md        ← NEW
```

---

## 📋 Phase 5: Run Setup Script

- [ ] Open File Explorer
- [ ] Navigate to: `C:\Users\YourName\Documents\TTZ-AI-Platform`
- [ ] Find `setup-windows.bat`
- [ ] Double-click `setup-windows.bat`
- [ ] Wait for Docker images to build (5-10 minutes) ☕
- [ ] Wait for services to start
- [ ] Wait for model download (another 5-10 minutes) ☕
- [ ] See "TTZ.KT AI Platform is READY!" message
- [ ] Browser opens automatically

---

## 📋 Phase 6: First Use

- [ ] Browser shows: http://localhost:8501
- [ ] See "TTZ.KT AI Platform 2025" title
- [ ] Sidebar on left is visible
- [ ] See "Select AI Model" dropdown
- [ ] Select "Qwen 2.5: qwen2.5:7b"
- [ ] See "✅ Ollama Local" status
- [ ] Click "Choose files" in sidebar
- [ ] Select a test document (PDF, DOCX, etc.)
- [ ] Click "🚀 Process All Files"
- [ ] Wait for processing
- [ ] See "✅ Processed 1 file(s)" message
- [ ] Type a question in chat box
- [ ] Press Enter
- [ ] Get an answer! 🎉

---

## 📋 Phase 7: Create Shortcuts (Optional)

### Start Shortcut:
- [ ] Right-click Desktop → New → Text Document
- [ ] Name it: `Start-TTZ-AI.bat`
- [ ] Right-click → Edit
- [ ] Copy content from WINDOWS_SETUP.md
- [ ] Edit the path to match your folder
- [ ] Save and close
- [ ] Double-click to test

### Stop Shortcut:
- [ ] Create: `Stop-TTZ-AI.bat`
- [ ] Copy stop script from WINDOWS_SETUP.md
- [ ] Edit path
- [ ] Save

---

## 📋 Phase 8: Daily Usage Test

### Starting:
- [ ] Double-click `Start-TTZ-AI.bat` (or run: `docker-compose up -d`)
- [ ] Wait 10-15 seconds
- [ ] Open: http://localhost:8501
- [ ] Platform loads successfully

### Using:
- [ ] Upload document
- [ ] Ask questions
- [ ] Get answers
- [ ] Works smoothly

### Stopping:
- [ ] Double-click `Stop-TTZ-AI.bat` (or run: `docker-compose down`)
- [ ] Services stop
- [ ] No errors

---

## 🎯 Success Criteria

You're done when ALL these are true:

- ✅ Docker Desktop installed and running
- ✅ Whale icon 🐳 visible in taskbar
- ✅ `docker --version` works in Command Prompt
- ✅ Project files in correct folder
- ✅ `docker-compose up -d` starts services
- ✅ http://localhost:8501 shows the app
- ✅ Can select AI model
- ✅ Can upload and process documents
- ✅ Can ask questions and get answers
- ✅ Can stop with `docker-compose down`

---

## ❓ If Something Goes Wrong

### Docker won't install:
- Check Windows version (need Windows 10 1903+ or Windows 11)
- Enable virtualization in BIOS
- Install WSL 2: https://aka.ms/wsl2

### Docker won't start:
- Restart computer
- Check Windows Updates
- Reinstall Docker Desktop

### Setup script fails:
- Make sure Docker Desktop is running (whale icon visible)
- Run Command Prompt as Administrator
- Check internet connection

### Can't access localhost:8501:
- Wait 30-60 seconds after starting
- Try: `docker-compose ps` to check status
- Check firewall isn't blocking port 8501

### Model download too slow:
- Press Ctrl+C to skip
- Download later: `docker-compose exec ollama ollama pull qwen2.5:7b`
- Try smaller model first: `ollama pull phi3`

---

## 📞 Need Help?

1. Check logs: `docker-compose logs -f`
2. Read: `WINDOWS_SETUP.md` (detailed guide)
3. Read: `WINDOWS_QUICK_REFERENCE.md` (quick commands)
4. Restart everything: `docker-compose down` then `docker-compose up -d`
5. Ask in GitHub Issues (provide error messages and logs)

---

## 🎉 Congratulations!

If you checked all boxes above, you now have:
- ✅ A fully working AI platform
- ✅ Running locally on your computer
- ✅ 100% private and offline
- ✅ Easy to start and stop
- ✅ No manual Python setup needed

**Enjoy chatting with your documents! 🚀**

---

**Estimated Total Time:** 30-45 minutes
- Docker installation: 10 minutes
- Project setup: 5 minutes  
- Docker build: 10 minutes
- Model download: 10 minutes
- Testing: 5 minutes

**☕ Grab a coffee and let Docker do the work!**