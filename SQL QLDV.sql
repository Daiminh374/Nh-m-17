-- TẠO DATABASE
CREATE DATABASE QuanLyDatVe;
GO
USE QuanLyDatVe;
GO

-- TẠO BẢNG NHÀ TỔ CHỨC
CREATE TABLE NHATOCHUC (
    MANTC VARCHAR(10) PRIMARY KEY,
    TENNTC NVARCHAR(100),
    THONGTINLH NVARCHAR(255)
);

-- TẠO BẢNG ĐỊA ĐIỂM
CREATE TABLE DIADIEM (
    MADD VARCHAR(10) PRIMARY KEY,
    TENDD NVARCHAR(100),
    DIACHI NVARCHAR(255),
    SUCCHUA INT
);

-- TẠO BẢNG SỰ KIỆN
CREATE TABLE SUKIEN (
    MASK VARCHAR(10) PRIMARY KEY,
    TENSK NVARCHAR(100),
    MOTA NVARCHAR(255),
    THOIGIANBD DATETIME,
    THOIGIANKT DATETIME,
    TRANGTHAI NVARCHAR(50),
    MANTC VARCHAR(10),
    MADD VARCHAR(10),
    FOREIGN KEY (MANTC) REFERENCES NHATOCHUC(MANTC),
    FOREIGN KEY (MADD) REFERENCES DIADIEM(MADD)
);

-- TẠO BẢNG LOẠI VÉ
CREATE TABLE LOAIVE (
    MAVE VARCHAR(10) PRIMARY KEY,
    TENVE NVARCHAR(100),
    GIAVE MONEY,
    SOLUONG INT,
    MASK VARCHAR(10),
    FOREIGN KEY (MASK) REFERENCES SUKIEN(MASK)
);

-- TẠO BẢNG KHÁCH HÀNG
CREATE TABLE KHACHHANG (
    MAKH VARCHAR(10) PRIMARY KEY,
    HOTEN NVARCHAR(100),
    EMAIL NVARCHAR(100),
    SDT VARCHAR(15),
    MATKHAU NVARCHAR(100)
);

-- TẠO BẢNG ĐẶT VÉ
CREATE TABLE DATVE (
    MADATVE VARCHAR(10) PRIMARY KEY,
    THOIGIANDAT DATETIME,
    TONGTIEN MONEY,
    TRANGTHAITT NVARCHAR(50),
    MASK VARCHAR(10),
    MAKH VARCHAR(10),
    FOREIGN KEY (MASK) REFERENCES SUKIEN(MASK),
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
);

-- TẠO BẢNG CHI TIẾT ĐẶT VÉ
CREATE TABLE CHITIETDATVE (
    MADATVE VARCHAR(10),
    MAVE VARCHAR(10),
    SOLUONGMUA INT,
    DONGIA MONEY,
    PRIMARY KEY (MADATVE, MAVE),
    FOREIGN KEY (MADATVE) REFERENCES DATVE(MADATVE),
    FOREIGN KEY (MAVE) REFERENCES LOAIVE(MAVE)
);

-- NHẬP DỮ LIỆU NHÀ TỔ CHỨC
INSERT INTO NHATOCHUC VALUES
('NTC01', N'Công ty ABC', N'abc@example.com'),
('NTC02', N'Tổ chức DEF', N'def@example.com'),
('NTC03', N'Group 123', N'group123@example.com'),
('NTC04', N'Team SoundWave', N'soundwave@example.com'),
('NTC05', N'Nhà tổ chức 5', N'contact5@example.com');

-- NHẬP DỮ LIỆU ĐỊA ĐIỂM
INSERT INTO DIADIEM VALUES
('DD01', N'Sân vận động QG', N'Hà Nội', 30000),
('DD02', N'Nhà hát Lớn', N'Hà Nội', 1000),
('DD03', N'Trung tâm HN Q1', N'HCM', 2000),
('DD04', N'Sân khấu Sao Mai', N'Đà Nẵng', 500),
('DD05', N'Rạp chiếu Beta', N'Cần Thơ', 300);

