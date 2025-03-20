<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lỗi</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #1a1a2e;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 10px;
        }
        .error-container h1 {
            color: #ff4444;
        }
        .error-container p {
            color: #fff;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>Đã xảy ra lỗi</h1>
    <p>Thông báo lỗi: <%= exception != null ? exception.getMessage() : "Không có thông tin lỗi" %></p>
    <p>Vui lòng liên hệ quản trị viên để được hỗ trợ.</p>
    <a href="/book" style="color: #00ffcc;">Quay lại trang chủ</a>
</div>
</body>
</html>