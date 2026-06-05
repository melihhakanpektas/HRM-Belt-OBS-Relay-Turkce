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

- **Node.js 18+** ([indir](https://nodejs.org))
- **npm** (Node.js ile birlikte gelir) veya **yarn**
- **Chrome, Edge veya Chromium tabanlı tarayıcı**
- **OBS Studio** (overlay için)

### Genel Kurulum Adımları

1. Depoyu klonla:

```bash
git clone https://github.com/melihhakanpektas/HRM-Belt-OBS-Relay-Turkce.git
cd HRM-Belt-OBS-Relay-Turkce
```

2. Bağımlılıkları yükle:

```bash
cd hrm-obs
npm install
```

### ▶️ Windows Başlangıç

1. Proje klasörüne git
2. `start.bat` dosyasına çift tıkla
3. Bitti! Otomatik olarak her şey başlayacak

### 🍎 macOS Başlangıç

```bash
cd ~/Desktop/hrm-belt
./start.sh
```

Bitti! Script otomatik olarak her şeyi yapacak.

### 🐧 Linux Başlangıç

```bash
cd ~/Desktop/hrm-belt
./start.sh
```

Bitti! Script otomatik olarak her şeyi yapacak.

> **Not:** Node.js yüklü değilse, paket yöneticinden yükle: `sudo apt install nodejs npm` (Ubuntu/Debian), `sudo dnf install nodejs npm` (Fedora), vb.

## Kullanım

### 🎮 Controller (Kontrol Paneli)

1. Sunucu başlatıldıktan sonra browser otomatik açılacak
2. "Nabız Sensörüne Bağlan" butonuna tıkla
3. Bluetooth cihazını seç ve eşleştir
4. BPM değeri ana ekranda gösterilecek

### 📹 OBS Overlay

1. OBS'de: Sources → "+" → "Browser Source"
2. Dosya yolunu gir:
   ```
   file:///<proje-yolu>/hrm-obs/overlay.html
   ```
3. Boyut: 1500×875px
4. Konumlandır ve hazırsan yayın başla!

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
- Sunucuyu kapat (Ctrl+C) veya start scriptini kapatıp tekrar başlat

**Bluetooth cihazı bağlanmıyor?**
- Chrome/Edge en güncel sürüme güncelle
- Cihazın Bluetooth'u açık ve yakında olduğundan emin ol

## Lisans

MIT License - Melih Hakan Pektas

Bu proje MIT Lisansı altında yayımlanmıştır. Ayrıntılar için [LICENSE](LICENSE) dosyasına bakın.

**MIT Lisansı Özeti:**

- ✅ Ticari kullanım
- ✅ Değişiklik yapma
- ✅ Dağıtma
- ✅ Özel kullanım
- ⚠️ Sorumluluğu almıyorum
- ⚠️ Garanti yok

## Katkıda Bulunma

Projeyi geliştirmek için katkıların bekliyoruz!

1. Depoyu fork et
2. Feature branch oluştur (`git checkout -b feature/YeniOzellik`)
3. Değişiklikleri commit et (`git commit -am 'Yeni özellik ekle'`)
4. Branch'i push et (`git push origin feature/YeniOzellik`)
5. Pull Request aç

**Katkı İçin Yardım:**

- Bug raporları için Issue açabilirsin
- Önerilerin için Discussion başlatabilirsin
- Kod review'ında yardımcı olabilirsin

## İletişim & Destek

- GitHub Issues: Bug raporları ve öneriler
- Discussions: Fikirler ve sorular
- GitHub: [melihhakanpektas](https://github.com/melihhakanpektas)
