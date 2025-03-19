<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: DacHaiPham
  Date: 2/13/2025
  Time: 7:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String idParam = request.getParameter("id");
    int bookId = 0; // Giá trị mặc định nếu id bị null

    if (idParam != null && !idParam.isEmpty()) {
        try {
            bookId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            bookId = 0; // Nếu lỗi, giữ giá trị mặc định
        }
    }

    Book book = new Book();
    book.setId(bookId);
    book.setImageURL(request.getParameter("imageURL"));
    book.setTitle(request.getParameter("title"));

    String priceParam = request.getParameter("price");
    double bookPrice = 0.0; // Giá mặc định
    if (priceParam != null && !priceParam.isEmpty()) {
        try {
            bookPrice = Double.parseDouble(priceParam);
        } catch (NumberFormatException e) {
            bookPrice = 0.0;
        }
    }
    book.setPrice(bookPrice);
%>

<!DOCTYPE html>
<html lang="vi">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>


    <style>

        /*body {*/
        /*    padding-top: 70px; !* Tạo khoảng trống để tránh navbar che mất nội dung *!*/
        /*}*/

        /* Màu chủ đạo */
        .navbar, footer {
            background-color: #ff7f00 !important; /* Màu cam */
        }

        .navbar .nav-link {
            color: white !important;
        }

        .navbar .nav-link:hover {
            color: #ffd700 !important; /* Màu vàng nhạt */
        }

        .btn-danger {
            background-color: #ff7f00 !important; /* Màu cam */
            border-color: #ff7f00 !important;
        }

        .btn-danger:hover {
            background-color: #e67300 !important; /* Màu cam đậm */
            border-color: #e67300 !important;
        }

        .card {
            border-color: #ff7f00 !important;
        }

        h4, h5 {
            color: #ff7f00 !important;
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

        .payment {
            display: flex;
            flex-direction: column;
            align-items: center;
            color: orange;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .payment i {
            font-size: 24px; /* Kích thước biểu tượng */
            margin-bottom: 5px; /* Khoảng cách giữa icon và chữ */
        }

        .payment:hover {
            color: darkorange; /* Màu cam đậm khi hover */
        }
        /* Điều chỉnh chiều rộng ảnh */
        .card img {
            max-width: 100px; /* Giới hạn chiều rộng ảnh */
            height: auto;
            margin-right: 15px;
            border-radius: 5px;
        }

        /* Bố cục giỏ hàng */
        .card {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border: 2px solid #ff7f00;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .card-body {
            flex-grow: 1;
            padding-left: 10px;
        }

        .card-body h5 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-body p {
            font-size: 14px;
            margin-bottom: 5px;
        }

        .card-footer {
            display: flex;
            justify-content: flex-end;
            font-size: 14px;
            font-weight: bold;
            color: #ff7f00;
        }

        .card-footer .total-price {
            font-size: 16px;
        }
        .custom-header {
            background-color: white;
            padding: 10px 0;
            border-bottom: 2px ;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
        .payment {
            display: flex;
            flex-direction: column;
            align-items: center;
            color: orange;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }
        .payment i {
            font-size: 24px; /* Kích thước biểu tượng */
            margin-bottom: 5px; /* Khoảng cách giữa icon và chữ */
        }

        .payment:hover {
            color: darkorange; /* Màu cam đậm khi hover */
        }
        .custom-header {
            background-color: white;
            padding: 10px 0;
            border-bottom: 2px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .container1 {
            max-width: 1200px;
            margin: auto;
            display: flex; /* Dùng Flexbox */
            align-items: center; /* Căn giữa theo chiều dọc */
            justify-content: space-between; /* Dàn đều các phần tử */
            padding: 0 20px;
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
            flex-grow: 1; /* Cho phép mở rộng */
            margin: 0 20px; /* Tạo khoảng cách giữa logo và các nút bên phải */
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

        /* Các nút bên phải */
        .header-right {
            display: flex;
            align-items: center;
            gap: 30px; /* Khoảng cách giữa các nút */
        }

        .header-account,
        .payment,
        .manage {
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            color: #FFA500;
            transition: color 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .header-account i,
        .payment i,
        .manage i {
            font-size: 24px;
            margin-bottom: 5px;
        }

        .header-account:hover,
        .payment:hover,
        .manage:hover {
            color: #FF8C00;
        }
        /* Định dạng dropdown */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            background-color: #fff;
            min-width: 180px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            padding: 10px 0;
        }

        .dropdown-menu a {
            display: block;
            padding: 10px 15px;
            text-decoration: none;
            color: #333;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }

        /* Khi mở dropdown */
        .show {
            display: block;
        }

    </style>

</head>
<body>

<!-- Thanh Navbar -->
<header class="custom-header">
    <div class="container1">
        <!-- Logo -->
        <div>
            <a href="/book">
                <img src="https://beedesign.com.vn/wp-content/uploads/2020/08/logo-nha-sach-Viet.jpg" alt="Logo" class="header-logo">
            </a>
        </div>

        <!-- Ô tìm kiếm -->
        <form action="/book" method="GET" class="search-bar">
            <input type="hidden" name="type" value="title">
            <input type="text" class="search-input" name="query" placeholder="Tìm kiếm sách theo tên...">
            <button type="submit" class="search-btn">
                <i class="bi bi-search"></i>
            </button>
        </form>

        <!-- Các nút bên phải -->
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
                <a href="#" class="manage" onclick="toggleDropdown()">
                    <i class="bi bi-person-lines-fill"></i>
                    <span>Quản lý</span>
                </a>
                <div class="dropdown-menu">
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
<div class="container mt-4">
    <form action="orderDetails?action=create" method="post" onsubmit="return confirmOrder()">
    <div class="row">
            <!-- Địa chỉ giao hàng (bên trái) -->
            <div class="col-md-8">
                <h4>Địa chỉ giao hàng</h4>
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

            <!-- Giỏ hàng (bên phải) -->
            <div class="col-md-4">
                <h4>Giỏ hàng</h4>
                <div class="card p-3">
                    <div class="d-flex">
                        <img src="<%= book.getImageURL() %>" alt="Sản phẩm" class="card-img-top">
                        <div class="card-body">
                            <h5><%= book.getTitle() %></h5>
                            <p><strong>Giá sách: </strong>
                                <fmt:formatNumber value="${book.price}" type="number" pattern="#,##0.000"/> VNĐ

                            </p>
                            <input type="hidden" name="total_price" value="${book.price + 30.000}">VND
                            <p><strong>Trọng lượng:</strong> 300g</p>
                            <p><strong>Vận chuyển:</strong> 30,000 VNĐ</p>
                        </div>
                    </div>
                    <div class="card-footer">
                        <p class="total-price">Tổng giá:
                            <fmt:formatNumber value="${book.price + 30.000}" type="number" pattern="#,##0.000" />

                        </p>
                    </div>
                </div>

                <input type="hidden" name="bookId" value="${book.id}">

                <!-- Phương thức thanh toán -->
                <h4>Phương thức thanh toán</h4>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMethod" value="Thanh toán khi nhận hàng" id="cod" checked>
                    <label class="form-check-label" for="cod">Thanh toán khi nhận hàng</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMethod" value="Chuyển khoản qua ATM/Internet Banking" id="bankTransfer">
                    <label class="form-check-label" for="bankTransfer">Chuyển khoản qua ATM/Internet Banking</label>
                </div>
            </div>
        </div>

        <!-- Nút thao tác -->
        <div class="mt-4 d-flex justify-content-center gap-4">
            <button type="button" class="btn btn-secondary">Quay lại</button>
            <button type="submit" class="btn btn-danger">Thanh toán</button>
        </div>
    </form>
</div>
<footer class="bg-light text-center py-3 mt-4">
    <p class="mb-0">© 2024 Cửa hàng của bạn. All Rights Reserved.</p>
</footer>

<script>
    function toggleDropdown() {
        var menu = document.querySelector(".dropdown-menu");
        menu.classList.toggle("show");
    }
    function confirmOrder() {
        alert("Đặt hàng thành công! Cảm ơn bạn đã mua hàng.");
        return true; // Cho phép form tiếp tục submit
    }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
