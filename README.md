# 🚗 Turkey Car Catalog & Vehicle Dataset (Türkiye Otomobil Veri Seti)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Brands](https://img.shields.io/badge/Brands-94-crimson.svg)](#)
[![Models](https://img.shields.io/badge/Models-3%2C545%2B-blue.svg)](#)
[![Formats](https://img.shields.io/badge/Formats-JSON%20%7C%20SQL%20%7C%20CSV-green.svg)](#)
[![Maintained by ST Motors](https://img.shields.io/badge/Powered%20By-ST%20Motors-B70116.svg)](https://www.stmotorss.com)

Türkiye pazarındaki otomotiv yazılımları, ekspertiz sistemleri, araç değerleme motorları, sigorta/kasko teklif platformları ve yapay zeka (RAG/LLM) projeleri için **özel olarak normalize edilmiş, tekilleştirilmiş ve hiyerarşik olarak yapılandırılmış** açık kaynak araç veri seti.

> 💎 **Bu veri seti [ST Motors](https://www.stmotorss.com) otomobil kataloğu altyapısı standartlarına göre düzenlenmiş ve açık kaynak topluluğunun kullanımına sunulmuştur.**

---

## 🌟 Öne Çıkan Özellikler

* **🧹 Normalize Edilmiş Temiz Veri:** Web kazıma kaynaklı *"Photos, engines & full specs"* gibi çöp metinler, bozuk üretim yılları ve mükerrer kayıtlar elenmiş; 3.545 benzersiz model elde edilmiştir.
* **🇹🇷 Türkiye Pazarı Odaklı Hiyerarşi:** Togg, Tofaş, Volkswagen Jetta, Renault Megane/Clio, Fiat Egea gibi Türkiye'de çok satan tüm modeller için **Marka ➔ Ana Model Serisi ➔ Kasa / Versiyon** kademeli seçim hiyerarşisi içerir.
* **⚡ 31 Popüler Model Serisi İçin Hazır Trim Paketi:** 1.2 TSI, 1.4 TSI DSG, 1.6 TDI, EcoBoost, Hybrid gibi hazır teknik motor, şanzıman ve yakıt kombinasyonları.
* **🔒 Supabase / PostgreSQL RLS Koruması:** `schema.sql` ve `dump.sql` tabloları, veritabanına aktarıldığında anonim yazma riskini engelleyen varsayılan **Row Level Security (RLS)** kurallarıyla birlikte gelir.
* **💾 Çoklu Format:** İster JSON, ister PostgreSQL / Supabase SQL dump, isterseniz Pandas/Excel uyumlu CSV olarak kullanın.

---

## 📊 Veri Seti İstatistikleri

| Metrik | Sayı | Açıklama |
| :--- | :--- | :--- |
| **Marka Sayısı** | **94** | Global süper sporlardan (Ferrari, Porsche) yerel markalara (Togg, Tofaş) kadar |
| **Tekil Model Sayısı** | **3.545** | Mükerrer kayıtlardan arındırılmış temiz aktif ve geçmiş modeller |
| **Model Ailesi** | **114** | Jetta, Passat, Golf, C-Serisi, 3 Serisi, Egea gibi ana seriler |
| **Kasa & Versiyon** | **424** | Doğrudan seçilebilir kasa ve gövde varyantları |
| **Hazır Trim Grubu** | **31** | Popüler modeller için motor hacmi, yakıt ve şanzıman presetleri |

---

## 📂 Dosya Yapısı

```bash
├── data/
│   ├── brands.json                  # 94 Marka (isim, slug, menşei, logo CDN)
│   ├── models.json                  # 3.545 Tekil Model (marka ilişkili)
│   ├── brand-model-families.json    # Kademeli model serileri ve varyantları
│   └── popular-vehicle-trims.json   # Popüler donanım ve motor paketleri
├── database/
│   ├── schema.sql                   # Tablo yapıları + RLS Politikaları
│   └── dump.sql                     # Tek tıkla veritabanına aktarılabilir tam SQL dökümü
├── csv/
│   ├── brands.csv
│   └── models.csv
└── logos/                           # Yerel SVG logolar (Togg, Tofaş, Karsan, Jaecoo)
```

---

## 🚀 Hızlı Başlangıç

### JavaScript / TypeScript
```typescript
import brands from './data/brands.json';
import models from './data/models.json';

// Volkswagen markasının modellerini listele
const vw = brands.find(b => b.slug === 'volkswagen');
const vwModels = models.filter(m => m.brand_id === vw.id);
console.log(vwModels);
```

### Python (Pandas)
```python
import pandas as pd

df_models = pd.read_csv('csv/models.csv')
print(df_models.head())
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
