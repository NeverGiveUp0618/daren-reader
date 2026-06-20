@echo off
cd /d "%~dp0"

:: Kill any previous server on port 8765
for /f "tokens=5" %%a in ('netstat -aon 2^>nul ^| findstr ":8765 "') do (
    taskkill /PID %%a /F >nul 2>&1
)

set PYTHON=
where py >nul 2>&1
if not errorlevel 1 set PYTHON=py

if "%PYTHON%"=="" (
    where python >nul 2>&1
    if not errorlevel 1 set PYTHON=python
)

if "%PYTHON%"=="" (
    where python3 >nul 2>&1
    if not errorlevel 1 set PYTHON=python3
)

if "%PYTHON%"=="" (
    echo Python not found. Please install from https://www.python.org/downloads/
    pause
    exit /b 1
)

echo Server starting at http://localhost:8765
echo Close this window to stop.
timeout /t 1 /nobreak >nul
start "" "http://localhost:8765/index.html"
%PYTHON% -m http.server 8765

echo Server stopped.
pause
