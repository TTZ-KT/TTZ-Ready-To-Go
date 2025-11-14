# 🎯 Quick Reference - TTZ.KT AI Platform (Windows)

## ⚡ Quick Commands

### **Start the Platform**
```cmd
docker-compose up -d
```
Then open: http://localhost:8501

### **Stop the Platform**
```cmd
docker-compose down
```

### **Restart Services**
```cmd
docker-compose restart
```

### **Check Status**
```cmd
docker-compose ps
```

### **View Logs**
```cmd
docker-compose logs -f
```
Press `Ctrl+C` to exit

---

## 🤖 Model Management

### **Download a Model**
```cmd
docker-compose exec ollama ollama pull qwen2.5:7b
```

### **List Downloaded Models**
```cmd
docker-compose exec ollama ollama list
```

### **Remove a Model**
```cmd
docker-compose exec ollama ollama rm MODEL_NAME
```

### **Popular Models to Try**

**General Use:**
```cmd
docker-compose exec ollama ollama pull qwen2.5:7b       # Best balanced (4.7 GB)
docker-compose exec ollama ollama pull llama3.2         # Fast (2.0 GB)
docker-compose exec ollama ollama pull phi3             # Lightweight (2.3 GB)
```

**Advanced:**
```cmd
docker-compose exec ollama ollama pull deepseek-r1:8b   # Best reasoning (4.9 GB)
docker-compose exec ollama ollama pull mistral          # Fast & smart (4.1 GB)
```

**Vision AI (for images):**
```cmd
docker-compose exec ollama ollama pull llama3.2-vision  # Image understanding
docker-compose exec ollama ollama pull llava            # Fast vision
```

---

## 🔧 Troubleshooting

### **Docker Not Running**
1. Open Docker Desktop
2. Wait for whale icon 🐳 in taskbar
3. Try command again

### **Port Already in Use**
```cmd
docker-compose down
netstat -ano | findstr :8501
taskkill /PID <NUMBER> /F
docker-compose up -d
```

### **Complete Reset**
```cmd
docker-compose down -v
docker-compose up -d
```
⚠️ This removes downloaded models!

### **Update the App**
```cmd
git pull
docker-compose build
docker-compose up -d
```

---

## 📂 File Locations

### **Project Files:**
```
C:\Users\YourName\Documents\TTZ-AI-Platform\
```

### **Docker Data:**
- Ollama models: Docker volume `ollama_data`
- Vector database: `./vectors/` folder

### **View Docker Volume Size:**
```cmd
docker system df -v
```

---

## 🎮 Desktop Shortcuts

### **Start.bat**
```batch
@echo off
cd C:\Users\YourName\Documents\TTZ-AI-Platform
docker-compose up -d
timeout /t 10
start http://localhost:8501
pause
```

### **Stop.bat**
```batch
@echo off
cd C:\Users\YourName\Documents\TTZ-AI-Platform
docker-compose down
echo Platform stopped!
pause
```

---

## 💡 Tips

### **Speed Up Loading**
- Keep Docker Desktop running in background
- Pre-download models you use frequently
- Allocate more RAM in Docker Desktop settings

### **Save Disk Space**
- Remove unused models: `docker-compose exec ollama ollama rm MODEL`
- Clean Docker cache: `docker system prune -a`
- Keep only 2-3 models you use regularly

### **Better Performance**
1. Docker Desktop → Settings → Resources
2. Set Memory: 8-12 GB
3. Set CPUs: 4-6 cores
4. Enable WSL 2 backend

---

## 📊 System Check

### **Check Docker Resources:**
```cmd
docker stats
```

### **Check Disk Usage:**
```cmd
docker system df
```

### **Check Running Containers:**
```cmd
docker ps
```

### **Check All Containers:**
```cmd
docker ps -a
```

---

## 🆘 Emergency Recovery

### **Services Won't Start:**
```cmd
docker-compose down
docker system prune -f
docker-compose up -d
```

### **Out of Disk Space:**
```cmd
docker system prune -a --volumes
docker-compose up -d
```
⚠️ Removes ALL Docker data!

### **Complete Reinstall:**
```cmd
docker-compose down -v
docker system prune -a --volumes
docker-compose build --no-cache
docker-compose up -d
```

---

## 📞 Support

### **Check Logs:**
```cmd
docker-compose logs ttz-app
docker-compose logs ollama
```

### **Interactive Shell:**
```cmd
docker-compose exec ttz-app /bin/bash
docker-compose exec ollama /bin/bash
```

### **Test Network:**
```cmd
docker-compose exec ttz-app curl http://ollama:11434
```

---

## 🎯 Daily Workflow

**Morning:**
```cmd
cd C:\Users\YourName\Documents\TTZ-AI-Platform
docker-compose up -d
start http://localhost:8501
```

**Evening:**
```cmd
docker-compose down
```

**OR just leave it running 24/7!** ⚡

---

**🎉 That's it! Keep this file handy for quick reference.**