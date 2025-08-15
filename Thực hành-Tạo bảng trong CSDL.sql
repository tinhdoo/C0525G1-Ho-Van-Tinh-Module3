use QuanLyDiemThi;

select * from HocSinh;
create table HocSinh(
	MaHS varchar(20) PRIMARY Key,
    TenHS varchar(50),
    NgaySinh DATETIME,
    Lop varchar(20),
    GT VARCHAR(20)
);
CREATE table MonHoc(
	MaMH varchar(20) PRIMARY key,
    TenMH varchar(20),giaoviengiaovienhocsinh
    MaGV varchar(20)
);
create table BangDiem(
	MaHS varchar(20),
    MaMH varchar(20),
    DiemThi INT,
    NgayKT DATETIME,
    PRIMARY KEY (MaHS, MaMH),
    FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);
create table GiaoVien(
	MaGV varchar(20) PRIMARY Key,
    TenGV varchar(20),
    SDT varchar(10)
);
ALTER Table MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);