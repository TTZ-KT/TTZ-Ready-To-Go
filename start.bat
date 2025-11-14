@echo off
setlocal enabledelayedexpansion

echo ========================================
echo TTZ.KT AI Platform - Smart Starter
echo ========================================
echo.

echo [1/6] Checking Docker Desktop...

:: Check if Docker is running
docker info >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Docker Desktop is running!
    goto :find_port
)

echo [WARN] Docker Desktop is not running
echo [2/6] Starting Docker Desktop...

:: Start Docker Desktop
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

echo [3/6] Waiting for Docker to start...
echo This may take 30-60 seconds...
echo.

:: Wait for Docker to be ready (max 2 minutes)
set /a counter=0
:wait_loop
timeout /t 5 /nobreak > nul
docker info >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Docker Desktop is ready!
    goto :find_port
)

set /a counter+=1
if %counter% lss 24 (
    echo Still waiting... (%counter%/24)
    goto :wait_loop
)

echo.
echo [ERROR] Docker Desktop did not start in time
echo Please start Docker Desktop manually and try again
echo.
pause
exit /b 1

:find_port
echo.
echo [4/6] Finding available port...

:: Try ports 8501 to 8510
set FOUND_PORT=0
for /L %%p in (8501,1,8510) do (
    netstat -an | find "LISTENING" | find ":%%p " >nul 2>&1
    if errorlevel 1 (
        set FOUND_PORT=%%p
        echo [OK] Port %%p is available!
        goto :update_compose
    ) else (
        echo [SKIP] Port %%p is already in use
    )
)

:: If no port found
if !FOUND_PORT! equ 0 (
    echo [ERROR] All ports 8501-8510 are in use!
    echo Please free up a port or stop conflicting applications
    pause
    exit /b 1
)

:update_compose
echo.
echo [5/6] Configuring application to use port !FOUND_PORT!...

:: Backup original docker-compose.yml
if not exist docker-compose.yml.bak (
    copy docker-compose.yml docker-compose.yml.bak >nul
)

:: Update docker-compose.yml with available port
powershell -Command "(Get-Content docker-compose.yml) -replace '\"[0-9]+:8501\"', '\"%FOUND_PORT%:8501\"' | Set-Content docker-compose.yml"

echo [OK] Configured to use port !FOUND_PORT!

echo.
echo [6/6] Starting TTZ.KT AI Platform...
docker compose up -d

echo.
echo Waiting for services to start...
timeout /t 5 /nobreak > nul

echo.
echo [OK] Opening browser...
start http://localhost:!FOUND_PORT!

echo.
echo ========================================
echo TTZ.KT AI Platform Started!
echo ========================================
echo Application: http://localhost:!FOUND_PORT!
echo.
echo To stop: stop.bat
echo ========================================
echo.

endlocal