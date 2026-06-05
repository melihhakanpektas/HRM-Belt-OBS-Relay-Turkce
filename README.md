# HRM Belt OBS Relay

Bluetooth Kalp Hızı (HR) Monitörü verilerini OBS'e entegre etmek için WebSocket tabanlı bir relay sunucusu.

## Özellikler

### 📊 Bluetooth Kalp Hızı Entegrasyonu

- Web Bluetooth API kullanarak cihazla doğrudan iletişim
- BPM (Beats Per Minute) verilerini gerçek zamanlı olarak okur
- Kalp atış hızı değişikliklerini anında algılar
- Bluetooth Low Energy (BLE) cihazlarıyla uyumlu

### 🎮 İnteraktif Web Controller

- Modern, responsive tasarım
- Kalp atış hızını anlık olarak görüntüler
- Bir tuşla Bluetooth cihazına bağlan/bağlantıyı kes
- Canlı günlük (log) paneli ile bağlantı durumunu takip et
- Aktif monitörleme süresini göster
- Toplam atış sayısını hesapla

### 📹 OBS Broadcasting Overlay

- 4K hazır overlay tasarımı (1500×875px)
- Gerçek zamanlı BPM gösterimi büyük yazı ile
- Dinamik renk değişimi: Normal (yeşil) → Düşük (mavi) → Yüksek (kırmızı)
- Kalp atış animasyonu ile görsel feedback
- Taşkın durum göstergesi
- Profesyonel glass morphism tasarımı

### 🔗 WebSocket Relay Mimarisi

- Localhost üzerinde çalışan dedike relay sunucusu
- Birden fazla istemci aynı anda bağlanabilir
- Düşük latency (gecikme) ile veri iletimi
- Otomatik hata handling ve yeniden bağlanma
- State persistency - son durumu sakla ve yeni bağlananlar için aktar

### 🌐 Türkçe Arayüz

- Tüm UI metinleri Türkçe
- Ülkeye özgü tasarım ve UX best practices
- Kolay kurulum ve kullanım rehberi

### ⚡ Performans & Güvenilirlik

- Minimal bağımlılık (sadece `ws` kütüphanesi)
- Hızlı başlangıç ve başlatma
- Otomatik error recovery
- Port çakışması tespit ve yönetimi
- Kristal temiz console output ile debugging kolaylığı

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
