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
// Gọi file cấu hình kết nối database
require_once __DIR__ . '/app/config/config.php';

// ===== PHẦN 1: TÍNH TOÁN PHÂN TRANG =====
// Số sản phẩm hiển thị trên 1 trang
$perPage = 9;

// Đếm tổng số sản phẩm trong database
// COUNT(*) trả về số lượng bản ghi, fetchColumn() lấy giá trị đó
$totalProducts = (int)$pdo->query("SELECT COUNT(*) FROM SanPham")->fetchColumn();

// Tính tổng số trang: chia tổng sản phẩm cho sản phẩm/trang rồi làm tròn lên
// Ví dụ: 25 sản phẩm / 9 = 2.78 → ceil() = 3 trang
// max(1, ...) đảm bảo luôn có tối thiểu 1 trang
$totalPages = max(1, (int)ceil($totalProducts / $perPage));

// ===== PHẦN 2: LẤY VÀ KIỂM TRA SỐ TRANG TỪ URL =====
// filter_input(): lấy giá trị từ URL query string (?page=2)
// FILTER_VALIDATE_INT: chỉ chấp nhận số nguyên
// default: 1 nếu không có parameter "page" trong URL
// min_range: 1 = trang tối thiểu là trang 1 (không cho trang 0 hay âm)
$page = filter_input(
  INPUT_GET,
  'page',
  FILTER_VALIDATE_INT,
  ['options' => ['default' => 1, 'min_range' => 1]]
);

// Nếu người dùng nhập trang > tổng số trang, đưa về trang cuối cùng
// Ví dụ: nếu có 3 trang, nhưng URL yêu cầu ?page=10 → sẽ về page=3
$page = min($page, $totalPages);

// ===== PHẦN 3: TÍNH TOÁN OFFSET (BỎ QUA BAO NHIÊU DÒNG) =====
// offset = (trang hiện tại - 1) × sản phẩm/trang
// Trang 1: offset = (1-1) × 9 = 0 (lấy từ sản phẩm 0)
// Trang 2: offset = (2-1) × 9 = 9 (lấy từ sản phẩm 9, bỏ qua 0-8)
// Trang 3: offset = (3-1) × 9 = 18 (lấy từ sản phẩm 18, bỏ qua 0-17)
$offset = ($page - 1) * $perPage;

// ===== PHẦN 4: TRUY VẤN DATABASE LẤY SẢN PHẨM THEO TRANG =====
// SELECT: lấy các cột (id sản phẩm, tên, giá gốc, giá khuyến mại, ảnh)
// ORDER BY idSP DESC: sắp xếp giảm dần theo ID (sản phẩm mới nhất trước)
// LIMIT :limit: lấy tối đa bao nhiêu dòng (9 sản phẩm/trang)
// OFFSET :offset: bỏ qua bao nhiêu dòng từ đầu (phụ thuộc trang)
$sql = "
    SELECT idSP, tenSP, gia, giaKM, hinhAnh
    FROM SanPham
    ORDER BY idSP DESC
  LIMIT :limit OFFSET :offset
";

// prepare(): chuẩn bị câu SQL (ngăn chặn SQL injection)
$stmt = $pdo->prepare($sql);

// bindValue(): gán giá trị cho tham số (giả lập được bảo vệ chống tấn công)
// :limit = 9 (lấy 9 sản phẩm)
// :offset = số sản phẩm bỏ qua (0, 9, 18, ...)
// PDO::PARAM_INT: khẩn định đây là số nguyên
$stmt->bindValue(':limit', $perPage, PDO::PARAM_INT);
$stmt->bindValue(':offset', $offset, PDO::PARAM_INT);

// execute(): chạy câu SQL đã chuẩn bị
$stmt->execute();

// fetchAll(): lấy tất cả kết quả trả về dưới dạng mảng
// Mỗi phần tử là 1 dòng (1 sản phẩm)
$products = $stmt->fetchAll();

// ===== PHẦN 5: HÀM ĐỊNH DẠN GIÁ TIỀN =====
// Chuyển số tiền thành chuỗi dạng Việt Nam (VND)
// Ví dụ: 1500000 → "1.500.000đ"
function formatPriceVnd(int|float|null $price): string {
    // Nếu giá không có (null) thì trả về chuỗi rỗng
    if ($price === null) return '';
    
    // number_format():
    //   - (float)$price: chuyển thành số thực
    //   - 0: không lấy phần thập phân (0 chữ số sau dấu phẩy)
    //   - ',': dùng dấu phẩy làm dấu phân cách thập phân (không dùng ở VN, nhưng số vẫn đúng)
    //   - '.': dùng dấu chấm làm dấu phân cách hàng nghìn (1.500.000)
    // Cuối cùng thêm 'đ' phía sau để biểu thị đơn vị đồng Việt Nam
    return number_format((float)$price, 0, ',', '.') . 'đ';
}
?>


