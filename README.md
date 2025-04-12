# 📚 BookStore Database Project

## Overview

This project is a comprehensive database design and implementation task aimed at creating a **MySQL-based relational database system** for a Bookstore. It simulates real-world scenarios where database administrators are required to manage complex, interconnected data systems.

By building this database, we demonstrate our skills in:
- Database design and modeling
- Writing SQL scripts to create tables and relationships
- Managing user roles and permissions
- Querying data to extract meaningful insights

## 👨‍💻 Technologies Used

- **MySQL** – For building and managing the database
- **Draw.io** – For designing and visualizing the database schema

## 📌 Project Objective

To build a well-structured relational database that supports the operations of a bookstore, including managing books, authors, customers, orders, and shipping processes. The database ensures efficient data storage, quick retrieval, and robust security for different users.

## ✅ Key Deliverables

1. A fully functional MySQL database named `bookstore_db`
2. Optimized schema for each table with appropriate data types
3. Implementation of user roles and access controls
4. Sample queries to test and demonstrate database functionality
5. An ER diagram designed in Draw.io for schema visualization

## 🗃️ Tables Created

| Table Name           | Description                                                                 |
|----------------------|-----------------------------------------------------------------------------|
| `book`               | Stores all book details available in the store                              |
| `book_author`        | Manages the many-to-many relationship between books and authors             |
| `author`             | List of authors                                                             |
| `book_language`      | Languages in which books are available                                      |
| `publisher`          | Book publishers                                                             |
| `customer`           | Bookstore customers                                                         |
| `customer_address`   | Links customers to their addresses                                          |
| `address_status`     | Status of each address (e.g., current, old)                                 |
| `address`            | General list of addresses                                                   |
| `country`            | Countries linked to customer addresses                                      |
| `cust_order`         | Orders placed by customers                                                  |
| `order_line`         | List of books within each order                                             |
| `shipping_method`    | Shipping options for orders                                                 |
| `order_history`      | Status history for each order                                               |
| `order_status`       | Defines statuses like pending, shipped, delivered                           |

## 🔒 User Roles & Access Control

- Implemented role-based user groups to ensure secure database access.
- Permissions were granted based on the principle of least privilege.

## 🧪 Testing & Querying

The database was tested using a set of **SQL SELECT queries** to:
- Retrieve customer order history
- Check current shipping status
- Analyze book sales
- Identify most active authors and publishers

## 📊 ER Diagram

The database schema was designed and visualized using **Draw.io**. The diagram is included in the repo as `ER_Diagram.png`.

## Contributors | 🧑‍🤝‍🧑 Group Members

| Name              | Email                          |
|------------------|---------------------------------|
|     Esther Muthoni   | esthermuthoni030@gmail.com          |
|  Alex Kimari   |   kimaria117@gmail.com    |
| Esther Maina      | estherchestter@gmail.com        |

##
