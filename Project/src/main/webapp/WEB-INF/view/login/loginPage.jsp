<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng Nhập & Đăng Ký - Fahasa Library</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <style>
    body {
      background: linear-gradient(135deg, #1a2a44, #2d4062);
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
      overflow: hidden;
      position: relative;
    }

    /* Header VIP */
    .custom-header {
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(10px);
      padding: 15px 0;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 1000;
      transition: all 0.3s ease;
    }

    .custom-header.scrolled {
      background: rgba(255, 255, 255, 0.1);
      padding: 10px 0;
    }

    .container {
      max-width: 1200px;
      margin: auto;
    }

    .header-logo {
      height: 60px;
      transition: transform 0.3s ease;
    }

    .header-logo:hover {
      transform: scale(1.1);
    }

    /* Account Icon */
    .header-account {
      text-decoration: none;
      font-size: 16px;
      font-weight: 500;
      color: #fff;
      transition: all 0.3s ease;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 10px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.1);
    }

    .header-account i {
      font-size: 28px;
      margin-bottom: 5px;
      color: #ff6f61;
    }

    .header-account:hover {
      color: #fff;
      background: rgba(255, 111, 97, 0.2);
      transform: scale(1.1);
    }

    /* Login Container */
    .auth-container {
      display: flex;
      gap: 30px;
      justify-content: center;
      align-items: center;
      margin-top: 120px;
      z-index: 1;
    }

    .auth-card {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border-radius: 15px;
      padding: 30px;
      width: 350px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
      transition: all 0.3s ease;
      border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .auth-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 40px rgba(255, 111, 97, 0.3);
    }

    .auth-card h2 {
      font-size: 24px;
      font-weight: 600;
      text-align: center;
      margin-bottom: 25px;
      color: #ff6f61;
    }

    .auth-card.register-card h2 {
      color: #fff;
    }

    /* Ô nhập liệu */
    .input-group {
      margin-bottom: 20px;
      border-radius: 10px;
      overflow: hidden;
      background: rgba(255, 255, 255, 0.15);
      border: 1px solid rgba(255, 255, 255, 0.3);
      transition: all 0.3s ease;
    }

    .input-group:hover {
      border-color: #ff6f61;
      box-shadow: 0 0 10px rgba(255, 111, 97, 0.2);
    }

    .input-group-text {
      background: transparent;
      border: none;
      color: #ff6f61;
    }

    .form-control {
      border: none;
      background: transparent;
      color: #fff;
      font-size: 16px;
      padding: 12px 15px;
    }

    .form-control:focus {
      background: rgba(255, 255, 255, 0.2);
      box-shadow: none;
      color: #fff;
    }

    .form-control::placeholder {
      color: #ccc;
    }

    /* Nút bấm */
    .btn-auth {
      background: linear-gradient(135deg, #ff6f61, #e65b50);
      color: #fff;
      width: 100%;
      padding: 12px;
      border-radius: 10px;
      font-weight: 600;
      border: none;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(255, 111, 97, 0.4);
    }

    .btn-auth:hover {
      background: linear-gradient(135deg, #e65b50, #ff6f61);
      transform: translateY(-2px);
      box-shadow: 0 7px 20px rgba(255, 111, 97, 0.5);
    }

    /* Hiển thị mật khẩu */
    .password-toggle {
      cursor: pointer;
      color: #ff6f61;
      transition: color 0.3s ease;
    }

    .password-toggle:hover {
      color: #e65b50;
    }

    /* Checkbox và Link */
    .remember-me {
      display: flex;
      align-items: center;
      font-size: 14px;
      color: #fff;
      margin-bottom: 15px;
    }

    .remember-me input {
      margin-right: 8px;
    }

    .forgot-password {
      color: #ff6f61;
      font-size: 14px;
      text-decoration: none;
      transition: color 0.3s ease;
      display: block;
      text-align: center;
      margin-bottom: 20px;
    }

    .forgot-password:hover {
      color: #e65b50;
      text-decoration: underline;
    }

    /* Background Animation */
    .bg-animation {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: radial-gradient(circle, rgba(255, 111, 97, 0.1) 0%, transparent 70%);
      animation: pulse 10s infinite alternate;
      z-index: 0;
    }

    @keyframes pulse {
      0% { transform: scale(0.5); opacity: 0.5; }
      100% { transform: scale(1.5); opacity: 0; }
    }
  </style>
</head>
<body>
<div class="bg-animation"></div>

<header class="custom-header">
  <div class="container">
    <div class="row align-items-center justify-content-between">
      <div class="col-auto">
        <a href="/book">
          <img src="https://th.bing.com/th/id/OIP.Q2amTWlPUanyIlSCtEcoSwHaFZ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Logo" class="header-logo">
        </a>
      </div>

      <div class="col-auto">
        <a href="/login" class="header-account">
          <i class="bi bi-person-fill"></i>
          <span>Tài khoản</span>
        </a>
      </div>
    </div>
  </div>
</header>

<div class="auth-container">
  <!-- Đăng nhập -->
  <div class="auth-card">
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

      <div class="remember-me">
        <input type="checkbox" id="remember"> <label for="remember">Ghi nhớ đăng nhập</label>
      </div>

      <a href="/forgot-password" class="forgot-password">Quên mật khẩu?</a>

      <button type="submit" class="btn-auth mt-3">Đăng nhập</button>
    </form>
  </div>

  <!-- Đăng ký -->
  <div class="auth-card register-card">
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
        <input type="password" class="form-control" name="password" placeholder="Mật khẩu *" id="register-password" required>
        <span class="input-group-text password-toggle" onclick="togglePassword('register-password')">
                        <i class="bi bi-eye"></i>
                    </span>
      </div>

      <div class="input-group">
        <span class="input-group-text"><i class="bi bi-lock"></i></span>
        <input type="password" class="form-control" name="confirm-password" placeholder="Xác nhận mật khẩu *" required>
      </div>

      <button type="submit" class="btn-auth mt-3">Đăng Ký</button>
    </form>
  </div>
</div>

<script>
  function togglePassword(id) {
    let passwordField = document.getElementById(id);
    let icon = passwordField.nextElementSibling.querySelector("i");
    passwordField.type = passwordField.type === "password" ? "text" : "password";
    icon.classList.toggle("bi-eye-slash");
  }

  // Kiểm tra scroll cho header
  window.addEventListener('scroll', function() {
    const header = document.querySelector('.custom-header');
    if (window.scrollY > 50) {
      header.classList.add('scrolled');
    } else {
      header.classList.remove('scrolled');
    }
  });

  // Thông báo thành công/lỗi
  document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get("success") === "1") {
      alert("Đăng ký thành công! Vui lòng đăng nhập.");
      history.replaceState(null, null, window.location.pathname);
    } else if (urlParams.get("error") === "exists") {
      alert("Email đã tồn tại! Vui lòng sử dụng email khác.");
      history.replaceState(null, null, window.location.pathname);
    } else if (urlParams.get("error") === "mismatch") {
      alert("Mật khẩu và xác nhận mật khẩu không khớp!");
      history.replaceState(null, null, window.location.pathname);
    }
  });
</script>
</body>
</html>