-- NHẬP DỮ LIỆU SỰ KIỆN
INSERT INTO SUKIEN VALUES
('SK01', N'Live Concert', N'Ca nhạc trực tiếp', '2025-06-01 19:00', '2025-06-01 22:00', N'Sắp diễn ra', 'NTC01', 'DD01'),
('SK02', N'Hội thảo CNTT', N'Thảo luận công nghệ', '2025-06-10 09:00', '2025-06-10 16:00', N'Sắp diễn ra', 'NTC02', 'DD03'),
('SK03', N'Triển lãm ảnh', N'Triển lãm nghệ thuật', '2025-05-15 10:00', '2025-05-20 18:00', N'Đang diễn ra', 'NTC03', 'DD04'),
('SK04', N'Giải bóng đá', N'Thể thao hấp dẫn', '2025-07-01 17:00', '2025-07-01 19:00', N'Sắp diễn ra', 'NTC01', 'DD01'),
('SK05', N'Chiếu phim đặc biệt', N'Bộ phim bom tấn', '2025-05-10 20:00', '2025-05-10 22:30', N'Sắp diễn ra', 'NTC04', 'DD05'),
('SK06', N'Giải bóng đá', N'Thể thao hấp dẫn', '2025-05-01 17:00', '2025-05-01 19:00', N'Sắp diễn ra', 'NTC01', 'DD01');

-- NHẬP DỮ LIỆU LOẠI VÉ
INSERT INTO LOAIVE VALUES
('VE01', N'VIP', 1000000, 50, 'SK01'),
('VE02', N'Thường', 300000, 200, 'SK01'),
('VE03', N'Sinh viên', 150000, 100, 'SK02'),
('VE04', N'Ghế hạng A', 500000, 80, 'SK04'),
('VE05', N'Vé thường', 100000, 50, 'SK03');

-- NHẬP DỮ LIỆU KHÁCH HÀNG
INSERT INTO KHACHHANG VALUES
('KH01', N'Nguyễn Văn A', 'a@gmail.com', '0909123456', 'matkhau1'),
('KH02', N'Trần Thị B', 'b@yahoo.com', '0909876543', 'matkhau2'),
('KH03', N'Lê Văn C', 'c@gmail.com', '0912121212', 'matkhau3'),
('KH04', N'Phạm Thị D', 'd@gmail.com', '0933456789', 'matkhau4'),
('KH05', N'Hồ Văn E', 'e@gmail.com', '0987654321', 'matkhau5');

-- NHẬP DỮ LIỆU ĐẶT VÉ
INSERT INTO DATVE VALUES
('DV01', '2025-05-01 14:00', 1300000, N'Đã thanh toán', 'SK01', 'KH01'),
('DV02', '2025-05-02 15:30', 300000, N'Chưa thanh toán', 'SK01', 'KH02'),
('DV03', '2025-05-03 09:00', 150000, N'Đã hủy', 'SK02', 'KH03'),
('DV04', '2025-05-04 10:15', 500000, N'Đã thanh toán', 'SK04', 'KH04'),
('DV05', '2025-05-05 11:00', 100000, N'Đã thanh toán', 'SK03', 'KH05'),
('DV06', '2025-05-04 10:15', 500000, N'Đã thanh toán', 'SK04', 'KH05'),
('DV07', '2025-05-05 11:00', 100000, N'Đã thanh toán', 'SK03', 'KH05');

-- NHẬP DỮ LIỆU CHI TIẾT ĐẶT VÉ
INSERT INTO CHITIETDATVE VALUES
('DV01', 'VE01', 1, 1000000),
('DV01', 'VE02', 1, 300000),
('DV02', 'VE02', 1, 300000),
('DV03', 'VE03', 1, 150000),
('DV04', 'VE04', 1, 500000),
('DV05', 'VE05', 1, 100000);

select * from NHATOCHUC
select * from DIADIEM
select * from SUKIEN
select * from LOAIVE
select * from KHACHHANG
select * from DATVE
select * from CHITIETDATVE

-- 1. Liệt kê 5 khách hàng gần đây nhất đã đặt vé thành công
SELECT TOP 5 
    KH.HOTEN, 
    SK.TENSK, 
    DV.TONGTIEN, 
    DV.TRANGTHAITT, 
    DV.THOIGIANDAT
