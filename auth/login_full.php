
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng nhập - Tech4Future</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
<link rel="stylesheet" href="../assets/css/auth.css">
</head>

<body>
<div class="main-content">
<div class="container">

<h2>Đăng nhập</h2>

<input type="text" placeholder="Tên đăng nhập">
<input type="password" placeholder="Mật khẩu">

<button>Đăng nhập</button>

<div class="divider">hoặc</div>

<button class="google-btn">
<img src="../assets/images/products/icons_google.png" width="20">
Đăng nhập bằng Google
</button>

<div class="link">
Chưa có tài khoản? <a href="register_full.php">Đăng ký</a>
</div>

</div>
</div>
<?php
$showZaloFloat = false;
require __DIR__ . '/../app/includes/footer.php';
?>

</body>
</html>

