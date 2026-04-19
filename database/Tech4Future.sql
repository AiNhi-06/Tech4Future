CREATE DATABASE IF NOT EXISTS `Tech_4_Future` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `Tech_4_Future`;

-- Table: LoaiSanPham
CREATE TABLE `LoaiSanPham` (
  `idCate` int(11) NOT NULL PRIMARY KEY,
  `nameCate` varchar(30) NOT NULL
) ENGINE=InnoDB;

-- Table: NhaCungCap
CREATE TABLE `NhaCungCap` (
  `idNCC` int(11) NOT NULL PRIMARY KEY,
  `tenNCC` varchar(50) NOT NULL,
  `diaChi` varchar(300) NOT NULL,
  `SDT` char(10) NOT NULL
) ENGINE=InnoDB;

-- Table: NhaSanXuat
CREATE TABLE `NhaSanXuat` (
  `idNSX` int(11) NOT NULL PRIMARY KEY,
  `tenNSX` varchar(30) NOT NULL,
  `diaChi` varchar(300) NOT NULL,
  `SDT` char(10) NOT NULL
) ENGINE=InnoDB;

-- Table: Users
CREATE TABLE `Users` (
  `idUsers` bigint(20) NOT NULL PRIMARY KEY,
  `userName` varchar(50) DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `tinhTrang` varchar(10) NOT NULL DEFAULT 'active',
  `roles` varchar(10) NOT NULL DEFAULT 'user',
  `ngayTao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Table: KhachHang
CREATE TABLE `KhachHang` (
  `idKH` bigint(20) NOT NULL PRIMARY KEY,
  `tenKH` varchar(50) NOT NULL,
  `diaChi` varchar(300) NOT NULL,
  `sdt` char(10) NOT NULL,
  `idUsers` bigint(20) DEFAULT NULL,
  FOREIGN KEY (`idUsers`) REFERENCES `Users`(`idUsers`)
) ENGINE=InnoDB;

-- Table: NhanVien
CREATE TABLE `NhanVien` (
  `idNV` bigint(20) NOT NULL PRIMARY KEY,
  `tenNV` varchar(50) NOT NULL,
  `gioiTinh` varchar(5) NOT NULL,
  `diaChi` varchar(300) NOT NULL,
  `ngaySinh` date NOT NULL,
  `idUsers` bigint(20) DEFAULT NULL,
  FOREIGN KEY (`idUsers`) REFERENCES `Users`(`idUsers`)
) ENGINE=InnoDB;

-- Table: SanPham
CREATE TABLE `SanPham` (
  `idSP` int(11) NOT NULL PRIMARY KEY,
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
  `idCate` int(11) NOT NULL,
  FOREIGN KEY (`idNSX`) REFERENCES `NhaSanXuat`(`idNSX`),
  FOREIGN KEY (`idNCC`) REFERENCES `NhaCungCap`(`idNCC`),
  FOREIGN KEY (`idCate`) REFERENCES `LoaiSanPham`(`idCate`)
) ENGINE=InnoDB;

-- Table: MaGiamGia
CREATE TABLE `MaGiamGia` (
  `idMaGiam` int(11) NOT NULL PRIMARY KEY,
  `tenMaGiam` varchar(50) NOT NULL,
  `code` char(10) NOT NULL,
  `soLuong` int(11) NOT NULL,
  `ngayBatDau` datetime NOT NULL,
  `ngayKetThuc` datetime NOT NULL,
  `tiLeGiam` float NOT NULL,
  `idSP` int(11) NOT NULL,
  FOREIGN KEY (`idSP`) REFERENCES `SanPham`(`idSP`)
) ENGINE=InnoDB;

-- Table: LoaiGiaoHang
CREATE TABLE `LoaiGiaoHang` (
  `idLoaiGH` int(11) NOT NULL PRIMARY KEY,
  `tenLoaiGH` varchar(30) NOT NULL,
  `donHangToiThieu` int(11) NOT NULL,
  `phiGiaoHang` int(11) NOT NULL,
  `DVVC` varchar(50) NOT NULL
) ENGINE=InnoDB;

-- Table: GioHang
CREATE TABLE `GioHang` (
  `idGio` int(11) NOT NULL PRIMARY KEY,
  `tongTienTamTinh` int(11) NOT NULL,
  `soTienGiam` int(11) NOT NULL,
  `VAT` float NOT NULL,
  `idKH` bigint(20) NOT NULL,
  `idLoaiGH` int(11) NOT NULL,
  `idMaGiam` int(11) NOT NULL,
  FOREIGN KEY (`idKH`) REFERENCES `KhachHang`(`idKH`),
  FOREIGN KEY (`idLoaiGH`) REFERENCES `LoaiGiaoHang`(`idLoaiGH`),
  FOREIGN KEY (`idMaGiam`) REFERENCES `MaGiamGia`(`idMaGiam`)
) ENGINE=InnoDB;

-- Table: HoaDonBanHang
CREATE TABLE `HoaDonBanHang` (
  `idHDBH` int(11) NOT NULL PRIMARY KEY,
  `ngayTao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `thanhToan` int(11) NOT NULL,
  `idPhieuGH` int(11) NOT NULL,
  `idNV` bigint(20) NOT NULL,
  `idGio` int(11) NOT NULL,
  FOREIGN KEY (`idNV`) REFERENCES `NhanVien`(`idNV`),
  FOREIGN KEY (`idGio`) REFERENCES `GioHang`(`idGio`)
) ENGINE=InnoDB;

