USE quan_ly_ban_hang;

SELECT order_ID AS order_ID, order_Date AS order_Date, order_TotalPrice AS order_TotalPrice
FROM Orders;

SELECT DISTINCT C.customer_Name, P.product_Name
FROM Customer C
JOIN Orders O ON C.customer_ID = O.customer_ID
JOIN OrderDetail OD ON O.order_ID = OD.order_ID
JOIN Product P ON OD.product_ID = P.product_ID;

SELECT C.customer_Name
FROM Customer C
LEFT JOIN Orders O ON C.customer_ID = O.customer_ID
LEFT JOIN OrderDetail OD ON O.order_ID = OD.order_ID
WHERE OD.product_ID IS NULL;

SELECT 
    O.order_ID AS MaHoaDon,
    O.order_Date AS NgayBan,
    SUM(OD.order_detail_QTY * P.product_Price) AS GiaTien
FROM Orders O
JOIN OrderDetail OD ON O.order_ID = OD.order_ID
JOIN Product P ON OD.product_ID = P.product_ID
GROUP BY O.order_ID, O.order_Date;

-- cập nhật order_TotalPrice bằng tổng tiền thực tế của hoá đơn
UPDATE Orders O
JOIN (
    SELECT 
        OD.order_ID,
        SUM(OD.order_detail_QTY * P.product_Price) AS total_price
    FROM OrderDetail OD
    JOIN Product P ON OD.product_ID = P.product_ID
    GROUP BY OD.order_ID
) AS T ON O.order_ID = T.order_ID
SET O.order_TotalPrice = T.total_price;
