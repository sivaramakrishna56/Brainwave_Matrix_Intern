create database onlinestore;
use onlinestore;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Customers (name, email, phone, address)
VALUES
('Kumar', 'kumar@example.com', '2662794174', '57066 Ashley Shoal Apt. 365, West Courtney, NC 21844'),
('Prakash', 'prakash@example.com', '6830021942', '7423 Matthew Inlet, South Lori, MA 53587'),
('Pavan', 'pavan@example.com', '2586270068', '45145 Travis Villages Suite 723, South Shannonburgh, VT 78396'),
('Siva', 'siva@example.com', '3654347450', '51331 Hudson Gardens, Lake Amberstad, NY 54461'),
('Sai', 'sai@example.com', '7311703214', '10266 Daniels Flats, West Ryan, SC 96938'),
('Venkatesh', 'venkatesh@example.com', '5314346431', '75879 Sheila Motorway Apt. 138, West Nathan, OR 11966'),
('Ravi', 'ravi@example.com', '3522343715', '4842 Jacob Mill Apt. 604, East Amy, FL 02256'),
('Teja', 'teja@example.com', '2347431101', '3748 Martinez Locks, East Michelle, AR 41580'),
('Manoj', 'manoj@example.com', '3603671823', 'Unit 3550 Box 6011, DPO AA 96873'),
('Arjun', 'arjun@example.com', '7373709827', '9628 Jacob Port Apt. 076, New Matthew, GA 94091'),
('Ramesh', 'ramesh@example.com', '3381587407', '7576 Austin Key, South Janefurt, AZ 84744'),
('Mahesh', 'mahesh@example.com', '1017538743', '75263 Daniel Falls, West Lisa, OH 63058'),
('Srinu', 'srinu@example.com', '9736487854', '85806 Amanda View Apt. 186, South Melissa, PA 41282'),
('Naresh', 'naresh@example.com', '5944353873', '3265 Emily Extensions, North Jessica, WY 05327'),
('Naveen', 'naveen@example.com', '9511853231', '1988 Marcus Mount, West Davidmouth, NH 56061'),
('Lokesh', 'lokesh@example.com', '6328262812', '2219 Cynthia Drives, Port Jeremy, NM 06398'),
('Chaitanya', 'chaitanya@example.com', '8201046047', '78778 Davis Fords, West Nathan, ID 35076'),
('Anil', 'anil@example.com', '4525266525', '078 Michelle Parkway Suite 077, East Nathan, VT 93338'),
('Rajesh', 'rajesh@example.com', '5807026170', '92543 Ellis Plain, East Andrew, AK 62064'),
('Vinay', 'vinay@example.com', '2006255191', '8594 Graham Drive, South Samantha, KY 95286');

INSERT INTO Products (name, description, price, stock)
VALUES
('Wireless Mouse', 'Ergonomic wireless mouse', 699.00, 100),
('Mechanical Keyboard', 'RGB mechanical keyboard', 2299.00, 50),
('Laptop Stand', 'Adjustable aluminum stand', 999.00, 75),
('USB-C Hub', 'Multiport USB-C adapter', 1199.00, 200),
('Webcam', '1080p HD webcam', 1499.00, 60),
('Bluetooth Speaker', 'Portable Bluetooth speaker', 1799.00, 80),
('Smartwatch', 'Fitness smartwatch', 2999.00, 40),
('HD Monitor', '24-inch HD monitor', 8499.00, 30);


INSERT INTO Orders (customer_id, order_date, status)
VALUES
(11, '2025-03-25 10:23:00', 'Completed'),
(18, '2025-02-14 15:45:00', 'Shipped'),
(4, '2025-03-01 09:10:00', 'Completed'),
(20, '2025-04-04 11:30:00', 'Pending'),
(5, '2025-02-20 08:00:00', 'Pending'),
(10, '2025-03-12 13:15:00', 'Completed'),
(16, '2025-02-12 16:40:00', 'Completed'),
(15, '2025-02-07 17:00:00', 'Shipped'),
(9, '2025-02-05 12:05:00', 'Shipped'),
(18, '2025-02-15 14:20:00', 'Completed'),
(8, '2025-03-11 10:10:00', 'Pending'),
(6, '2025-03-22 18:45:00', 'Pending'),
(14, '2025-03-06 09:35:00', 'Pending'),
(15, '2025-02-14 20:10:00', 'Pending'),
(19, '2025-03-19 11:50:00', 'Pending'),
(5, '2025-03-11 12:20:00', 'Shipped'),
(4, '2025-04-01 07:55:00', 'Pending'),
(6, '2025-02-28 10:05:00', 'Shipped'),
(15, '2025-03-23 17:25:00', 'Shipped'),
(12, '2025-02-26 14:45:00', 'Pending');


INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES
(1, 8, 2, 16998.00), 
(1, 8, 3, 25497.00), 
(2, 2, 1, 2299.00),
(2, 6, 3, 5397.00), 
(3, 4, 3, 3597.00), 
(4, 2, 1, 2299.00),
(5, 1, 2, 1398.00),  
(5, 7, 1, 2999.00),
(6, 4, 2, 2398.00),  
(6, 2, 3, 6897.00),   
(6, 3, 1, 999.00),
(7, 6, 3, 5397.00),   
(7, 5, 1, 1499.00),
(7, 1, 2, 1398.00),
(8, 5, 2, 2998.00),
(9, 3, 3, 2997.00),   
(9, 7, 1, 2999.00),
(10, 1, 1, 699.00),
(10, 4, 2, 2398.00),
(10, 5, 1, 1499.00);



INSERT INTO Payments (order_id, payment_date, amount, payment_method, status)
VALUES
(1, '2025-03-27', 600.0, 'Credit Card', 'Completed'),
(3, '2025-03-01', 60.0, 'Net Banking', 'Completed'),
(6, '2025-03-13', 232.5, 'Credit Card', 'Completed'),
(7, '2025-02-16', 197.97, 'Net Banking', 'Completed'),
(10, '2025-02-16', 105.99, 'Credit Card', 'Completed');


select * from customers;
select * from products;
select * from Orders;
select * from Order_items;
select * from Payments;

INSERT INTO Orders (customer_id, order_date, status)
VALUES (5, NOW(), 'Pending');

INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES
(21, 1, 2, 1398.00),  
(21, 3, 1, 999.00);   

-- View All Orders with Customer Info
SELECT 
    o.order_id AS order_id,
    c.name AS customer_name,
    o.order_date,
    o.status
FROM Orders AS o
JOIN Customers AS c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;

-- get all orders for a perticular customer
SELECT o.order_id, o.order_date, o.status, SUM(oi.quantity * oi.price) AS total
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE o.customer_id = 5
GROUP BY o.order_id, o.order_date, o.status;


-- get product stock after orders
SELECT p.name, p.stock - IFNULL(SUM(oi.quantity), 0) AS remaining_stock
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id;


-- monthly revenue
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.price) AS total_revenue
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY month
ORDER BY month DESC;


-- top 5 customers by spend
SELECT 
    c.customer_id,
    c.name,
    c.email,
    SUM(oi.price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;


-- view all pending orders
SELECT 
    o.order_id,
    c.name AS customer_name,
    o.order_date,
    o.status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Pending'
ORDER BY o.order_date;


-- top selling products
SELECT 
    p.name,
    SUM(oi.quantity) AS total_units_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_units_sold DESC
LIMIT 5;


-- total amount for a specific order
SELECT 
    SUM(price) AS total_amount
FROM Order_Items
WHERE order_id = 21;
