create table NhaCungCap(
	MaNhaCC int primary key,
    TenNhaCC varchar(200),
    DiaChi varchar(200),
    SoDT varchar(200),
    MaSoThue int
);

Create Table LoaiDichVu(
	MaLoaiDV int primary key,
    TenLoaiDV varchar(200)
);

Create table MucPhi(
	MaMP int primary key,
    DonGia int,
    MoTa varchar(200)
);

Create table DongXe(
	DongXe varchar(200) primary key,
    HangXe varchar(200),
    SoChoNgoi int
);

create table DangKyCungCap(
	MaDKCC int primary key,
    NgayBatDauCC date,
    NgayKetThucCC date,
    SoLuongXeDK int,
    
	DongXe varchar(200),
	MaMP int,
	MaLoaiDV int,	
    MaNhaCC int,
    
    foreign key (DongXe) references DongXe(DongXe),
    foreign key (MaMP) references MucPhi(MaMP),
    foreign key (MaLoaiDV) references LoaiDichVu(MaLoaiDV),
    foreign key (MaNhaCC) references NhaCungCap(MaNhaCC)
);

-- Câu 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
Select * from Dongxe where SoChoNgoi >= 5;

-- Câu 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
-- thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
-- thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
Select * 
from 
	NhaCungCap join DangKyCungCap on NhaCungCap.MaNhaCC = DangKyCungCap.MaNhaCC
    join DongXe on DangKyCungCap.DongXe = DongXe.Dongxe
    join MucPhi on DangKyCungCap.MaMP = MucPhi.MaMP
Where HangXe = 'Mazda' and Dongia >= 150000;

-- Câu 5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung
-- cấp và giảm dần theo mã số thuế
Select * 
From NhaCungCap
order by TenNhaCC asc, MaSoThue desc;

-- Câu 6: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
-- yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
-- cung cấp là “20/11/2015”
Select TenNhaCC, count(MaDKCC) as 'So luong DKCC'
from 
	NhaCungCap join DangKyCungCap on NhaCungCap.MaNhaCC = DangKyCungCap.MaNhaCC
where NgayBatDauCC > '2022-1-20'
group by TenNhaCC;

-- Câu 7: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần
Select DISTINCT HangXe 
from DongXe;

-- Câu 9: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện
-- thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”

Select * 
from 
	NhaCungCap join DangKyCungCap on NhaCungCap.MaNhaCC = DangKyCungCap.MaNhaCC
Where dongxe = 'Hiace' or dongxe = 'SUV';


-- Câu 10: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp
-- phương tiện lần nào cả.

Select NhaCungCap.* 
from 
	NhaCungCap left join DangKyCungCap on NhaCungCap.MaNhaCC = DangKyCungCap.MaNhaCC
where MaDKCC is null;






