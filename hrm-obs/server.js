process.on("uncaughtException", (err) => {
  console.error("[KRITIK HATA]", err.message);
  console.error(err.stack);
  // 3 saniye bekle ki log okunabilsin, sonra yeniden basla
  setTimeout(() => process.exit(1), 3000);
});

process.on("unhandledRejection", (reason) => {
  console.error("[UNHANDLED REJECTION]", reason);
});

import WebSocket, { WebSocketServer } from "ws";
const OPEN = WebSocket.OPEN;

const PORT = 8765;
const wss = new WebSocketServer({ port: PORT });

wss.on("error", (err) => {
  if (err.code === "EADDRINUSE") {
    console.error(`[HATA] Port ${PORT} zaten kullanımda. Önceki sunucu hâlâ çalışıyor olabilir.`);
    console.error("start.bat üzerinden tekrar deneyin veya portu kullanan işlemi kapatın.");
  } else {
    console.error("[HATA]", err.message);
  }
  process.exit(1);
});

let lastState = {
  type: "state",
  connected: false,
  bpm: null,
  rawBpm: null,
  deviceName: null,
  timestamp: Date.now(),
};

function broadcast(data, excludeSocket = null) {
  const message = JSON.stringify(data);

  for (const client of wss.clients) {
    if (client !== excludeSocket && client.readyState === OPEN) {
      client.send(message);
    }
  }
}

wss.on("connection", (socket) => {
  socket.send(JSON.stringify(lastState));

  socket.on("message", (message) => {
    try {
      const data = JSON.parse(message.toString());

      if (data.type === "state" || data.type === "bpm") {
        lastState = {
          ...lastState,
          ...data,
          timestamp: Date.now(),
        };

        broadcast(lastState, socket);
      }
    } catch (err) {
      console.error("Invalid message:", err.message);
    }
  });

  socket.on("close", () => {
    // Controller kapanırsa otomatik disconnected demiyoruz;
    // çünkü overlay son state'i birkaç saniye daha gösterebilir.
  });
});

console.log(`HRM WebSocket relay çalışıyor: ws://localhost:${PORT}`);
