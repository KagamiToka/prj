<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<Book> cart = (List<Book>) session.getAttribute("cart");
    if (cart == null) {
        cart = new java.util.ArrayList<>();
    }

    double totalPrice = 0.0;
    for (Book book : cart) {
        if (book.getPrice() != 0.0) {
            totalPrice += book.getPrice();
        }
    }
    totalPrice += 30000; // Phí vận chuyển cố định 30,000 VNĐ
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán</title>
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

        /* Header */
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

        /* Search Bar */
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

        /* Header Right */
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

        /* Dropdown */
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

        /* Main Content */
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

        /* Checkout Section */
        .checkout-container {
            display: flex;
            gap: 50px;
        }

        .left-section, .right-section {
            background: rgba(26, 26, 46, 0.9);
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(0, 255, 204, 0.2);
            animation: pulse 2s infinite alternate;
            flex: 1;
        }

        @keyframes pulse {
            from { box-shadow: 0 15px 50px rgba(0, 255, 204, 0.3); }
            to { box-shadow: 0 15px 50px rgba(255, 0, 255, 0.3); }
        }

        h4 {
            font-size: 28px;
            font-weight: 600;
            color: #00ffcc;
            margin-bottom: 30px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
            filter: drop-shadow(0 0 5px #00ffcc);
        }

        .form-label {
            font-weight: 500;
            color: #fff;
            margin-bottom: 8px;
            opacity: 0.9;
        }

        .form-control {
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 14px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .form-control:focus {
            border-color: #00ffcc;
            box-shadow: 0 0 15px rgba(0, 255, 204, 0.5), inset 0 2px 4px rgba(0, 0, 0, 0.2);
            background: rgba(255, 255, 255, 0.1);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
        }

        /* Cart Section */
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

        /* Payment Method */
        .form-check {
            margin-bottom: 20px;
            padding-left: 35px;
        }

        .form-check-input {
            width: 22px;
            height: 22px;
            margin-top: 2px;
            transition: all 0.3s ease;
            border: 2px solid rgba(255, 255, 255, 0.2);
            background: transparent;
        }

        .form-check-input:checked {
            background-color: #00ffcc;
            border-color: #00ffcc;
            box-shadow: 0 0 10px rgba(0, 255, 204, 0.6);
        }

        .form-check-label {
            font-size: 16px;
            color: #fff;
            font-weight: 500;
            margin-left: 10px;
            opacity: 0.9;
        }

        /* Buttons */
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

        /* Footer */
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

            <a href="/orderpage" class="payment">
                <i class="bi bi-cart-fill"></i>
                <span>Thanh toán</span>
            </a>
        </div>
    </div>
</header>

<!-- Nội dung chính -->
<div class="container">
    <form action="orderDetails?action=create" method="post" onsubmit="return confirmOrder()">
        <div class="checkout-container">
            <!-- Left Section (Form Thông Tin) -->
            <div class="left-section">
                <h4>Thông tin giao hàng</h4>
                <div class="mb-3">
                    <label class="form-label">Họ tên *</label>
                    <input type="text" class="form-control" name="fullName" required>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Email *</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Số điện thoại *</label>
                        <input type="text" class="form-control" name="phoneNumber" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Tỉnh/Thành phố *</label>
                        <input type="text" class="form-control" name="provinceCity" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Quận/Huyện *</label>
                        <input type="text" class="form-control" name="district" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Phường/Xã/Thị trấn *</label>
                        <input type="text" class="form-control" name="ward" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Số nhà, Tên đường</label>
                        <input type="text" class="form-control" name="street">
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ghi chú</label>
                    <textarea class="form-control" name="noteOrder" rows="3"></textarea>
                </div>
            </div>

            <!-- Right Section (Giỏ Hàng và Thanh Toán) -->
            <div class="right-section">
                <h4>Giỏ hàng & Thanh toán</h4>
                <% if (cart != null && !cart.isEmpty()) { %>
                <% for (Book book : cart) { %>
                <div class="cart-card">
                    <div class="d-flex align-items-center">
                        <img src="<%= book.getImageURL() != null ? book.getImageURL() : "https://via.placeholder.com/180" %>" alt="Sản phẩm" class="img-fluid">
                        <div class="card-body">
                            <h5><%= book.getTitle() != null ? book.getTitle() : "Không có tiêu đề" %></h5>
                            <p><strong>Giá sách: </strong>
                                <fmt:formatNumber value="<%= book.getPrice() %>" type="number" pattern="#,##0"/> VNĐ
                            </p>
                            <p><strong>Trọng lượng:</strong> 300g</p>
                        </div>
                    </div>
                </div>
                <% } %>
                <% } else { %>
                <p style="color: rgba(255, 255, 255, 0.6);">Giỏ hàng trống.</p>
                <% } %>
                <div class="cart-card">
                    <div class="card-footer">
                        <p class="total-price">Tổng giá (bao gồm vận chuyển 30,000 VNĐ):
                            <fmt:formatNumber value="<%= totalPrice %>" type="number" pattern="#,##0"/> VNĐ
                        </p>
                    </div>
                </div>

                <input type="hidden" name="bookIds" value="<%= String.join(",", cart.stream().map(b -> String.valueOf(b.getId())).toArray(String[]::new)) %>">
                <input type="hidden" name="total_price" value="<%= totalPrice %>">

                <h4>Phương thức thanh toán</h4>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMethod" value="Thanh toán khi nhận hàng" id="cod" checked>
                    <label class="form-check-label" for="cod">Thanh toán khi nhận hàng</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMethod" value="Chuyển khoản qua ATM/Internet Banking" id="bankTransfer">
                    <label class="form-check-label" for="bankTransfer">Chuyển khoản qua ATM/Internet Banking</label>
                </div>

                <div class="mt-5 d-flex justify-content-center gap-4">
                    <a href="/book" class="btn btn-secondary">Quay lại</a>
                    <button type="submit" class="btn btn-primary">Thanh toán</button>
                </div>
            </div>
        </div>
    </form>
</div>

<footer>
    <p>© 2025 Nhà sách Việt. All Rights Reserved.</p>
</footer>

<script>
    // Hàm toggle dropdown
    function toggleDropdown(event) {
        event.preventDefault();
        const dropdown = event.target.nextElementSibling;
        dropdown.classList.toggle("show");
    }

    // Đóng dropdown khi click ra ngoài
    document.addEventListener("click", function(event) {
        const dropdowns = document.getElementsByClassName("dropdown-menu");
        for (let i = 0; i < dropdowns.length; i++) {
            const openDropdown = dropdowns[i];
            if (!openDropdown.contains(event.target) && event.target.className !== "manage") {
                openDropdown.classList.remove("show");
            }
        }
    });

    // Xác nhận đơn hàng
    function confirmOrder() {
        alert("Đặt hàng thành công! Cảm ơn bạn đã mua hàng.");
        return true;
    }
</script>
</body>
</html>