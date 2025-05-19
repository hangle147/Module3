create database quan_li_diem_thi;
use quan_li_diem_thi;

create table giao_vien(
	ma_giao_vien varchar(20) primary key,
    ten_giao_vien varchar(20),
    sdt varchar(15)
);

create table mon_hoc(
	ma_mon_hoc varchar(20) primary key,
    ten_mon_hoc varchar(50),
    ma_giao_vien varchar(20),
    foreign key (ma_giao_vien) references giao_vien(ma_giao_vien)
);

create table hoc_sinh(
	ma_hoc_sinh varchar(20) primary key,
    ten_hoc_sinh varchar(50),
    ngay_sinh datetime,
    lop varchar(20),
    gioi_tinh varchar(20)
);

create table bang_diem(
	ma_hoc_sinh varchar(20),
    ma_mon_hoc varchar(20),
    diem_thi int,
    ngay_kiem_tra datetime,
    primary key (ma_hoc_sinh, ma_mon_hoc),
    foreign key (ma_hoc_sinh) references hoc_sinh(ma_hoc_sinh),
    foreign key (ma_mon_hoc) references mon_hoc(ma_mon_hoc)
);
