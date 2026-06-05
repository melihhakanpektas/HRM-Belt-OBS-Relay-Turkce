#!/bin/bash

# Mac ve Linux için HRM Belt OBS Relay başlatma scripti

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HRMS_OBS_DIR="$SCRIPT_DIR/hrm-obs"

cd "$HRMS_OBS_DIR"

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║        HRM Belt OBS Relay            ║"
echo "  ╚══════════════════════════════════════╝"
echo ""

# --- node_modules kontrol ---
if [ ! -d "node_modules" ]; then
    echo "  [KURULUM] node_modules bulunamadı, npm install çalıştırılıyor..."
    echo ""
    npm install
    if [ $? -ne 0 ]; then
        echo ""
        echo "  [HATA] npm install başarısız. Node.js yüklü mü?"
        exit 1
    fi
    echo ""
fi

echo "  [SUNUCU] WebSocket relay başlatılıyor..."
echo ""
echo "  ┌─────────────────────────────────────────────────┐"
echo "  │  WebSocket : ws://localhost:8765                 │"
echo "  │  Controller: controller.html  (Chrome/Safari)   │"
echo "  │  Overlay   : overlay.html     (OBS Browser)     │"
echo "  └─────────────────────────────────────────────────┘"
echo ""
echo "  Kapat: Bu pencereyi kapat veya Ctrl+C"
echo ""

# --- controller.html'yi Chrome veya Safari ile aç ---
FILE="$HRMS_OBS_DIR/controller.html"

# Chrome yüklü mü kontrol et
if command -v google-chrome &> /dev/null; then
    echo "  [TARAYICI] Chrome ile controller.html açılıyor..."
    open -a "Google Chrome" "$FILE"
elif command -v chromium &> /dev/null; then
    echo "  [TARAYICI] Chromium ile controller.html açılıyor..."
    open -a "Chromium" "$FILE"
elif [ -d "/Applications/Google Chrome.app" ]; then
    echo "  [TARAYICI] Chrome ile controller.html açılıyor..."
    open -a "Google Chrome" "$FILE"
elif [ -d "/Applications/Chromium.app" ]; then
    echo "  [TARAYICI] Chromium ile controller.html açılıyor..."
    open -a "Chromium" "$FILE"
else
    # Safari veya sistemde bulunan herhangi bir browser ile aç
    echo "  [TARAYICI] Varsayılan browser ile controller.html açılıyor..."
    open "$FILE"
fi

echo ""

# --- 8765 portunu kullanan işlemi durdur ---
echo "  [PORT] 8765 portu kontrol ediliyor..."
if lsof -Pi :8765 -sTCP:LISTEN -t >/dev/null ; then
    echo "  [PORT] 8765 portunu kullanan işlem kapatılıyor..."
    lsof -ti :8765 | xargs kill -9 2>/dev/null || true
    sleep 1
fi

echo "  ─────────────────────────────────────────────────────"
echo "  SUNUCU LOGLARI:"
echo "  ─────────────────────────────────────────────────────"
echo ""

# --- Server başlatma ve otomatik restart ---
while true; do
    node server.js
    EXIT_CODE=$?
    echo ""
    echo "  [SUNUCU] Beklenmedik şekilde kapandı. 3 saniye sonra yeniden başlatılıyor..."
    echo "  Çıkış için: Ctrl+C"
    sleep 3
done
