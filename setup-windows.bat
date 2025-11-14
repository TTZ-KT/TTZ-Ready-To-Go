@echo off
setlocal enabledelayedexpansion

echo.
echo ========================================================
echo.
echo     TTZ.KT AI PLATFORM 2025 - Complete Setup
echo     With DNS Fix ^& GPU Auto-Detection
echo.
echo ========================================================
echo.

REM =====================================================
REM STEP 1: Check Docker Installation
REM =====================================================
echo [1/8] Checking Docker installation...
docker --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Docker is not installed!
    echo.
    echo Please install Docker Desktop from:
    echo https://www.docker.com/products/docker-desktop
    echo.
    pause
    exit /b 1
)
echo [OK] Docker found!

REM =====================================================
REM STEP 2: Check if Docker is Running
REM =====================================================
echo [2/8] Checking if Docker is running...
docker ps >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Docker is not running!
    echo.
    echo Please start Docker Desktop and try again.
    pause
    exit /b 1
)
echo [OK] Docker is running!

REM =====================================================
REM STEP 3: Check/Configure Docker DNS
REM =====================================================
echo [3/8] Checking Docker DNS configuration...
echo.

REM Test DNS resolution
docker run --rm alpine ping -c 1 8.8.8.8 >nul 2>&1
if errorlevel 1 (
    echo [WARNING] Docker cannot access internet!
    echo.
    echo DNS needs to be configured in Docker Desktop.
    echo.
    echo Please configure DNS manually:
    echo 1. Docker Desktop is already open
    echo 2. Go to Settings ^(gear icon^)
    echo 3. Click "Docker Engine"
    echo 4. Make sure you have these lines in JSON:
    echo.
    echo   "dns": ["8.8.8.8", "8.8.4.4", "1.1.1.1"],
    echo   "dns-opts": ["ndots:0"]
    echo.
    echo 5. Click "Apply ^& Restart"
    echo 6. Wait for Docker to restart
    echo.
    echo Then run this script again.
    echo.
    pause
    exit /b 1
)
echo [OK] Docker DNS is working!

REM =====================================================
REM STEP 4: Check GPU Availability
REM =====================================================
echo [4/8] Checking for NVIDIA GPU...
nvidia-smi >nul 2>&1
if errorlevel 1 (
    echo [INFO] No NVIDIA GPU detected or drivers not installed
    echo       Application will use CPU mode
) else (
    echo [OK] NVIDIA GPU detected!
    nvidia-smi --query-gpu=name,driver_version --format=csv,noheader
)
echo.

REM =====================================================
REM STEP 5: Check Docker Compose
REM =====================================================
echo [5/8] Checking Docker Compose...
docker compose version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Docker Compose not found!
    echo Docker Compose is included with Docker Desktop.
    echo Please reinstall Docker Desktop.
    pause
    exit /b 1
)
echo [OK] Docker Compose found!

REM =====================================================
REM STEP 6: Build Docker Images
REM =====================================================
echo [6/8] Building Docker images...
echo.
echo ================================================
echo  DOWNLOAD INFORMATION:
echo ================================================
echo  - PyTorch: ~200 MB
echo  - AI Libraries: ~500 MB
echo  - Other packages: ~300 MB
echo  Total: ~1 GB
echo.
echo  Estimated time: 15-30 minutes
echo.
echo  The build is split into 3 stages:
echo  [Stage 1] System dependencies
echo  [Stage 2] PyTorch ^& AI libs
echo  [Stage 3] Remaining packages
echo.
echo  If interrupted, just run again - Docker caches!
echo ================================================
echo.
echo Starting build...
echo.

docker compose build
if errorlevel 1 (
    echo.
    echo ================================================
    echo  BUILD FAILED
    echo ================================================
    echo.
    echo  Common causes:
    echo.
    echo  1. Network timeout - Run again, resumes from cache
    echo  2. DNS not working - Configure Docker DNS
    echo  3. Low disk space - Need 10+ GB free
    echo.
    echo ================================================
    pause
    exit /b 1
)
echo.
echo [OK] Docker images built successfully!

REM =====================================================
REM STEP 7: Download AI Model
REM =====================================================
echo [7/8] Starting services and downloading AI model...
echo.
echo Starting Ollama service...
docker compose up -d ollama
timeout /t 10 /nobreak >nul

echo.
echo Downloading qwen2.5:7b model (~4.7 GB)...
echo This may take 5-15 minutes...
echo.
docker compose exec ollama ollama pull qwen2.5:7b
if errorlevel 1 (
    echo.
    echo [WARNING] Model download may have failed.
    echo You can download it later using:
    echo   docker compose exec ollama ollama pull qwen2.5:7b
    echo.
)

REM =====================================================
REM STEP 8: Start All Services
REM =====================================================
echo [8/8] Starting TTZ.KT AI Platform...
docker compose up -d

if errorlevel 1 (
    echo.
    echo [ERROR] Failed to start services!
    echo Check logs: docker compose logs
    pause
    exit /b 1
)

REM Give services time to initialize
echo.
echo Waiting for services to initialize...
timeout /t 5 /nobreak >nul

REM =====================================================
REM SUCCESS MESSAGE
REM =====================================================
cls
echo.
echo ========================================================
echo.
echo   SUCCESS! TTZ.KT AI PLATFORM IS READY!
echo.
echo ========================================================
echo.
echo  Access the application at:
echo    http://localhost:8501
echo.
echo ========================================================
echo  DAILY COMMANDS:
echo ========================================================
echo  Start:      docker compose up -d
echo  Stop:       docker compose down
echo  Restart:    docker compose restart
echo  Logs:       docker compose logs -f
echo  Status:     docker compose ps
echo.
echo  Download more models:
echo    docker compose exec ollama ollama pull MODEL_NAME
echo.
echo  List models:
echo    docker compose exec ollama ollama list
echo.
echo ========================================================
echo.
echo Opening browser in 3 seconds...
timeout /t 3 /nobreak >nul
start http://localhost:8501

echo.
echo Press any key to close this window...
pause >nul