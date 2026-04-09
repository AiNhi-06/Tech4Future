USE [master]
GO
/****** Object:  Database [Tech_4_Future]    Script Date: 3/12/2026 9:31:18 PM ******/
CREATE DATABASE [Tech_4_Future]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tech_4_Future', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tech_4_Future.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tech_4_Future_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tech_4_Future_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tech_4_Future] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tech_4_Future].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tech_4_Future] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tech_4_Future] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tech_4_Future] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tech_4_Future] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tech_4_Future] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tech_4_Future] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Tech_4_Future] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tech_4_Future] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tech_4_Future] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tech_4_Future] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tech_4_Future] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tech_4_Future] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tech_4_Future] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tech_4_Future] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tech_4_Future] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tech_4_Future] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tech_4_Future] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tech_4_Future] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tech_4_Future] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tech_4_Future] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tech_4_Future] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tech_4_Future] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tech_4_Future] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tech_4_Future] SET  MULTI_USER 
GO
ALTER DATABASE [Tech_4_Future] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tech_4_Future] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tech_4_Future] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tech_4_Future] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tech_4_Future] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tech_4_Future] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tech_4_Future] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tech_4_Future] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tech_4_Future]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[idGio] [int] NOT NULL,
	[idSP] [int] NOT NULL,
	[ngayMua] [date] NOT NULL,
	[soLuong] [int] NOT NULL,
	[donGia] [int] NOT NULL,
	[tongTien] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[idSP] [int] NOT NULL,
	[soLuongBan] [int] NOT NULL,
	[donGia] [int] NOT NULL,
	[idHDBH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietKM]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKM](
	[idKM] [int] NULL,
	[ngayBatDau] [datetime] NOT NULL,
	[ngayKetThuc] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietNhap]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietNhap](
	[idHDN] [int] NOT NULL,
	[idSP] [int] NOT NULL,
	[SLNhap] [int] NOT NULL,
	[donGia] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaSP]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaSP](
	[idDanhGia] [int] NOT NULL,
	[review] [nvarchar](300) NOT NULL,
	[rating] [int] NOT NULL,
	[idKH] [bigint] NOT NULL,
	[idSP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[idGio] [int] NOT NULL,
	[tongTienTamTinh] [int] NOT NULL,
	[soTienGiam] [int] NOT NULL,
	[VAT] [float] NOT NULL,
	[idKH] [bigint] NOT NULL,
	[idLoaiGH] [int] NOT NULL,
	[idMaGiam] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idGio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBanHang]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBanHang](
	[idHDBH] [int] NOT NULL,
	[ngayTao] [datetime] NOT NULL,
	[thanhToan] [int] NOT NULL,
	[idPhieuGH] [int] NOT NULL,
	[idNV] [bigint] NOT NULL,
	[idGio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHDBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[idHDN] [int] NOT NULL,
	[ngayLap] [datetime] NOT NULL,
	[idNV] [bigint] NOT NULL,
	[idNCC] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[idKH] [bigint] NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](300) NOT NULL,
	[sdt] [char](10) NOT NULL,
	[idUsers] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[idKM] [int] NOT NULL,
	[idSP] [int] NOT NULL,
	[tiLeGiam] [float] NOT NULL,
	[tenCTKM] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiGiaoHang]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGiaoHang](
	[idLoaiGH] [int] NOT NULL,
	[tenLoaiGH] [nvarchar](30) NOT NULL,
	[donHangToiThieu] [int] NOT NULL,
	[phiGiaoHang] [int] NOT NULL,
	[DVVC] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLoaiGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[idCate] [int] NOT NULL,
	[nameCate] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaGiamGia](
	[idMaGiam] [int] NOT NULL,
	[tenMaGiam] [nvarchar](50) NOT NULL,
	[code] [char](10) NOT NULL,
	[soLuong] [int] NOT NULL,
	[ngayBatDau] [datetime] NOT NULL,
	[ngayKetThuc] [datetime] NOT NULL,
	[tiLeGiam] [float] NOT NULL,
	[idSP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMaGiam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[idNCC] [int] NOT NULL,
	[tenNCC] [nvarchar](50) NOT NULL,
	[diaChi] [nvarchar](300) NOT NULL,
	[SDT] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[idNV] [bigint] NOT NULL,
	[tenNV] [nvarchar](50) NOT NULL,
	[gioiTinh] [nvarchar](5) NOT NULL,
	[diaChi] [nvarchar](300) NOT NULL,
	[ngaySinh] [date] NOT NULL,
	[idUsers] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[idNSX] [int] NOT NULL,
	[tenNSX] [nvarchar](30) NOT NULL,
	[diaChi] [nvarchar](300) NOT NULL,
	[SDT] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuGiaoHang]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuGiaoHang](
	[idPhieuGH] [int] NOT NULL,
	[ngayGiao] [date] NOT NULL,
	[nvGiaoHang] [nvarchar](50) NOT NULL,
	[nguoiNhan] [nvarchar](50) NOT NULL,
	[sdtNhan] [char](10) NOT NULL,
	[diaChiNhan] [nvarchar](300) NOT NULL,
	[idHDBH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPhieuGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[idSP] [int] NOT NULL,
	[tenSP] [nvarchar](30) NOT NULL,
	[chiTietSP] [nvarchar](300) NOT NULL,
	[gia] [int] NOT NULL,
	[tinhTrang] [nvarchar](50) NOT NULL,
	[hinhAnh] [nvarchar](100) NOT NULL,
	[baoHanh] [nvarchar](50) NOT NULL,
	[giaKM] [int] NULL,
	[soLuong] [int] NOT NULL,
	[idNSX] [int] NOT NULL,
	[idNCC] [int] NOT NULL,
	[idCate] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/12/2026 9:31:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUsers] [bigint] NOT NULL,
	[userName] [varchar](50) NULL,
	[pass] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[tinhTrang] [varchar](10) NOT NULL,
	[roles] [varchar](10) NOT NULL,
	[ngayTao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietKM] ([idKM], [ngayBatDau], [ngayKetThuc]) VALUES (1, CAST(N'2025-03-01T00:00:00.000' AS DateTime), CAST(N'2025-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietKM] ([idKM], [ngayBatDau], [ngayKetThuc]) VALUES (2, CAST(N'2025-03-10T00:00:00.000' AS DateTime), CAST(N'2025-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ChiTietKM] ([idKM], [ngayBatDau], [ngayKetThuc]) VALUES (3, CAST(N'2025-02-20T00:00:00.000' AS DateTime), CAST(N'2025-03-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ChiTietNhap] ([idHDN], [idSP], [SLNhap], [donGia]) VALUES (1, 1, 50, 11800000)
INSERT [dbo].[ChiTietNhap] ([idHDN], [idSP], [SLNhap], [donGia]) VALUES (1, 2, 80, 6000000)
INSERT [dbo].[ChiTietNhap] ([idHDN], [idSP], [SLNhap], [donGia]) VALUES (2, 4, 30, 8200000)
INSERT [dbo].[ChiTietNhap] ([idHDN], [idSP], [SLNhap], [donGia]) VALUES (2, 5, 25, 23000000)
GO
INSERT [dbo].[DanhGiaSP] ([idDanhGia], [review], [rating], [idKH], [idSP]) VALUES (1, N'CPU i7-14700K c?c m?nh, choi game mu?t mà!', 5, 1, 1)
INSERT [dbo].[DanhGiaSP] ([idDanhGia], [review], [rating], [idKH], [idSP]) VALUES (2, N'VGA RTX 4070 Ti SUPER dáng ti?n nh?t phân khúc!', 5, 1, 5)
INSERT [dbo].[DanhGiaSP] ([idDanhGia], [review], [rating], [idKH], [idSP]) VALUES (3, N'Chu?t Logitech siêu nh?, r?t phù h?p game th?', 4, 2, 7)
GO
INSERT [dbo].[HoaDonNhap] ([idHDN], [ngayLap], [idNV], [idNCC]) VALUES (1, CAST(N'2025-02-20T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[HoaDonNhap] ([idHDN], [ngayLap], [idNV], [idNCC]) VALUES (2, CAST(N'2025-03-05T00:00:00.000' AS DateTime), 2, 2)
GO
INSERT [dbo].[KhachHang] ([idKH], [tenKH], [diaChi], [sdt], [idUsers]) VALUES (1, N'Lê Hoàng Nam', N'Qu?n Bình Th?nh, TP.HCM', N'0912345678', 3)
INSERT [dbo].[KhachHang] ([idKH], [tenKH], [diaChi], [sdt], [idUsers]) VALUES (2, N'Ph?m Th? Lan', N'Qu?n Th? Ð?c, TP.HCM', N'0987654321', 4)
GO
INSERT [dbo].[KhuyenMai] ([idKM], [idSP], [tiLeGiam], [tenCTKM]) VALUES (1, 5, 7, N'Gi?m m?nh VGA RTX 4070 Ti')
INSERT [dbo].[KhuyenMai] ([idKM], [idSP], [tiLeGiam], [tenCTKM]) VALUES (2, 9, 7, N'Gi?m giá màn hình LG UltraGear')
INSERT [dbo].[KhuyenMai] ([idKM], [idSP], [tiLeGiam], [tenCTKM]) VALUES (3, 12, 6.5, N'Khuy?n mãi Ryzen 7 7800X3D')
GO
INSERT [dbo].[LoaiGiaoHang] ([idLoaiGH], [tenLoaiGH], [donHangToiThieu], [phiGiaoHang], [DVVC]) VALUES (1, N'Giao hàng nhanh GHTK', 0, 30000, N'GHTK')
INSERT [dbo].[LoaiGiaoHang] ([idLoaiGH], [tenLoaiGH], [donHangToiThieu], [phiGiaoHang], [DVVC]) VALUES (2, N'GHN Express', 500000, 25000, N'GHN')
INSERT [dbo].[LoaiGiaoHang] ([idLoaiGH], [tenLoaiGH], [donHangToiThieu], [phiGiaoHang], [DVVC]) VALUES (3, N'Viettel Post', 1000000, 20000, N'Viettel Post')
GO
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (1, N'CPU')
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (2, N'RAM')
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (3, N'Mainboard')
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (4, N'VGA')
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (5, N'Case PC')
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (6, N'Chu?t')
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (7, N'Bàn phím')
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (8, N'Màn hình')
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (9, N'Laptop Gaming')
INSERT [dbo].[LoaiSanPham] ([idCate], [nameCate]) VALUES (10, N'SSD')
GO
INSERT [dbo].[NhaCungCap] ([idNCC], [tenNCC], [diaChi], [SDT]) VALUES (1, N'Intel Vi?t Nam', N'Hà N?i', N'0241234567')
INSERT [dbo].[NhaCungCap] ([idNCC], [tenNCC], [diaChi], [SDT]) VALUES (2, N'ASUS Vi?t Nam', N'TP.HCM', N'0289876543')
INSERT [dbo].[NhaCungCap] ([idNCC], [tenNCC], [diaChi], [SDT]) VALUES (3, N'Corsair Distribution', N'Bình Duong', N'0274382910')
INSERT [dbo].[NhaCungCap] ([idNCC], [tenNCC], [diaChi], [SDT]) VALUES (4, N'Logitech Vi?t Nam', N'TP.HCM', N'0287654321')
GO
INSERT [dbo].[NhanVien] ([idNV], [tenNV], [gioiTinh], [diaChi], [ngaySinh], [idUsers]) VALUES (1, N'Nguy?n Van An', N'Nam', N'Qu?n 1, TP.HCM', CAST(N'1995-05-20' AS Date), 1)
INSERT [dbo].[NhanVien] ([idNV], [tenNV], [gioiTinh], [diaChi], [ngaySinh], [idUsers]) VALUES (2, N'Tr?n Th? Bích', N'N?', N'Qu?n 7, TP.HCM', CAST(N'1998-08-15' AS Date), 2)
GO
INSERT [dbo].[NhaSanXuat] ([idNSX], [tenNSX], [diaChi], [SDT]) VALUES (1, N'Intel', N'M?', N'1800123456')
INSERT [dbo].[NhaSanXuat] ([idNSX], [tenNSX], [diaChi], [SDT]) VALUES (2, N'ASUS', N'Ðài Loan', N'1800987654')
INSERT [dbo].[NhaSanXuat] ([idNSX], [tenNSX], [diaChi], [SDT]) VALUES (3, N'Corsair', N'M?', N'1800555123')
INSERT [dbo].[NhaSanXuat] ([idNSX], [tenNSX], [diaChi], [SDT]) VALUES (4, N'Logitech', N'Th?y Si', N'1800666789')
INSERT [dbo].[NhaSanXuat] ([idNSX], [tenNSX], [diaChi], [SDT]) VALUES (5, N'NVIDIA', N'M?', N'1800777890')
GO
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (1, N'Chu?t Gaming Logitech G102', N'Chu?t gaming DPI cao', 350000, N'Còn hàng', N'images/sp001_logitech_g102.jpg', N'24 tháng', NULL, 80, 4, 4, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (2, N'Bàn phím co Redragon K552', N'Bàn phím co switch d?', 890000, N'Còn hàng', N'images/sp002_redragon_k552.jpg', N'24 tháng', NULL, 60, 2, 2, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (3, N'Tai nghe Logitech G331', N'Tai nghe gaming có mic', 750000, N'Còn hàng', N'images/sp003_logitech_g331.jpg', N'24 tháng', NULL, 70, 4, 4, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (4, N'Lót chu?t SteelSeries QcK', N'Lót chu?t c? l?n', 250000, N'Còn hàng', N'images/sp004_steelseries_qck.jpg', N'12 tháng', NULL, 100, 3, 3, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (5, N'Webcam Logitech C270', N'Webcam HD 720p', 650000, N'Còn hàng', N'images/sp005_logitech_c270.jpg', N'24 tháng', NULL, 50, 4, 4, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (6, N'PC Gaming i5 RTX 3060', N'PC choi game c?u hình cao', 22000000, N'Còn hàng', N'images/sp006_pc_gaming_i5_rtx3060.jpg', N'36 tháng', NULL, 15, 5, 2, 2)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (7, N'PC Van phòng i3', N'PC dùng cho van phòng', 9000000, N'Còn hàng', N'images/sp007_pc_van_phong_i3.jpg', N'36 tháng', NULL, 20, 5, 2, 2)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (8, N'PC Gaming Ryzen 7', N'PC choi game cao c?p', 28000000, N'Còn hàng', N'images/sp008_pc_gaming_ryzen7.jpg', N'36 tháng', NULL, 10, 5, 2, 2)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (9, N'PC Mini ITX', N'PC nh? g?n', 15000000, N'H?t hàng', N'images/sp009_pc_mini_itx.jpg', N'24 tháng', NULL, 0, 5, 2, 2)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (10, N'PC Streaming', N'PC livestream', 32000000, N'Còn hàng', N'images/sp010_pc_streaming.jpg', N'36 tháng', NULL, 8, 5, 2, 2)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (11, N'Màn hình LG 24MP400', N'Màn hình 24 inch IPS', 3200000, N'Còn hàng', N'images/sp011_lg_24mp400.jpg', N'24 tháng', NULL, 40, 5, 2, 3)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (12, N'Màn hình Samsung 27 inch', N'Màn hình cong 27 inch', 4500000, N'Còn hàng', N'images/sp012_samsung_27_inch.jpg', N'24 tháng', NULL, 35, 5, 2, 3)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (13, N'Màn hình Dell 22 inch', N'Màn hình van phòng', 2900000, N'Còn hàng', N'images/sp013_dell_22_inch.jpg', N'24 tháng', NULL, 50, 5, 2, 3)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (14, N'Màn hình Asus TUF', N'Màn hình gaming 165Hz', 6500000, N'Còn hàng', N'images/sp014_asus_tuf_monitor.jpg', N'36 tháng', NULL, 25, 2, 2, 3)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (15, N'Màn hình MSI 24 inch', N'Màn hình gaming', 5200000, N'H?t hàng', N'images/sp015_msi_24_inch.jpg', N'36 tháng', NULL, 0, 5, 2, 3)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (16, N'Laptop Dell Inspiron 15', N'Laptop h?c t?p', 14500000, N'Còn hàng', N'images/sp016_dell_inspiron15.jpg', N'24 tháng', NULL, 30, 5, 2, 4)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (17, N'Laptop HP Pavilion', N'Laptop van phòng', 16000000, N'Còn hàng', N'images/sp017_hp_pavilion.jpg', N'24 tháng', NULL, 25, 5, 2, 4)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (18, N'Laptop Asus TUF Gaming', N'Laptop gaming', 23000000, N'Còn hàng', N'images/sp018_asus_tuf_gaming.jpg', N'24 tháng', NULL, 20, 2, 2, 4)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (19, N'MacBook Air M1', N'Laptop Apple chip M1', 18500000, N'Còn hàng', N'images/sp019_macbook_air_m1.jpg', N'12 tháng', NULL, 15, 5, 2, 4)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (20, N'Laptop Lenovo ThinkPad', N'Laptop doanh nhân', 17000000, N'Còn hàng', N'images/sp020_lenovo_thinkpad.jpg', N'24 tháng', NULL, 18, 5, 2, 4)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (21, N'? c?ng SSD Samsung 970 EVO', N'SSD NVMe 1TB', 2800000, N'Còn hàng', N'images/sp021_ssd_samsung_970.jpg', N'60 tháng', NULL, 60, 1, 1, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (22, N'? c?ng HDD Seagate 2TB', N'HDD luu tr?', 1600000, N'Còn hàng', N'images/sp022_hdd_seagate_2tb.jpg', N'24 tháng', NULL, 70, 5, 2, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (23, N'RAM Corsair 16GB', N'RAM DDR4', 1200000, N'Còn hàng', N'images/sp023_ram_corsair_16gb.jpg', N'36 tháng', NULL, 90, 3, 3, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (24, N'CPU Intel Core i5', N'Vi x? lý Intel', 4200000, N'Còn hàng', N'images/sp024_cpu_intel_i5.jpg', N'36 tháng', NULL, 40, 1, 1, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (25, N'CPU AMD Ryzen 5', N'Vi x? lý AMD', 3900000, N'Còn hàng', N'images/sp025_cpu_amd_ryzen5.jpg', N'36 tháng', NULL, 45, 1, 1, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (26, N'Card d? h?a RTX 3060', N'VGA gaming', 8500000, N'Còn hàng', N'images/sp026_vga_rtx3060.jpg', N'36 tháng', NULL, 30, 5, 2, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (27, N'Mainboard Asus B560', N'Bo m?ch ch?', 2600000, N'Còn hàng', N'images/sp027_main_asus_b560.jpg', N'36 tháng', NULL, 35, 2, 2, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (28, N'Ngu?n Corsair 650W', N'Ngu?n máy tính', 1800000, N'Còn hàng', N'images/sp028_nguon_corsair_650w.jpg', N'60 tháng', NULL, 50, 3, 3, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (29, N'T?n nhi?t Cooler Master', N'T?n nhi?t khí', 900000, N'Còn hàng', N'images/sp029_tan_nhiet_cooler_master.jpg', N'24 tháng', NULL, 55, 5, 2, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (30, N'Case Xigmatek', N'V? máy tính', 1100000, N'Còn hàng', N'images/sp030_case_xigmatek.jpg', N'12 tháng', NULL, 40, 5, 2, 5)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (31, N'USB Kingston 64GB', N'USB luu tr?', 250000, N'Còn hàng', N'images/sp031_usb_kingston_64gb.jpg', N'12 tháng', NULL, 100, 5, 2, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (32, N'? c?ng di d?ng WD 1TB', N'HDD di d?ng', 1800000, N'Còn hàng', N'images/sp032_hdd_wd_1tb.jpg', N'24 tháng', NULL, 65, 5, 2, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (33, N'Router TP-Link', N'Thi?t b? m?ng', 950000, N'Còn hàng', N'images/sp033_router_tp_link.jpg', N'24 tháng', NULL, 45, 5, 2, 6)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (34, N'B? phát Wifi Asus', N'Wifi bang t?n kép', 2200000, N'Còn hàng', N'images/sp034_wifi_asus.jpg', N'36 tháng', NULL, 30, 2, 2, 6)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (35, N'Card m?ng PCIe', N'Card m?ng máy tính', 450000, N'Còn hàng', N'images/sp035_card_mang_pcie.jpg', N'12 tháng', NULL, 50, 1, 1, 6)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (36, N'Máy in HP Laser', N'Máy in laser', 3200000, N'Còn hàng', N'images/sp036_may_in_hp_laser.jpg', N'24 tháng', NULL, 25, 5, 2, 7)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (37, N'Máy scan Canon', N'Máy quét tài li?u', 2800000, N'Còn hàng', N'images/sp037_may_scan_canon.jpg', N'24 tháng', NULL, 20, 5, 2, 7)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (38, N'UPS Santak', N'B? luu di?n', 2100000, N'Còn hàng', N'images/sp038_ups_santak.jpg', N'24 tháng', NULL, 30, 5, 2, 8)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (39, N'Bàn laptop', N'Bàn làm vi?c laptop', 600000, N'Còn hàng', N'images/sp039_ban_laptop.jpg', N'12 tháng', NULL, 60, 5, 2, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (40, N'Ð? t?n nhi?t laptop', N'Ð? làm mát', 450000, N'Còn hàng', N'images/sp040_de_tan_nhiet_laptop.jpg', N'12 tháng', NULL, 70, 5, 2, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (41, N'Loa Logitech Z213', N'Loa máy tính', 850000, N'Còn hàng', N'images/sp041_loa_logitech_z213.jpg', N'24 tháng', NULL, 40, 4, 4, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (42, N'Micro thu âm Fifine', N'Micro USB', 1200000, N'Còn hàng', N'images/sp042_micro_fifine.jpg', N'24 tháng', NULL, 35, 5, 2, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (43, N'Camera an ninh Ezviz', N'Camera wifi', 950000, N'Còn hàng', N'images/sp043_camera_ezviz.jpg', N'24 tháng', NULL, 45, 5, 2, 10)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (44, N'Màn hình ph? 15 inch', N'Màn hình di d?ng', 4200000, N'Còn hàng', N'images/sp044_manhinh_phu_15inch.jpg', N'12 tháng', NULL, 25, 5, 2, 3)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (45, N'Laptop MSI Gaming', N'Laptop gaming cao c?p', 27000000, N'Còn hàng', N'images/sp045_laptop_msi_gaming.jpg', N'24 tháng', NULL, 12, 5, 2, 4)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (46, N'PC All In One HP', N'Máy tính AIO', 18500000, N'Còn hàng', N'images/sp046_pc_aio_hp.jpg', N'24 tháng', NULL, 10, 5, 2, 2)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (47, N'Mini PC Intel NUC', N'Máy tính mini', 12000000, N'Còn hàng', N'images/sp047_mini_pc_intel_nuc.jpg', N'24 tháng', NULL, 15, 1, 1, 9)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (48, N'Bàn phím không dây Logitech', N'Bàn phím wireless', 690000, N'Còn hàng', N'images/sp048_banphim_logitech_khongday.jpg', N'24 tháng', NULL, 50, 4, 4, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (49, N'Chu?t không dây Microsoft', N'Chu?t van phòng', 420000, N'Còn hàng', N'images/sp049_chuot_microsoft_khongday.jpg', N'12 tháng', NULL, 80, 5, 2, 1)
INSERT [dbo].[SanPham] ([idSP], [tenSP], [chiTietSP], [gia], [tinhTrang], [hinhAnh], [baoHanh], [giaKM], [soLuong], [idNSX], [idNCC], [idCate]) VALUES (50, N'Laptop Acer Aspire', N'Laptop ph? thông', 13500000, N'Còn hàng', N'images/sp050_laptop_acer_aspire.jpg', N'24 tháng', NULL, 25, 5, 2, 4)
GO
INSERT [dbo].[Users] ([idUsers], [userName], [pass], [email], [tinhTrang], [roles], [ngayTao]) VALUES (1, N'admin', N'admin123', N'admin@tech4future.vn', N'active', N'admin', CAST(N'2026-03-12T20:46:01.780' AS DateTime))
INSERT [dbo].[Users] ([idUsers], [userName], [pass], [email], [tinhTrang], [roles], [ngayTao]) VALUES (2, N'vendor01', N'vendor123', N'vendor@tech4future.vn', N'active', N'vendor', CAST(N'2026-03-12T20:46:01.780' AS DateTime))
INSERT [dbo].[Users] ([idUsers], [userName], [pass], [email], [tinhTrang], [roles], [ngayTao]) VALUES (3, N'khach1', N'khach123', N'khach1@gmail.com', N'active', N'user', CAST(N'2026-03-12T20:46:01.780' AS DateTime))
INSERT [dbo].[Users] ([idUsers], [userName], [pass], [email], [tinhTrang], [roles], [ngayTao]) VALUES (4, N'khach2', N'khach123', N'khach2@gmail.com', N'active', N'user', CAST(N'2026-03-12T20:46:01.780' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616448486AE6]    Script Date: 3/12/2026 9:31:18 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HoaDonBanHang] ADD  DEFAULT (getdate()) FOR [ngayTao]
GO
ALTER TABLE [dbo].[HoaDonNhap] ADD  DEFAULT (getdate()) FOR [ngayLap]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [userName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('active') FOR [tinhTrang]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('user') FOR [roles]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [ngayTao]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD FOREIGN KEY([idGio])
REFERENCES [dbo].[GioHang] ([idGio])
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD FOREIGN KEY([idSP])
REFERENCES [dbo].[SanPham] ([idSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([idHDBH])
REFERENCES [dbo].[HoaDonBanHang] ([idHDBH])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([idSP])
REFERENCES [dbo].[SanPham] ([idSP])
GO
ALTER TABLE [dbo].[ChiTietKM]  WITH CHECK ADD FOREIGN KEY([idKM])
REFERENCES [dbo].[KhuyenMai] ([idKM])
GO
ALTER TABLE [dbo].[ChiTietNhap]  WITH CHECK ADD FOREIGN KEY([idHDN])
REFERENCES [dbo].[HoaDonNhap] ([idHDN])
GO
ALTER TABLE [dbo].[ChiTietNhap]  WITH CHECK ADD FOREIGN KEY([idSP])
REFERENCES [dbo].[SanPham] ([idSP])
GO
ALTER TABLE [dbo].[DanhGiaSP]  WITH CHECK ADD FOREIGN KEY([idKH])
REFERENCES [dbo].[KhachHang] ([idKH])
GO
ALTER TABLE [dbo].[DanhGiaSP]  WITH CHECK ADD FOREIGN KEY([idSP])
REFERENCES [dbo].[SanPham] ([idSP])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([idKH])
REFERENCES [dbo].[KhachHang] ([idKH])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([idLoaiGH])
REFERENCES [dbo].[LoaiGiaoHang] ([idLoaiGH])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([idMaGiam])
REFERENCES [dbo].[MaGiamGia] ([idMaGiam])
GO
ALTER TABLE [dbo].[HoaDonBanHang]  WITH CHECK ADD FOREIGN KEY([idGio])
REFERENCES [dbo].[GioHang] ([idGio])
GO
ALTER TABLE [dbo].[HoaDonBanHang]  WITH CHECK ADD FOREIGN KEY([idNV])
REFERENCES [dbo].[NhanVien] ([idNV])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([idNCC])
REFERENCES [dbo].[NhaCungCap] ([idNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([idNV])
REFERENCES [dbo].[NhanVien] ([idNV])
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD FOREIGN KEY([idUsers])
REFERENCES [dbo].[Users] ([idUsers])
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD FOREIGN KEY([idSP])
REFERENCES [dbo].[SanPham] ([idSP])
GO
ALTER TABLE [dbo].[MaGiamGia]  WITH CHECK ADD FOREIGN KEY([idSP])
REFERENCES [dbo].[SanPham] ([idSP])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([idUsers])
REFERENCES [dbo].[Users] ([idUsers])
GO
ALTER TABLE [dbo].[PhieuGiaoHang]  WITH CHECK ADD FOREIGN KEY([idHDBH])
REFERENCES [dbo].[HoaDonBanHang] ([idHDBH])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([idCate])
REFERENCES [dbo].[LoaiSanPham] ([idCate])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([idNCC])
REFERENCES [dbo].[NhaCungCap] ([idNCC])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([idNSX])
REFERENCES [dbo].[NhaSanXuat] ([idNSX])
GO
ALTER TABLE [dbo].[DanhGiaSP]  WITH CHECK ADD CHECK  (([idDanhGia]>=(0)))
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD CHECK  (([idGio]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonBanHang]  WITH CHECK ADD CHECK  (([idHDBH]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD CHECK  (([idHDN]>=(0)))
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD CHECK  (([idKH]>=(0)))
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD CHECK  (([idKM]>=(0)))
GO
ALTER TABLE [dbo].[LoaiGiaoHang]  WITH CHECK ADD CHECK  (([idLoaiGH]>=(0)))
GO
ALTER TABLE [dbo].[LoaiSanPham]  WITH CHECK ADD CHECK  (([idCate]>=(0)))
GO
ALTER TABLE [dbo].[MaGiamGia]  WITH CHECK ADD CHECK  (([idMaGiam]>=(0)))
GO
ALTER TABLE [dbo].[NhaCungCap]  WITH CHECK ADD CHECK  (([idNCC]>=(0)))
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD CHECK  (([idNV]>=(0)))
GO
ALTER TABLE [dbo].[NhaSanXuat]  WITH CHECK ADD CHECK  (([idNSX]>=(0)))
GO
ALTER TABLE [dbo].[PhieuGiaoHang]  WITH CHECK ADD CHECK  (([idPhieuGH]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([idSP]>=(0)))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([idUsers]>=(0)))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([roles]='user' OR [roles]='vendor' OR [roles]='admin'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([tinhTrang]='inactive' OR [tinhTrang]='active'))
GO
USE [master]
GO
ALTER DATABASE [Tech_4_Future] SET  READ_WRITE 
GO