<?php
$basePath = '';
$showTopBar = true;
$showNavCat = true;
require __DIR__ . '/app/includes/header.php'; 
// _DIR- luôn trả về đường dẫn tuyệt đối đến thư mục chứa file hiện tại, 
//nên dù file này được include ở đâu thì vẫn sẽ tìm đúng header.php
//C:/xampp/htdocs/tech4future/app/includes/header.php
//_DIR__ : C:/xampp/htdocs/tech4future/
?>

  <div class="container">
    <!-- Sidebar -->
    <aside>
      <h3>Danh mục sản phẩm</h3>
      <ul class="cat-list">
        <?php
        // ===== COMMENT: HIỂN THỊ DANH MỤC ĐỘNG TỪ DATABASE =====
        // Truy vấn tất cả loại sản phẩm từ bảng loaisanpham
        // Sắp xếp theo tên loại (ORDER BY nameCate)
        $cateStmt = $pdo->query("SELECT idCate, nameCate FROM loaisanpham ORDER BY nameCate");
        $categories = $cateStmt->fetchAll();
        
        // Lặp qua từng loại sản phẩm
        // $cat: mảng chứa idCate (ID loại) và nameCate (tên loại)
        foreach ($categories as $cat):
        ?>
          <li>
            <!-- Link tới products_type.php với query parameter idCate
                 products_type.php?idCate=X sẽ lọc sản phẩm theo loại X
                 &page=1: khởi động từ trang đầu tiên -->
            <a href="pages/products_type.php?idCate=<?= (int)$cat['idCate'] ?>&page=1">
              <i class="fas fa-list"></i> 
              <?= htmlspecialchars($cat['nameCate']) ?>
            </a>
          </li>
        <?php endforeach; ?>
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

      $detailUrl = 'pages/products/products_detail.php?idSP=' . (int)$p['idSP'];
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

      <?php 
      // ===== PHẦN 6: HIỂN THỊ THANH PHÂN TRANG (NẾUÓ NHiều TRANG) =====
      // Chỉ hiển thị thanh phân trang khi có > 1 trang
      if ($totalPages > 1): 
      ?>
        <nav class="t4f-pagination" aria-label="Phan trang san pham">
          <!-- NÚT "TRANG TRƯỚC" -->
          <?php if ($page > 1): ?>
            <!-- Nếu không phải trang 1, hiển thị link sang trang trước -->
            <a class="t4f-page-btn t4f-page-nav" href="?page=<?= $page - 1 ?>">&laquo; Truoc</a>
          <?php else: ?>
            <!-- Nếu đang ở trang 1, nút "Trước" bị vô hiệu hóa (disabled) -->
            <span class="t4f-page-btn t4f-page-nav is-disabled">&laquo; Truoc</span>
          <?php endif; ?>

          <!-- NÚT CÁC SỐ TRANG -->
          <?php 
          // Vòng lặp từ trang 1 đến trang cuối cùng
          for ($i = 1; $i <= $totalPages; $i++): 
          ?>
            <?php if ($i === $page): ?>
              <!-- Nếu đây là trang hiện tại, hiển thị dạng span (không click được) với class "is-active" -->
              <span class="t4f-page-btn is-active"><?= $i ?></span>
            <?php else: ?>
              <!-- Nếu không phải trang hiện tại, hiển thị link để người dùng click -->
              <a class="t4f-page-btn" href="?page=<?= $i ?>"><?= $i ?></a>
            <?php endif; ?>
          <?php endfor; ?>

          <!-- NÚT "TRANG SAU" -->
          <?php if ($page < $totalPages): ?>
            <!-- Nếu không phải trang cuối, hiển thị link sang trang sau -->
            <a class="t4f-page-btn t4f-page-nav" href="?page=<?= $page + 1 ?>">Sau &raquo;</a>
          <?php else: ?>
            <!-- Nếu đang ở trang cuối, nút "Sau" bị vô hiệu hóa (disabled) -->
            <span class="t4f-page-btn t4f-page-nav is-disabled">Sau &raquo;</span>
          <?php endif; ?>
        </nav>
      <?php endif; ?>
    </main>
  </div>

<?php
$showZaloFloat = true;
require __DIR__ . '/app/includes/footer.php';
?>

</body>
</html>



 