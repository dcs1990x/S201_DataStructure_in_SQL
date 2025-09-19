# Sprint 2, Task 1: Database Structure - MongoDB

This repository implements database models for two different business systems: an optics store and a pizza restaurant, following specific business requirements for each.

## 📁 Project Structure

The project contains two independent database models implemented in MySQL:

- **Optics Store**: Management system for customers, suppliers, and glasses sales
- **Pizzeria**: Food delivery order system with store, employee, and product management

## 💻 Technologies

- **MySQL 8.0+**
- **MySQL Workbench** (Recommended for model visualization)
- **Schemas** designed using dbdiagram: https://dbdiagram.io/home

## 📋 Models Overview

### 🕶️ Optics Store "Cul d'Ampolla"

#### Schema fields
- **glasses**: id_product, Brand, prescription_left, prescription_right, frame_type, frame color, glass_colour_left, glass_colour_right, Price, supplier_id
- **employees**: id_employee, name, position, address, phone, email, start_date, bank_account
- **customers**: id_customer, name, address, phone, email, signup_date, recommended_by_id
- **orders**: id_order, customer_id, order_date, total_amount, sold_by_id
- **order_details**: order_id, product_id, quantity, Price
- **suppliers**: id_supplier, name, address, phone, fax, NIF

### 🍕 Pizza Restaurant

#### Schema fields
- **products**: id_product, name, type, description, picture, price, category_id
- **pizza_categories**: id_category, category_name
- **employees**: id_employee, name, surname, NIF, phone, start_date, role, store_id
- **customers**: id_customer, name, surname, address, zip_code, municipality_id, province_id, phone
- **orders**: id_order, order_date, order_type, order_status, total_amount, customer_id, preparted_by_id, delivery_datetime, store_id
- **order_details**: order_id, product_id, quantity, price
- **stores**: id_store, name, address, zip_code, municipality_id 
- **municipalities**: id_municipality, name_municipality, province_id
- **provinces**: id_province, name_province

## 🚀 How to Run

1. **Clone the repository**
2. **Import scripts into MySQL Workbench** or run directly on your MySQL server
3. **Execute scripts in order**:
   ```sql
   -- First: Optics store table creation script
   SOURCE Exercise_1 - queries.sql;
   
   -- Second: Pizzeria schema script
   SOURCE Exercise_2 - queries.sql;
4. **Open schema pictures** using any image visualization software that can open .png images

## 👨‍💻 Author

Developed by Daniel Caldito Serrano as part of the Java Back-end Development Bootcamp at the IT Academy.
