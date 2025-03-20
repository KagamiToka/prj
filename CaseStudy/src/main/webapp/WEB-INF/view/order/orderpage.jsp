<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
            background: rgba(255, 255, 250, 0.1);
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

        .order-card {
            background: linear-gradient(135deg, rgba(26, 26, 46, 0.9), rgba(22, 33, 62, 0.9));
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            position: relative;
            overflow: hidden;
            transition: all 0.4s ease;
            border: 1px solid rgba(0, 255, 204, 0.1);
        }

        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 255, 204, 0.3);
        }

        .order-card h4 {
            font-size: 28px;
            font-weight: 600;
            color: #ff00ff;
            margin-bottom: 20px;
            text-align: center;
        }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .cart-item img {
            width: 80px;
            height: 100px;
            object-fit: cover;
            margin-right: 20px;
            border-radius: 8px;
        }

        .cart-item-details {
            flex: 1;
        }

        .cart-item-details h5 {
            font-size: 18px;
            margin-bottom: 5px;
            color: #00ffcc;
        }

        .cart-item-details p {
            margin: 0;
            color: rgba(255, 255, 255, 0.8);
        }

        .form-label {
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff;
            padding: 12px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background: rgba(255, 255, 194, 0.1);
            border-color: #00ffcc;
            box-shadow: 0 0 10px rgba(0, 255, 204, 0.3);
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .btn-primary {
            background: linear-gradient(135deg, #00ffcc, #ff00ff);
            border: none;
            padding: 15px 35px;
            font-weight: 600;
            border-radius: 12px;
            transition: all 0.4s ease;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-size: 16px;
            color: #fff;
            filter: drop-shadow(0 0 10px #00ffcc);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #ff00ff, #ff1493);
            transform: translateY(-3px);
            box-shadow: 0 6px 25px rgba(0, 255, 204, 0.4);
            filter: drop-shadow(0 0 15px #ff00ff);
        }

        .btn-secondary {
            background: #6c757d;
            border: none;
            padding: 15px 35px;
            font-weight: 600;
            border-radius: 12px;
            transition: all 0.4s ease;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-size: 16px;
            color: #fff;
        }

        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(108, 117, 125, 0.3);
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

        .error-message {
            color: #ff4444;
            text-align: center;
            margin-bottom: 20px;
        }

        .debug-message {
            color: #00ffcc;
            text-align: center;
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
    <div class="order-card">
        <h4>Thông tin thanh toán</h4>

        <!-- Debug: Kiểm tra trạng thái của cart -->
        <p class="debug-message">Debug: sessionScope.cart is <c:out value="${sessionScope.cart != null ? 'not null' : 'null'}"/></p>
        <c:if test="${empty sessionScope.cart}">
            <p class="error-message">Giỏ hàng của bạn đang trống. Vui lòng thêm sách vào giỏ hàng trước khi thanh toán.</p>
        </c:if>

        <!-- Bắt lỗi trong toàn bộ phần render -->
        <c:catch var="renderException">
            <!-- Tính tổng giá -->
            <c:set var="totalPrice" value="0.0"/>
            <c:if test="${not empty sessionScope.cart}">
                <p class="debug-message">Debug: Bắt đầu tính totalPrice</p>
                <c:forEach var="item" items="${sessionScope.cart}">
                    <c:if test="${item.book != null and item.book.price != 0.0}">
                        <c:set var="totalPrice" value="${totalPrice + (item.book.price * item.quantity * 1000)}"/>
                    </c:if>
                </c:forEach>
                <c:set var="totalPrice" value="${totalPrice + 30000}"/> <!-- Phí vận chuyển 30,000 VNĐ -->
                <p class="debug-message">Debug: totalPrice = <fmt:formatNumber value="${totalPrice}" type="number" pattern="#,##0.###"/> VNĐ</p>
            </c:if>

            <div class="row">
                <!-- Cột bên trái: Hiển thị danh sách các mục hàng -->
                <div class="col-md-6">
                    <h5 class="text-center" style="color: #00ffcc;">Danh sách mục hàng</h5>
                    <div class="cart-items">
                        <c:choose>
                            <c:when test="${not empty sessionScope.cart}">
                                <p class="debug-message">Debug: Bắt đầu hiển thị danh sách mục hàng</p>
                                <c:forEach var="item" items="${sessionScope.cart}">
                                    <c:if test="${item.book != null}">
                                        <div class="cart-item">
                                            <img src="${item.book.imageURL != null ? item.book.imageURL : 'https://via.placeholder.com/80x100'}" alt="Book Image">
                                            <div class="cart-item-details">
                                                <h5>${item.book.title != null ? item.book.title : 'Không có tiêu đề'}</h5>
                                                <p>Số lượng: ${item.quantity}</p>
                                                <p>Giá: <fmt:formatNumber value="${item.book.price * item.quantity * 1000}" type="number" pattern="#,##0.###"/> VNĐ</p>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="text-center">Giỏ hàng của bạn đang trống.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Cột bên phải: Form nhập thông tin giao hàng -->
                <div class="col-md-6">
                    <p class="debug-message">Debug: Bắt đầu hiển thị form nhập thông tin</p>
                    <form action="/orderDetails" method="post">
                        <input type="hidden" name="action" value="create">
                        <input type="hidden" name="total_price" value="${totalPrice}">
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label for="fullName" class="form-label">Họ và tên</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Nhập họ và tên" required>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label for="phoneNumber" class="form-label">Số điện thoại</label>
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Nhập số điện thoại" required>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label for="provinceCity" class="form-label">Tỉnh/Thành phố</label>
                                <input type="text" class="form-control" id="provinceCity" name="provinceCity" placeholder="Nhập tỉnh/thành phố" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label for="district" class="form-label">Quận/Huyện</label>
                                <input type="text" class="form-control" id="district" name="district" placeholder="Nhập quận/huyện" required>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label for="ward" class="form-label">Phường/Xã</label>
                                <input type="text" class="form-control" id="ward" name="ward" placeholder="Nhập phường/xã" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="street" class="form-label">Đường</label>
                            <input type="text" class="form-control" id="street" name="street" placeholder="Nhập tên đường" required>
                        </div>
                        <div class="mb-3">
                            <label for="noteOrder" class="form-label">Ghi chú đơn hàng</label>
                            <textarea class="form-control" id="noteOrder" name="noteOrder" rows="3" placeholder="Ghi chú (nếu có)"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="paymentMethod" class="form-label">Phương thức thanh toán</label>
                            <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                                <option value="COD">Thanh toán khi nhận hàng (COD)</option>
                                <option value="BankTransfer">Chuyển khoản ngân hàng</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tổng giá (bao gồm vận chuyển 30,000 VNĐ):</label>
                            <p class="text-info">
                                <fmt:formatNumber value="${totalPrice}" type="number" pattern="#,##0.###"/> VNĐ
                            </p>
                        </div>
                        <div class="d-flex justify-content-center gap-4">
                            <a href="/cart" class="btn btn-secondary">Quay lại</a>
                            <button type="submit" class="btn btn-primary" <c:if test="${empty sessionScope.cart}">disabled</c:if>>Thanh toán</button>
                        </div>
                    </form>
                </div>
            </div>
        </c:catch>

        <!-- Hiển thị lỗi nếu có -->
        <c:if test="${not empty renderException}">
            <p class="error-message">Đã xảy ra lỗi khi render trang: <c:out value="${renderException.message}"/></p>
        </c:if>
    </div>
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