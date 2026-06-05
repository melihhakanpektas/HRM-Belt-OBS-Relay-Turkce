#!/bin/bash

# Mac ve Linux için hrm-obs npm server başlatma

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
echo "  WebSocket : ws://localhost:8765"
echo ""
echo "  Kapat: Ctrl+C"
echo ""

# --- 8765 portunu kullanan işlemi durdur ---
if lsof -Pi :8765 -sTCP:LISTEN -t >/dev/null ; then
    echo "  [PORT] 8765 portunu kullanan işlem kapatılıyor..."
    lsof -ti :8765 | xargs kill -9 2>/dev/null || true
    sleep 1
fi

# --- Server başlatma ve otomatik restart ---
while true; do
    node server.js
    EXIT_CODE=$?
    echo ""
    echo "  [SUNUCU] Beklenmedik şekilde kapandı. 3 saniye sonra yeniden başlatılıyor..."
    sleep 3
done
