<?php

declare(strict_types=1);

require_once __DIR__ . '/../app/config/config.php';

function formatPriceVnd(int|float|null $price): string
{
    if ($price === null) {
        return '';
    }
    return number_format((float)$price, 0, ',', '.') . 'đ';
}

$idSp = filter_input(INPUT_GET, 'idSP', FILTER_VALIDATE_INT);
if (!$idSp || $idSp < 1) {
    $idSp = 1;
}

$productStmt = $pdo->prepare('SELECT idSP, tenSP, chiTietSP, gia, giaKM, hinhAnh FROM SanPham WHERE idSP = :idSP LIMIT 1');
$productStmt->execute([':idSP' => $idSp]);
$product = $productStmt->fetch();

if (!$product) {
    http_response_code(404);
    exit('Khong tim thay san pham.');
}

$specStmt = $pdo->prepare('SELECT tenThongSo, giaTri FROM thongso WHERE idSP = :idSP ORDER BY id ASC');
$specStmt->execute([':idSP' => (int)$product['idSP']]);
$specs = $specStmt->fetchAll();

$img = trim((string)($product['hinhAnh'] ?? ''));
if ($img === '') {
    $img = '../assets/images/products/no-image.png';
} elseif (!preg_match('/^https?:\/\//i', $img) && !str_starts_with($img, '../assets/')) {
    $img = '../assets/images/products/' . ltrim($img, '/');
}

$gia = isset($product['gia']) ? (float)$product['gia'] : 0;
$giaKm = isset($product['giaKM']) && $product['giaKM'] !== null ? (float)$product['giaKM'] : null;
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars((string)$product['tenSP']) ?> - Tech4Future</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/products.css">
</head>

<body>

    <header>
        <div class="main-header">
            <a href="../index.php" class="logo">Tech4Future 🖥️</a>

            <div class="search-bar">
                <input type="text" placeholder="Bạn cần tìm gì? Laptop gaming, PC build, VGA, RAM...">
            </div>

            <div class="icons">
                <a href="../pages/cart.php" class="cart"><i class="fas fa-shopping-cart"></i></a>
                <a href="../pages/profile.php"><i class="fas fa-user"></i></a>
            </div>
        </div>
    </header>

    <div class="container">

        <div class="product">

            <div class="product-image">
                <img src="<?= htmlspecialchars($img) ?>" alt="<?= htmlspecialchars((string)$product['tenSP']) ?>">
            </div>

            <div class="product-info">

                <div class="product-name">
                    <?= htmlspecialchars((string)$product['tenSP']) ?>
                </div>

                <div class="price">
                    <?php if ($giaKm !== null): ?>
                        <span style="text-decoration: line-through; color: #777; font-size: 18px; margin-right: 8px;"><?= htmlspecialchars(formatPriceVnd($gia)) ?></span>
                        <span><?= htmlspecialchars(formatPriceVnd($giaKm)) ?></span>
                    <?php else: ?>
                        <span><?= htmlspecialchars(formatPriceVnd($gia)) ?></span>
                    <?php endif; ?>
                </div>

                <p>
                    <?= htmlspecialchars((string)($product['chiTietSP'] ?? '')) ?>
                </p>
                <a href="../pages/thanh-toan.html">
                    <button class="buy-btn">Mua ngay</button>
                </a>
                <a href="../pages/cart.php">
                    <button class="btn-cart">Thêm vào giỏ hàng</button>
                </a>
            </div>
        </div>

        <div class="spec">

            <h2>Thông số kỹ thuật</h2>

            <table>
                <?php if ($specs): ?>
                    <?php foreach ($specs as $row): ?>
                        <tr>
                            <td><?= htmlspecialchars((string)($row['tenThongSo'] ?? '')) ?></td>
                            <td><?= htmlspecialchars((string)($row['giaTri'] ?? '')) ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="2">Chưa có dữ liệu thông số cho sản phẩm này.</td>
                    </tr>
                <?php endif; ?>
            </table>

        </div>

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
</body>

</html>