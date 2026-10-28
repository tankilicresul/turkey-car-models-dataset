# 🚗 Turkey Car Catalog & Vehicle Dataset 2026 (Türkiye Vasıta & Otomobil Veri Seti)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Catalog: 2026 Edition](https://img.shields.io/badge/Catalog-2026%20Edition-success.svg)](#)
[![Brands](https://img.shields.io/badge/Brands-101-crimson.svg)](#)
[![Categorized Models](https://img.shields.io/badge/Categorized%20Models-1%2C083-blue.svg)](#)
[![Raw Records](https://img.shields.io/badge/Total%20Records-4%2C734-purple.svg)](#)
[![Formats](https://img.shields.io/badge/Formats-JSON%20%7C%20CSV%20%7C%20XLSX%20%7C%20SQL-darkgreen.svg)](#)
[![Maintained by ST Motors](https://img.shields.io/badge/Maintained%20By-ST%20Motors-B70116.svg)](https://www.stmotorss.com)

Türkiye otomotiv pazarı, araç değerleme motorları, ekspertiz yazılımları, sigorta/kasko teklif sistemleri ve otomotiv yapay zeka (LLM / RAG) uygulamaları için **2026 güncel pazar verileriyle normalize edilmiş, hiyerarşik ve kategorize edilmiş** açık kaynak vasıta veri seti.

> 💎 **Bu veri seti [ST Motors](https://www.stmotorss.com) kurumsal araç alım ve değerleme standartlarına göre derlenmiş, 2026 güncel vasıta kataloğuyla zenginleştirilmiş ve açık kaynak topluluğuna sunulmuştur.**

---

## 🆕 28 Ekim 2026 Güncellemesi: ST Motors Sihirbaz Kataloğu

* **`data/st-motors-wizard-catalog-2026.json` / `csv/st-motors-wizard-catalog-2026.csv` (yeni):** [stmotorss.com/aracini-sat](https://www.stmotorss.com/aracini-sat) değerleme sihirbazında müşterinin seçebildiği ağacın birebir kopyası: araç türü (Otomobil / SUV / Ticari) → marka → model; her model için yıl aralığı (1990–2026), kasa tipleri, yakıt ve vites seçenekleri ile TSB kasko listesindeki paket sayısı. **935 satır** (Otomobil 65 marka / 495 model, SUV 66 / 316, Ticari 29 / 124).
* **Model aileleri 515 → 858:** Türkiye'de satılmış ama model ailesi listesinde olmayan 28 markanın modelleri eklendi (Chrysler, Dodge, Smart, Lancia, Lada, Daewoo, Proton, Tata, Geely, Saab, Rover, Daihatsu, Infiniti, Cadillac, Lincoln, GMC, Alpine, Lotus, Omoda, Leapmotor, Lynk & Co, Seres, Skywell, SWM, IKCO, Polestar, Hongqi, Voyah) ve var olan markalarda eksik ~180 model (Hyundai i40, Kia Optima, VW Sharan, Mercedes CLK/Viano, Jaguar X-Type...).
* **Marka sayısı 94 → 101**, model sayısı 3.543 → 3.727. `alfa-repo` slug hatası `alfa-romeo` olarak düzeltildi.
* **SQL:** `catalog_model_families` ve `catalog_wizard_models` tabloları şemaya ve dump'a eklendi (RLS: herkese açık salt okunur). Dump PostgreSQL 16'da hatasız yüklendiği doğrulandı.
* Yıllar 2012 ve sonrası için TSB kasko listesinden (Ekim 2026), daha eskiler üretim/satış yıllarından alınmıştır.

## 🌟 2026 Sürümü ile Gelen Yenilikler

* 🆕 **2026 Güncel Vasıta Kataloğu (`excel/vasita_marka_model_2026.xlsx`):** Türkiye pazarında satışta olan ve ikinci elde işlem gören tüm vasıta sınıflarını içeren **4.734 satırlık resmi referans veri seti**.
* 🎯 **4 Ana Vasıta Kategorisi (`data/turkey-vehicles-categorized-2026.json`):**
  1. **Otomobil (Binek):** Sedan, Hatchback, Station Wagon, Coupe, Cabrio
  2. **Arazi, SUV & Pick-up:** C-SUV, D-SUV, 4x4, Şehir Crossover, Pick-up
  3. **Ticari & Kamyonet (Minivan/Panelvan):** Caddy, Doblo, Fiorino, Courier, Transporter, Vito, Custom vb.
  4. **Elektrikli Araçlar (EV):** Togg, Tesla, BYD, Porsche Taycan, BMW i-Serisi, Mercedes EQ vb.
* ⚡ **3.543 Model & 812 Trim/Motor Paketi:** Motor hacmi (cc), beygir gücü (hp), yakıt türü (*BENZIN, DIZEL, HIBRIT, ELEKTRIK*), şanzıman ve donanım varyantları.
* 🇹🇷 **Yerli ve Küresel Marka Entegrasyonu:** Togg, Tofaş, Karsan'dan BYD, Jaecoo, Tesla, Chery ve süper spor üreticilerine kadar 101 marka.
* 💾 **Çoklu Veri Formatı:** İster **JSON**, ister **CSV**, ister **Excel XLSX**, isterseniz **PostgreSQL / Supabase SQL Dump**.

---

## 📊 Veri Seti İstatistikleri

| Metrik | Sayı | Açıklama |
| :--- | :--- | :--- |
| **Toplam Ham Vasıta Kaydı** | **4.734** | 2026 Vasıta kataloğundaki toplam satır sayısı |
| **Kategorize Edilmiş Model** | **1.083** | Binek, SUV, Hafif Ticari ve Elektrikli olarak filtrelenmiş model serisi |
| **Marka Sayısı** | **101** | Menşei ülke, segment (*supercar, luxury, premium, standard*) ve resmi logo URL'leri |
| **Model Ailesi (Hierarchy)** | **858** | Marka ➔ Ana Model Serisi ➔ Kasa/Paket hiyerarşisi |
| **Sihirbaz Kataloğu (Tür → Marka → Model)** | **935** | ST Motors değerleme sihirbazının yıl, kasa, yakıt ve vites bilgili ağacı |
| **Preset Trim & Donanım** | **812** | 248 popüler model için cc, hp, yakıt, vites kombinasyonları |
| **Desteklenen Formatlar** | **4** | JSON, CSV, Excel (.xlsx), PostgreSQL/Supabase (.sql) |

---

## 📂 Dosya ve Dizin Yapısı

```bash
├── excel/
│   └── vasita_marka_model_2026.xlsx       # 2026 Resmi vasıta marka/model Excel kataloğu (17 sayfa, 4.734 satır)
├── data/
│   ├── turkey-vehicles-categorized-2026.json # 2026 Kategorize edilmiş araç serileri (Otomobil, SUV, Ticari, EV)
│   ├── st-motors-wizard-catalog-2026.json  # Sihirbaz ağacı: tür → marka → model (yıl, kasa, yakıt, vites)
│   ├── brands.json                         # 101 Marka (slug, menşei, pazar segmenti, logo CDN)
│   ├── models.json                         # 3.727 Tekil model ve marka ilişkisi
│   ├── brand-model-families.json           # 858 Model ailesi (kasa tipleri ve yıl aralığıyla)
│   └── popular-vehicle-trims.json          # 812 Hazır donanım, motor ve güç paketi
├── csv/
│   ├── turkey-vehicles-categorized-2026.csv # 2026 Kategorize veri CSV dökümü
│   ├── st-motors-wizard-catalog-2026.csv   # Sihirbaz ağacı CSV
│   ├── brands.csv                          # Markalar tablosu
│   ├── models.csv                          # Modeller tablosu
│   ├── trims.csv                           # Trimler & motor güçleri tablosu
│   └── brand-model-families.csv            # Model aileleri tablosu
├── database/
│   ├── schema.sql                          # PostgreSQL / Supabase şeması + RLS güvenlik politikaları
│   └── dump.sql                            # Tek komutla içe aktarılabilir SQL veritabanı yedeği
└── logos/                                  # Togg, Tofaş, Karsan, Jaecoo yerel vektörel SVG logoları
```

---

## 🚀 Hızlı Başlangıç

### JavaScript / TypeScript (Node.js & Next.js)
```typescript
import categorizedVehicles from './data/turkey-vehicles-categorized-2026.json';
import brands from './data/brands.json';

// 2026 Hafif Ticari & Kamyonet kategorisindeki modelleri listele
const commercialVehicles = categorizedVehicles.filter(v => v.category === 'MINIVAN_PANELVAN');
console.log('Hafif Ticari Araçlar:', commercialVehicles);

// Elektrikli araçları (EV) listele
const evVehicles = categorizedVehicles.filter(v => v.category === 'ELEKTRIK');
console.log('Elektrikli Modeller:', evVehicles);
```

### Python (Pandas)
```python
import pandas as pd

# 2026 Kategorize edilmiş veri setini yükle
df = pd.read_csv('csv/turkey-vehicles-categorized-2026.csv')

# Kategori bazlı model dağılımı
print(df['category'].value_counts())

# Volkswagen modellerini filtrele
vw_models = df[df['brand_name'] == 'Volkswagen']
print(vw_models[['model_name', 'category']].head(10))
```

### Sihirbaz kataloğu (değerleme formu kurmak için)
```typescript
import wizard from './data/st-motors-wizard-catalog-2026.json';

// SUV türünde Jeep modelleri ve seçilebilir yılları
const jeep = wizard.vehicleTypes.SUV.find((b) => b.slug === 'jeep');
jeep?.models.forEach((m) => console.log(m.model, m.minYear, '-', m.maxYear, m.bodyTypes, m.fuels));
```

### PostgreSQL / Supabase İçe Aktarma
```bash
psql -h your-db-host -U postgres -d your_db -f database/dump.sql
```

---

## 🏷️ Araç Türü Kapsam Standardı (ST Motors Kriterleri)

Veri seti özellikle değerleme ve ekspertiz sistemlerinde kolay entegrasyon için 4 çekirdek sınıfta normalize edilmiştir:

1. **Otomobil:** Sedan, Hatchback, Station Wagon, Coupe, Cabrio (Binek araçlar).
2. **Arazi, SUV & Pick-up:** Şehir SUV'ları, 4x4 arazi taşıtları ve çift kabin pick-up modelleri.
3. **Ticari & Kamyonet:** Minivan, panelvan, hafif kamyonet (Caddy, Doblo, Fiorino, Courier, Transporter, Vito).
4. **Elektrikli (EV):** %100 elektrikli binek ve crossover modeller.

*(Ağır vasıta, çekici, iş makinesi, motosiklet ve deniz taşıtları bu ana değerleme kümelerinden ayrıştırılmıştır.)*

---

## ⚖️ Yasal Bildirim & Telif Hakları (Trademark & License)

1. **Ticari Markalar:** Bu veri setinde yer alan tüm otomobil ve vasıta marka isimleri, model adları ve logolar ilgili üreticilerin tescilli markalarıdır. Veriler yalnızca tanıtım, teknik referans, araştırma ve adil kullanım (Fair Use) kapsamında sunulmuştur.
2. **Lisans:** Bu veri seti ve yazılım araçları **MIT Lisansı** ile lisanslanmıştır. Projelerinizde kaynak olarak [ST Motors](https://www.stmotorss.com) bağlantısını belirtmeniz rica olunur.
