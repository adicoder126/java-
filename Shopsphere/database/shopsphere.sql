CREATE DATABASE IF NOT EXISTS shopsphere;
USE shopsphere;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    mobile VARCHAR(15),
    role ENUM('CUSTOMER', 'ADMIN') DEFAULT 'CUSTOMER',
    status BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    status BOOLEAN DEFAULT TRUE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    name VARCHAR(150) NOT NULL,
    brand VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(5, 2) DEFAULT 0.00,
    stock INT NOT NULL,
    image_url VARCHAR(255),
    status BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Insert dummy data to test
INSERT INTO categories (name, description) VALUES ('Electronics', 'Gadgets and devices');
INSERT INTO products (category_id, name, brand, description, price, stock) 
VALUES (1, 'Laptop', 'Dell', 'High performance laptop', 55000.00, 10);
USE shopsphere;

INSERT INTO categories (category_id, name, description) 
VALUES 
(1, 'Electronics', 'Gadgets and appliances'),
(2, 'Fashion', 'Apparel and accessories'),
(3, 'Home & Kitchen', 'Home decor and appliances')
ON DUPLICATE KEY UPDATE name=VALUES(name);

INSERT INTO products (category_id, name, brand, description, price, stock) 
VALUES 
(1, 'Laptop', 'Dell', 'High performance laptop', 55000.00, 10),
(2, 'T-Shirt', 'Nike', 'Cotton casual shirt', 1200.00, 25),
(3, 'Coffee Maker', 'Philips', 'Automatic coffee machine', 3500.00, 8);