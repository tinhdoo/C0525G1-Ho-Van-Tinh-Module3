create database view_index_sp;
use view_index_sp;

create table products(
	id_product int auto_increment primary key,
    code_product int not null,
    name_product varchar(45),
    price_product double not null,
    amount_product int not null, -- số lượng
    description_product varchar(100), -- mô tả
    status_product varchar(100)
);

insert into products (code_product, name_product, price_product, amount_product, description_product, status_product)
values
(1001, 'Cà phê Espresso', 45000, 50, 'Cà phê đậm vị Ý', 'Còn hàng'),
(1002, 'Cà phê Sữa', 30000, 80, 'Cà phê sữa truyền thống Việt Nam', 'Còn hàng'),
(1003, 'Cà phê Phin', 25000, 100, 'Cà phê phin gói tiện lợi', 'Còn hàng'),
(1004, 'Trà Đào', 40000, 40, 'Trà đào tươi mát', 'Còn hàng'),
(1005, 'Bánh Croissant', 20000, 30, 'Bánh ngọt Pháp giòn tan', 'Hết hàng'),
(1006, 'Sinh tố Xoài', 35000, 25, 'Sinh tố trái cây tự nhiên', 'Còn hàng');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục) 
create unique index idx_product
on products(code_product);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index idx_compo_product
on products(name_product, price_product);
explain select * from products where name_product like "Trà Đào";

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_product as
select code_product, name_product, price_product, status_product
from products;

-- Sửa đổi view
alter view view_product as
select code_product, name_product, status_product
from products;

-- Xoá view
drop view view_product;

select * from view_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_product()
begin
select * from products;
end //
delimiter ;

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_add_product(
in code_product varchar(40),
in name_product varchar(40),
in price_product varchar(40),
in amount_product varchar(40),
in description_product varchar(40),
in status_product varchar(40)
)
begin
insert into products (code_product, name_product, price_product, amount_product, description_product, status_product)
values (code_product, name_product, price_product, amount_product, description_product, status_product);
end //
delimiter ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_update_product(
in id_new int,
in code_new varchar(40),
in name_new varchar(40),
in price_new varchar(40),
in amount_new varchar(40),
in description_new varchar(40),
in status_new varchar(40)
)
begin
update products set code_product = code_new,
name_product = name_new,
 price_product = price_new,
 amount_product = amount_new,
 description_product = description_new,
 status_product = status_new
 where id_product = id_new;
end //
delimiter ;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_delete_product(
in id_new int
)
begin
delete from products where
id_product = id_new;
end //
delimiter ;

call sp_delete_product(13);
call sp_update_product(1,2,'ok',10000,10,'ok','ok');
select * from products;
drop procedure sp_update_product;
call sp_product();
