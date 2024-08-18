CREATE TABLE IF NOT EXISTS "user" (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NULL,
    last_name VARCHAR(255) NULL,
    email VARCHAR(255) NULL,
    phone VARCHAR(255) NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    'firebase_id' VARCHAR(255) NULL
);
CREATE TABLE IF NOT EXISTS investor_profile (
    investor_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "user"(user_id),
    company_name VARCHAR(255),
    location VARCHAR(255) NULL,
    is_company BOOLEAN NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    'post_id' INT NULL REFERENCES investor_post(investor_post_id),
    'social_media_links' JSONB NULL
);

CREATE TABLE IF NOT EXISTS investor_post (
    investor_post_id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    investment_min INT NULL,
    investment_max INT NULL,
    other_offers TEXT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    'investor_id' INT NULL REFERENCES investor_profile(investor_id),
    'interests' JSONB NULL,
    'returns' VARCHAR(255) NULL CHECK (investment_type IN ('equity', 'debt', 'grant', 'other'))
);

CREATE TABLE IF NOT EXISTS business_profile (
    business_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "user"(user_id),
    company_name VARCHAR(255) NOT NULL,
    headquarter_location VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    date_founded DATE NOT NULL,
    mission_statement TEXT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    'industry' VARCHAR(255) NOT NULL,
    'social_media_links' JSONB NULL,
);

CREATE TABLE IF NOT EXISTS business_post (
    business_post_id SERIAL PRIMARY KEY,
    business_id INT NOT NULL REFERENCES business_profile(business_id),
    product_name VARCHAR(255),
    product_description TEXT,
    asking_price INT NOT NULL,
    equity_offered INT,
    debt_offered INT,
    grant_offered INT,
    other_offers TEXT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pitch_video_url VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS financial (
    financial_id SERIAL PRIMARY KEY,
    business_id INT NOT NULL REFERENCES business_profile(business_id),
    revenue INT NULL,
    net_income INT NULL,
    total_assets INT NULL,
    total_liabilities INT NULL,
    total_equity INT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE IF NOT EXISTS "match" (
    match_id SERIAL PRIMARY KEY,
    investor_id INT NOT NULL REFERENCES investor_profile(investor_id),
    business_id INT NOT NULL REFERENCES business_profile(business_id),
    matched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS 'social_media' (
    'id' SERIAL PRIMARY KEY,
    'platform' VARCHAR(255) NULL, 
    'url' VARCHAR(255) NULL,
    'post_id' INT NULL REFERENCES 'investor_post'('id'),
);