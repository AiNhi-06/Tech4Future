<?php
$basePath = $basePath ?? '';
$showTopBar = $showTopBar ?? true;
$showNavCat = $showNavCat ?? true;
?>
<?php if ($showTopBar): ?>
<div class="top-bar">
  <div>Khuyen Mai Sap WEB - Giam den 99% Moi San Pham</div>
  <div>
    <a href="tel:0986552233">Hotline: 0986.552.233</a> |
    <a href="<?= htmlspecialchars($basePath . 'pages/donhang.php') ?>">Don hang</a> |
    <a href="<?= htmlspecialchars($basePath . 'pages/cart.php') ?>">Gio hang</a> |
    <a href="<?= htmlspecialchars($basePath . 'auth/login_full.php') ?>">Dang nhap</a> |
    <a href="<?= htmlspecialchars($basePath . 'auth/register_full.php') ?>">Dang ky</a>
  </div>
</div>
<?php endif; ?>

<header>
  <div class="main-header">
    <a href="<?= htmlspecialchars($basePath . 'index.php') ?>" class="logo">Tech4Future</a>

    <div class="search-bar">
      <input type="text" placeholder="Ban can tim gi? Laptop gaming, PC build, VGA, RAM...">
    </div>

    <div class="icons">
      <a href="<?= htmlspecialchars($basePath . 'pages/cart.php') ?>" class="cart"><i class="fas fa-shopping-cart"></i></a>
      <a href="<?= htmlspecialchars($basePath . 'pages/profile.html') ?>"><i class="fas fa-user"></i></a>
    </div>
  </div>

  <?php if ($showNavCat): ?>
  <div class="nav-cat">
    <div class="nav-cat-inner">
      <a href="#">Xay dung cau hinh</a>
      <a href="#">Hot deal</a>
      <a href="#">Thu cu doi moi</a>
      <a href="<?= htmlspecialchars($basePath . 'pages/trabaohanh.html') ?>">Tra cuu bao hanh</a>
    </div>
  </div>
  <?php endif; ?>
</header>
