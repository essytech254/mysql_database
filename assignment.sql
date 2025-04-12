-- Database Creation
CREATE DATABASE bookstore;
USE bookstore;

-- Authors Table
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL
);

-- Publishers Table
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(255) NOT NULL
);

-- Book Languages Table
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) NOT NULL
);

-- Books Table
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    publication_year INT,
    publisher_id INT,
    language_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Book Author Relationship Table
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE
);

-- Countries Table
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL
);

-- Addresses Table
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Address Status Table
CREATE TABLE address_status (
    address_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

-- Customers Table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- Customer Addresses Table
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    address_status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);

-- Shipping Methods Table
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) NOT NULL UNIQUE
);

-- Order Status Table
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

-- Customer Orders Table
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    shipping_method_id INT NOT NULL,
    order_status_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Order Lines Table
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Order History Table
CREATE TABLE order_history (
    order_history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    change_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id) ON DELETE CASCADE,
    FOREIGN KEY (status_id) REFERENCES order_status(order_status_id)
);

-- Insert Sample Data

-- Authors Table
INSERT INTO author (author_name) VALUES
('Jane Austen'), ('George Orwell'), ('J.R.R. Tolkien'), ('Stephen King'),
('Agatha Christie'), ('Ernest Hemingway'), ('Gabriel Garcia Marquez'), ('Haruki Murakami');

-- Publishers Table
INSERT INTO publisher (publisher_name) VALUES
('Penguin Classics'), ('Secker & Warburg'), ('Allen & Unwin'), ('Scribner'),
('HarperCollins'), ('Simon & Schuster'), ('Vintage Books'), ('Knopf');

-- Book Languages Table
INSERT INTO book_language (language_name) VALUES
('English'), ('Spanish'), ('French'), ('German'),
('Japanese'), ('Italian'), ('Russian'), ('Portuguese');

-- Books Table
INSERT INTO book (title, isbn, publication_year, publisher_id, language_id) VALUES
('Pride and Prejudice', '978-0141439518', 1813, 1, 1),
('1984', '978-0451524935', 1949, 2, 1),
('The Hobbit', '978-0547928227', 1937, 3, 1),
('The Shining', '978-0385121675', 1977, 4, 1),
('Murder on the Orient Express', '978-0062073484', 1934, 5, 1),
('The Old Man and the Sea', '978-0684830490', 1952, 6, 1),
('One Hundred Years of Solitude', '978-0061120084', 1967, 7, 2),
('Norwegian Wood', '978-0375704024', 1987, 8, 5);

-- Book Author Relationship Table
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8);

-- Countries Table
INSERT INTO country (country_name) VALUES
('USA'), ('UK'), ('Canada'), ('Australia'),
('Germany'), ('Japan'), ('Spain'), ('Brazil');

-- Addresses Table
INSERT INTO address (street, city, postal_code, country_id) VALUES
('123 Main St', 'New York', '10001', 1),
('456 Elm St', 'London', 'SW1A 1AA', 2),
('789 Oak Ave', 'Toronto', 'M5V 2L7', 3),
('101 Pine Ln', 'Sydney', '2000', 4),
('202 Birch Rd', 'Berlin', '10115', 5),
('303 Maple Ct', 'Tokyo', '100-0001', 6),
('404 Cedar Dr', 'Madrid', '28001', 7),
('505 Willow Way', 'Rio de Janeiro', '20000-000', 8);

-- Address Status Table
INSERT INTO address_status (status_name) VALUES
('Current'), ('Old'), ('Temporary'), ('Vacation'),
('Business'), ('Shipping'), ('Billing'), ('Home');

-- Customers Table
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('Alice', 'Smith', 'alice@example.com', '123-456-7890'),
('Bob', 'Johnson', 'bob@example.com', '987-654-3210'),
('Charlie', 'Williams', 'charlie@example.com', '555-123-4567'),
('David', 'Brown', 'david@example.com', '111-222-3333'),
('Eve', 'Davis', 'eve@example.com', '444-555-6666'),
('Frank', 'Miller', 'frank@example.com', '777-888-9999'),
('Grace', 'Wilson', 'grace@example.com', '101-202-3030'),
('Henry', 'Moore', 'henry@example.com', '404-505-6060');

-- Customer Addresses Table
INSERT INTO customer_address (customer_id, address_id, address_status_id) VALUES
(1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 4, 1),
(5, 5, 1), (6, 6, 1), (7, 7, 1), (8, 8, 1);

-- Shipping Methods Table
INSERT INTO shipping_method (method_name) VALUES
('Standard'), ('Express'), ('Overnight'), ('2-Day'),
('Pickup'), ('International'), ('Freight'), ('Drone');

-- Order Status Table
INSERT INTO order_status (status_name) VALUES
('Pending'), ('Shipped'), ('Delivered'), ('Cancelled'),
('Returned'), ('Processing'), ('On Hold'), ('Ready for Pickup');

-- Customer Orders Table
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, order_status_id) VALUES
(1, '2023-10-26', 1, 3), (2, '2023-10-25', 2, 2), (3, '2023-10-24', 3, 1), (4, '2023-10-23', 1, 3),
(5, '2023-10-22', 2, 2), (6, '2023-10-21', 3, 1), (7, '2023-10-20', 1, 3), (8, '2023-10-19', 2, 2);

-- Order Lines Table
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 1, 15.99), (2, 2, 2, 12.50), (3, 3, 1, 20.00), (4, 4, 3, 10.99),
(5, 5, 1, 18.75), (6, 6, 2, 9.99), (7, 7, 1, 22.50), (8, 8, 1, 14.00);

-- Order History Table
INSERT INTO order_history (order_id, status_id, change_date) VALUES
(1, 1, '2023-10-26 10:00:00'), (1, 2, '2023-10-26 12:00:00'),(1, 3, '2023-10-26 14:00:00'),
(2, 1, '2023-10-25 11:00:00'), (2, 2, '2023-10-25 13:00:00'),
(3, 1, '2023-10-24 12:00:00'),
(4, 1, '2023-10-23 13:00:00'),
(5, 1, '2023-10-22 14:00:00');

-- User Groups and Roles

-- Create Users
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'adminpassword';
CREATE USER IF NOT EXISTS 'sales'@'localhost' IDENTIFIED BY 'salespassword';
CREATE USER IF NOT EXISTS 'inventory'@'localhost' IDENTIFIED BY 'inventorypassword';

-- Grant Privileges
GRANT ALL PRIVILEGES ON bookstore.* TO 'admin'@'localhost';

-- Sales staff needs access to customer and order information
GRANT SELECT, INSERT, UPDATE ON bookstore.customer TO 'sales'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.cust_order TO 'sales'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_line TO 'sales'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_history TO 'sales'@'localhost';
GRANT SELECT ON bookstore.book TO 'sales'@'localhost';

-- Inventory staff needs access to book and inventory information
GRANT SELECT, INSERT, UPDATE ON bookstore.book TO 'inventory'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.author TO 'inventory'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.publisher TO 'inventory'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.book_author TO 'inventory'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.book_language TO 'inventory'@'localhost';

FLUSH PRIVILEGES;