<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Tài khoản - Tech4Future</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/profile.css">
</head>
<body>

  <header>
    <div class="main-header">
      <a href="../index.php" class="logo">Tech4Future 🖥️</a>
      
      <div class="search-bar">
        <input type="text" placeholder="Bạn cần tìm gì? Laptop gaming, PC build, VGA, RAM...">
      </div><

      <div class="icons">
        <a href="../pages/cart.php" class="cart"><i class="fas fa-shopping-cart"></i></a>
        <a href="../pages/profile.php"><i class="fas fa-user"></i></a>
      </div>
    </div>

    <div class="nav-cat">
      <div class="nav-cat-inner">
        <a href="#">Xây dựng cấu hình</a>
        <a href="#">Hot deal</a>
        <a href="#">Thu cũ đổi mới</a>
        <a href="../pages/trabaohanh.php">Tra cứu bảo hành</a>
      </div>
    </div>
  </header>

  <!-- Nội dung chính -->
  <div class="main-wrapper">
    <div class="content-container">
      <!-- Sidebar trái -->
      <aside class="sidebar">
        <div class="user-profile">
          <div class="avatar"><i class="fas fa-user"></i></div>
          <div class="username">Ái Nhi</div>
        </div>

        <ul class="menu-list">
          <li class="menu-item"><a href="#" class="active"><i class="fas fa-user-circle"></i> Thông tin tài khoản</a></li>
          <li class="menu-item"><a href="#"><i class="fas fa-shopping-bag"></i> Quản lý đơn hàng</a></li>
          <li class="menu-item"><a href="#"><i class="fas fa-lock"></i> Thay đổi mật khẩu</a></li>
          <li class="menu-item logout"><a href="#"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
        </ul>
      </aside>

      <!-- Nội dung chính -->
      <main class="main-content">
        <div class="breadcrumb">
          <a href="/">Trang chủ</a> > Tài khoản
        </div>

        <div class="welcome-box">
          <div class="welcome-icon"><i class="fas fa-user-shield"></i></div>
          <h2 class="welcome-title">Xin chào, Ái Nhi!</h2>
          <p class="welcome-text">
            Bạn đang ở trang tài khoản cá nhân. Vui lòng chọn một mục ở menu bên trái để xem hoặc chỉnh sửa thông tin.
          </p>
          <a href="#" class="btn">Xem đơn hàng gần nhất</a>
        </div>
      </main>
    </div>
  </div>

  <!-- Footer chung (dùng cho mọi trang) -->
  <footer class="site-footer">
    <div class="footer-container">
      <div class="footer-col">
        <h4>Tech4Future</h4>
        <p>Chuyên linh kiện máy tính, PC Gaming, Workstation cao cấp.</p>
        <p><i class="fas fa-map-marker-alt"></i> Quy Nhơn, Bình Định</p>
        <p><i class="fas fa-phone"></i> 0986.552.233</p>
        <p><i class="fas fa-envelope"></i> contact@tech4future.vn</p>
      </div>

      <div class="footer-col">
        <h4>Hỗ trợ khách hàng</h4>
        <ul>
          <li><a href="#">Hướng dẫn mua hàng</a></li>
          <li><a href="#">Chính sách đổi trả</a></li>
          <li><a href="#">Chính sách bảo hành</a></li>
          <li><a href="#">Phương thức thanh toán</a></li>
          <li><a href="#">Vận chuyển & Giao hàng</a></li>
        </ul>
      </div>

      <div class="footer-col">
        <h4>Về chúng tôi</h4>
        <ul>
          <li><a href="#">Giới thiệu</a></li>
          <li><a href="#">Liên hệ</a></li>
        </ul>
      </div>
    </div>

    <div class="footer-bottom">
      © 2026 Tech4Future. All rights reserved. | Thiết kế bởi [Teach4Future]
    </div>
  </footer>

</body>
</html>
