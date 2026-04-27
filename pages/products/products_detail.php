<?php

declare(strict_types=1);

require_once __DIR__ . '/../../app/config/config.php';

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
    $img = '../../assets/images/products/no-image.png';
} elseif (str_starts_with($img, 'assets/')) {
    $img = '../../' . ltrim($img, '/');
} elseif (!preg_match('/^https?:\/\//i', $img) && !str_starts_with($img, '../../assets/')) {
    $img = '../../assets/images/products/' . ltrim($img, '/');
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
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link rel="stylesheet" href="../../assets/css/products.css">
</head>

<body>
<?php
$basePath = '../../';
$showTopBar = true;
$showNavCat = true;
require __DIR__ . '/../../app/includes/header.php';
?>

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
                <a href="../thanh-toan.php">
                    <button class="buy-btn">Mua ngay</button>
                </a>
                <a href="../cart.php">
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
<?php
$showZaloFloat = false;
require __DIR__ . '/../../app/includes/footer.php';
?>
</body>

</html>