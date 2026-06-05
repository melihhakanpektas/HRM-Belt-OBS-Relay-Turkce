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

### ▶️ Windows Başlangıç Rehberi

**En Kolay Yol (Önerilen):**

1. Proje klasörüne git
2. `start.bat` dosyasına çift tıkla
3. Otomatik olarak:
   - Node.js bağımlılıkları yüklenecek (ilk çalıştırmada)
   - WebSocket sunucusu başlayacak
   - Controller arayüzü Chrome/Edge'de açılacak

**Manuel Başlangıç:**

```cmd
cd hrm-obs
node server.js
```

Sonra tarayıcıda şu adresleri aç:
- Controller: `file:///C:/Users/<KullanıcıAdı>/Desktop/hrm-belt/hrm-obs/controller.html`
- OBS Overlay: `file:///C:/Users/<KullanıcıAdı>/Desktop/hrm-belt/hrm-obs/overlay.html`

### 🍎 macOS Başlangıç Rehberi

1. Terminal'i aç (Spotlight ile: `Cmd + Space` → "Terminal")

2. Proje klasörüne git:
```bash
cd ~/Desktop/hrm-belt
```

3. Başlangıç scriptini çalıştır:
```bash
chmod +x start.sh
./start.sh
```

4. Script otomatik olarak:
   - Bağımlılıkları kontrol edip yükleyecek
   - WebSocket sunucusunu başlatacak
   - Safari veya Chrome'da controller açacak

**Alternatif (Homebrew ile Node.js):**

Node.js yüklü değilse:
```bash
brew install node
```

### 🐧 Linux Başlangıç Rehberi

**Ubuntu/Debian:**

1. Node.js yükle (eğer yüklü değilse):
```bash
sudo apt update
sudo apt install nodejs npm
```

2. Proje klasörüne git:
```bash
cd ~/Desktop/hrm-belt
```

3. Başlangıç scriptini çalıştır:
```bash
chmod +x start.sh
./start.sh
```

**Fedora/RHEL:**

```bash
sudo dnf install nodejs npm
cd ~/Desktop/hrm-belt
chmod +x start.sh
./start.sh
```

**Arch:**

```bash
sudo pacman -S nodejs npm
cd ~/Desktop/hrm-belt
chmod +x start.sh
./start.sh
```

## Kullanım

### 🎮 Controller (Kontrol Paneli) Kullanımı

**Adım 1: Controller'ı Başlat**
- Windows: `start.bat` çift tıkla
- Mac/Linux: Terminal'de `./start.sh` çalıştır
- Otomatik olarak browser'da açılacak

**Adım 2: Bluetooth Sensörüne Bağlan**
1. Kalp atış monitörünün Bluetooth'u açık olduğundan emin ol
2. Controller arayüzündeki "Nabız Sensörüne Bağlan" butonuna tıkla
3. Popup'ta bağlanabileceğin cihazları göreceksin
4. Senin monitörünü seç ve "Pair" (Eşleştir) tıkla

**Adım 3: Gerçek Zamanlı Monitörleme**
- BPM değeri ana ekranda büyük yazıyla gösterilir
- Alt panelde bağlantı durumu, sensör adı, aktif süre gösterilir
- Bağlantıyı kesmek için "Bağlantıyı Kes" butonuna tıkla

### 📹 OBS Overlay Entegrasyonu

**OBS'te Overlay Ekle:**

1. OBS'yi aç
2. "Sources" panelinde "+" butonuna tıkla
3. "Browser Source" seç
4. Yeni kaynak için isim gir (örn: "HRM Overlay")
5. Oluştur/OK

**URL Ayarla (her platform için):**

**Windows:**
```
file:///C:/Users/<KullanıcıAdı>/Desktop/hrm-belt/hrm-obs/overlay.html
```

**Mac:**
```
file:///Users/<KullanıcıAdı>/Desktop/hrm-belt/hrm-obs/overlay.html
```

**Linux:**
```
file:///home/<KullanıcıAdı>/Desktop/hrm-belt/hrm-obs/overlay.html
```

**Properties Ayarla:**
- Width: 1500
- Height: 875
- Refresh browser when scene becomes active: ✓ Kapat
- Shutdown source when not visible: ✓ Kapat

**Pozisyon & Ölçek:**
1. OBS preview'da overlay görünecek
2. Köşelerinden sürükleyerek boyutlandır
3. Ortasından sürükleyerek konumlandır
4. Transparancy (saydamlık) ayarlamak için "Position and Size" kullan

### 💡 İpuçları

- Controller ve Overlay'ı **aynı anda** açık tutabilirsin
- Sensörün aralıklı olarak bağlantı keserse, Bluetooth cihazı susturma modundan çıkar
- Overlay'da "--" görüyorsan, sensör bağlantısı kontrolle
- Best performance için OBS'i ve browser'ı farklı monitörlerde aç

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