FROM DATVE DV
JOIN KHACHHANG KH ON DV.MAKH = KH.MAKH
JOIN SUKIEN SK ON DV.MASK = SK.MASK
WHERE DV.TRANGTHAITT = N'Đã thanh toán'
ORDER BY DV.THOIGIANDAT DESC;

-- 2. Các loại vé thuộc sự kiện tại địa điểm có sức chứa > 500
SELECT
    SK.TENSK,
    LV.TENVE,
    LV.GIAVE,
    DD.TENDD
FROM LOAIVE LV
JOIN SUKIEN SK ON LV.MASK = SK.MASK
JOIN DIADIEM DD ON SK.MADD = DD.MADD
WHERE DD.SUCCHUA > 500;

-- 3. Tăng giá 5% cho các loại vé thuộc sự kiện diễn ra trong 30 ngày tới
UPDATE LOAIVE
SET GIAVE = GIAVE * 1.05
WHERE MASK IN (
    SELECT MASK
    FROM SUKIEN
    WHERE THOIGIANBD BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE())
);

-- 4. Cập nhật trạng thái 'Đã kết thúc' cho sự kiện đã qua hôm qua
UPDATE SUKIEN
SET TRANGTHAI = N'Đã kết thúc'
WHERE THOIGIANKT < DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0);

-- 5. Xóa các loại vé chưa từng được bán
DELETE FROM LOAIVE
WHERE MAVE NOT IN (
    SELECT DISTINCT MAVE FROM CHITIETDATVE
);

-- 6. Xóa đơn đặt vé chưa thanh toán quá 30 ngày
DELETE FROM DATVE
WHERE TRANGTHAITT = N'Chưa thanh toán'
  AND THOIGIANDAT < DATEADD(DAY, -30, GETDATE());

-- 7. Tính tổng số vé đã bán được cho mỗi loại vé trong sự kiện có Mã sự kiện là 'SK04'. Hiển thị Mã loại vé và tổng số lượng vé đã bán
SELECT 
	CDV.MAVE, 
	SUM(CDV.SOLUONGMUA) AS TONGSOVEDABAN
FROM CHITIETDATVE CDV
JOIN DATVE DV ON CDV.MADATVE = DV.MADATVE
WHERE DV.MASK = 'SK04'
GROUP BY CDV.MAVE

-- 8. Thống kê số sự kiện do mỗi nhà tổ chức thực hiện
SELECT
    TC.TENNTC,
    COUNT(SK.MASK) AS TONGSUKIEN
FROM NHATOCHUC TC
JOIN SUKIEN SK ON TC.MANTC = SK.MANTC
GROUP BY TC.TENNTC;

-- 9. Khách hàng có tổng chi cao nhất
SELECT TOP 1
    KH.HOTEN,
    SUM(DV.TONGTIEN) AS TONGCHI
FROM DATVE DV
JOIN KHACHHANG KH ON DV.MAKH = KH.MAKH
WHERE DV.TRANGTHAITT = N'Đã thanh toán'
GROUP BY KH.HOTEN
ORDER BY TONGCHI DESC;

-- 10. Sự kiện chưa có ai đặt vé
SELECT TENSK
FROM SUKIEN
WHERE MASK NOT IN (
    SELECT DISTINCT MASK FROM DATVE
);

-- 11. Liệt kê số vé còn lại của mỗi loại vé
SELECT
    LV.TENVE,
    LV.SOLUONG - ISNULL(SUM(CT.SOLUONGMUA), 0) AS SOLUONGCONLAI
FROM LOAIVE LV
LEFT JOIN CHITIETDATVE CT ON LV.MAVE = CT.MAVE
GROUP BY LV.TENVE, LV.SOLUONG;

-- 12. Các sự kiện có vé VIP nhưng đã bán hết vé VIP
SELECT SK.TENSK, LV.TENVE
FROM LOAIVE LV
JOIN SUKIEN SK ON LV.MASK = SK.MASK
WHERE LV.TENVE = N'VIP'
  AND LV.SOLUONG = (
    SELECT SUM(SOLUONGMUA)
    FROM CHITIETDATVE
    WHERE MAVE = LV.MAVE
);

