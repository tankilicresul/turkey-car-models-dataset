# 🚗 Turkey Car Catalog & Vehicle Dataset (Türkiye Otomobil Veri Seti)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Brands](https://img.shields.io/badge/Brands-94-crimson.svg)](#)
[![Models](https://img.shields.io/badge/Models-3543%2B-blue.svg)](#)
[![Families](https://img.shields.io/badge/Model%20Families-515-purple.svg)](#)
[![Trims](https://img.shields.io/badge/Preset%20Trims-812-darkgreen.svg)](#)
[![Formats](https://img.shields.io/badge/Formats-JSON%20%7C%20SQL%20%7C%20CSV-green.svg)](#)
[![Maintained by ST Motors](https://img.shields.io/badge/Powered%20By-ST%20Motors-B70116.svg)](https://www.stmotorss.com)

Türkiye pazarındaki otomotiv yazılımları, ekspertiz sistemleri, araç değerleme motorları, sigorta/kasko teklif platformları ve yapay zeka (RAG/LLM) projeleri için **özel olarak normalize edilmiş, tekilleştirilmiş ve hiyerarşik olarak yapılandırılmış** açık kaynak araç veri seti.

> 💎 **Bu veri seti [ST Motors](https://www.stmotorss.com) otomobil kataloğu altyapısı standartlarına göre düzenlenmiş ve açık kaynak topluluğunun kullanımına sunulmuştur.**

---

## 🌟 Öne Çıkan Özellikler

* **🧹 Normalize Edilmiş & Zenginleştirilmiş Veri:** 5510 ham veritabanı kaydı taranmış; web kazıma kaynaklı *"Photos, engines & full specs"* gibi çöp metinler, bozuk üretim yılları ve mükerrer kayıtlar ayıklanarak **3543 benzersiz model** elde edilmiştir.
* **🌍 %100 Doğrulanmış Marka Bilgisi:** 94 markanın tamamı için menşei ülke (*Almanya, İtalya, Japonya, Fransa, İngiltere, ABD, Türkiye vb.*), pazar segment kategorisi (*supercar, luxury, premium, standard*) ve resmi logo URL'leri eksiksiz doldurulmuştur.
* **🇹🇷 Türkiye Pazarı Odaklı Hiyerarşi:** Togg, Tofaş, Volkswagen (Passat, Golf, Polo, Jetta), Renault (Clio, Megane, Austral, R9, Toros), Fiat (Egea, Linea, Fiorino, Doblo) gibi Türkiye'de çok satan tüm modeller için **Marka ➔ Ana Model Serisi ➔ Kasa / Versiyon** kademeli seçim hiyerarşisi (**49 markada 515 model ailesi**).
* **⚡ 812 Hazır Trim & Motor Paketi:** 206 model serisi altında motor hacmi (cc), beygir gücü (hp), yakıt türü (*standardize edilmiş HIBRIT, BENZIN, DIZEL, ELEKTRIK*), şanzıman ve gövde tipi kombinasyonları.
* **🔒 Supabase / PostgreSQL RLS Koruması:** `schema.sql` ve `dump.sql` tabloları, veritabanına aktarıldığında anonim yazma riskini engelleyen varsayılan **Row Level Security (RLS)** kurallarıyla birlikte gelir.
* **💾 Çoklu Format:** İster JSON, ister PostgreSQL / Supabase SQL dump, isterseniz Pandas/Excel uyumlu CSV (Markalar, Modeller, Trimler, Model Aileleri) olarak kullanın.

---

## 📊 Veri Seti İstatistikleri

| Metrik | Sayı | Açıklama |
| :--- | :--- | :--- |
| **Marka Sayısı** | **94** | Global süper sporlardan (Ferrari, Porsche) yerel markalara (Togg, Tofaş, Karsan) kadar |
| **Doğrulanmış Ülke & Segment** | **%100** | 94 markanın tamamı için menşei ülke ve pazar segmenti |
| **Ham Veri Kaydı** | **5510** | Temizleme öncesi ham veritabanı satır sayısı |
| **Tekil & Temiz Model** | **3543** | Mükerrer üretim yılı kopyalarından ve çöp metinlerden arındırılmış net model sayısı |
| **Model Ailesi** | **515** | 49 marka altında Sedan, Hatchback, SUV, Station Wagon, Coupe/Cabrio, Ticari aileler |
| **Hazır Trim & Motor Paketi** | **812** | 206 model grubu altında cc, hp, yakıt, şanzıman ve kasa presetleri |

---

## 📂 Dosya Yapısı

```bash
├── data/
│   ├── brands.json                  # 94 Marka (isim, slug, menşei ülke, pazar kategorisi, logo CDN)
│   ├── models.json                  # 3543 Tekil Model (marka ilişkili, temizlenmiş)
│   ├── brand-model-families.json    # 515 Kademeli model serisi ve varyantları
│   └── popular-vehicle-trims.json   # 812 Popüler donanım, motor ve güç paketi
├── database/
│   ├── schema.sql                   # Tablo yapıları + RLS Politikaları
│   └── dump.sql                     # Tek tıkla veritabanına aktarılabilir tam SQL dökümü (Brands, Models, Trims)
├── csv/
│   ├── brands.csv                   # Marka listesi CSV
│   ├── models.csv                   # Model listesi CSV
│   ├── trims.csv                    # 697+ donanım ve motor paketi CSV (Pandas/Excel uyumlu)
│   └── brand-model-families.csv     # Model aileleri ve gövde kategorileri CSV
└── logos/                           # Yerel SVG logolar (Togg, Tofaş, Karsan, Jaecoo)
```

---

## 🚀 Hızlı Başlangıç

### JavaScript / TypeScript
```typescript
import brands from './data/brands.json';
import models from './data/models.json';
import trims from './data/popular-vehicle-trims.json';

// Volkswagen markasının modellerini listele
const vw = brands.find(b => b.slug === 'volkswagen');
const vwModels = models.filter(m => m.brand_id === vw.id);
console.log(vwModels);

// Volkswagen Golf için hazır donanım & motor presetleri
const golfTrims = trims['volkswagen:golf'];
console.log(golfTrims);
```

### Python (Pandas)
```python
import pandas as pd

# Modelleri yükle
df_models = pd.read_csv('csv/models.csv')
print(df_models.head())

# Donanım & motor paketlerini incele
df_trims = pd.read_csv('csv/trims.csv')
print(df_trims[df_trims['brand_slug'] == 'volkswagen'][['trim_name', 'engine', 'fuel', 'power_hp']])
```

### PostgreSQL / Supabase Import
```bash
psql -h your-db-host -U postgres -d your_db -f database/dump.sql
```

---

## ⚖️ Yasal Bildirim & Telif Hakları (Trademark & Attribution)

1. **Ticari Markalar (Trademarks):** Bu veri setinde yer alan tüm otomobil marka isimleri, model adları, amblem ve logolar ilgili üretici şirketlerin tescilli ticari markalarıdır. Bu veriler yalnızca tanıtım, referans, eğitim ve adil kullanım (Fair Use) kapsamında bilgi amaçlı listelenmiştir. ST Motors bu markaların hiçbirinin resmi temsilcisi veya telif sahibi olduğunu iddia etmez.
2. **Upstream Logo Kaynağı:** CDN logo yönlendirmeleri açık kaynaklı [filippofilip95/car-logos-dataset](https://github.com/filippofilip95/car-logos-dataset) (MIT Lisansı) projesinden referans alınmıştır.
3. **Yazılım & Şema Lisansı:** Veritabanı şemaları, JSON veri hiyerarşisi ve dönüştürme scriptleri **MIT Lisansı** ile lisanslanmıştır. Projelerinizde kaynak olarak [ST Motors](https://www.stmotorss.com) bağlantısını belirtmeniz rica olunur.
