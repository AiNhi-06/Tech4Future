<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Đơn Hàng Của Tôi - Tech4Future</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <link rel="stylesheet" href="../css/style.css">          <!-- CSS chung toàn web -->
  <link rel="stylesheet" href="../css/donhang.css">       <!-- CSS riêng cho trang này -->
</head>
<body>

  <!-- Header -->
  <header>
    <div class="main-header">
      <a href="../index.html" class="logo">Tech4Future 🖥️</a>
      
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
        <a href="tra-cuu-bao-hanh.html">Tra cứu bảo hành</a>
        <a href="don-hang.html">Đơn hàng</a>
      </div>
    </div>
  </header>

  <!-- Nội dung chính -->
  <main class="main-content">
    <div class="order-banner">
      <h1>Đơn Hàng Của Tôi</h1>
      <p>Quản lý và theo dõi tất cả đơn hàng bạn đã đặt tại Tech4Future</p>
    </div>

    <div class="orders-list-container">
      <h2>Danh sách đơn hàng</h2>

      <!-- Đơn hàng 1 -->
      <div class="order-item">
        <div class="order-image">
          <img src="https://images.unsplash.com/photo-1611078489935-0cb4c2497a00?auto=format&fit=crop&w=800&q=80" alt="Laptop Gaming SAGER">
        </div>
        <div class="order-content">
          <div class="order-header">
            <div class="order-info">
              <strong>Mã đơn hàng:</strong> DH20251234
              <span class="order-date">Ngày đặt: 05/03/2026</span>
            </div>
            <span class="order-status status-delivered">Đã giao hàng</span>
          </div>
          <div class="order-body">
            <p><strong>Sản phẩm:</strong> Laptop Gaming SAGER NP9560R + Phụ kiện gaming</p>
            <p><strong>Tổng tiền:</strong> <span class="price">42.980.000đ</span></p>
          </div>
          <div class="order-actions">
            <a href="#" class="btn-detail">Xem chi tiết</a>
            <a href="#" class="btn-invoice">Xem hóa đơn</a>
          </div>
        </div>
      </div>

      <!-- Đơn hàng 2 -->
      <div class="order-item">
        <div class="order-image">
          <img src="https://i.ytimg.com/vi/aJdxla_t1h0/maxresdefault.jpg" alt="PC RGB Build">
        </div>
        <div class="order-content">
          <div class="order-header">
            <div class="order-info">
              <strong>Mã đơn hàng:</strong> DH20259876
              <span class="order-date">Ngày đặt: 28/02/2026</span>
            </div>
            <span class="order-status status-shipping">Đang vận chuyển</span>
          </div>
          <div class="order-body">
            <p><strong>Sản phẩm:</strong> PC Gaming RGB Ryzen 7 + RTX 4080 Custom Build</p>
            <p><strong>Tổng tiền:</strong> <span class="price">41.500.000đ</span></p>
          </div>
          <div class="order-actions">
            <a href="#" class="btn-detail">Xem chi tiết</a>
            <a href="#" class="btn-invoice">Xem hóa đơn</a>
          </div>
        </div>
      </div>

      <!-- Đơn hàng 3 -->
      <div class="order-item">
        <div class="order-image">
          <img src="https://us.maxgaming.com/img/bilder/artiklar/1001028.jpg?m=1598958590&w=720" alt="Tai nghe Logitech">
        </div>
        <div class="order-content">
          <div class="order-header">
            <div class="order-info">
              <strong>Mã đơn hàng:</strong> DH20254567
              <span class="order-date">Ngày đặt: 10/02/2026</span>
            </div>
            <span class="order-status status-processing">Đang xử lý</span>
          </div>
          <div class="order-body">
            <p><strong>Sản phẩm:</strong> Tai nghe Logitech G733 Lightspeed Wireless + Chuột Gaming</p>
            <p><strong>Tổng tiền:</strong> <span class="price">2.890.000đ</span></p>
          </div>
          <div class="order-actions">
            <a href="#" class="btn-detail">Xem chi tiết</a>
            <a href="#" class="btn-invoice">Xem hóa đơn</a>
          </div>
        </div>
      </div>

      <!-- Đơn hàng 4 -->
      <div class="order-item">
        <div class="order-image">
          <img src="https://cdn.mos.cms.futurecdn.net/SvSFhmZrWHMoyYzFj8oZdf-1200-80.jpg" alt="Màn hình Alienware">
        </div>
        <div class="order-content">
          <div class="order-header">
            <div class="order-info">
              <strong>Mã đơn hàng:</strong> DH20251234
              <span class="order-date">Ngày đặt: 15/01/2026</span>
            </div>
            <span class="order-status status-cancelled">Đã hủy</span>
          </div>
          <div class="order-body">
            <p><strong>Sản phẩm:</strong> Màn hình Alienware AW3821DW Ultrawide Curved</p>
            <p><strong>Tổng tiền:</strong> <span class="price">4.190.000đ</span></p>
          </div>
          <div class="order-actions">
            <a href="#" class="btn-detail">Xem chi tiết</a>
            <a href="#" class="btn-invoice">Xem hóa đơn</a>
          </div>
        </div>
      </div>

      <p class="note-text" style="text-align: center; margin-top: 50px;">
        Nếu bạn không thấy đơn hàng nào, vui lòng kiểm tra lại hoặc liên hệ hotline để được hỗ trợ.
      </p>
    </div>
  </main>

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