<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.OrderDetail" %>

<%@ page import="service.impl.OrderDetail.OrderDetailService" %>
<%@ page import="model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  OrderDetailService orderDetailService = new OrderDetailService(repository.connection.DBRepository.getConnection());
  List<OrderDetail> orderDetails = orderDetailService.getAll();
  request.setAttribute("orderDetails", orderDetails);
%>


<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Quản Lý Chi Tiết Đơn Hàng</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <style>
    body { font-family: Arial, sans-serif; background-color: #f8f9fa; }
    .container { margin-top: 30px; }
    .table th, .table td { text-align: center; vertical-align: middle; }
    .status-processing { color: #ffc107; font-weight: bold; }
    .status-delivered { color: #28a745; font-weight: bold; }
    .status-cancelled { color: #dc3545; font-weight: bold; }
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


<div class="container">
  <h2 class="text-center text-primary">Quản Lý Chi Tiết Đơn Hàng</h2>
  <div class="card shadow p-4">
    <div class="row mb-3">
      <div class="col-md-6">
        <input type="text" id="searchInput" class="form-control" placeholder="Tìm kiếm theo tên khách hàng...">
      </div>
      <div class="col-md-3">
        <select id="statusFilter" class="form-select">
          <option value="">-- Lọc theo trạng thái --</option>
          <option value="Đang xử lý">Đang xử lý</option>
          <option value="Đã xử lý">Đã xử lý</option>
        </select>
      </div>
    </div>

    <table class="table table-striped table-bordered">
      <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Book ID</th>
        <th>Khách Hàng</th>
        <th>Email</th>
        <th>Số Điện Thoại</th>
        <th>Địa Chỉ</th>
        <th>Ghi chú</th>
        <th>Giá</th>
        <th>Phương Thức Thanh Toán</th>
        <th>Trạng Thái</th>
        <th>Hành Động</th>
      </tr>
      </thead>
      <tbody id="orderTable">
      <c:forEach var="orderDetail" items="${orderDetails}">
        <tr>
          <td>${orderDetail.id}</td>
          <td>${orderDetail.bookId}</td>
          <td>${orderDetail.fullName}</td>
          <td>${orderDetail.email}</td>
          <td>${orderDetail.phoneNumber}</td>
          <td>
              ${orderDetail.street}, ${orderDetail.ward}, ${orderDetail.district}, ${orderDetail.provinceCity}
          </td>
          <td>${orderDetail.noteOrder}</td>
          <td>${orderDetail.price}</td>
          <td>${orderDetail.paymentMethod}</td>
          <td>
            <span class="${orderDetail.status eq 'Đang xử lý' ? 'status-processing'
                          : (orderDetail.status eq 'Đã xử lý ' ? 'status-delivered'
                          : 'status-cancelled')}">
                ${orderDetail.status}
            </span>
          </td>
          <td>
            <button class="btn btn-warning btn-sm editBtn">
                <a href="orderDetails?action=edit&id=${orderDetail.id}" class="btn btn-warning btn-sm">
                  Sửa
                </a>
            </button>

            <a href="orderDetails?action=delete&id=${orderDetail.id}" class="btn btn-danger btn-sm"
               onclick="return confirm('Bạn có chắc chắn muốn xóa chi tiết đơn hàng này?')">
              Xóa
            </a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>


</body>
<script>
  function toggleDropdown() {
    var menu = document.querySelector(".dropdown-menu");
    menu.classList.toggle("show");
  }
</script>
</html>
