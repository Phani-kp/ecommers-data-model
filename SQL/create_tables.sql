-- Database: E-Commerce Data Warehouse
-- Schema: Star Schema

-- Fact Table: Orders (Transaction Data)
CREATE TABLE fact_orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_price DECIMAL(10,2),
    payment_type VARCHAR(50),
    shipping_cost DECIMAL(10,2),
    discount DECIMAL(10,2),
    store_id INT,
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (store_id) REFERENCES dim_stores(store_id)
);

-- Dimension Table: Customers
CREATE TABLE dim_customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    address VARCHAR(500),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

-- Dimension Table: Products
CREATE TABLE dim_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10,2)
);

-- Dimension Table: Stores
CREATE TABLE dim_stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255),
    location VARCHAR(255),
    manager VARCHAR(255)
);

-- Dimension Table: Date (for Time-based Analysis)
CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,
    date DATE UNIQUE,
    year INT,
    quarter INT,
    month INT,
    day INT,
    weekday VARCHAR(20)
);

