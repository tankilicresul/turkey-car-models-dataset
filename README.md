# 🚗 Turkey Car Catalog & Vehicle Dataset 2026 (Türkiye Vasıta & Otomobil Veri Seti)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Catalog: 2026 Edition](https://img.shields.io/badge/Catalog-2026%20Edition-success.svg)](#)
[![Brands](https://img.shields.io/badge/Brands-94+-crimson.svg)](#)
[![Categorized Models](https://img.shields.io/badge/Categorized%20Models-1%2C083-blue.svg)](#)
[![Raw Records](https://img.shields.io/badge/Total%20Records-4%2C734-purple.svg)](#)
[![Formats](https://img.shields.io/badge/Formats-JSON%20%7C%20CSV%20%7C%20XLSX%20%7C%20SQL-darkgreen.svg)](#)
[![Maintained by ST Motors](https://img.shields.io/badge/Maintained%20By-ST%20Motors-B70116.svg)](https://www.stmotorss.com)

Türkiye otomotiv pazarı, araç değerleme motorları, ekspertiz yazılımları, sigorta/kasko teklif sistemleri ve otomotiv yapay zeka (LLM / RAG) uygulamaları için **2026 güncel pazar verileriyle normalize edilmiş, hiyerarşik ve kategorize edilmiş** açık kaynak vasıta veri seti.

> 💎 **Bu veri seti [ST Motors](https://www.stmotorss.com) kurumsal araç alım ve değerleme standartlarına göre derlenmiş, 2026 güncel vasıta kataloğuyla zenginleştirilmiş ve açık kaynak topluluğuna sunulmuştur.**

---

## 🌟 2026 Sürümü ile Gelen Yenilikler

* 🆕 **2026 Güncel Vasıta Kataloğu (`excel/vasita_marka_model_2026.xlsx`):** Türkiye pazarında satışta olan ve ikinci elde işlem gören tüm vasıta sınıflarını içeren **4.734 satırlık resmi referans veri seti**.
* 🎯 **4 Ana Vasıta Kategorisi (`data/turkey-vehicles-categorized-2026.json`):**
  1. **Otomobil (Binek):** Sedan, Hatchback, Station Wagon, Coupe, Cabrio
  2. **Arazi, SUV & Pick-up:** C-SUV, D-SUV, 4x4, Şehir Crossover, Pick-up
  3. **Ticari & Kamyonet (Minivan/Panelvan):** Caddy, Doblo, Fiorino, Courier, Transporter, Vito, Custom vb.
  4. **Elektrikli Araçlar (EV):** Togg, Tesla, BYD, Porsche Taycan, BMW i-Serisi, Mercedes EQ vb.
* ⚡ **3.543 Model & 812 Trim/Motor Paketi:** Motor hacmi (cc), beygir gücü (hp), yakıt türü (*BENZIN, DIZEL, HIBRIT, ELEKTRIK*), şanzıman ve donanım varyantları.
* 🇹🇷 **Yerli ve Küresel Marka Entegrasyonu:** Togg, Tofaş, Karsan'dan BYD, Jaecoo, Tesla, Chery ve süper spor üreticilerine kadar 94+ marka.
* 💾 **Çoklu Veri Formatı:** İster **JSON**, ister **CSV**, ister **Excel XLSX**, isterseniz **PostgreSQL / Supabase SQL Dump**.

---

## 📊 Veri Seti İstatistikleri

| Metrik | Sayı | Açıklama |
| :--- | :--- | :--- |
| **Toplam Ham Vasıta Kaydı** | **4.734** | 2026 Vasıta kataloğundaki toplam satır sayısı |
| **Kategorize Edilmiş Model** | **1.083** | Binek, SUV, Hafif Ticari ve Elektrikli olarak filtrelenmiş model serisi |
| **Marka Sayısı** | **94+** | Menşei ülke, segment (*supercar, luxury, premium, standard*) ve resmi logo URL'leri |
| **Model Ailesi (Hierarchy)** | **515** | Marka ➔ Ana Model Serisi ➔ Kasa/Paket hiyerarşisi |
| **Preset Trim & Donanım** | **812** | 248 popüler model için cc, hp, yakıt, vites kombinasyonları |
| **Desteklenen Formatlar** | **4** | JSON, CSV, Excel (.xlsx), PostgreSQL/Supabase (.sql) |

---

## 📂 Dosya ve Dizin Yapısı

```bash
├── excel/
│   └── vasita_marka_model_2026.xlsx       # 2026 Resmi vasıta marka/model Excel kataloğu (17 sayfa, 4.734 satır)
├── data/
│   ├── turkey-vehicles-categorized-2026.json # 2026 Kategorize edilmiş araç serileri (Otomobil, SUV, Ticari, EV)
│   ├── brands.json                         # 94+ Marka (slug, menşei, pazar segmenti, logo CDN)
│   ├── models.json                         # 3.543 Tekil model ve marka ilişkisi
│   ├── brand-model-families.json           # 515 Kademeli model ailesi
│   └── popular-vehicle-trims.json          # 812 Hazır donanım, motor ve güç paketi
├── csv/
│   ├── turkey-vehicles-categorized-2026.csv # 2026 Kategorize veri CSV dökümü
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
