<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sách - Fahasa Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: #e0e0e0;
            min-height: 100vh;
            padding-top: 80px;
        }

        .custom-header {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 15px 30px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .container1 {
            max-width: 1400px;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header-logo {
            height: 50px;
        }

        .header-right a {
            color: #fff;
            font-weight: 500;
            text-decoration: none;
            margin-left: 20px;
            display: flex;
            align-items: center;
        }

        .header-right a i {
            margin-right: 5px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px;
        }

        .book-detail-card {
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            gap: 30px;
        }

        .book-detail-card img {
            max-width: 300px;
            height: auto;
            border-radius: 5px;
        }

        .book-detail-info h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .book-detail-info p {
            font-size: 16px;
            color: #34495e;
            margin-bottom: 10px;
        }

        .book-detail-info .price {
            font-size: 24px;
            color: #e74c3c;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #4fc3f7, #42a5f5);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: #fff;
            margin-right: 10px;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #42a5f5, #2196f3);
        }

        .btn-success {
            background: linear-gradient(135deg, #28a745, #218838);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: #fff;
            margin-right: 10px;
        }

        .btn-success:hover {
            background: linear-gradient(135deg, #218838, #1e7e34);
        }

        .btn-secondary {
            background: #6c757d;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: #fff;
        }

        .btn-secondary:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
<header class="custom-header">
    <div class="container1">
        <a href="/book">
            <img src="https://th.bing.com/th/id/OIP.Q2amTWlPUanyIlSCtEcoSwHaFZ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Logo" class="header-logo">
        </a>
        <div class="header-right">
            <c:if test="${empty sessionScope.user}">
                <a href="/login"><i class="bi bi-person-fill"></i> Đăng nhập</a>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <a href="/logout"><i class="bi bi-box-arrow-right"></i> Đăng xuất</a>
            </c:if>
            <c:if test="${sessionScope.roleId == 1}">
                <a href="/users"><i class="bi bi-person-lines-fill"></i> Quản lý người dùng</a>
                <a href="/managementBook"><i class="bi bi-book"></i> Quản lý sách</a>
                <a href="/orderDetails"><i class="bi bi-cart"></i> Quản lý đơn hàng</a>
            </c:if>
            <a href="/cart"><i class="bi bi-cart-fill"></i> Giỏ hàng</a>
        </div>
    </div>
</header>

<div class="container">
    <h2 class="text-center mb-4" style="color: #fff;">Chi Tiết Sách</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <c:if test="${not empty book}">
        <div class="book-detail-card">
            <img src="${book.imageURL}" alt="${book.title}">
            <div class="book-detail-info">
                <h2>${book.title}</h2>
                <p><strong>Tác giả:</strong> ${book.author}</p>
                <p class="price">
                    <fmt:formatNumber value="${book.price}" type="number" pattern="#,##0.000"/> VND
                </p>
                <p><strong>Mô tả:</strong> ${book.bookDescription}</p>
                <p><strong>Số lượng trong kho:</strong> ${book.stockQuantity}</p>
                <div class="d-flex gap-2">
                    <!-- Nút Mua ngay -->
                    <a href="/buy?bookId=${book.id}" class="btn btn-success">Mua ngay</a>
                    <!-- Nút Thêm vào giỏ hàng -->
                    <a href="cart?action=add&bookId=${book.id}" class="btn btn-primary">Thêm vào giỏ hàng</a>
                    <!-- Nút Quay lại -->
                    <a href="/book" class="btn btn-secondary">Quay lại</a>
                </div>
            </div>
        </div>
    </c:if>
</div>
</body>
</html>