-- PostgreSQL / Supabase Schema for Turkey Car Catalog

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

CREATE INDEX IF NOT EXISTS idx_catalog_models_brand_id ON catalog_models(brand_id);
CREATE INDEX IF NOT EXISTS idx_catalog_models_name ON catalog_models(canonical_name);

-- Row Level Security (RLS) - Read-only for public access
ALTER TABLE catalog_brands ENABLE ROW LEVEL SECURITY;
ALTER TABLE catalog_models ENABLE ROW LEVEL SECURITY;

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
END $$;
