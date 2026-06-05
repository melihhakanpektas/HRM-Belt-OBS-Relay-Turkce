@echo off
chcp 65001 >nul
title HRM Belt OBS Relay

cd /d "%~dp0hrm-obs"

echo.
echo  ╔══════════════════════════════════════╗
echo  ║        HRM Belt OBS Relay            ║
echo  ╚══════════════════════════════════════╝
echo.

REM --- node_modules kontrol ---
if not exist "node_modules\" (
    echo  [KURULUM] node_modules bulunamadi, npm install calistiriliyor...
    echo.
    call npm install
    if errorlevel 1 (
        echo.
        echo  [HATA] npm install basarisiz. Node.js yuklu mu?
        pause
        exit /b 1
    )
    echo.
)

echo  [SUNUCU] WebSocket relay baslatiliyor...
echo.
echo  ┌─────────────────────────────────────────────────┐
echo  │  WebSocket : ws://localhost:8765                 │
echo  │  Controller: controller.html  (Chrome/Edge)     │
echo  │  Overlay   : overlay.html     (OBS Browser)     │
echo  └─────────────────────────────────────────────────┘
echo.
echo  Kapat: Bu pencereyi kapat veya Ctrl+C
echo.

REM --- controller.html'yi Chrome veya Edge ile ac ---
set "FILE=%~dp0hrm-obs\controller.html"

where chrome >nul 2>&1
if %errorlevel%==0 (
    echo  [TARAYICI] Chrome ile controller.html aciliyor...
    start "" chrome "%FILE%"
    goto :server
)

set "CHROME_PATH=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%CHROME_PATH%" (
    echo  [TARAYICI] Chrome ile controller.html aciliyor...
    start "" "%CHROME_PATH%" "%FILE%"
    goto :server
)

set "EDGE_PATH=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if exist "%EDGE_PATH%" (
    echo  [TARAYICI] Edge ile controller.html aciliyor...
    start "" "%EDGE_PATH%" "%FILE%"
    goto :server
)

set "EDGE_PATH2=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if exist "%EDGE_PATH2%" (
    echo  [TARAYICI] Edge ile controller.html aciliyor...
    start "" "%EDGE_PATH2%" "%FILE%"
    goto :server
)

echo  [UYARI] Chrome veya Edge bulunamadi. controller.html'yi elle ac:
echo  %FILE%
echo.

:server
echo  ─────────────────────────────────────────────────────
echo  SUNUCU LOGLARI:
echo  ─────────────────────────────────────────────────────
echo.

REM --- 8765 portunu kullanan islemi durdur ---
echo  [PORT] 8765 portu kontrol ediliyor...
for /f "tokens=5" %%a in ('netstat -ano 2^>nul ^| findstr /r " :::8765 " 2^>nul') do (
    if not "%%a"=="" (
        echo  [PORT] PID %%a kapatiliyor...
        taskkill /f /pid %%a >nul 2>&1
    )
)
timeout /t 1 /nobreak >nul

:run
node server.js
echo.
echo  [SUNUCU] Beklenmedik sekilde kapandi. 3 saniye sonra yeniden baslatiliyor...
echo  Cikis icin bu pencereyi kapat.
timeout /t 3 /nobreak >nul
goto :run
