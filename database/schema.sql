-- PostgreSQL / Supabase Schema for Turkey Car Catalog
-- Powered by ST Motors (https://www.stmotorss.com)

CREATE TABLE IF NOT EXISTS catalog_brands (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) DEFAULT 'standard',
    country VARCHAR(100),
    logo_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS catalog_models (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    brand_id UUID NOT NULL REFERENCES catalog_brands(id) ON DELETE CASCADE,
    canonical_name VARCHAR(150) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT unique_brand_model UNIQUE(brand_id, canonical_name)
);

CREATE TABLE IF NOT EXISTS catalog_preset_trims (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    model_key VARCHAR(100) NOT NULL,
    trim_name VARCHAR(150) NOT NULL,
    engine VARCHAR(150) NOT NULL,
    fuel VARCHAR(30) NOT NULL,
    transmission VARCHAR(30) NOT NULL,
    body_type VARCHAR(30) NOT NULL,
    displacement_cc INT,
    power_hp INT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_catalog_models_brand_id ON catalog_models(brand_id);
CREATE INDEX IF NOT EXISTS idx_catalog_models_name ON catalog_models(canonical_name);
CREATE INDEX IF NOT EXISTS idx_catalog_preset_trims_model_key ON catalog_preset_trims(model_key);

-- Row Level Security (RLS) - Read-only for public access
ALTER TABLE catalog_brands ENABLE ROW LEVEL SECURITY;
ALTER TABLE catalog_models ENABLE ROW LEVEL SECURITY;
ALTER TABLE catalog_preset_trims ENABLE ROW LEVEL SECURITY;

DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies WHERE tablename = 'catalog_brands' AND policyname = 'Public read-only'
    ) THEN
        CREATE POLICY "Public read-only" ON catalog_brands FOR SELECT USING (true);
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_policies WHERE tablename = 'catalog_models' AND policyname = 'Public read-only'
    ) THEN
        CREATE POLICY "Public read-only" ON catalog_models FOR SELECT USING (true);
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_policies WHERE tablename = 'catalog_preset_trims' AND policyname = 'Public read-only'
    ) THEN
        CREATE POLICY "Public read-only" ON catalog_preset_trims FOR SELECT USING (true);
    END IF;
END $$;

-- 2026-10-28: ST Motors değerleme sihirbazı kataloğu (model aileleri + sihirbazda görünen ağaç)
CREATE TABLE IF NOT EXISTS catalog_model_families (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    brand_slug VARCHAR(100) NOT NULL,
    family_id VARCHAR(120) NOT NULL,
    family_name VARCHAR(150) NOT NULL,
    badge VARCHAR(150),
    body_category VARCHAR(30),
    allowed_body_types TEXT[] NOT NULL DEFAULT '{}',
    min_year INT,
    max_year INT,
    is_popular BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT unique_brand_family UNIQUE(brand_slug, family_id)
);

CREATE TABLE IF NOT EXISTS catalog_wizard_models (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    vehicle_type VARCHAR(20) NOT NULL,
    brand_name VARCHAR(100) NOT NULL,
    brand_slug VARCHAR(100) NOT NULL,
    model_name VARCHAR(150) NOT NULL,
    badge VARCHAR(150),
    min_year INT NOT NULL,
    max_year INT NOT NULL,
    body_types TEXT[] NOT NULL DEFAULT '{}',
    fuels TEXT[] NOT NULL DEFAULT '{}',
    transmissions TEXT[] NOT NULL DEFAULT '{}',
    tsb_package_count INT DEFAULT 0,
    is_popular BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT unique_wizard_model UNIQUE(vehicle_type, brand_slug, model_name)
);

CREATE INDEX IF NOT EXISTS idx_catalog_model_families_brand ON catalog_model_families(brand_slug);
CREATE INDEX IF NOT EXISTS idx_catalog_wizard_models_type_brand ON catalog_wizard_models(vehicle_type, brand_slug);

ALTER TABLE catalog_model_families ENABLE ROW LEVEL SECURITY;
ALTER TABLE catalog_wizard_models ENABLE ROW LEVEL SECURITY;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'catalog_model_families' AND policyname = 'Public read-only') THEN
        CREATE POLICY "Public read-only" ON catalog_model_families FOR SELECT USING (true);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE tablename = 'catalog_wizard_models' AND policyname = 'Public read-only') THEN
        CREATE POLICY "Public read-only" ON catalog_wizard_models FOR SELECT USING (true);
    END IF;
END $$;
