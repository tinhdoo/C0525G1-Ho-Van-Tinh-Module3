create database furama;
use furama;

-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * from nhan_vien
where ten_nhanvien like 'H%' or ten_nhanvien like 'T%' or ten_nhanvien like 'K%' 
and length(ten_nhanvien) <= 15;

-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang
where timestampdiff(year, ngay_sinh_khach, CURDATE()) BETWEEN 18 AND 50
and (dia_chi_khach like 'Đà Nẵng' or dia_chi_khach like 'Quảng Trị');

-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.id_khachhang,
       kh.name_khach,
       lk.ten_loaikhach,
       COUNT(hd.id_hopdong) as so_lan_dat_phong
from khach_hang kh
join loai_khach lk on kh.id_loaikhach = lk.id_loaikhach
join hopdong hd on kh.id_khachhang = hd.id_khachhang
where lk.ten_loaikhach = 'Diamond'
group by kh.id_khachhang, kh.name_khach, lk.ten_loaikhach
order by so_lan_dat_phong asc;

create table vitri(
	id_vitri int auto_increment primary key,
    ten_vitri varchar(45)
);
create table trinhdo(
	id_trinhdo int auto_increment primary key,
    trinhdo varchar(45)
);
create table bophan(
	id_bophan int auto_increment primary key,
    ten_bophan varchar(45)
);
create table nhan_vien(
	id_nhanvien int auto_increment primary key,
	ten_nhanvien varchar(50) not null,
    id_vitri int,
    id_trinhdo int,
    id_bophan int,
    ngaysinh_nv datetime default now(),
    so_cmtnd varchar(45),
    luong varchar(45),
    sdt varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    foreign key (id_vitri) references vitri(id_vitri),
    foreign key (id_trinhdo) references trinhdo(id_trinhdo),
    foreign key (id_bophan) references bophan(id_bophan)
);

create table loai_khach(
	id_loaikhach int auto_increment primary key,
    ten_loaikhach varchar(45)
);
create table khach_hang(
	id_khachhang int auto_increment primary key,
    id_loaikhach int,
    name_khach varchar(45),
    ngay_sinh_khach datetime default now(),
    so_cmtnd_khach varchar(45),
    sdt_khach varchar(45),
    email_khach varchar(45),
    dia_chi_khach varchar(45),
    foreign key(id_loaikhach) references loai_khach(id_loaikhach)
);

create table dichvudikem(
	id_dichvudikem int auto_increment primary key,
    ten_dichvudikem varchar(45),
    gia_dichvu int,
    don_vi_dichvu int,
    trangthaikhadung varchar(45)
);

create table kieuthue(
	id_kieuthue int auto_increment primary key,
    ten_kieuthue varchar(45),
    gia_kieuthue int
);
create table loaidichvu(
	id_loaidichvu int auto_increment primary key,
    ten_loaidichvu varchar(45)
);
create table dichvu(
	id_dichvu int auto_increment primary key,
	ten_dichvu varchar(45),
    dientich int,
    sotang int,
    songuoitoida varchar(45),
    chiphithue varchar(45),
    id_kieuthue int,
    id_loaidichvu int,
    trangthai varchar(45),
    foreign key (id_kieuthue) references kieuthue(id_kieuthue),
    foreign key (id_loaidichvu) references loaidichvu(id_loaidichvu)
);
create table hopdong(
	id_hopdong int auto_increment primary key,
	id_nhanvien int,
	id_khachhang int,
    id_dichvu int,
    ngaylamhopdong datetime default now(),
    ngayketthuc datetime default now(),
    tiendatcoc int,
    tongtien int,
    foreign key (id_nhanvien) references nhan_vien(id_nhanvien),
    foreign key (id_khachhang) references khach_hang(id_khachhang),
    foreign key (id_dichvu) references dichvu(id_dichvu)
);
create table hopdongchitiet(
	id_hopdongchitiet int auto_increment primary key,
	id_hopdong int,
    id_dichvudikem int,
    soluong int,
    foreign key (id_hopdong) references hopdong(id_hopdong),
    foreign key (id_dichvudikem) references dichvudikem(id_dichvudikem)
);

