<?php
/**
 * ===== FILE: products_type.php =====
 * Tác dụng: Hiển thị danh sách sản phẩm theo loại (category)
 * Cách sử dụng: products_type.php?idCate=1 (hoặc 2, 3, ...)
 * 
 * Cộng tác với index.php:
 * - index.php: hiển thị 9 sản phẩm mới nhất toàn bộ
 * - products_type.php: hiển thị sản phẩm lọc theo loại được chọn
 */

// ===== PHẦN 1: NHẬP CẤU HÌNH VÀ KẾT NỐI DATABASE =====
// Gọi file config để kết nối database và các cài đặt chung
require_once __DIR__ . '/../app/config/config.php';

// ===== PHẦN 2: KIỂM TRA VÀ LẤY ID LOẠI SẢN PHẨM TỪ URL =====
// Lấy tham số "idCate" từ URL query string (?idCate=1)
// filter_input(): an toàn hơn $_GET (chống injection)
// FILTER_VALIDATE_INT: chỉ chấp nhận số nguyên
// default: 0 nếu không có tham số
// min_range: 1 = loại phải có ID ≥ 1 (không cho ID âm hoặc 0)
$idCate = filter_input(
  INPUT_GET,
  'idCate',
  FILTER_VALIDATE_INT,
  ['options' => ['default' => 0, 'min_range' => 1]]
);

// ===== PHẦN 3: LẤY THÔNG TIN LOẠI SẢN PHẨM =====
// Truy vấn database để lấy tên loại sản phẩm dựa trên idCate
// Nếu không tìm thấy, $cateName sẽ là null
$stmt = $pdo->prepare("SELECT nameCate FROM loaisanpham WHERE idCate = :idCate");
$stmt->bindValue(':idCate', $idCate, PDO::PARAM_INT);
$stmt->execute();
$cate = $stmt->fetch();
$cateName = $cate ? $cate['nameCate'] : 'Loại không tìm thấy';

// ===== PHẦN 4: PHÂN TRANG - TÍNH TOÁN =====
// Số sản phẩm hiển thị trên 1 trang
$perPage = 9;

// Truy vấn đếm tổng sản phẩm của loại được chọn
// COUNT(*) trả về số lượng dòng khớp với điều kiện WHERE idCate = :idCate
$countStmt = $pdo->prepare("SELECT COUNT(*) FROM SanPham WHERE idCate = :idCate");
$countStmt->bindValue(':idCate', $idCate, PDO::PARAM_INT);
$countStmt->execute();
$totalProducts = (int)$countStmt->fetchColumn();

// Tính tổng số trang
// ceil(): làm tròn lên (5.2 → 6)
// max(1, ...): đảm bảo luôn có ≥ 1 trang ngay cả khi không có sản phẩm
$totalPages = max(1, (int)ceil($totalProducts / $perPage));

// Lấy số trang hiện tại từ URL (?page=2)
$page = filter_input(
  INPUT_GET,
  'page',
  FILTER_VALIDATE_INT,
  ['options' => ['default' => 1, 'min_range' => 1]]
);
// Đảm bảo trang không vượt quá tổng trang
$page = min($page, $totalPages);

// Tính offset (bỏ qua bao nhiêu dòng từ đầu)
// offset = (trang hiện tại - 1) × số sản phẩm/trang
// Trang 1: offset = 0 (lấy từ sản phẩm 0)
// Trang 2: offset = 9 (bỏ qua 0-8, lấy từ sản phẩm 9)
$offset = ($page - 1) * $perPage;

// ===== PHẦN 5: TRUY VẤN DANH SÁCH SẢN PHẨM THEO LOẠI VÀ TRANG =====
// SELECT: lấy các cộtanh (id, tên, giá gốc, giá khuyến mại, hình ảnh)
// WHERE idCate = :idCate: CHỈ lấy sản phẩm thuộc loại được chọn
// ORDER BY idSP DESC: sắp xếp từ mới nhất (id cao nhất) đến cũ nhất
// LIMIT :limit OFFSET :offset: lấy 9 sản phẩm, bỏ qua theo offset
$sql = "
    SELECT idSP, tenSP, gia, giaKM, hinhAnh
    FROM SanPham
    WHERE idCate = :idCate
    ORDER BY idSP DESC
    LIMIT :limit OFFSET :offset
";

// prepare(): chuẩn bị câu SQL (an toàn chống SQL injection)
$stmt = $pdo->prepare($sql);

// bindValue(): gán giá trị cho các tham số :idCate, :limit, :offset
// PDO::PARAM_INT: xác định đây là số nguyên
$stmt->bindValue(':idCate', $idCate, PDO::PARAM_INT);
$stmt->bindValue(':limit', $perPage, PDO::PARAM_INT);
$stmt->bindValue(':offset', $offset, PDO::PARAM_INT);