-- Table: ChiTietHoaDon
CREATE TABLE `ChiTietHoaDon` (
  `idSP` int(11) NOT NULL,
  `soLuongBan` int(11) NOT NULL,
  `donGia` int(11) NOT NULL,
  `idHDBH` int(11) NOT NULL,
  FOREIGN KEY (`idSP`) REFERENCES `SanPham`(`idSP`),
  FOREIGN KEY (`idHDBH`) REFERENCES `HoaDonBanHang`(`idHDBH`)
) ENGINE=InnoDB;

-- Table: DanhGiaSP
CREATE TABLE `DanhGiaSP` (
  `idDanhGia` int(11) NOT NULL PRIMARY KEY,
  `review` varchar(300) NOT NULL,
  `rating` int(11) NOT NULL,
  `idKH` bigint(20) NOT NULL,
  `idSP` int(11) NOT NULL,
  FOREIGN KEY (`idKH`) REFERENCES `KhachHang`(`idKH`),
  FOREIGN KEY (`idSP`) REFERENCES `SanPham`(`idSP`)
) ENGINE=InnoDB;

-- Table: HoaDonNhap
CREATE TABLE `HoaDonNhap` (
  `idHDN` int(11) NOT NULL PRIMARY KEY,
  `ngayLap` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idNV` bigint(20) NOT NULL,
  `idNCC` int(11) NOT NULL,
  FOREIGN KEY (`idNV`) REFERENCES `NhanVien`(`idNV`),
  FOREIGN KEY (`idNCC`) REFERENCES `NhaCungCap`(`idNCC`)
) ENGINE=InnoDB;

-- Table: ChiTietNhap
CREATE TABLE `ChiTietNhap` (
  `idHDN` int(11) NOT NULL,
  `idSP` int(11) NOT NULL,
  `SLNhap` int(11) NOT NULL,
  `donGia` int(11) NOT NULL,
  FOREIGN KEY (`idHDN`) REFERENCES `HoaDonNhap`(`idHDN`),
  FOREIGN KEY (`idSP`) REFERENCES `SanPham`(`idSP`)
) ENGINE=InnoDB;

-- Chèn dữ liệu mẫu (Ví dụ một số bảng chính)
INSERT INTO `Users` (`idUsers`, `userName`, `pass`, `email`, `tinhTrang`, `roles`, `ngayTao`) VALUES
(1, 'admin', 'admin123', 'admin@tech4future.vn', 'active', 'admin', '2026-03-12 20:46:01'),
(2, 'vendor01', 'vendor123', 'vendor@tech4future.vn', 'active', 'vendor', '2026-03-12 20:46:01'),
(3, 'khach1', 'khach123', 'khach1@gmail.com', 'active', 'user', '2026-03-12 20:46:01'),
(4, 'khach2', 'khach123', 'khach2@gmail.com', 'active', 'user', '2026-03-12 20:46:01');

INSERT INTO `LoaiSanPham` (`idCate`, `nameCate`) VALUES 
(1, 'CPU'), (2, 'RAM'), (3, 'Mainboard'), (4, 'VGA');

INSERT INTO `NhaSanXuat` (`idNSX`, `tenNSX`, `diaChi`, `SDT`) VALUES 
(1, 'Intel', 'USA', '1800123456'), (2, 'ASUS', 'Taiwan', '1800987654');

INSERT INTO `NhaCungCap` (`idNCC`, `tenNCC`, `diaChi`, `SDT`) VALUES 
(1, 'Intel Việt Nam', 'Hà Nội', '0241234567'), (2, 'ASUS Việt Nam', 'TP.HCM', '0289876543');

INSERT INTO `SanPham` (`idSP`, `tenSP`, `chiTietSP`, `gia`, `tinhTrang`, `hinhAnh`, `baoHanh`, `soLuong`, `idNSX`, `idNCC`, `idCate`) VALUES 
(1, 'Chuột Gaming Logitech G102', 'Chuột gaming DPI cao', 350000, 'Còn hàng', 'assets/images/g102.jpg', '24 tháng', 80, 2, 2, 1);
