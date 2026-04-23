<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Tra Cứu Bảo Hành - Tech4Future</title>
  <link rel="stylesheet" href="#"/>
  <link rel="stylesheet" href="../assets/css/style.css">           <!-- CSS chung toàn web -->
  <link rel="stylesheet" href="../assets/css/trabaohanh.css"> <!-- CSS riêng cho trang này -->
</head>
<body>

  <!-- Top bar -->
  <div class="top-bar">
    <div>
      <a href="#">Hotline: 0832108179</a> |
      <a href="#">Đơn hàng</a> |
      <a href="#">Giỏ hàng</a> |
      <a href="auth/login_full.php">Đăng nhập</a> |
      <a href="auth/register_full.php">Đăng ký</a>
    </div>
  </div>

  <!-- Header -->
  <header>
    <div class="main-header">
      <a href="../index.php" class="logo">Tech4Future 🖥️</a>
      
      <div class="search-bar">
        <input type="text" placeholder="Bạn cần tìm gì? Laptop gaming, PC build, VGA, RAM...">
      </div>

      <div class="icons">
        <a href="#" class="cart"><i class="fas fa-shopping-cart"></i></a>
        <a href="#"><i class="fas fa-user"></i></a>
      </div>
    </div>

    <div class="nav-cat">
      <div class="nav-cat-inner">
        <a href="#">Xây dựng cấu hình</a>
        <a href="#">Hot deal</a>
        <a href="#">Thu cũ đổi mới</a>
        <a href="tra-cuu-bao-hanh.php">Tra cứu bảo hành</a>
      </div>
    </div>
  </header>

  <div class="container">
    <!-- Sidebar -->
    <aside>
      <h3>Danh mục sản phẩm</h3>
      <ul class="cat-list">
        <li><a href="pages/laptop.php"><i class="fas fa-laptop"></i> Laptop</a></li>
        <li><a href="pages/pc.php"><i class="fas fa-desktop"></i> PC</a></li>
        <li><a href="#"><i class="fas fa-hdd"></i> Ổ cứng, RAM, thẻ nhớ</a></li>
        <li><a href="#"><i class="fas fa-microchip"></i> Case, nguồn, tản nhiệt</a></li>
        <li><a href="#"><i class="fas fa-volume-up"></i> Loa, micro, webcam</a></li>
        <li><a href="#"><i class="fas fa-tv"></i> Màn hình</a></li>
        <li><a href="#"><i class="fas fa-keyboard"></i> Bàn phím</a></li>
        <li><a href="#"><i class="fas fa-mouse-pointer"></i> Chuột + lót chuột</a></li>
        <li><a href="#"><i class="fas fa-headphones"></i> Tai nghe</a></li>
        <li><a href="#"><i class="fas fa-microchip"></i> Main, CPU, VGA</a></li>
      </ul>
    </aside>

    <!-- Nội dung chính -->
    <main>
      <div class="warranty-banner">
        <h1>Tra Cứu Bảo Hành</h1>
        <p>Kiểm tra trạng thái bảo hành sản phẩm nhanh chóng và dễ dàng</p>
      </div>

      <div class="warranty-form-container">
        <h2>Tra cứu bằng Phiếu bảo hành</h2>
        <p class="note-text">Quý khách vui lòng nhập đầy đủ thông tin bên dưới để tra cứu.</p>

        <form class="warranty-form">
          <div class="form-row">
            <div class="form-group">
              <label for="phone-phieu">Số điện thoại <span style="color: red;">*</span></label>
              <input type="tel" id="phone-phieu" placeholder="Nhập số điện thoại" required>
            </div>

            <div class="form-group">
              <label for="maPhieu">Mã phiếu bảo hành <span style="color: red;">*</span></label>
              <input type="text" id="maPhieu" placeholder="Nhập mã phiếu bảo hành" required>
            </div>
          </div>

          <button type="submit" class="submit-btn">Tra cứu Phiếu</button>
        </form>

        <hr style="margin: 60px 0; border-color: #eee;">

        <h2>Tra cứu bằng IMEI / Serial Number</h2>
        <p class="note-text">Quý khách vui lòng nhập đầy đủ thông tin bên dưới để tra cứu.</p>

        <form class="warranty-form">
          <div class="form-row">
            <div class="form-group">
              <label for="phone-imei">Số điện thoại <span style="color: red;">*</span></label>
              <input type="tel" id="phone-imei" placeholder="Nhập số điện thoại" required>
            </div>

            <div class="form-group">
              <label for="imei">IMEI / Serial Number <span style="color: red;">*</span></label>
              <input type="text" id="imei" placeholder="Nhập IMEI hoặc Serial Number" required>
            </div>
          </div>

          <button type="submit" class="submit-btn">Tra cứu IMEI</button>
        </form>

        <p class="note-text" style="margin-top: 40px;">Lưu ý: Hiện tại chức năng tra cứu chỉ hỗ trợ xem thông tin mẫu. Vui lòng liên hệ hotline để được hỗ trợ tra cứu chính xác.</p>
      </div>
    </main>
  </div>

  <!-- Footer -->
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
          <li><a href="gioi-thieu.html">Giới thiệu</a></li>
          <li><a href="#">Liên hệ</a></li>
        </ul>
      </div>
    </div>

    <div class="footer-bottom">
      © 2026 Tech4Future. All rights reserved. | Thiết kế bởi Tech4Future
    </div>
  </footer>

  <!-- Zalo float -->
  <a href="https://zalo.me/0832108179" target="_blank" class="zalo-float" title="Chat hỗ trợ qua Zalo">
    <img src="https://classic.vn/wp-content/uploads/2022/07/zalo-icon.png" alt="Zalo Support">
  </a>

</body>
</html>
