CREATE DATABASE IF NOT EXISTS optics_store;
USE optics_store;

CREATE TABLE suppliers (
    id_supplier VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    address TEXT,
    phone VARCHAR(12),
    fax CHAR(12),
    NIF VARCHAR(9) NOT NULL
);

CREATE TABLE glasses (
    id_product VARCHAR(5) PRIMARY KEY,
    brand VARCHAR(15) NOT NULL,
    prescription_left FLOAT NOT NULL,
    prescription_right FLOAT NOT NULL,
    frame_type VARCHAR(10),
    frame_colour VARCHAR(10),
    glass_colour_left VARCHAR(10),
    glass_colour_right VARCHAR(10),
    price FLOAT,
    supplier_id VARCHAR(10),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id_supplier)
);

CREATE TABLE customers (
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    address TEXT,
    phone VARCHAR(12) NOT NULL,
    email VARCHAR(20) NOT NULL UNIQUE,
    signup_date DATE,
    recommended_by_id INT,
    FOREIGN KEY (recommended_by_id) REFERENCES customers(customer_id)
);

CREATE TABLE employees (
    id_employee INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    position VARCHAR(20),
    address TEXT,
    phone CHAR(9),
    email VARCHAR(20),
    start_date DATE NOT NULL,
    bank_account CHAR(24)
);

CREATE TABLE orders (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount FLOAT NOT NULL,
    sold_by_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id_customer),
    FOREIGN KEY (sold_by_id) REFERENCES employees(id_employee)
);

CREATE TABLE order_details (
	order_id INT NOT NULL,
    product_id VARCHAR(6) NOT NULL,
    quantity INT NOT NULL,
    price FLOAT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id_order),
    FOREIGN KEY (product_id) REFERENCES glasses(id_product)
);