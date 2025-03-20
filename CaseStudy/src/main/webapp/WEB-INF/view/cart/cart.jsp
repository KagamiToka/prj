<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>

<%
    // Đặt Locale là vi_VN để định dạng số theo chuẩn Việt Nam
    pageContext.setAttribute("locale", new java.util.Locale("vi", "VN"));
%>

<fmt:setLocale value="${locale}"/>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #1a1a2e;
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            min-height: 100vh;
            padding-top: 100px;
            position: relative;
            overflow-x: hidden;
            color: #fff;
        }

        .custom-header {
            background: linear-gradient(90deg, #00ffcc, #ff00ff);
            padding: 15px 0;
            border-bottom: 2px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 6px 25px rgba(0, 255, 204, 0.3);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            backdrop-filter: blur(5px);
        }

        .container1 {
            max-width: 1400px;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 40px;
        }

        .header-logo {
            height: 70px;
            filter: drop-shadow(0 0 10px #00ffcc);
            transition: transform 0.4s ease-in-out;
        }

        .header-logo:hover {
            transform: scale(1.15) rotate(5deg);
        }

        .search-bar {
            display: flex;
            align-items: center;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 30px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.1);
            max-width: 500px;
            flex-grow: 1;
            margin: 0 30px;
            transition: all 0.4s ease;
        }

        .search-bar:hover {
            box-shadow: 0 0 20px rgba(0, 255, 204, 0.5);
            transform: translateY(-3px);
        }

        .search-input {
            flex: 1;
            padding: 14px 20px;
            border: none;
            outline: none;
            font-size: 16px;
            color: #fff;
            background: transparent;
        }

        .search-input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .search-btn {
            background: linear-gradient(135deg, #00ffcc, #ff00ff);
            border: none;
            padding: 14px 20px;
            color: #fff;
            cursor: pointer;
            transition: all 0.4s ease;
            border-radius: 0 30px 30px 0;
            filter: drop-shadow(0 0 5px #00ffcc);
        }

        .search-btn:hover {
            background: linear-gradient(135deg, #ff00ff, #ff1493);
            transform: scale(1.1);
            filter: drop-shadow(0 0 10px #ff00ff);
        }

        .search-btn i {
            font-size: 20px;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .header-account, .payment, .manage {
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            color: #fff;
            transition: all 0.4s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 12px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(5px);
            filter: drop-shadow(0 0 5px rgba(0, 255, 204, 0.3));
            position: relative;
        }

        .header-account i, .payment i, .manage i {
            font-size: 24px;
            margin-bottom: 5px;
        }

        .header-account:hover, .payment:hover, .manage:hover {
            color: #00ffcc;
            background: rgba(0, 255, 204, 0.2);
            transform: translateY(-3px);
            filter: drop-shadow(0 0 10px #00ffcc);
        }

        .dropdown {
            position: relative;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            background: rgba(26, 26, 46, 0.9);
            min-width: 220px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
            border-radius: 15px;
            padding: 15px 0;
            top: 100%;
            right: 0;
            backdrop-filter: blur(10px);
            animation: fadeInDown 0.3s ease-in-out;
            border: 1px solid rgba(0, 255, 204, 0.2);
            z-index: 1000;
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .dropdown-menu a {
            display: block;
            padding: 12px 20px;
            text-decoration: none;
            color: #fff;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .dropdown-menu a:hover {
            color: #00ffcc;
            background: rgba(0, 255, 204, 0.1);
            padding-left: 25px;
        }

        .dropdown-menu.show {
            display: block;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 50px 30px;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .cart-card {
            background: linear-gradient(135deg, rgba(26, 26, 46, 0.9), rgba(22, 33, 62, 0.9));
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            position: relative;
            overflow: hidden;
            transition: all 0.4s ease;
            border: 1px solid rgba(0, 255, 204, 0.1);
        }

        .cart-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 255, 204, 0.3);
        }

        .cart-card img {
            max-width: 180px;
            height: auto;
            border-radius: 12px;
            transition: transform 0.4s ease;
            filter: drop-shadow(0 0 10px rgba(0, 255, 204, 0.5));
        }

        .cart-card img:hover {
            transform: scale(1.1) rotate(2deg);
        }

        .cart-card .card-body h5 {
            font-size: 24px;
            font-weight: 600;
            color: #ff00ff;
            margin-bottom: 15px;
            text-transform: capitalize;
        }

        .cart-card .card-body p {
            font-size: 16px;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 12px;
        }

        .cart-card .card-footer {
            background: none;
            padding-top: 20px;
            border-top: 1px dashed rgba(0, 255, 204, 0.2);
            text-align: right;
            font-weight: 600;
            color: #00ffcc;
        }

        .cart-card .card-footer .total-price {
            font-size: 24px;
            filter: drop-shadow(0 0 5px #00ffcc);
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-control button {
            background: linear-gradient(135deg, #00ffcc, #ff00ff);
            border: none;
            padding: 5px 10px;
            color: #fff;
            cursor: pointer;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .quantity-control button:hover {
            background: linear-gradient(135deg, #ff00ff, #ff1493);
            transform: scale(1.1);
        }

        .quantity-control input {
            width: 50px;
            text-align: center;
            border-radius: 5px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
        }

        .btn-secondary, .btn-primary {
            padding: 15px 35px;
            font-weight: 600;
            border-radius: 12px;
            transition: all 0.4s ease;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-size: 16px;
            border: 2px solid transparent;
        }

        .btn-secondary {
            background: #6c757d;
            color: #fff;
        }

        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(108, 117, 125, 0.3);
        }

        .btn-primary {
            background: linear-gradient(135deg, #00ffcc, #ff00ff);
            color: #fff;
            filter: drop-shadow(0 0 10px #00ffcc);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #ff00ff, #ff1493);
            transform: translateY(-3px);
            box-shadow: 0 6px 25px rgba(0, 255, 204, 0.4);
            filter: drop-shadow(0 0 15px #ff00ff);
        }

        footer {
            background: linear-gradient(90deg, #00ffcc, #ff00ff);
            color: #fff;
            text-align: center;
            padding: 20px 0;
            margin-top: 50px;
            box-shadow: 0 -3px 15px rgba(0, 0, 0, 0.1);
            filter: drop-shadow(0 0 5px #00ffcc);
        }

        footer p {
            font-size: 15px;
            font-weight: 500;
            margin: 0;
        }

        .alert {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<header class="custom-header">
    <div class="container1">
        <!-- Logo -->
        <div>
            <a href="/book">
                <img src="https://th.bing.com/th/id/OIP.Q2amTWlPUanyIlSCtEcoSwHaFZ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Logo" class="header-logo">
            </a>
        </div>

        <!-- Search Bar -->
        <form action="/book" method="GET" class="search-bar">
            <input type="hidden" name="type" value="title">
            <input type="text" class="search-input" name="query" placeholder="Tìm kiếm sách theo tên...">
            <button type="submit" class="search-btn">
                <i class="bi bi-search"></i>
            </button>
        </form>

        <!-- Header Right -->
        <div class="header-right">
            <%
                User user = (User) session.getAttribute("user");
            %>
            <div>
                <% if (user != null) { %>
                <a href="/logout" class="header-account">
                    <i class="bi bi-box-arrow-right"></i>
                    <span>Đăng xuất</span>
                </a>
                <% } else { %>
                <a href="/login" class="header-account">
                    <i class="bi bi-person-fill"></i>
                    <span>Tài khoản</span>
                </a>
                <% } %>
            </div>

            <% Integer roleId = (Integer) session.getAttribute("roleId"); %>
            <% if (roleId != null && roleId == 1) { %>
            <div class="dropdown">
                <a href="#" class="manage" onclick="toggleDropdown(event)">
                    <i class="bi bi-person-lines-fill"></i>
                    <span>Quản lý</span>
                </a>
                <div class="dropdown-menu" id="manageDropdown">
                    <a href="/users">Quản lý người dùng</a>
                    <a href="/managementBook">Quản lý sách</a>
                    <a href="/orderDetails">Quản lý đơn hàng</a>
                </div>
            </div>
            <% } %>

            <a href="/cart" class="payment">
                <i class="bi bi-cart-fill"></i>
                <span>Thanh toán</span>
            </a>
        </div>
    </div>
</header>

<!-- Nội dung chính -->
<div class="container">
    <h4 class="text-center mb-5">Giỏ hàng của bạn</h4>
    <% if (request.getAttribute("message") != null) { %>
    <div class="alert alert-success text-center">
        <%= request.getAttribute("message") %>
    </div>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger text-center">
        <% if ("not_enough_stock".equals(request.getParameter("error"))) { %>
        Không đủ hàng trong kho để thêm số lượng này.
        <% } else if ("book_not_found".equals(request.getParameter("error"))) { %>
        Không tìm thấy sách.
        <% } %>
    </div>
    <% } %>
    <%
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null && !cart.isEmpty()) {
    %>
    <% for (CartItem item : cart) { %>
    <div class="cart-card">
        <div class="d-flex align-items-center">
            <img src="<%= item.getBook().getImageURL() != null ? item.getBook().getImageURL() : "https://via.placeholder.com/180" %>" alt="Sản phẩm" class="img-fluid">
            <div class="card-body">
                <h5><%= item.getBook().getTitle() != null ? item.getBook().getTitle() : "Không có tiêu đề" %></h5>
                <p><strong>Giá sách: </strong>
                    <fmt:formatNumber value="<%= item.getBook().getPrice() * 1000 %>" type="number" pattern="#,##0.###"/> VNĐ
                </p>
                <p><strong>Số lượng: </strong>
                <form action="cart" method="get" class="quantity-control d-inline">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="bookId" value="<%= item.getBook().getId() %>">
                    <button type="submit" name="quantity" value="<%= item.getQuantity() - 1 %>">-</button>
                    <input type="text" value="<%= item.getQuantity() %>" readonly>
                    <button type="submit" name="quantity" value="<%= item.getQuantity() + 1 %>">+</button>
                </form>
                </p>
                <p><strong>Tổng giá mục này: </strong>
                    <fmt:formatNumber value="<%= item.getSubtotal() * 1000 %>" type="number" pattern="#,##0.###"/> VNĐ
                </p>
                <p><strong>Trọng lượng:</strong> 300g</p>
                <p><strong>Số lượng tồn kho: </strong><%= item.getBook().getStockQuantity() %></p>
            </div>
        </div>
        <div class="card-footer">
            <a href="cart?action=remove&bookId=<%= item.getBook().getId() %>" class="btn btn-danger">Xóa</a>
        </div>
    </div>
    <% } %>
    <div class="cart-card">
        <div class="card-footer">
            <p class="total-price">Tổng giá (bao gồm vận chuyển 30,000 VNĐ):
                <fmt:formatNumber value="${totalPrice}" type="number" pattern="#,##0.###"/> VNĐ
            </p>
        </div>
    </div>
    <div class="mt-5 d-flex justify-content-center gap-4">
        <a href="/book" class="btn btn-secondary">Quay lại</a>
        <a href="/orderpage" class="btn btn-primary">Thanh toán</a>
    </div>
    <% } else { %>
    <p style="color: rgba(255, 255, 255, 0.6); text-align: center;">Giỏ hàng trống.</p>
    <div class="mt-5 d-flex justify-content-center">
        <a href="/book" class="btn btn-secondary">Quay lại</a>
    </div>
    <% } %>
</div>

<footer>
    <p>© 2025 Nhà sách Việt. All Rights Reserved.</p>
</footer>

<script>
    function toggleDropdown(event) {
        event.preventDefault();
        const dropdown = event.target.nextElementSibling;
        dropdown.classList.toggle("show");
    }

    document.addEventListener("click", function(event) {
        const dropdowns = document.getElementsByClassName("dropdown-menu");
        for (let i = 0; i < dropdowns.length; i++) {
            const openDropdown = dropdowns[i];
            if (!openDropdown.contains(event.target) && event.target.className !== "manage") {
                openDropdown.classList.remove("show");
            }
        }
    });
</script>
</body>
</html>