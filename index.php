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
  1 => 'products/products_detail.php?idSP=1',
  2 => 'products/products_detail.php?idSP=2',
  3 => 'products/products_detail.php?idSP=3',
  4 => 'products/products_detail.php?idSP=4',
];

function formatPriceVnd(int|float|null $price): string {
    if ($price === null) return '';
    return number_format((float)$price, 0, ',', '.') . 'đ';
}
?>






<?php
$basePath = '';
$showTopBar = true;
$showNavCat = true;
require __DIR__ . '/app/includes/header.php';
?>

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

      $detailUrl = $detailMap[(int)$p['idSP']] ?? ('products/products_detail.php?idSP=' . (int)$p['idSP']);
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

<?php
$showZaloFloat = true;
require __DIR__ . '/app/includes/footer.php';
?>

</body>
</html>



 