# HRM Belt OBS Relay

Bluetooth Kalp Hızı (HR) Monitörü verilerini OBS'e entegre etmek için WebSocket tabanlı bir relay sunucusu.

## Özellikler

- 📊 Bluetooth kalp hızı monitöründen BPM (Beats Per Minute) verisini okur
- 🎮 Web tabanlı controller arayüzü
- 📹 OBS Browser Source ile uyumlu overlay
- 🔗 WebSocket ile gerçek zamanlı veri senkronizasyonu
- 🌐 Türkçe arayüz

## Kurulum

### Gereksinimler

- Node.js 18+
- npm veya yarn

### Adımlar

1. Depoyu klonla:
```bash
git clone <repo-url>
cd hrm-belt
```

2. Bağımlılıkları yükle:
```bash
cd hrm-obs
npm install
```

3. Sunucuyu başlat:
```bash
# Windows
start.bat

# Linux/Mac
./start.sh
```

## Kullanım

### Controller (Kontrol Paneli)

1. `start.bat` veya `start.sh` çalıştır
2. Otomatik olarak `controller.html` Chrome/Edge'de açılacak
3. "Nabız sensörüne bağlan" butonuna tıkla
4. Bluetooth cihazını seç

### Overlay (OBS)

1. OBS'de yeni Browser Source ekle
2. URL'e şunu gir:
   ```
   file:///<proje-yolu>/hrm-obs/overlay.html
   ```
3. Boyutu ayarla: 1500×875px (önerilen)

## Teknik Detaylar

- **Port**: ws://localhost:8765
- **Framework**: Node.js + WebSocket (ws)
- **Frontend**: Vanilla HTML/CSS/JavaScript

## Dosya Yapısı

```
hrm-belt/
├── start.bat          # Windows başlangıç scripti
├── start.sh           # Linux/Mac başlangıç scripti
├── hrm-test.html      # Test arayüzü (Bluetooth API denemesi)
└── hrm-obs/
    ├── server.js      # WebSocket relay sunucusu
    ├── controller.html # Kontrol paneli
    ├── overlay.html   # OBS overlay
    ├── package.json
    └── start.bat      # Windows başlangıç scripti
```

## Hata Giderme

**Port 8765 zaten kullanımda?**
- Önceki sunucuyı kapat: `start.bat` penceresini kapat veya Ctrl+C
- Port kullanan işlemi kapat: `taskkill /PID <PID> /F`

**Bluetooth cihazı algılanmıyor?**
- Chrome/Edge en güncel versiyona güncelle
- Cihazın Bluetooth'u açık olduğundan emin ol
- Web Bluetooth API desteği için HTTPS veya localhost gerekli

## Lisans

MIT

## Katkıda Bulunma

Pull requestler memnuniyetle karşılanır!
