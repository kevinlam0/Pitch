CREATE TABLE "user" (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE business_profile (
    business_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "user"(user_id) NOT NULL,

    company_image_url VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarter_location VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    date_founded DATE NOT NULL,
    mission_statement TEXT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE investor_profile (
    investor_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "user"(user_id) NOT NULL,

    investor_image_url VARCHAR(255),
    company_name VARCHAR(255),
    location VARCHAR(255),
    is_company BOOLEAN NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE business_post (
    business_post_id SERIAL PRIMARY KEY,
    business_id INT NOT NULL REFERENCES business_profile(business_id),

    product_name VARCHAR(255),
    product_description TEXT,
    asking_price INT NOT NULL,
    equity_offered INT,
    debt_offered INT,
    grant_offered INT,
    other_offers TEXT,
    pitch_video_url VARCHAR(255),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE investor_post (
    investor_post_id SERIAL PRIMARY KEY,
    investor_id INT NOT NULL REFERENCES investor_profile(investor_id),

    description TEXT NOT NULL,
    investment_min INT,
    investment_max INT,
    other_offers TEXT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

    -- 'returns' VARCHAR(255) NULL CHECK (investment_type IN ('equity', 'debt', 'grant', 'other'))
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE business_category (
    business_id INT NOT NULL REFERENCES business_profile(business_id),
    category_id INT NOT NULL REFERENCES category(category_id),
    PRIMARY KEY (business_id, category_id)
);

CREATE TABLE investor_category (
    investor_id INT NOT NULL REFERENCES investor_profile(investor_id),
    category_id INT NOT NULL REFERENCES category(category_id),
    PRIMARY KEY (investor_id, category_id)
);

CREATE TABLE financial (
    financial_id SERIAL PRIMARY KEY,
    business_id INT NOT NULL REFERENCES business_profile(business_id),
    revenue INT,
    net_income INT,
    total_assets INT,
    total_liabilities INT,
    total_equity INT,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "match" (
    match_id SERIAL PRIMARY KEY,
    investor_id INT NOT NULL REFERENCES investor_profile(investor_id),
    business_id INT NOT NULL REFERENCES business_profile(business_id),
    matched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE social_media_link (
    link_id SERIAL PRIMARY KEY,
    platform VARCHAR(255) NOT NULL, 
    url VARCHAR(255) NOT NULL,
    investor_id INT NOT NULL REFERENCES investor_profile(investor_id),
    business_id INT NOT NULL REFERENCES business_profile(business_id)
);