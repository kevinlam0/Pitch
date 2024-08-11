CREATE TABLE IF NOT EXISTS 'user' (
    'id' SERIAL PRIMARY KEY,
    'firebase_id' VARCHAR(255) NULL,
    'first_name' VARCHAR(255) NULL,
    'last_name' VARCHAR(255) NULL,
    'email' VARCHAR(255) NULL,
    'phone' VARCHAR(255) NULL,
    'timestamp' TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);
CREATE TABLE IF NOT EXISTS 'investor_profile' (
    'id' SERIAL PRIMARY KEY,
    'user_id' INT NULL REFERENCES 'user'('id'),
    'company_name' VARCHAR(255) NULL,
    'investment_min' INT NULL,
    'investment_max' INT NULL,
    'post_id' INT NULL REFERENCES 'investor_post'('id'),
    'location' VARCHAR(255) NULL,
    'investor_type' VARCHAR(10) NOT NULL CHECK (investor_type IN ('person', 'company')),
);

CREATE TABLE IF NOT EXISTS 'investor_post' (
    'id' SERIAL PRIMARY KEY,
    'bio' TEXT NULL,
    'timestamp' TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    'investment_type' VARCHAR(255) NULL CHECK (investment_type IN ('equity', 'debt', 'grant', 'other')),
    'other_offers' TEXT NULL,
);

CREATE TABLE IF NOT EXISTS 'business_profile' (
    'id' SERIAL PRIMARY KEY,
    'user_id' INT NOT NULL REFERENCES 'user'('id'),
    'company_name' VARCHAR(255) NOT NULL,
    'headquarter_location' VARCHAR(255) NOT NULL,
    'industry' VARCHAR(255) NOT NULL,
    'description' TEXT NOT NULL,
    'date_founded' DATE NOT NULL,
    'mission_statement' TEXT NULL,
);

CREATE TABLE IF NOT EXISTS 'social_media' (
    'id' SERIAL PRIMARY KEY,
    'platform' VARCHAR(255) NULL, 
    'url' VARCHAR(255) NULL,
    'post_id' INT NULL REFERENCES 'investor_post'('id'),
);

CREATE TABLE IF NOT EXISTS 'business_post' (
    'id' SERIAL PRIMARY KEY,
    'timestamp' TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    'business_id' INT NOT NULL REFERENCES 'business_profile'('id'),
    'product_name' VARCHAR(255) NULL,
    'product_description' TEXT NULL,
    'asking_price' INT NOT NULL,
    'equity_offered' INT NULL,
    'debt_offered' INT NULL,
    'grant_offered' INT NULL,
    'other_offers' TEXT NULL,
);

CREATE TABLE IF NOT EXISTS 'finance' (
    'id' SERIAL PRIMARY KEY,
    'business_id' INT NOT NULL REFERENCES 'business_profile'('id'),
    'revenue' INT NULL,
    'net_income' INT NULL,
    'total_assets' INT NULL,
    'total_liabilities' INT NULL,
    'total_equity' INT NULL,
    'timestamp' TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);
