create database QuanLyDonDatHang;
use QuanLyDonDatHang;

select * from hang;
create table nguoi_nhan(
	ma_so_nn int auto_increment primary key,
    ho_ten_nn varchar(50) not null
);


create table noi_giao(
	ma_so_ddg int auto_increment primary key,
    ten_noi_giao varchar(50) not null,
    ma_so_nn int,
    foreign key (ma_so_nn) references nguoi_nhan(ma_so_nn)
);
create table nguoi_giao(
	ma_so_ng int auto_increment primary key,
    ho_ten_ng varchar(50) not null
);
create table hang(
	ma_hang int auto_increment,
    ten_hang varchar(50) not null,
    dv_tinh varchar(50) not null,
    mo_ta varchar(100) not null,
    primary key (ma_hang),
    ma_so_ng int,
    ma_so_nn int,
    foreign key (ma_so_ng) references nguoi_giao(ma_so_ng),
    foreign key (ma_so_nn) references nguoi_nhan(ma_so_nn)
);

create table don_vi_kh(
	ma_dv int auto_increment,
    ten_dv varchar(50) not null,
    dia_chi varchar(50) not null,
    primary key (ma_dv),
    ma_so_nn int,
    foreign key (ma_so_nn) references nguoi_nhan(ma_so_nn)
);
create table nguoi_dat(
	ma_nd int auto_increment primary key,
    ho_ten_nd varchar(50) not null,
    ma_hang int,
    foreign key (ma_hang) references hang(ma_hang)
);
create table don_vi_dat(
	ma_dv int auto_increment,
    ten_dv varchar(50) not null,
    dia_chi varchar(50) not null,
    dien_thoai int not null,
    primary key (ma_dv),
    ma_nd int,
    foreign key (ma_nd) references nguoi_dat(ma_nd)
);