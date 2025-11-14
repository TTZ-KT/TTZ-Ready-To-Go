@echo off
REM Script to push TTZ-Ready-To-Go to GitHub organization TTZ-KT

echo ================================================
echo Pushing TTZ.KT AI Platform to GitHub
echo ================================================
echo.

REM Navigate to your project directory
cd /d C:\TTZ-Ready-To-Go

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Git is not installed!
    echo Please install Git from: https://git-scm.com/downloads
    pause
    exit /b 1
)

echo [1/7] Initializing Git repository...
git init

echo [2/7] Adding remote repository...
REM Remove existing remote if it exists
git remote remove origin 2>nul

REM Add the remote repository (TTZ-KT organization)
git remote add origin https://github.com/TTZ-KT/TTZ-Ready-To-Go.git

echo [3/7] Creating .gitignore...
(
echo # Python
echo __pycache__/
echo *.py[cod]
echo *$py.class
echo *.so
echo .Python
echo env/
echo venv/
echo ENV/
echo build/
echo develop-eggs/
echo dist/
echo downloads/
echo eggs/
echo .eggs/
echo lib/
echo lib64/
echo parts/
echo sdist/
echo var/
echo wheels/
echo *.egg-info/
echo .installed.cfg
echo *.egg
echo.
echo # Virtual Environments
echo .env
echo .venv
echo env/
echo venv/
echo ENV/
echo env.bak/
echo venv.bak/
echo.
echo # IDE
echo .vscode/
echo .idea/
echo *.swp
echo *.swo
echo *~
echo .DS_Store
echo.
echo # Jupyter Notebook
echo .ipynb_checkpoints
echo.
echo # Vector Storage - Exclude actual index files but keep directory structure
echo vectors/*.pkl
echo vectors/*.faiss
echo vectors/faiss_index/*.pkl
echo vectors/faiss_index/*.faiss
echo vectors/faiss_index/*.index
echo.
echo # Keep directory structure files
echo !vectors/.gitkeep
echo !vectors/faiss_index/.gitkeep
echo !vectors/README.md
echo.
echo # Logs
echo *.log
echo logs/
echo.
echo # Temporary files
echo *.tmp
echo *.bak
echo *.swp
echo .cache/
echo.
echo # OS
echo Thumbs.db
echo .DS_Store
echo.
echo # Docker backup
echo docker-compose.yml.bak
) > .gitignore

echo [4/7] Creating vectors directory structure...
if not exist "vectors\faiss_index" mkdir "vectors\faiss_index"

REM Create .gitkeep for vectors directory
(
echo # This file ensures the vectors directory is tracked in Git
echo # The directory will be populated with FAISS index files at runtime
) > vectors\.gitkeep

REM Create .gitkeep for faiss_index directory
(
echo # This file ensures the faiss_index directory is tracked in Git
echo # FAISS vector index files will be stored here during document processing
) > vectors\faiss_index\.gitkeep

echo [5/7] Staging all files...
git add .

echo [6/7] Creating commit...
git commit -m "Initial commit: TTZ.KT AI Platform 2025 - Production Ready RAG System" -m "- 24 AI models support (Qwen, DeepSeek, Llama, Mistral, Gemma, Phi, GPT-OSS, Vision models)" -m "- Multi-format document support (PDF, DOCX, XLSX, Images, JSON, XML, YAML)" -m "- 100%% local processing, complete privacy" -m "- GPU acceleration with CPU fallback" -m "- Docker containerized for easy deployment" -m "- Smart Windows startup with automatic port detection" -m "- Automated setup scripts for Windows, macOS, Linux"

echo [7/7] Pushing to GitHub...
git branch -M main
git push -u origin main

if errorlevel 1 (
    echo.
    echo ================================================
    echo PUSH FAILED
    echo ================================================
    echo.
    echo Common issues:
    echo 1. Repository doesn't exist on GitHub
    echo    - Create it first at: https://github.com/organizations/TTZ-KT/repositories/new
    echo    - Name it: TTZ-Ready-To-Go
    echo.
    echo 2. Authentication required
    echo    - You need to authenticate with GitHub
    echo    - Use Personal Access Token or SSH key
    echo.
    echo 3. No write permission
    echo    - Make sure you have write access to TTZ-KT organization
    echo.
    pause
    exit /b 1
)

echo.
echo ================================================
echo SUCCESS!
echo ================================================
echo.
echo Repository: https://github.com/TTZ-KT/TTZ-Ready-To-Go
echo.
echo ================================================
pause
