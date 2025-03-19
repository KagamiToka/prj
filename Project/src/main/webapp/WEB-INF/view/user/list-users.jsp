<%@ page import="model.User, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
  List<User> users = (List<User>) request.getAttribute("users");
  String searchQuery = (String) request.getAttribute("searchQuery");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Danh sách người dùng</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>




<!-- Form tìm kiếm -->
<!-- Form tìm kiếm với class để áp dụng CSS -->


<!-- Nhúng Font Awesome để có icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<!-- CSS ngay bên dưới -->
<style>
  /* Ô tìm kiếm */
  .search-bar {
    display: flex;
    align-items: center;
    border-radius: 5px;
    overflow: hidden;
    background-color: #FFA500;
    max-width: 500px;
    margin: auto;
    padding: 5px;
  }

  .search-input {
    flex: 1;
    padding: 10px 15px;
    border: none;
    outline: none;
    font-size: 14px;
    background-color: #fff;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
  }

  .search-btn {
    background-color: #FFA500;
    border: none;
    padding: 10px 15px;
    color: white;
    cursor: pointer;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
  }

  .search-btn i {
    font-size: 18px;
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
<body style="background-color: #f8f9fa;">

<header class="custom-header">
  <div class="container1">
    <!-- Logo -->
    <div>
      <a href="/book">
        <img src="https://beedesign.com.vn/wp-content/uploads/2020/08/logo-nha-sach-Viet.jpg" alt="Logo" class="header-logo">
      </a>
    </div>

    <!-- Ô tìm kiếm -->
    <form class="search-bar" action="users" method="get">
      <input class="search-input" type="text" name="search" placeholder="Nhập tên người dùng..."
             value="<%= searchQuery != null ? searchQuery : "" %>">
      <button class="search-btn" type="submit">
        <i class="fas fa-search"></i> <!-- Icon tìm kiếm -->
      </button>
    </form>

    <!-- Các nút bên phải -->
    <div class="header-right">
      <c:if test="${empty sessionScope.user}">
        <a href="/login" class="header-account">
          <i class="bi bi-person-fill"></i>
          <span>Tài khoản</span>
        </a>
      </c:if>

      <c:if test="${not empty sessionScope.user}">
        <a href="/logout" class="header-account">
          <i class="bi bi-box-arrow-right"></i>
          <span>Đăng xuất</span>
        </a>
      </c:if>

      <c:if test="${sessionScope.roleId == 1}">
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
      </c:if>


      <a href="/orderpage" class="payment">
        <i class="bi bi-cart-fill"></i>
        <span>Thanh toán</span>
      </a>
    </div>
  </div>
</header>
<h2 class="text-center">Danh sách Người Dùng</h2>
<table class="table table-bordered">
  <thead class="table-dark">
  <tr>
    <th>ID</th>
    <th>Username</th>
    <th>Email</th>
    <th>Role ID</th>
    <th>Trạng thái</th> <!-- Thêm cột trạng thái -->
    <th>Hành động</th>
  </tr>
  </thead>
  <tbody>
  <% for (User u : users) { %>
  <tr>
    <td><%= u.getId() %></td>
    <td><%= u.getUsername() %></td>
    <td><%= u.getEmail() %></td>
    <td><%= u.getRoleId() %></td>
    <td>
      <% if (u.getStatus() == 1) { %>
      <span class="badge bg-success">Hoạt động</span>
      <% } else { %>
      <span class="badge bg-danger">Bị ẩn</span>
      <% } %>
    </td>
    <td>
      <button class="btn btn-warning btn-sm" onclick="openEditModal(<%= u.getId() %>, '<%= u.getUsername() %>', '<%= u.getEmail() %>', <%= u.getRoleId() %>)">
        Sửa
      </button>
      <form action="users" method="post" class="d-inline">
        <input type="hidden" name="id" value="<%= u.getId() %>">
        <input type="hidden" name="action" value="delete">
        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn ẩn người dùng này?')">Ẩn</button>
      </form>
    </td>
  </tr>
  <% } %>
  </tbody>

</table>

<!-- Modal chỉnh sửa -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editModalLabel">Chỉnh sửa Người Dùng</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="editForm" action="users" method="post">
          <input type="hidden" name="id" id="editUserId">
          <input type="hidden" name="action" value="edit">

          <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" class="form-control" name="username" id="editUsername" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" id="editEmail" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Role ID</label>
            <input type="number" class="form-control" name="role_id" id="editRoleId" required>
          </div>
          <button type="submit" class="btn btn-success">Lưu thay đổi</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Script Bootstrap & Modal -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function openEditModal(id, username, email, roleId) {
    document.getElementById("editUserId").value = id;
    document.getElementById("editUsername").value = username;
    document.getElementById("editEmail").value = email;
    document.getElementById("editRoleId").value = roleId;

    var editModal = new bootstrap.Modal(document.getElementById("editModal"));
    editModal.show();
  }
  function toggleDropdown() {
    var menu = document.querySelector(".dropdown-menu");
    menu.classList.toggle("show");
  }
</script>

</body>
</html>