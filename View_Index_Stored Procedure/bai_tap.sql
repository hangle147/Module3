CREATE DATABASE IF NOT EXISTS demo;
USE demo;

CREATE TABLE IF NOT EXISTS Products (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    productCode VARCHAR(50) UNIQUE,
    productName VARCHAR(100),
    productPrice DECIMAL(10,2),
    productAmount INT,
    productDescription TEXT,
    productStatus TINYINT
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES 
('P001', 'Iphone 15', 999.99, 10, 'Apple smartphone', 1),
('P002', 'Samsung Galaxy S23', 850.50, 15, 'Samsung flagship', 1),
('P003', 'Xiaomi Redmi Note 12', 250.00, 20, 'Affordable phone', 1),
('P004', 'Oppo Reno 8', 450.00, 12, 'Mid-range phone', 1);

CREATE UNIQUE INDEX idx_product_code ON Products(productCode);
CREATE INDEX idx_name_price ON Products(productName, productPrice);

EXPLAIN SELECT * FROM Products WHERE productCode = 'P002';
EXPLAIN SELECT * FROM Products WHERE productName = 'Iphone 15' AND productPrice = 999.99;

CREATE OR REPLACE VIEW view_product_info AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AddProduct(
    IN pCode VARCHAR(50),
    IN pName VARCHAR(100),
    IN pPrice DECIMAL(10,2),
    IN pAmount INT,
    IN pDesc TEXT,
    IN pStatus TINYINT
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (pCode, pName, pPrice, pAmount, pDesc, pStatus);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateProductById(
    IN pId INT,
    IN pName VARCHAR(100),
    IN pPrice DECIMAL(10,2),
    IN pAmount INT,
    IN pDesc TEXT,
    IN pStatus TINYINT
)
BEGIN
    UPDATE Products
    SET productName = pName,
        productPrice = pPrice,
        productAmount = pAmount,
        productDescription = pDesc,
        productStatus = pStatus
    WHERE Id = pId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteProductById(IN pId INT)
BEGIN
    DELETE FROM Products WHERE Id = pId;
END //
DELIMITER ;
