CREATE TABLE IF NOT EXISTS "user" (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NULL,
    last_name VARCHAR(255) NULL,
    email VARCHAR(255) NULL,
    phone VARCHAR(255) NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    -- 'firebase_id' VARCHAR(255) NULL
);
CREATE TABLE IF NOT EXISTS investor_profile (
    investor_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "user"(user_id),
    company_name VARCHAR(255),
    location VARCHAR(255) NULL,
    is_company BOOLEAN NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    'post_id' INT NULL REFERENCES investor_post(investor_post_id),
);

CREATE TABLE IF NOT EXISTS investor_post (
    investor_post_id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    investment_min INT NULL,
    investment_max INT NULL,
    other_offers TEXT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    returns VARCHAR(255)[] CHECK (array_length(Returns, 1) <= 4) NOT NULL,

    'investor_id' INT NULL REFERENCES investor_profile(investor_id),
    -- 'returns' VARCHAR(255) NULL CHECK (investment_type IN ('equity', 'debt', 'grant', 'other'))
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

CREATE TABLE IF NOT EXISTS social_media_link (
    link_id SERIAL PRIMARY KEY,
    platform VARCHAR(255), 
    url VARCHAR(255),
    investor_id INT REFERENCES investor_profile(investor_id),
    business_id INT REFERENCES business_profile(business_id)
);

CREATE TABLE IF NOT EXISTS category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
);

CREATE TABLE IF NOT EXISTS business_category (
    business_id INT REFERENCES business_profile(business_id),
    category_id INT REFERENCES category(category_id),
    PRIMARY KEY (business_id, category_id)
);

CREATE TABLE IF NOT EXISTS investor_category (
    investor_id INT REFERENCES investor_profile(investor_id),
    category_id INT REFERENCES category(category_id),
    PRIMARY KEY (investor_id, category_id)
);