// execute(): chạy câu SQL
$stmt->execute();

// fetchAll(): lấy tất cả kết quả trả về dưới dạng mảng
// Mỗi phần tử là 1 sản phẩm (1 dòng từ database)
$products = $stmt->fetchAll();

// ===== PHẦN 6: HÀM ĐỊNH DẠNG GIÁ TIỀN =====
// Chuyển số tiền thành chuỗi định dạng VND (Việt Nam Đồng)
// Ví dụ: 1500000 → "1.500.000đ"
function formatPriceVnd(int|float|null $price): string {
    // Nếu giá không có (null) thì trả về chuỗi rỗng
    if ($price === null) return '';
    
    // number_format():
    //   - (float)$price: chuyển thành số thực
    //   - 0: không lấy phần thập phân (0 chữ số sau dấu phẩy)
    //   - ',': dấu phân cách thập phân (không dùng ở VN)
    //   - '.': dấu phân cách hàng nghìn (1.500.000)
    // Cuối cùng thêm 'đ' = đơn vị tiền Việt Nam
    return number_format((float)$price, 0, ',', '.') . 'đ';
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title><?= htmlspecialchars($cateName) ?> - Tech4Future</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>

<?php
// Gọi header (thanh menu trên cùng)
$basePath = '../';
$showTopBar = true;
$showNavCat = true;
require __DIR__ . '/../app/includes/header.php';
?>

  <div class="container">
    <!-- Sidebar: Danh mục sản phẩm -->
    <aside>
      <h3>Danh mục sản phẩm</h3>
      <ul class="cat-list">
        <!-- Liệt kê tất cả loại sản phẩm từ database -->
        <!-- Highlight loại hiện tại bằng class "active" -->
        <?php
        // Truy vấn tất cả loại sản phẩm từ bảng loaisanpham
        $cateStmt = $pdo->query("SELECT idCate, nameCate FROM loaisanpham ORDER BY nameCate");
        $categories = $cateStmt->fetchAll();
        
        // Lặp qua từng loại
        foreach ($categories as $cat):
          // Kiểm tra xem đây có phải loại hiện tại được chọn không
          $isActive = ($cat['idCate'] === $idCate) ? 'active' : '';
        ?>
          <li>
            <a href="products_type.php?idCate=<?= (int)$cat['idCate'] ?>&page=1" class="<?= $isActive ?>">
              <i class="fas fa-list"></i> <?= htmlspecialchars($cat['nameCate']) ?>
            </a>
          </li>
        <?php endforeach; ?>
      </ul>
    </aside>

    <!-- Main content: Danh sách sản phẩm -->
    <main>
      <!-- Tiêu đề trang -->
      <h2 style="text-align:center; color:var(--primary-dark); margin:30px 0;">
        Sản phẩm loại: <strong><?= htmlspecialchars($cateName) ?></strong>
      </h2>

      <!-- Kiểm tra xem có sản phẩm không -->
      <?php if (empty($products)): ?>
        <!-- Nếu không có sản phẩm, hiển thị thông báo -->
        <div style="text-align: center; padding: 40px; color: #999;">
          <i class="fas fa-inbox" style="font-size: 3rem; margin-bottom: 20px;"></i>
          <p>Không có sản phẩm nào trong loại này.</p>
          <a href="../index.php" class="btn" style="margin-top: 20px;">Quay lại trang chủ</a>
        </div>
      <?php else: ?>
        <!-- Nếu có sản phẩm, hiển thị grid -->
        <div class="hot-deals">
          <?php 
          // ===== PHẦN 7: VÒNG LẶP HIỂN THỊ TỪNG SẢN PHẨM =====
          // foreach: lặp qua từng sản phẩm trong mảng $products
          // $p: đại diện cho 1 sản phẩm (1 dòng từ database)
          foreach ($products as $p): 
          ?>
            <?php
            // Lấy thông tin từ sản phẩm hiện tại
            // ?? 'Sản phẩm': giá trị mặc định nếu key không tồn tại
            $name = $p['tenSP'] ?? 'Sản phẩm';
            
            // Chuyển giá gốc thành số thực (float)
            // isset(): kiểm tra xem key 'gia' có tồn tại không
            $gia = isset($p['gia']) ? (float)$p['gia'] : 0;
            
            // Lấy giá khuyến mại (có thể null nếu không giảm giá)
            // isset(): key tồn tại + !== null: giá trị không phải null
            $giaKm = isset($p['giaKM']) && $p['giaKM'] !== null ? (float)$p['giaKM'] : null;
            
            // Xử lý đường dẫn hình ảnh
            $img = trim((string)($p['hinhAnh'] ?? ''));
            
            // Nếu không có hình ảnh, dùng ảnh mặc định
            if ($img === '') {
              $img = '../assets/images/products/no-image.png';
            } 
            elseif (str_starts_with($img, 'assets/')) {
              $img = '../' . ltrim($img, '/');
            }
            // Nếu URL không bắt đầu bằng http:// và không bắt đầu bằng 'assets/', thêm đường dẫn
            elseif (!preg_match('/^https?:\/\//i', $img) && !str_starts_with($img, '../assets/')) {
              $img = '../assets/images/products/' . ltrim($img, '/');
            }
            
            // Tạo URL đi tới chi tiết sản phẩm
            $detailUrl = 'products/products_detail.php?idSP=' . (int)$p['idSP'];
            ?>

            <!-- Card sản phẩm -->
            <a href="<?= htmlspecialchars($detailUrl) ?>" class="product-card-link">
              <div class="product-card">
                <img src="<?= htmlspecialchars($img) ?>" alt="<?= htmlspecialchars($name) ?>">
                <div class="product-info">
                  <h4><?= htmlspecialchars($name) ?></h4>

                  <!-- Hiển thị giá (gốc và khuyến mại nếu có) -->
                  <?php if ($giaKm !== null): ?>
                    <!-- Nếu có giá khuyến mại, hiển thị cả giá gốc (gạch ngang) và giá khuyến mại -->
                    <div><span class="old-price"><?= htmlspecialchars(formatPriceVnd($gia)) ?></span></div>
                    <div class="price"><?= htmlspecialchars(formatPriceVnd($giaKm)) ?></div>
                  <?php else: ?>
                    <!-- Nếu không có khuyến mại, chỉ hiển thị giá gốc -->
                    <div class="price"><?= htmlspecialchars(formatPriceVnd($gia)) ?></div>
                  <?php endif; ?>

                  <!-- Nút hành động -->
                  <div class="product-buttons">
                    <button class="btn btn-add-to-cart"><i class="fas fa-cart-plus"></i> Thêm vào giỏ</button>
                    <button class="btn btn-detail">Chi tiết</button>
                  </div>
                </div>
              </div>
            </a>
          <?php endforeach; ?>
        </div>

        <!-- ===== PHẦN 8: THANH PHÂN TRANG ===== -->
        <?php if ($totalPages > 1): ?>
          <nav class="t4f-pagination" aria-label="Phan trang san pham">
            <!-- Nút "TRANG TRƯỚC" -->
            <?php if ($page > 1): ?>
              <!-- Nếu không phải trang 1, hiển thị link sang trang trước -->
              <!-- Giữ nguyên query parameter &idCate để stay ở loại này -->
              <a class="t4f-page-btn t4f-page-nav" href="?idCate=<?= (int)$idCate ?>&page=<?= $page - 1 ?>">&laquo; Trước</a>
            <?php else: ?>
              <!-- Nếu ở trang 1, nút "Trước" bị disable -->
              <span class="t4f-page-btn t4f-page-nav is-disabled">&laquo; Trước</span>
            <?php endif; ?>

            <!-- CÁC NÚT SỐ TRANG -->
            <?php 
            // Vòng lặp từ trang 1 đến trang cuối
            for ($i = 1; $i <= $totalPages; $i++): 
            ?>
              <?php if ($i === $page): ?>
                <!-- Nếu đây là trang hiện tại, hiển thị dạng span (không clickable) với trạng thái active -->
                <span class="t4f-page-btn is-active"><?= $i ?></span>
              <?php else: ?>
                <!-- Nếu không phải trang hiện tại, hiển thị link để click -->
                <!-- Giữ nguyên query parameter &idCate -->
                <a class="t4f-page-btn" href="?idCate=<?= (int)$idCate ?>&page=<?= $i ?>"><?= $i ?></a>
              <?php endif; ?>
            <?php endfor; ?>

            <!-- Nút "TRANG SAU" -->
            <?php if ($page < $totalPages): ?>
              <!-- Nếu không phải trang cuối, hiển thị link sang trang sau -->
              <a class="t4f-page-btn t4f-page-nav" href="?idCate=<?= (int)$idCate ?>&page=<?= $page + 1 ?>">Sau &raquo;</a>
            <?php else: ?>
              <!-- Nếu ở trang cuối, nút "Sau" bị disable -->
              <span class="t4f-page-btn t4f-page-nav is-disabled">Sau &raquo;</span>
            <?php endif; ?>
          </nav>
        <?php endif; ?>
      <?php endif; ?>
    </main>
  </div>

<?php
// Gọi footer (chân trang)
$showZaloFloat = true;
require __DIR__ . '/../app/includes/footer.php';
?>

</body>
</html>
