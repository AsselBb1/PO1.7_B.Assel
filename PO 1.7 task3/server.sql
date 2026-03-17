DROP DATABASE food_delivery;
CREATE DATABASE food_delivery;
USE food_delivery;

CREATE TABLE Customer (
    Customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    address VARCHAR(100)
);

CREATE TABLE Restaurant (
    Restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE,
    city VARCHAR(50) NOT NULL,
    rating DECIMAL(2,1) DEFAULT 0 CHECK (rating >= 0 AND rating <= 5)
);

CREATE TABLE Orders (
    Order_id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_id INT NOT NULL,
    Restaurant_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) CHECK (total_amount > 0),

    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY (Restaurant_id) REFERENCES Restaurant(Restaurant_id)
);

ALTER TABLE Customer
ADD birth_date DATE;

ALTER TABLE Restaurant
RENAME COLUMN city TO location;

ALTER TABLE Orders
MODIFY total_amount DECIMAL(12,2);

INSERT INTO Customer (first_name, email, phone, address) VALUES
('Ayan', 'ayan@mail.com', '87001111111', 'Aktau'),
('Dana', 'dana@mail.com', '87002222222', 'Almaty'),
('Ali', 'ali@mail.com', '87003333333', 'Astana'),
('Sara', 'sara@mail.com', '87004444444', 'Shymkent'),
('Nurlan', 'nurlan@mail.com', '87005555555', 'Atyrau');

INSERT INTO Restaurant (restaurant_name, phone, location, rating) VALUES
('Burger House', '87111111111', 'Aktau', 4.5),
('Pizza City', '87222222222', 'Almaty', 4.2),
('Sushi Bar', '87333333333', 'Astana', 4.8),
('Cafe Time', '87444444444', 'Shymkent', 3.9),
('Food Point', '87555555555', 'Atyrau', 4.0);

INSERT INTO Orders (Customer_id, Restaurant_id, total_amount) VALUES
(1, 1, 5000),
(2, 2, 6500),
(3, 3, 8000),
(4, 4, 3000),
(5, 5, 4500);


SELECT * FROM Customer;
SELECT * FROM Restaurant;
SELECT * FROM Orders;

SELECT 
    c.first_name,
    r.restaurant_name,
    o.total_amount,
    o.order_date
FROM Orders o
JOIN Customer c ON o.Customer_id = c.Customer_id
JOIN Restaurant r ON o.Restaurant_id = r.Restaurant_id;