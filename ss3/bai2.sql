create database bai2;
use bai2;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT 
    order_id AS oID, 
    order_date AS oDate, 
    order_total_price AS oPrice
FROM orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    c.customer_name, 
    p.product_name, 
    od.order_quantity
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_detail od ON o.order_id = od.order_id
JOIN product p ON od.product_id = p.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.customer_name
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT 
    o.order_id, 
    o.order_date, 
    SUM(od.order_quantity * p.product_price) AS total_price
FROM orders o
JOIN order_detail od ON o.order_id = od.order_id
JOIN product p ON od.product_id = p.product_id
GROUP BY o.order_id, o.order_date;

create table customer(
	customer_id int auto_increment primary key,
    customer_name varchar(50) not null,
    customer_age int not null
);
create table orders(
	order_id int auto_increment primary key,
    order_date datetime default now(),
    order_total_price double,
    customer_id int,
    foreign key (customer_id) references customer(customer_id)
);
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    product_price DOUBLE NOT NULL
);
create table order_detail(
	order_id int,
    product_id int,
    order_quantity int not null,
    foreign key (product_id) references product(product_id),
    foreign key (order_id) references orders(order_id)
);

insert into customer(customer_name, customer_age) values ("Minh Quan", 10),
("Ngoc Oanh", 20), ("Hong Ha", 50);

insert into orders(order_date) 
values 
('2006-03-21'), 
('2006-03-23'), 
('2006-03-16');

insert into product(product_name, product_price) values ('May giat', 3),('Tu Lanh', 5),('Dieu Hoa', 7),('Quat', 1),('Bep Dien', 2);

insert into order_detail(order_id, product_id, order_quantity) values (1, 1, 3),   -- Đơn 1 mua 3 máy giặt
(1, 3, 7),   
(2, 4, 2), 
(2, 5, 1),  
(3, 2, 8),  
(3, 3, 4),  
(3, 1, 3);   

