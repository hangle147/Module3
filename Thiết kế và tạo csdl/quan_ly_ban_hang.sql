CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE Customer (
    customer_ID INT PRIMARY KEY,
    customer_Name VARCHAR(100),
    customer_Age INT
);

CREATE TABLE Product (
    product_ID INT PRIMARY KEY,
    product_Name VARCHAR(100),
    product_Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    order_ID INT PRIMARY KEY,
    customer_ID INT,
    order_Date DATE,
    order_TotalPrice DECIMAL(12, 2),
    FOREIGN KEY (customer_ID) REFERENCES Customer(customer_ID)
);

CREATE TABLE OrderDetail (
    order_ID INT,
    product_ID INT,
    order_detail_QTY INT,
    PRIMARY KEY (order_ID, product_ID),
    FOREIGN KEY (order_ID) REFERENCES Orders(order_ID),
    FOREIGN KEY (product_ID) REFERENCES Product(product_ID)
);

