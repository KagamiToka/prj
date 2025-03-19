<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng Nhập & Đăng Ký</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

  <style>
    /* Định dạng chung */
    body {
      background-color: #f8f9fa;
    }

    /* Header cố định trên cùng */
    .custom-header {
      background-color: white;
      padding: 10px 0;
      border-bottom: 2px ;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 1000;
    }

    .container {
      max-width: 1200px;
      margin: auto;
    }

    .header-logo {
      height: 60px;
    }

    /* Ô tìm kiếm */
    .search-bar {
      display: flex;
      align-items: center;
      border: 2px solid #FFA500;
      border-radius: 5px;
      overflow: hidden;
      background-color: #fff;
      max-width: 500px;
      margin: auto;
    }

    .search-input {
      flex: 1;
      padding: 10px 15px;
      border: none;
      outline: none;
      font-size: 14px;
    }

    .search-btn {
      background-color: #FFA500;
      border: none;
      padding: 10px 15px;
      color: white;
      cursor: pointer;
    }

    .search-btn i {
      font-size: 18px;
    }

    /* Biểu tượng tài khoản */
    .header-account {
      text-decoration: none;
      font-size: 14px;
      font-weight: bold;
      color: #FFA500;
      transition: color 0.3s;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .header-account i {
      font-size: 24px;
      margin-bottom: 5px;
    }

    .header-account:hover {
      color: #FF8C00;
    }

    /* Container của trang đăng nhập/đăng ký */
    .login-container {
      display: flex;
      width: 850px;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      margin-top: 120px; /* Tạo khoảng cách với header */
    }

    /* Phần đăng nhập */
    .login-box {
      width: 50%;
      padding: 40px;
      background-color: #fff;
    }

    /* Phần đăng ký */
    .register-box {
      width: 50%;
      padding: 40px;
      background-color: #f28c13;
      color: white;
    }

    /* Tiêu đề */
    .login-box h2, .register-box h2 {
      font-size: 22px;
      font-weight: bold;
      text-align: center;
      margin-bottom: 20px;
    }

    /* Ô nhập liệu */
    .input-group {
      margin-bottom: 15px;
    }

    .input-group-text {
      background-color: #ddd;
      border: none;
    }

    .form-control {
      border-left: none;
    }

    /* Nút bấm */
    .btn-login {
      background-color: #f28c13;
      color: white;
      width: 100%;
      padding: 10px;
      border-radius: 5px;
      font-weight: bold;
      border: none;
      transition: 0.3s;
    }

    .btn-login:hover {
      background-color: #d6760d;
    }

    .btn-register {
      background-color: white;
      color: #f28c13;
      width: 100%;
      padding: 10px;
      border-radius: 5px;
      font-weight: bold;
      border: none;
      transition: 0.3s;
    }

    .btn-register:hover {
      background-color: #f5f5f5;
    }

    /* Hiển thị mật khẩu */
    .password-toggle {
      cursor: pointer;
    }

    /* Checkbox */
    .remember-me {
      display: flex;
      align-items: center;
      font-size: 14px;
    }

    .remember-me input {
      margin-right: 5px;
    }

    /* Link */
    .forgot-password {
      color: #f28c13;
      font-size: 14px;
      text-decoration: none;
    }

    .forgot-password:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<header class="custom-header">
  <div class="container">
    <div class="row align-items-center justify-content-between">
      <div class="col-auto">
        <a href="/book">
          <img src="https://beedesign.com.vn/wp-content/uploads/2020/08/logo-nha-sach-Viet.jpg" alt="Logo" class="header-logo">
        </a>
      </div>

      <div class="col-md-6">
        <div class="search-bar">
          <input type="text" class="search-input" placeholder="Tìm kiếm sản phẩm...">
          <button class="search-btn">
            <i class="bi bi-search"></i>
          </button>
        </div>
      </div>

      <div class="col-auto">
        <a href="/login" class="header-account">
          <i class="bi bi-person-fill"></i>
          <span style="margin-top: -10px">Tài khoản</span>
        </a>
      </div>
    </div>
  </div>
</header>

<div class="d-flex justify-content-center mt-5">
  <div class="login-container">
    <!-- Đăng nhập -->
    <div class="login-box">
      <h2>Đăng nhập</h2>
      <form action="login?action=login" method="post">
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-envelope"></i></span>
          <input type="text" class="form-control" name="username" placeholder="Email/Số điện thoại *" required>
        </div>

        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-lock"></i></span>
          <input type="password" class="form-control" name="password" placeholder="Mật khẩu *" id="login-password" required>
          <span class="input-group-text password-toggle" onclick="togglePassword('login-password')">
            <i class="bi bi-eye"></i>
        </span>
        </div>

        <button type="submit" class="btn btn-login mt-3">Đăng nhập</button>
      </form>
    </div>

    <!-- Đăng ký -->
    <div class="register-box">
      <h2>Đăng ký thành viên</h2>
      <form action="login?action=register" method="post">
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-person"></i></span>
          <input type="text" class="form-control" name="username" placeholder="Họ tên *" required>
        </div>

        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-envelope"></i></span>
          <input type="email" class="form-control" name="email" placeholder="Email *" required>
        </div>

        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-lock"></i></span>
          <input type="password" class="form-control" name="password" placeholder="Mật khẩu *" required>
        </div>
        <button type="submit" class="btn btn-register mt-3">Đăng Ký</button>
      </form>
    </div>
  </div>
</div>

<script>
  function togglePassword(id) {
    let passwordField = document.getElementById(id);
    let icon = passwordField.nextElementSibling.querySelector("i");
    passwordField.type = passwordField.type === "password" ? "text" : "password";
    icon.classList.toggle("bi-eye-slash");
  }
  document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get("success") === "1") {
      alert("Đăng ký thành công! Vui lòng đăng nhập.");
      history.replaceState(null, null, window.location.pathname); // Xóa tham số 'success' khỏi URL
    } else if (urlParams.get("error") === "exists") {
      alert("Email đã tồn tại! Vui lòng sử dụng email khác.");
      history.replaceState(null, null, window.location.pathname);
    }
  });
</script>

</body>
</html>