insert into vitri(ten_vitri) values
('Lễ tân'),
('Phục vụ'),
('Chuyên viên'),
('Giám sát'),
('Quản lý'),
('Giám đốc');

insert into trinhdo(trinhdo) values
('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');

insert into bophan(ten_bophan) values
('Sale – Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');

insert into nhan_vien (ten_nhanvien, id_vitri, id_trinhdo, id_bophan, ngaysinh_nv, so_cmtnd, luong, sdt, email, dia_chi) values
('Nguyễn Văn A', 1, 3, 1, '1995-05-20', '201123456', '10000000', '0905123456', 'a@furama.com', 'Đà Nẵng'),
('Trần Thị B', 2, 2, 3, '1998-07-15', '201654321', '8000000', '0905234567', 'b@furama.com', 'Huế'),
('Lê Văn C', 6, 4, 4, '1980-02-10', '201987654', '30000000', '0905345678', 'c@furama.com', 'Hà Nội');

insert into loai_khach(ten_loaikhach) values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into khach_hang (id_loaikhach, name_khach, ngay_sinh_khach, so_cmtnd_khach, sdt_khach, email_khach, dia_chi_khach) values
(1, 'Nguyễn Hoàng', '1990-04-12', '123456789', '0912345678', 'hoang@gmail.com', 'Đà Nẵng'),
(3, 'Phạm Minh', '1985-10-01', '987654321', '0932123456', 'minh@gmail.com', 'Hà Nội'),
(5, 'Trần Thị Hoa', '2000-03-20', '456123789', '0945671234', 'hoa@gmail.com', 'Huế');

insert into khach_hang (id_loaikhach, name_khach, ngay_sinh_khach, so_cmtnd_khach, sdt_khach, email_khach, dia_chi_khach) values
(1, 'Ngô Thị Hạnh', '1995-09-09', '852369741', '0935002233', 'hanh@gmail.com', 'Quảng Trị');

insert into kieuthue (ten_kieuthue, gia_kieuthue) values
('Thuê theo năm', 100000000),
('Thuê theo tháng', 10000000),
('Thuê theo ngày', 1000000),
('Thuê theo giờ', 200000);

insert into loaidichvu(ten_loaidichvu) values
('Villa'),
('House'),
('Room');

insert into dichvu (ten_dichvu, dientich, sotang, songuoitoida, chiphithue, id_kieuthue, id_loaidichvu, trangthai) values
('Villa Ocean View', 300, 2, '10', '5000000', 3, 1, 'Đang trống'),
('House Garden', 120, 1, '6', '2000000', 2, 2, 'Đang trống'),
('Room Deluxe', 40, 1, '2', '800000', 4, 3, 'Đang trống');

insert into dichvudikem (ten_dichvudikem, gia_dichvu, don_vi_dichvu, trangthaikhadung) values
('Massage', 500000, 1, 'Còn'),
('Karaoke', 300000, 1, 'Còn'),
('Thức ăn', 200000, 1, 'Còn'),
('Nước uống', 50000, 1, 'Còn'),
('Thuê xe tham quan', 1000000, 1, 'Còn');

insert into hopdong (id_nhanvien, id_khachhang, id_dichvu, ngaylamhopdong, ngayketthuc, tiendatcoc, tongtien) values
(1, 1, 1, '2023-08-01', '2023-08-07', 2000000, 35000000),
(2, 2, 2, '2023-09-05', '2023-09-10', 1000000, 10000000),
(3, 3, 3, '2023-10-01', '2023-10-03', 500000, 2000000);

insert into hopdongchitiet (id_hopdong, id_dichvudikem, soluong) values
(1, 1, 2),  -- Khách thuê Villa và dùng 2 suất Massage
(1, 3, 5),  -- Khách thuê Villa và đặt 5 suất Thức ăn
(2, 2, 1),  -- Khách thuê House và hát Karaoke
(3, 4, 10); -- Khách thuê Room và gọi 10 chai nước