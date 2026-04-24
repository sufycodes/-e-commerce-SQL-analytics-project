-- Sample Data (for testing & analysis)

USE ecommerce_data;


-- Regions

INSERT INTO sales_regions (region_name, country) VALUES
('Karachi',   'Pakistan'),
('Lahore',    'Pakistan'),
('Islamabad', 'Pakistan'),
('Peshawar',  'Pakistan'),
('Quetta',    'Pakistan');

-- Categories

INSERT INTO categories (category_name, description) VALUES
('Electronics',    'Gadgets, phones, laptops'),
('Clothing',       'Apparel and accessories'),
('Home & Kitchen', 'Furniture and kitchen items'),
('Books',          'Educational and fiction'),
('Sports',         'Fitness and outdoor gear');


-- Employees (includes managers + staff)

INSERT INTO employees 
(first_name, last_name, job_title, salary, hire_date, manager_id, region_id)
VALUES
('Ahmed',  'Khan',     'Sales Director',   150000, '2018-03-01', NULL, 1),
('Sara',   'Ali',      'Regional Manager',  95000, '2019-06-15', 1,    2),
('Bilal',  'Hussain',  'Sales Rep',         55000, '2020-09-10', 2,    2),
('Nadia',  'Sheikh',   'Sales Rep',         52000, '2021-01-20', 2,    3),
('Omar',   'Farooq',   'Regional Manager',  90000, '2019-11-01', 1,    1),
('Zainab', 'Malik',    'Sales Rep',         54000, '2022-03-05', 5,    1),
('Hassan', 'Raza',     'Sales Rep',         50000, '2022-07-18', 5,    4),
('Fatima', 'Siddiqui', 'Sales Analyst',     60000, '2020-04-12', 1,    1);


-- Customers

INSERT INTO customers 
(first_name, last_name, email, phone, city, region_id, segment, signup_date)
VALUES
('Ali',    'Raza',    'ali.raza@email.com',   '0300-1111111', 'Karachi',   1, 'Retail',    '2021-01-10'),
('Sana',   'Noor',    'sana.noor@email.com',  '0301-2222222', 'Lahore',    2, 'VIP',       '2020-05-22'),
('Junaid', 'Ahmed',   'junaid.a@email.com',   '0302-3333333', 'Islamabad', 3, 'Wholesale', '2019-11-15'),
('Ayesha', 'Butt',    'ayesha.b@email.com',   '0303-4444444', 'Karachi',   1, 'Retail',    '2022-02-08'),
('Tariq',  'Mehmood', 'tariq.m@email.com',    '0304-5555555', 'Peshawar',  4, 'Retail',    '2021-07-30'),
('Hira',   'Qureshi', 'hira.q@email.com',     '0305-6666666', 'Lahore',    2, 'VIP',       '2020-09-14'),
('Usman',  'Ghani',   'usman.g@email.com',    '0306-7777777', 'Quetta',    5, 'Wholesale', '2023-01-05'),
('Mariam', 'Iqbal',   'mariam.i@email.com',   '0307-8888888', 'Karachi',   1, 'Retail',    '2022-11-20'),
('Kamran', 'Baig',    'kamran.b@email.com',   '0308-9999999', 'Islamabad', 3, 'VIP',       '2021-04-17'),
('Zara',   'Waheed',  'zara.w@email.com',     '0309-0000000', 'Lahore',    2, 'Retail',    '2023-06-01');


-- Products

INSERT INTO products (product_name, category_id, unit_price, stock_qty) VALUES
('Samsung Galaxy S24',  1,  85000, 50),
('Laptop Dell XPS 13',  1, 195000, 20),
('Wireless Earbuds',    1,   8500, 150),
('Men\'s Kurta Set',    2,   3200, 200),
('Women\'s Lawn Suit',  2,   4500, 180),
('Running Shoes',       2,   7800, 90),
('Rice Cooker 1.8L',    3,   5500, 60),
('Non-stick Cookware',  3,   9200, 40),
('LED Desk Lamp',       3,   2800, 110),
('Data Science Book',   4,   1800, 300),
('Urdu Novel Set',      4,    950, 250),
('Yoga Mat',            5,   3500, 120),
('Cricket Bat Kashmir', 5,   6200, 75),
('Dumbbell Set 10kg',   5,  12000, 35),
('Tablet 10 inch',      1,  45000, 45);


-- Orders

INSERT INTO orders 
(customer_id, employee_id, order_date, shipped_date, status)
VALUES
(1,  6, '2023-01-15 10:00:00', '2023-01-17 14:00:00', 'Delivered'),
(2,  3, '2023-02-20 11:30:00', '2023-02-22 09:00:00', 'Delivered'),
(3,  4, '2023-03-05 09:15:00', '2023-03-07 11:00:00', 'Delivered'),
(4,  6, '2023-04-10 14:00:00', '2023-04-12 10:00:00', 'Delivered'),
(5,  7, '2023-05-18 16:30:00', NULL,                   'Cancelled'),
(6,  3, '2023-06-22 08:45:00', '2023-06-24 15:00:00', 'Delivered'),
(7,  7, '2023-07-30 12:00:00', '2023-08-02 10:00:00', 'Delivered'),
(8,  6, '2023-08-14 10:30:00', '2023-08-16 13:00:00', 'Delivered'),
(9,  4, '2023-09-01 09:00:00', NULL,                   'Processing'),
(10, 3, '2023-10-05 11:00:00', '2023-10-07 16:00:00', 'Delivered'),
(1,  6, '2023-11-11 13:45:00', '2023-11-13 11:00:00', 'Delivered'),
(2,  3, '2023-12-01 10:15:00', NULL,                   'Shipped'),
(3,  4, '2024-01-08 09:30:00', '2024-01-10 14:00:00', 'Delivered'),
(5,  7, '2024-02-14 15:00:00', '2024-02-16 10:00:00', 'Delivered'),
(6,  3, '2024-03-20 11:00:00', NULL,                   'Pending');


-- Order Items (transaction-level data)

INSERT INTO order_items 
(order_id, product_id, quantity, unit_price, discount_pct)
VALUES
(1,  1, 1, 85000, 0.00),
(1,  3, 1,  8500, 0.05),
(2,  2, 1,195000, 0.10),
(3, 10, 2,  1800, 0.00),
(3, 11, 1,   950, 0.00),
(4,  4, 3,  3200, 0.05),
(4,  5, 2,  4500, 0.05),
(5, 13, 1,  6200, 0.00),
(6,  7, 1,  5500, 0.00),
(6,  8, 1,  9200, 0.10),
(7, 14, 1, 12000, 0.00),
(7, 12, 2,  3500, 0.00),
(8,  9, 2,  2800, 0.00),
(9, 15, 1, 45000, 0.08),
(10, 6, 2,  7800, 0.05),
(11, 1, 1, 85000, 0.00),
(11, 3, 2,  8500, 0.10),
(12, 2, 1,195000, 0.15),
(13,10, 3,  1800, 0.00),
(14,13, 2,  6200, 0.00),
(15, 5, 1,  4500, 0.00);