-- E-Commerce & Sales Analytics Project
-- Database Schema

DROP DATABASE IF EXISTS ecommerce_data;
CREATE DATABASE ecommerce_data;
USE ecommerce_data;

-- Table: sales_regions

CREATE TABLE sales_regions (
    region_id   INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL UNIQUE,
    country     VARCHAR(50) NOT NULL DEFAULT 'Pakistan'
);


-- Table: categories

CREATE TABLE categories (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(60) NOT NULL UNIQUE,
    description   VARCHAR(200)
);


-- Table: customers

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(100) NOT NULL UNIQUE,
    phone       VARCHAR(20),
    city        VARCHAR(50),
    region_id   INT,
    segment     ENUM('Retail','Wholesale','VIP') DEFAULT 'Retail',
    signup_date DATE NOT NULL,

    -- region may be missing if customer didn’t provide location
    FOREIGN KEY (region_id)
        REFERENCES sales_regions(region_id)
        ON DELETE SET NULL
);


-- Table: employees

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    job_title   VARCHAR(60),
    salary      DECIMAL(10,2) NOT NULL CHECK (salary > 0),
    hire_date   DATE NOT NULL,
    manager_id  INT,   -- self reference (manager hierarchy)
    region_id   INT,

    FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id)
        ON DELETE SET NULL,

    FOREIGN KEY (region_id)
        REFERENCES sales_regions(region_id)
        ON DELETE SET NULL
);


-- Table: products

CREATE TABLE products (
    product_id   INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id  INT NOT NULL,
    unit_price   DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    stock_qty    INT NOT NULL DEFAULT 0,
    is_active    TINYINT(1) NOT NULL DEFAULT 1,

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
        ON DELETE RESTRICT
);


-- Table: orders

CREATE TABLE orders (
    order_id     INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT NOT NULL,
    employee_id  INT,
    order_date   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    shipped_date DATETIME,
    status       ENUM('Pending','Processing','Shipped','Delivered','Cancelled')
                 DEFAULT 'Pending',

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE RESTRICT,

    FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
        ON DELETE SET NULL
);


-- Table: order_items (junction table)

CREATE TABLE order_items (
    order_id     INT NOT NULL,
    product_id   INT NOT NULL,
    quantity     INT NOT NULL CHECK (quantity > 0),
    unit_price   DECIMAL(10,2) NOT NULL, -- price at purchase time
    discount_pct DECIMAL(4,2) DEFAULT 0.00,

    PRIMARY KEY (order_id, product_id),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE,

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
        ON DELETE RESTRICT
);