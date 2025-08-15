use bai2;

create table customer(
	customer_id int auto_increment primary key,
    customer_name varchar(50) not null,
    customer_age int not null
);
create table orders(
	order_id int auto_increment primary key,
    order_date datetime default now(),
    order_total_price double not null,
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
)