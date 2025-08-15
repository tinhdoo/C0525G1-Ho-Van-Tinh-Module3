use bai2;

create table phieu_xuat(
	id_px int auto_increment primary key,
    so_px int not null ,
    ngay_xuat datetime default now()
);
create table vat_tu(
	id_vtu int auto_increment primary key,
    ma_vtu int not null,
    ten_vtu varchar(50) not null
);
create table chi_tiet_phieu_xuat(
	id_chi_tiet_xuat int auto_increment primary key,
    dg_xuat double not null,
    sl_xuat int not null,
    id_px int,
	id_vtu int,
    foreign key (id_px) references phieu_xuat(id_px),
    foreign key (id_vtu) references vat_tu(id_vtu)
);
create table phieu_nhap(
	id_pn int auto_increment primary key,
    so_pn int not null,
    ngay_nhap datetime default now()
);
create table chi_tiet_phieu_nhap(
	id_chi_tiet_nhap int auto_increment primary key,
    dg_nhap double not null,
    sl_nhap int not null,
    id_vtu int,
    id_pn int,
    foreign key (id_vtu) references vat_tu(id_vtu),
    foreign key (id_pn) references phieu_nhap(id_pn)
);
create table don_dat_hang(
	id_ddh int auto_increment primary key,
    so_dh int not null,
    ngay_dh datetime default now()
);
create table chi_tiet_don_dh(
	id_chi_tiet_ddh int auto_increment primary key,
	id_ddh int,
    id_vtu int,
    foreign key (id_ddh) references don_dat_hang(id_ddh),
    foreign key (id_vtu) references vat_tu(id_vtu)
);
create table nha_cc(
	id_nhacc int auto_increment primary key,
    ma_ncc int not null,
    ten_ncc varchar(50) not null,
    dia_chi varchar(50) not null
);
create table sdt(
	id_sdt int auto_increment primary key,
    sdt int not null,
    id_nhacc int,
    foreign key (id_nhacc) references nha_cc(id_nhacc)
);
