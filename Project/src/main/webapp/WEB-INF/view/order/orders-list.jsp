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
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #f1f3f5, #e9ecef);
      min-height: 100vh;
      padding-top: 80px;
      position: relative;
    }

    /* Header VIP */
    .custom-header {
      background: linear-gradient(90deg, #FFA500, #FF8C00);
      padding: 10px 0;
      border-bottom: 2px solid #fff;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 1000;
    }

    .container1 {
      max-width: 1200px;
      margin: auto;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 20px;
    }

    .header-logo {
      height: 50px;
      transition: transform 0.3s ease;
    }

    .header-logo:hover {
      transform: scale(1.1);
    }

    /* Search Bar */
    .search-bar {
      display: flex;
      align-items: center;
      border: 2px solid #fff;
      border-radius: 25px;
      overflow: hidden;
      background: rgba(255, 255, 255, 0.9);
      max-width: 400px;
      flex-grow: 1;
      margin: 0 20px;
      transition: all 0.3s ease;
    }

    .search-bar:hover {
      box-shadow: 0 0 10px rgba(255, 165, 0, 0.3);
    }

    .search-input {
      flex: 1;
      padding: 10px 15px;
      border: none;
      outline: none;
      font-size: 14px;
      color: #333;
    }

    .search-input::placeholder {
      color: #666;
    }

    .search-btn {
      background: #FFA500;
      border: none;
      padding: 10px 15px;
      color: #fff;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .search-btn:hover {
      background: #FF8C00;
    }

    .search-btn i {
      font-size: 18px;
    }

    /* Header Right */
    .header-right {
      display: flex;
      align-items: center;
      gap: 25px;
    }

    .header-account, .payment, .manage {
      text-decoration: none;
      font-size: 14px;
      font-weight: 500;
      color: #fff;
      transition: color 0.3s ease;
      display: flex;
      flex-direction: column;
      align-items: center;
      position: relative;
    }

    .header-account i, .payment i, .manage i {
      font-size: 22px;
      margin-bottom: 5px;
    }

    .header-account:hover, .payment:hover, .manage:hover {
      color: #FF8C00;
    }

    /* Dropdown */
    .dropdown {
      position: relative;
    }

    .dropdown-menu {
      display: none;
      position: absolute;
      background-color: #fff;
      min-width: 180px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      padding: 10px 0;
      top: 100%;
      right: 0;
      z-index: 1000;
      animation: fadeIn 0.2s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-5px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .dropdown-menu a {
      display: block;
      padding: 10px 15px;
      text-decoration: none;
      color: #333;
      font-weight: 500;
      transition: background 0.3s ease;
    }

    .dropdown-menu a:hover {
      background-color: #f8f9fa;
    }

    .dropdown-menu.show {
      display: block;
    }

    /* Main Content */
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    .card {
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      padding: 20px;
    }

    h2 {
      font-size: 28px;
      font-weight: 600;
      color: #FFA500;
      text-align: center;
      margin-bottom: 20px;
    }

    /* Filter and Search */
    .filter-row {
      display: flex;
      gap: 15px;
      margin-bottom: 20px;
    }

    #searchInput, #statusFilter {
      border-radius: 8px;
      border: 1px solid #ddd;
      transition: border-color 0.3s ease;
    }

    #searchInput:focus, #statusFilter:focus {
      border-color: #FFA500;
      box-shadow: 0 0 5px rgba(255, 165, 0, 0.3);
    }

    /* Table */
    .table {
      border-radius: 10px;
      overflow: hidden;
    }

    .table thead {
      background: linear-gradient(90deg, #FFA500, #FF8C00);
      color: #fff;
    }

    .table th {
      font-weight: 600;
      padding: 12px;
    }

    .table td {
      padding: 12px;
      vertical-align: middle;
    }

    .table-hover tbody tr:hover {
      background-color: #f8f9fa;
      transition: background-color 0.2s ease;
    }

    .status-processing { color: #ffc107; font-weight: bold; }
    .status-delivered { color: #28a745; font-weight: bold; }
    .status-cancelled { color: #dc3545; font-weight: bold; }

    /* Buttons */
    .btn-warning, .btn-danger {
      padding: 5px 10px;
      font-weight: 500;
      transition: all 0.3s ease;
    }

    .btn-warning:hover {
      background-color: #FF8C00;
      color: #fff;
    }

    .btn-danger:hover {
      background-color: #c82333;
      color: #fff;
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

<div class="container">
  <h2>Quản Lý Chi Tiết Đơn Hàng</h2>
  <div class="card">
    <div class="filter-row">
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

    <table class="table table-striped table-hover table-bordered">
      <thead>
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
                                : (orderDetail.status eq 'Đã xử lý' ? 'status-delivered'
                                : 'status-cancelled')}">
                            ${orderDetail.status}
                        </span>
          </td>
          <td>
            <a href="orderDetails?action=edit&id=${orderDetail.id}" class="btn btn-warning btn-sm">
              Sửa
            </a>
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

  // Lọc và tìm kiếm
  document.getElementById("searchInput").addEventListener("input", filterTable);
  document.getElementById("statusFilter").addEventListener("change", filterTable);

  function filterTable() {
    const input = document.getElementById("searchInput").value.toLowerCase();
    const status = document.getElementById("statusFilter").value;
    const table = document.getElementById("orderTable");
    const tr = table.getElementsByTagName("tr");

    for (let i = 0; i < tr.length; i++) {
      const tdName = tr[i].getElementsByTagName("td")[2]; // Cột Khách Hàng
      const tdStatus = tr[i].getElementsByTagName("td")[9]; // Cột Trạng Thái
      if (tdName) {
        const nameText = tdName.textContent.toLowerCase();
        const statusText = tdStatus.textContent || tdStatus.innerText;
        if ((input === "" || nameText.includes(input)) &&
                (status === "" || statusText.includes(status))) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  }
</script>
</body>
</html>