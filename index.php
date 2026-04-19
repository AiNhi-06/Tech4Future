<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Tech4Future - Laptop, PC Gaming, Phụ Kiện Chính Hãng</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<?php
require_once __DIR__ . '/app/config/config.php';
$sql = "
    SELECT idSP, tenSP, gia, giaKM, hinhAnh
    FROM SanPham
    ORDER BY idSP DESC
    LIMIT 8
";
$stmt = $pdo->query($sql);
$products = $stmt->fetchAll();

$detailMap = [
    1 => 'products/Sager.html',
    2 => 'products/alienware.html',
    3 => 'products/futuristic.html',
    4 => 'products/PC_Gaming.html',
];

function formatPriceVnd(int|float|null $price): string {
    if ($price === null) return '';
    return number_format((float)$price, 0, ',', '.') . 'đ';
}
?>






<!--Dong nay de test github-->
  <!-- Top bar -->
  <div class="top-bar">
    <div>Khuyến Mãi Sập WEB - Giảm đến 99% Mọi Sản Phẩm 🔥</div>
    <div>
      <a href="#">Hotline: 0832108179</a> |
      <a href="pages/donhang.html">Đơn hàng</a> |
      <a href="#">Giỏ hàng</a> |
      <a href="auth/login_full.html">Đăng nhập</a> |
      <a href="auth/register_full.html">Đăng ký</a>
    </div>
  </div>

  <!-- Header -->
  <header>
    <div class="main-header">
      <a href="../index.html" class="logo">Tech4Future 🖥️</a>
      
      <div class="search-bar">
        <input type="text" placeholder="Bạn cần tìm gì? Laptop gaming, PC build, VGA, RAM...">
      </div><

      <div class="icons">
        <a href="pages/cart.html" class="cart"><i class="fas fa-shopping-cart"></i></a>
        <a href="pages/profile.html"><i class="fas fa-user"></i></a>
      </div>
    </div>

    <div class="nav-cat">
      <div class="nav-cat-inner">
        <a href="#">Xây dựng cấu hình</a>
        <a href="#">Hot deal</a>
        <a href="#">Thu cũ đổi mới</a>
        <a href="pages/trabaohanh.html">Tra cứu bảo hành</a>
      </div>
    </div>
  </header>

  <div class="container">
    <!-- Sidebar -->
    <aside>
      <h3>Danh mục sản phẩm</h3>
      <ul class="cat-list">
        <li><a href="pages/laptop.html"><i class="fas fa-laptop"></i> Laptop</a></li>
        <li><a href="pages/pc.html"><i class="fas fa-desktop"></i> PC</a></li>
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

    <!-- Main content -->
    <main>
      <div class="banner">
        <h1>🔥 ƯU ĐÃI SẬP SÀN - GIẢM ĐẾN 99% 🔥</h1>
        <p>Laptop Gaming, PC Build RGB Cao Cấp, Phụ Kiện Chính Hãng - Giá Sốc Chỉ Có Tại Tech4Future!</p>
      </div>

      <h2 style="text-align:center; color:var(--primary-dark); margin:30px 0;">Hot Deal - Sản phẩm đang giảm giá mạnh</h2>
      <div class="hot-deals">

    <?php foreach ($products as $p): ?>
<?php
$name = $p['tenSP'] ?? 'San pham';
$gia = isset($p['gia']) ? (float)$p['gia'] : 0;
$giaKm = isset($p['giaKM']) && $p['giaKM'] !== null ? (float)$p['giaKM'] : null;
      $img = trim((string)($p['hinhAnh'] ?? ''));
      if ($img === '') {
          $img = 'assets/images/products/no-image.png';
      } elseif (!preg_match('/^https?:\/\//i', $img) && !str_starts_with($img, 'assets/')) {
          $img = 'assets/images/products/' . ltrim($img, '/');
      }

      $detailUrl = $detailMap[(int)$p['idSP']] ?? '#';
    ?>

    <a href="<?= htmlspecialchars($detailUrl) ?>" class="product-card-link">
      <div class="product-card">
        <img src="<?= htmlspecialchars($img) ?>" alt="<?= htmlspecialchars($name) ?>">
        <div class="product-info">
          <h4><?= htmlspecialchars($name) ?></h4>

          <?php if ($giaKm !== null): ?>
            <div><span class="old-price"><?= htmlspecialchars(formatPriceVnd($gia)) ?></span></div>
            <div class="price"><?= htmlspecialchars(formatPriceVnd($giaKm)) ?></div>
          <?php else: ?>
            <div class="price"><?= htmlspecialchars(formatPriceVnd($gia)) ?></div>
          <?php endif; ?>

          <div class="product-buttons">
            <button class="btn btn-add-to-cart"><i class="fas fa-cart-plus"></i> Thêm vào giỏ</button>
            <button class="btn btn-detail">Chi tiết</button>
          </div>
        </div>
      </div>
    </a>
  <?php endforeach; ?>

      </div>
    </main>
  </div>

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
      © 2026 Tech4Future. All rights reserved. | Thiết kế bởi Tech4Future
    </div>
  </footer>

  <!-- Floating Zalo Chat Button -->
  <a href="https://zalo.me/0832108179" target="_blank" class="zalo-float" title="Chat hỗ trợ qua Zalo">
    <img src="https://classic.vn/wp-content/uploads/2022/07/zalo-icon.png" alt="Zalo Support">
  </a>

</body>
</html>
<<<<<<< HEAD:index.php
=======

//van tai test  
//Hello World
>>>>>>> cdc70d77d4ea2eeeacda20d4ac9c676e2ed3e8ec:index.html



