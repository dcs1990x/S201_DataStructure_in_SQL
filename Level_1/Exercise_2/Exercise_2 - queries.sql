CREATE DATABASE IF NOT EXISTS pizza_restaurant;
USE pizza_restaurant;

CREATE TABLE customers (
    id_customer INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    address TEXT NOT NULL,
    zip_code CHAR(10) NOT NULL,
    municipality_id CHAR(5) NOT NULL,
    province_id CHAR(5) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    FOREIGN KEY (municipality_id) REFERENCES municipalities(id_municipality),
    FOREIGN KEY (province_id) REFERENCES provinces(id_province)
);

CREATE TABLE orders (
    id_order INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    order_type ENUM('Delivery', 'Pickup') NOT NULL,
    order_status ENUM('Pending', 'In Preparation', 'Delivered', 'Cancelled') NOT NULL DEFAULT 'Pending',
    total_amount FLOAT NOT NULL,
    customer_id INT NOT NULL,
    prepared_by_id INT NOT NULL,
    delivered_by_id INT NULL,
    delivery_datetime DATETIME NULL,
    store_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id_customer),
    FOREIGN KEY (prepared_by_id) REFERENCES employees(id_employee),
    FOREIGN KEY (delivered_by_id) REFERENCES employees(id_employee),
    FOREIGN KEY (store_id) REFERENCES stores(id_store)
);

CREATE TABLE order_details (
    order_id INT NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    price FLOAT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id_order),
    FOREIGN KEY (product_id) REFERENCES products(id_product)
);

CREATE TABLE products (
    id_product VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type ENUM('Pizza', 'Hamburger', 'Drink') NOT NULL,
    description TEXT,
    picture LONGBLOB,
    price FLOAT NOT NULL,
    category_id CHAR(5),
    FOREIGN KEY (category_id) REFERENCES categories(id_category)
);

CREATE TABLE pizza_categories (
    id_category CHAR(5) PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE stores (
    id_store VARCHAR(10) PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    address TEXT NOT NULL,
    zip_code CHAR(10) NOT NULL,
    municipality_id CHAR(5) NOT NULL,
    FOREIGN KEY (municipality_id) REFERENCES municipalities(id_municipality)
);

CREATE TABLE employees (
    id_employee INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    surname VARCHAR(45) NOT NULL,
    NIF VARCHAR(15) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    start_date DATE NOT NULL,
    role ENUM('Cook', 'Delivery') NOT NULL,
    store_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores(id_store)
);

CREATE TABLE provinces (
    id_province CHAR(5) PRIMARY KEY,
    name_province VARCHAR(30) NOT NULL
);

CREATE TABLE municipalities (
    id_municipality CHAR(5) PRIMARY KEY,
    name_municipality VARCHAR(50) NOT NULL,
    province_id CHAR(5) NOT NULL,
    FOREIGN KEY (province_id) REFERENCES provinces(id_province)
);