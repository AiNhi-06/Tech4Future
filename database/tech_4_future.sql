-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 21, 2026 lúc 05:07 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tech_4_future`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `idSP` int(11) NOT NULL,
  `soLuongBan` int(11) NOT NULL,
  `donGia` int(11) NOT NULL,
  `idHDBH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietnhap`
--

CREATE TABLE `chitietnhap` (
  `idHDN` int(11) NOT NULL,
  `idSP` int(11) NOT NULL,
  `SLNhap` int(11) NOT NULL,
  `donGia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgiasp`
--

CREATE TABLE `danhgiasp` (
  `idDanhGia` int(11) NOT NULL,
  `review` varchar(300) NOT NULL,
  `rating` int(11) NOT NULL,
  `idKH` bigint(20) NOT NULL,
  `idSP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `idGio` int(11) NOT NULL,
  `tongTienTamTinh` int(11) NOT NULL,
  `soTienGiam` int(11) NOT NULL,
  `VAT` float NOT NULL,
  `idKH` bigint(20) NOT NULL,
  `idLoaiGH` int(11) NOT NULL,
  `idMaGiam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonbanhang`
--

CREATE TABLE `hoadonbanhang` (
  `idHDBH` int(11) NOT NULL,
  `ngayTao` datetime NOT NULL DEFAULT current_timestamp(),
  `thanhToan` int(11) NOT NULL,
  `idPhieuGH` int(11) NOT NULL,
  `idNV` bigint(20) NOT NULL,
  `idGio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonnhap`
--

CREATE TABLE `hoadonnhap` (
  `idHDN` int(11) NOT NULL,
  `ngayLap` datetime NOT NULL DEFAULT current_timestamp(),
  `idNV` bigint(20) NOT NULL,
  `idNCC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `idKH` bigint(20) NOT NULL,
  `tenKH` varchar(50) NOT NULL,
  `diaChi` varchar(300) NOT NULL,
  `sdt` char(10) NOT NULL,
  `idUsers` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaigiaohang`
--

CREATE TABLE `loaigiaohang` (
  `idLoaiGH` int(11) NOT NULL,
  `tenLoaiGH` varchar(30) NOT NULL,
  `donHangToiThieu` int(11) NOT NULL,
  `phiGiaoHang` int(11) NOT NULL,
  `DVVC` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `idCate` int(11) NOT NULL,
  `nameCate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`idCate`, `nameCate`) VALUES
(1, 'CPU'),
(2, 'RAM'),
(3, 'Mainboard'),
(4, 'VGA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `magiamgia`
--

CREATE TABLE `magiamgia` (
  `idMaGiam` int(11) NOT NULL,
  `tenMaGiam` varchar(50) NOT NULL,
  `code` char(10) NOT NULL,
  `soLuong` int(11) NOT NULL,
  `ngayBatDau` datetime NOT NULL,
  `ngayKetThuc` datetime NOT NULL,
  `tiLeGiam` float NOT NULL,
  `idSP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `idNCC` int(11) NOT NULL,
  `tenNCC` varchar(50) NOT NULL,
  `diaChi` varchar(300) NOT NULL,
  `SDT` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`idNCC`, `tenNCC`, `diaChi`, `SDT`) VALUES
(1, 'Intel Việt Nam', 'Hà Nội', '0241234567'),
(2, 'ASUS Việt Nam', 'TP.HCM', '0289876543');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `idNV` bigint(20) NOT NULL,
  `tenNV` varchar(50) NOT NULL,
  `gioiTinh` varchar(5) NOT NULL,
  `diaChi` varchar(300) NOT NULL,
  `ngaySinh` date NOT NULL,
  `idUsers` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhasanxuat`
--

CREATE TABLE `nhasanxuat` (
  `idNSX` int(11) NOT NULL,
  `tenNSX` varchar(30) NOT NULL,
  `diaChi` varchar(300) NOT NULL,
  `SDT` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhasanxuat`
--

INSERT INTO `nhasanxuat` (`idNSX`, `tenNSX`, `diaChi`, `SDT`) VALUES
(1, 'Intel', 'USA', '1800123456'),
(2, 'ASUS', 'Taiwan', '1800987654');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `idSP` int(11) NOT NULL,
  `tenSP` varchar(30) NOT NULL,
  `chiTietSP` varchar(300) NOT NULL,
  `gia` int(11) NOT NULL,
  `tinhTrang` varchar(50) NOT NULL,
  `hinhAnh` varchar(100) NOT NULL,
  `baoHanh` varchar(50) NOT NULL,
  `giaKM` int(11) DEFAULT NULL,
  `soLuong` int(11) NOT NULL,
  `idNSX` int(11) NOT NULL,
  `idNCC` int(11) NOT NULL,
  `idCate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`idSP`, `tenSP`, `chiTietSP`, `gia`, `tinhTrang`, `hinhAnh`, `baoHanh`, `giaKM`, `soLuong`, `idNSX`, `idNCC`, `idCate`) VALUES
(1, 'Chuột Gaming Logitech G102', 'Chuột gaming DPI cao', 350000, 'Còn hàng', 'assets/images/products/Logitech-G102.png', '24 tháng', NULL, 80, 2, 2, 1),
(2, 'CPU Intel Core i5 12400F', 'CPU 6 nhân 12 luồng', 4500000, 'Còn hàng', 'assets/images/products/no-image.png\r\n ', '36 tháng', NULL, 20, 1, 1, 1),
(3, 'RAM DDR4 16GB ASUS', 'RAM bus 3200 hiệu năng cao', 1200000, 'Còn hàng', 'assets/images/products/no-image.png', '36 tháng', NULL, 30, 2, 2, 2),
(4, 'Mainboard ASUS B660M', 'Hỗ trợ CPU Intel Gen 12', 2800000, 'Còn hàng', 'assets/images/products/no-image.png', '36 tháng', NULL, 15, 2, 2, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongso`
--

CREATE TABLE `thongso` (
  `id` int(11) NOT NULL,
  `idSP` int(11) DEFAULT NULL,
  `tenThongSo` varchar(100) DEFAULT NULL,
  `giaTri` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thongso`
--

INSERT INTO `thongso` (`id`, `idSP`, `tenThongSo`, `giaTri`) VALUES
(1, 1, 'Hãng', 'Logitech'),
(2, 1, 'DPI', '8000 DPI'),
(3, 1, 'Kết nối', 'USB'),
(4, 1, 'Đèn LED', 'RGB'),
(5, 1, 'Trọng lượng', '85g'),
(6, 2, 'Hãng', 'Intel'),
(7, 2, 'Số nhân', '6 nhân'),
(8, 2, 'Số luồng', '12 luồng'),
(9, 2, 'Xung nhịp', '2.5GHz - 4.4GHz'),
(10, 2, 'Socket', 'LGA1700'),
(11, 3, 'Hãng', 'ASUS'),
(12, 3, 'Dung lượng', '16GB'),
(13, 3, 'Loại RAM', 'DDR4'),
(14, 3, 'Bus', '3200MHz'),
(15, 3, 'Điện áp', '1.35V'),
(16, 4, 'Hãng', 'ASUS'),
(17, 4, 'Chipset', 'B660'),
(18, 4, 'Socket', 'LGA1700'),
(19, 4, 'RAM hỗ trợ', 'DDR4'),
(20, 4, 'Khe RAM', '4 khe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `idUsers` bigint(20) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tinhTrang` varchar(10) NOT NULL DEFAULT 'active',
  `roles` varchar(10) NOT NULL DEFAULT 'user',
  `ngayTao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`idUsers`, `userName`, `pass`, `email`, `tinhTrang`, `roles`, `ngayTao`) VALUES
(1, 'admin', 'admin123', 'admin@tech4future.vn', 'active', 'admin', '2026-03-12 20:46:01'),
(2, 'vendor01', 'vendor123', 'vendor@tech4future.vn', 'active', 'vendor', '2026-03-12 20:46:01'),
(3, 'khach1', 'khach123', 'khach1@gmail.com', 'active', 'user', '2026-03-12 20:46:01'),
(4, 'khach2', 'khach123', 'khach2@gmail.com', 'active', 'user', '2026-03-12 20:46:01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD KEY `idSP` (`idSP`),
  ADD KEY `idHDBH` (`idHDBH`);

--
-- Chỉ mục cho bảng `chitietnhap`
--
ALTER TABLE `chitietnhap`
  ADD KEY `idHDN` (`idHDN`),
  ADD KEY `idSP` (`idSP`);

--
-- Chỉ mục cho bảng `danhgiasp`
--
ALTER TABLE `danhgiasp`
  ADD PRIMARY KEY (`idDanhGia`),
  ADD KEY `idKH` (`idKH`),
  ADD KEY `idSP` (`idSP`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`idGio`),
  ADD KEY `idKH` (`idKH`),
  ADD KEY `idLoaiGH` (`idLoaiGH`),
  ADD KEY `idMaGiam` (`idMaGiam`);

--
-- Chỉ mục cho bảng `hoadonbanhang`
--
ALTER TABLE `hoadonbanhang`
  ADD PRIMARY KEY (`idHDBH`),
  ADD KEY `idNV` (`idNV`),
  ADD KEY `idGio` (`idGio`);

--
-- Chỉ mục cho bảng `hoadonnhap`
--
ALTER TABLE `hoadonnhap`
  ADD PRIMARY KEY (`idHDN`),
  ADD KEY `idNV` (`idNV`),
  ADD KEY `idNCC` (`idNCC`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`idKH`),
  ADD KEY `idUsers` (`idUsers`);

--
-- Chỉ mục cho bảng `loaigiaohang`
--
ALTER TABLE `loaigiaohang`
  ADD PRIMARY KEY (`idLoaiGH`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`idCate`);

--
-- Chỉ mục cho bảng `magiamgia`
--
ALTER TABLE `magiamgia`
  ADD PRIMARY KEY (`idMaGiam`),
  ADD KEY `idSP` (`idSP`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`idNCC`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`idNV`),
  ADD KEY `idUsers` (`idUsers`);

--
-- Chỉ mục cho bảng `nhasanxuat`
--
ALTER TABLE `nhasanxuat`
  ADD PRIMARY KEY (`idNSX`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`idSP`),
  ADD KEY `idNSX` (`idNSX`),
  ADD KEY `idNCC` (`idNCC`),
  ADD KEY `idCate` (`idCate`);

--
-- Chỉ mục cho bảng `thongso`
--
ALTER TABLE `thongso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idSP` (`idSP`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `thongso`
--
ALTER TABLE `thongso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`idSP`) REFERENCES `sanpham` (`idSP`),
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`idHDBH`) REFERENCES `hoadonbanhang` (`idHDBH`);

--
-- Các ràng buộc cho bảng `chitietnhap`
--
ALTER TABLE `chitietnhap`
  ADD CONSTRAINT `chitietnhap_ibfk_1` FOREIGN KEY (`idHDN`) REFERENCES `hoadonnhap` (`idHDN`),
  ADD CONSTRAINT `chitietnhap_ibfk_2` FOREIGN KEY (`idSP`) REFERENCES `sanpham` (`idSP`);

--
-- Các ràng buộc cho bảng `danhgiasp`
--
ALTER TABLE `danhgiasp`
  ADD CONSTRAINT `danhgiasp_ibfk_1` FOREIGN KEY (`idKH`) REFERENCES `khachhang` (`idKH`),
  ADD CONSTRAINT `danhgiasp_ibfk_2` FOREIGN KEY (`idSP`) REFERENCES `sanpham` (`idSP`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`idKH`) REFERENCES `khachhang` (`idKH`),
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`idLoaiGH`) REFERENCES `loaigiaohang` (`idLoaiGH`),
  ADD CONSTRAINT `giohang_ibfk_3` FOREIGN KEY (`idMaGiam`) REFERENCES `magiamgia` (`idMaGiam`);

