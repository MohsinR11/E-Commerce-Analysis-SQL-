-- Create Database
CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    registration_date DATE
);

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(200),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

-- Create Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    total_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Sample Data
INSERT INTO customers (name, email, city, registration_date) VALUES
('John Doe', 'john@example.com', 'New York', '2023-01-15'),
('Jane Smith', 'jane@example.com', 'Los Angeles', '2023-02-20'),
('Mike Johnson', 'mike@example.com', 'Chicago', '2023-03-10');

INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Headphones', 'Electronics', 150.00),
('Running Shoes', 'Sportswear', 120.00);

INSERT INTO sales (customer_id, product_id, sale_date, quantity, total_price) VALUES
(1, 1, '2023-04-01', 1, 1200.00),
(1, 3, '2023-04-01', 2, 300.00),
(2, 2, '2023-04-15', 1, 800.00),
(3, 4, '2023-04-20', 1, 120.00),
(1, 2, '2023-05-05', 1, 800.00);

-- Analysis Queries

-- 1. Total Sales by Category
SELECT 
    p.category, 
    COUNT(*) as total_sales, 
    SUM(s.total_price) as total_revenue,
    AVG(s.total_price) as average_sale_value
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;

-- 2. Customer Purchasing Behavior
SELECT 
    c.name, 
    COUNT(s.sale_id) as num_purchases,
    SUM(s.total_price) as total_spent,
    MAX(s.sale_date) as last_purchase_date
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- 3. Monthly Sales Trend
SELECT 
    YEAR(sale_date) as sales_year,
    MONTH(sale_date) as sales_month,
    COUNT(*) as num_sales,
    SUM(total_price) as monthly_revenue
FROM sales
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;

-- 4. Top Selling Products
SELECT 
    p.product_name, 
    SUM(s.quantity) as total_quantity_sold,
    SUM(s.total_price) as total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_quantity_sold DESC;
