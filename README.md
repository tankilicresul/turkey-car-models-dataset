# 🚗 Turkey Car Catalog & Vehicle Dataset (Türkiye Otomobil Veri Seti)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Brands](https://img.shields.io/badge/Brands-94-crimson.svg)](#)
[![Models](https://img.shields.io/badge/Models-5%2C489%2B-blue.svg)](#)
[![Formats](https://img.shields.io/badge/Formats-JSON%20%7C%20SQL%20%7C%20CSV-green.svg)](#)
[![Maintained by ST Motors](https://img.shields.io/badge/Powered%20By-ST%20Motors-B70116.svg)](https://www.stmotorss.com)

Türkiye pazarındaki otomotiv yazılımları, ekspertiz sistemleri, araç değerleme motorları, sigorta/kasko teklif platformları ve yapay zeka (RAG/LLM) projeleri için **özel olarak temizlenmiş, normalize edilmiş ve hiyerarşik olarak yapılandırılmış** en kapsamlı açık kaynak araç veri seti.

> 💎 **Bu veri seti [ST Motors](https://www.stmotorss.com) premium otomobil değerleme altyapısı için derlenmiş ve açık kaynak topluluğunun kullanımına sunulmuştur.**

---

## 🌟 Neden Bu Veri Seti?

* **🧹 Scraper Pisliklerinden Sıfır Kalıntı:** Web kazıma kaynaklı *"Photos, engines & full specs"* gibi çöp metinler, bozuk üretim yılları ve çift kayıtlar tamamen temizlenmiştir.
* **🇹🇷 Türkiye Pazarı Odaklı Hiyerarşi:** Togg, Tofaş, Volkswagen Jetta, Renault Megane/Clio, Fiat Egea gibi Türkiye'de çok satan tüm modeller için **Marka ➔ Ana Model Serisi ➔ Kasa / Versiyon** kademeli seçim hiyerarşisi içerir.
* **⚡ 107 Hazır Trim & Motor Paketi:** 1.2 TSI, 1.4 TSI DSG, 1.6 TDI, EcoBoost, Hybrid gibi hazır teknik motor, şanzıman ve yakıt kombinasyonları.
* **🖼️ Doğrulanmış Logo URL'leri:** 94 markanın yüksek kaliteli vektör (SVG) ve optimize CDN PNG logoları test edilmiş ve eşlenmiştir.
* **💾 Çoklu Format:** İster JSON, ister PostgreSQL / Supabase SQL dump, isterseniz Pandas/Excel uyumlu CSV olarak kullanın.

---

## 📊 Veri Seti İstatistikleri

| Metrik | Sayı | Açıklama |
| :--- | :--- | :--- |
| **Marka Sayısı** | **94** | Global süper sporlardan (Ferrari, Porsche) yerel markalara (Togg, Tofaş) kadar |
| **Model Sayısı** | **5.489+** | Aktif ve geçmiş tüm binek, SUV ve ticari modeller |
| **Model Ailesi** | **114** | Jetta, Passat, Golf, C-Serisi, 3 Serisi, Egea gibi ana seriler |
| **Kasa & Versiyon** | **424** | Doğrudan seçilebilir kasa varyantları |
| **Hazır Trim Paketi** | **107** | Motor hacmi, yakıt ve şanzımanı otomatik dolduran hazır paketler |

---

## 📂 Dosya Yapısı

```bash
├── data/
│   ├── brands.json                  # 94 Marka (isim, slug, menşei, logo)
│   ├── models.json                  # 5.489 Model (marka ilişkili)
│   ├── brand-model-families.json    # Kademeli model serileri ve varyantları
│   └── popular-vehicle-trims.json   # Popüler donanım ve motor paketleri
├── database/
│   ├── schema.sql                   # Tablo yapıları (PostgreSQL / Supabase)
│   └── dump.sql                     # Tek tıkla veritabanına aktarılabilir SQL
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

## 📜 Lisans & Atıf

Bu proje **MIT Lisansı** ile korunmaktadır. Ticari ve kişisel tüm projelerinizde dilediğiniz gibi ücretsiz kullanabilirsiniz. Projelerinizde kaynak olarak [ST Motors](https://www.stmotorss.com) bağlantısını belirtmeniz rica olunur.