--
-- Các ràng buộc cho bảng `hoadonbanhang`
--
ALTER TABLE `hoadonbanhang`
  ADD CONSTRAINT `hoadonbanhang_ibfk_1` FOREIGN KEY (`idNV`) REFERENCES `nhanvien` (`idNV`),
  ADD CONSTRAINT `hoadonbanhang_ibfk_2` FOREIGN KEY (`idGio`) REFERENCES `giohang` (`idGio`);

--
-- Các ràng buộc cho bảng `hoadonnhap`
--
ALTER TABLE `hoadonnhap`
  ADD CONSTRAINT `hoadonnhap_ibfk_1` FOREIGN KEY (`idNV`) REFERENCES `nhanvien` (`idNV`),
  ADD CONSTRAINT `hoadonnhap_ibfk_2` FOREIGN KEY (`idNCC`) REFERENCES `nhacungcap` (`idNCC`);

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`idUsers`) REFERENCES `users` (`idUsers`);

--
-- Các ràng buộc cho bảng `magiamgia`
--
ALTER TABLE `magiamgia`
  ADD CONSTRAINT `magiamgia_ibfk_1` FOREIGN KEY (`idSP`) REFERENCES `sanpham` (`idSP`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`idUsers`) REFERENCES `users` (`idUsers`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`idNSX`) REFERENCES `nhasanxuat` (`idNSX`),
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`idNCC`) REFERENCES `nhacungcap` (`idNCC`),
  ADD CONSTRAINT `sanpham_ibfk_3` FOREIGN KEY (`idCate`) REFERENCES `loaisanpham` (`idCate`);

--
-- Các ràng buộc cho bảng `thongso`
--
ALTER TABLE `thongso`
  ADD CONSTRAINT `thongso_ibfk_1` FOREIGN KEY (`idSP`) REFERENCES `sanpham` (`idSP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
