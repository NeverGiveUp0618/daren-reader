@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo  ============================================
echo   任付红·民间实用八字  阅读室
echo  ============================================
echo.
echo  正在启动本地服务器，请稍候...
echo  浏览器地址：http://localhost:8765
echo  关闭此窗口即可停止服务
echo.

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
    echo.
    echo  错误：未检测到 Python！
    echo  请先安装：https://www.python.org/downloads/
    echo  安装时勾选 "Add Python to PATH"
    echo.
    pause
    exit /b 1
)

echo  检测到 %PYTHON%，正在启动...
timeout /t 1 /nobreak >nul
start "" "http://localhost:8765"
%PYTHON% -m http.server 8765

echo.
echo  服务器已停止。
pause
