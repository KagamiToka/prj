<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<%--<%--%>
<%--  java.util.List<model.User> users = (java.util.List<model.User>) request.getAttribute("users");--%>
<%--  String searchQuery = (String) request.getAttribute("searchQuery");--%>
<%--  if (users == null) {--%>
<%--    users = new java.util.ArrayList<>();--%>
<%--  }--%>
<%--  pageContext.setAttribute("usersList", users);--%>
<%--%>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="vi">--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--  <title>Danh sách người dùng - Fahasa Library</title>--%>
<%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">--%>
<%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">--%>
<%--  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">--%>
<%--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--  <style>--%>
<%--    body {--%>
<%--      font-family: 'Poppins', sans-serif;--%>
<%--      background: linear-gradient(135deg, #f5f7fa, #c3cfe2);--%>
<%--      min-height: 100vh;--%>
<%--      padding-top: 80px;--%>
<%--    }--%>

<%--    /* Header */--%>
<%--    .custom-header {--%>
<%--      background: #fff;--%>
<%--      padding: 15px 0;--%>
<%--      border-bottom: 2px solid #ff6f61;--%>
<%--      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);--%>
<%--      position: fixed;--%>
<%--      top: 0;--%>
<%--      width: 100%;--%>
<%--      z-index: 1000;--%>
<%--    }--%>

<%--    .header-container {--%>
<%--      max-width: 1300px;--%>
<%--      margin: 0 auto;--%>
<%--      display: flex;--%>
<%--      align-items: center;--%>
<%--      justify-content: space-between;--%>
<%--      padding: 0 20px;--%>
<%--    }--%>

<%--    .header-logo {--%>
<%--      height: 50px;--%>
<%--      transition: transform 0.3s ease;--%>
<%--    }--%>

<%--    .header-logo:hover {--%>
<%--      transform: scale(1.05);--%>
<%--    }--%>

<%--    .search-bar {--%>
<%--      flex-grow: 1;--%>
<%--      max-width: 500px;--%>
<%--      display: flex;--%>
<%--      border: 2px solid #ff6f61;--%>
<%--      border-radius: 25px;--%>
<%--      overflow: hidden;--%>
<%--      margin: 0 20px;--%>
<%--      transition: box-shadow 0.3s ease;--%>
<%--    }--%>

<%--    .search-bar:hover {--%>
<%--      box-shadow: 0 0 10px rgba(255, 111, 97, 0.3);--%>
<%--    }--%>

<%--    .search-input {--%>
<%--      flex: 1;--%>
<%--      padding: 10px 15px;--%>
<%--      border: none;--%>
<%--      outline: none;--%>
<%--      font-size: 14px;--%>
<%--      background: #f9f9f9;--%>
<%--    }--%>

<%--    .search-btn {--%>
<%--      background: #ff6f61;--%>
<%--      border: none;--%>
<%--      padding: 10px 20px;--%>
<%--      color: #fff;--%>
<%--      transition: background 0.3s ease;--%>
<%--    }--%>

<%--    .search-btn:hover {--%>
<%--      background: #e65b50;--%>
<%--    }--%>

<%--    .header-right a {--%>
<%--      color: #ff6f61;--%>
<%--      font-weight: 500;--%>
<%--      text-decoration: none;--%>
<%--      margin-left: 20px;--%>
<%--      display: flex;--%>
<%--      align-items: center;--%>
<%--      transition: color 0.3s ease;--%>
<%--    }--%>

<%--    .header-right a i {--%>
<%--      margin-right: 5px;--%>
<%--    }--%>

<%--    .header-right a:hover {--%>
<%--      color: #e65b50;--%>
<%--    }--%>

<%--    /* Main Content */--%>
<%--    .main-container {--%>
<%--      max-width: 1300px;--%>
<%--      margin: 30px auto;--%>
<%--      padding: 0 20px;--%>
<%--    }--%>

<%--    .page-title {--%>
<%--      font-size: 32px;--%>
<%--      font-weight: 600;--%>
<%--      color: #ff6f61;--%>
<%--      text-align: center;--%>
<%--      margin-bottom: 30px;--%>
<%--      text-transform: uppercase;--%>
<%--      letter-spacing: 1px;--%>
<%--    }--%>

<%--    .table-container {--%>
<%--      background: #fff;--%>
<%--      border-radius: 15px;--%>
<%--      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);--%>
<%--      overflow: hidden;--%>
<%--    }--%>

<%--    .table {--%>
<%--      margin-bottom: 0;--%>
<%--    }--%>

<%--    .table thead {--%>
<%--      background: linear-gradient(135deg, #ff6f61, #e65b50);--%>
<%--      color: #fff;--%>
<%--    }--%>

<%--    .table th, .table td {--%>
<%--      padding: 15px;--%>
<%--      text-align: center;--%>
<%--      vertical-align: middle;--%>
<%--    }--%>

<%--    .table-hover tbody tr:hover {--%>
<%--      background: #f9f9f9;--%>
<%--      transition: background 0.2s ease;--%>
<%--    }--%>

<%--    .badge {--%>
<%--      font-size: 12px;--%>
<%--      padding: 6px 12px;--%>
<%--      border-radius: 12px;--%>
<%--    }--%>

<%--    .btn-action {--%>
<%--      padding: 6px 12px;--%>
<%--      font-size: 14px;--%>
<%--      border-radius: 8px;--%>
<%--      transition: transform 0.2s ease, background 0.2s ease;--%>
<%--    }--%>

<%--    .btn-action:hover {--%>
<%--      transform: scale(1.05);--%>
<%--    }--%>

<%--    /* Modal */--%>
<%--    .modal-content {--%>
<%--      border-radius: 15px;--%>
<%--      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);--%>
<%--    }--%>

<%--    .modal-header {--%>
<%--      background: #ff6f61;--%>
<%--      color: #fff;--%>
<%--      border-bottom: none;--%>
<%--    }--%>

<%--    .modal-title {--%>
<%--      font-weight: 600;--%>
<%--    }--%>

<%--    .modal-body {--%>
<%--      padding: 20px;--%>
<%--    }--%>

<%--    .form-label {--%>
<%--      font-weight: 500;--%>
<%--      color: #333;--%>
<%--    }--%>

<%--    .form-control {--%>
<%--      border-radius: 8px;--%>
<%--      border: 1px solid #ddd;--%>
<%--      transition: border-color 0.3s ease;--%>
<%--    }--%>

<%--    .form-control:focus {--%>
<%--      border-color: #ff6f61;--%>
<%--      box-shadow: 0 0 5px rgba(255, 111, 97, 0.3);--%>
<%--    }--%>

<%--    /* Responsive */--%>
<%--    @media (max-width: 768px) {--%>
<%--      .header-container {--%>
<%--        flex-direction: column;--%>
<%--        padding: 10px;--%>
<%--      }--%>

<%--      .search-bar {--%>
<%--        width: 100%;--%>
<%--        margin: 10px 0;--%>
<%--      }--%>

<%--      .header-right {--%>
<%--        margin-top: 10px;--%>
<%--      }--%>

<%--      .table th, .table td {--%>
<%--        font-size: 14px;--%>
<%--        padding: 10px;--%>
<%--      }--%>
<%--    }--%>
<%--  </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<!-- Header -->--%>
<%--<header class="custom-header">--%>
<%--  <div class="header-container">--%>
<%--    <a href="/book">--%>
<%--      <img src="https://th.bing.com/th/id/OIP.Q2amTWlPUanyIlSCtEcoSwHaFZ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Logo" class="header-logo">--%>
<%--    </a>--%>
<%--    <form class="search-bar" action="users" method="get">--%>
<%--      <input class="search-input" type="text" name="search" placeholder="Tìm kiếm người dùng..." value="<%= searchQuery != null ? searchQuery : "" %>">--%>
<%--      <button class="search-btn" type="submit"><i class="fas fa-search"></i></button>--%>
<%--    </form>--%>
<%--    <div class="header-right">--%>
<%--      <c:if test="${empty sessionScope.user}">--%>
<%--        <a href="/login"><i class="bi bi-person-fill"></i> Đăng nhập</a>--%>
<%--      </c:if>--%>
<%--      <c:if test="${not empty sessionScope.user}">--%>
<%--        <a href="/logout"><i class="bi bi-box-arrow-right"></i> Đăng xuất</a>--%>
<%--      </c:if>--%>
<%--      <c:if test="${sessionScope.roleId == 1}">--%>
<%--        <a href="/managementBook"><i class="bi bi-book"></i> Quản lý sách</a>--%>
<%--        <a href="/orderDetails"><i class="bi bi-cart"></i> Quản lý đơn hàng</a>--%>
<%--      </c:if>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</header>--%>

<%--<!-- Main Content -->--%>
<%--<div class="main-container">--%>
<%--  <h2 class="page-title">Danh sách người dùng</h2>--%>

<%--  <!-- Thông báo -->--%>
<%--  <c:if test="${not empty message}">--%>
<%--    <div class="alert alert-success alert-dismissible fade show" role="alert">--%>
<%--        ${message}--%>
<%--      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>--%>
<%--    </div>--%>
<%--  </c:if>--%>
<%--  <c:if test="${not empty error}">--%>
<%--    <div class="alert alert-danger alert-dismissible fade show" role="alert">--%>
<%--        ${error}--%>
<%--      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>--%>
<%--    </div>--%>
<%--  </c:if>--%>

<%--  <!-- Bảng danh sách -->--%>
<%--  <div class="table-container">--%>
<%--    <table class="table table-hover">--%>
<%--      <thead>--%>
<%--      <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>Tên người dùng</th>--%>
<%--        <th>Email</th>--%>
<%--        <th>Vai trò</th>--%>
<%--        <th>Trạng thái</th>--%>
<%--        <th>Hành động</th>--%>
<%--      </tr>--%>
<%--      </thead>--%>
<%--      <tbody>--%>
<%--      <c:if test="${empty usersList}">--%>
<%--        <tr>--%>
<%--          <td colspan="6" class="text-center text-muted py-4">Không có người dùng nào để hiển thị.</td>--%>
<%--        </tr>--%>
<%--      </c:if>--%>
<%--      <c:forEach var="u" items="${usersList}">--%>
<%--        <tr>--%>
<%--          <td>${u.id}</td>--%>
<%--          <td>${u.username}</td>--%>
<%--          <td>${u.email}</td>--%>
<%--          <td>${u.roleId == 1 ? 'Admin' : 'Người dùng'}</td>--%>
<%--          <td>--%>
<%--            <c:choose>--%>
<%--              <c:when test="${u.status == 1}">--%>
<%--                <span class="badge bg-success">Hoạt động</span>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <span class="badge bg-danger">Bị ẩn</span>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </td>--%>
<%--          <td>--%>
<%--            <button class="btn btn-warning btn-action" onclick="openEditModal(${u.id}, '${u.username}', '${u.email}', ${u.roleId})">--%>
<%--              <i class="fas fa-edit"></i> Sửa--%>
<%--            </button>--%>
<%--            <form action="users" method="post" class="d-inline">--%>
<%--              <input type="hidden" name="id" value="${u.id}">--%>
<%--              <input type="hidden" name="action" value="delete">--%>
<%--              <button type="submit" class="btn btn-danger btn-action" onclick="return confirm('Bạn có chắc muốn ẩn người dùng này?')">--%>
<%--                <i class="fas fa-trash"></i> Ẩn--%>
<%--              </button>--%>
<%--            </form>--%>
<%--          </td>--%>
<%--        </tr>--%>
<%--      </c:forEach>--%>
<%--      </tbody>--%>
<%--    </table>--%>
<%--  </div>--%>

<%--  <!-- Debug: Hiển thị số lượng users -->--%>
<%--  <div class="text-muted mt-3">Tổng số người dùng: <%= users.size() %></div>--%>
<%--</div>--%>

<%--<!-- Modal chỉnh sửa -->--%>
<%--<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">--%>
<%--  <div class="modal-dialog">--%>
<%--    <div class="modal-content">--%>
<%--      <div class="modal-header">--%>
<%--        <h5 class="modal-title" id="editModalLabel">Chỉnh sửa người dùng</h5>--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--      </div>--%>
<%--      <div class="modal-body">--%>
<%--        <form id="editForm" action="users" method="post">--%>
<%--          <input type="hidden" name="id" id="editUserId">--%>
<%--          <input type="hidden" name="action" value="edit">--%>
<%--          <div class="mb-3">--%>
<%--            <label class="form-label">Tên người dùng</label>--%>
<%--            <input type="text" class="form-control" name="username" id="editUsername" required>--%>
<%--          </div>--%>
<%--          <div class="mb-3">--%>
<%--            <label class="form-label">Email</label>--%>
<%--            <input type="email" class="form-control" name="email" id="editEmail" required>--%>
<%--          </div>--%>
<%--          <div class="mb-3">--%>
<%--            <label class="form-label">Vai trò (1: Admin, 2: Người dùng)</label>--%>
<%--            <input type="number" class="form-control" name="role_id" id="editRoleId" min="1" max="2" required>--%>
<%--          </div>--%>
<%--          <button type="submit" class="btn btn-success w-100">Lưu thay đổi</button>--%>
<%--        </form>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

<%--<script>--%>
<%--  function openEditModal(id, username, email, roleId) {--%>
<%--    document.getElementById("editUserId").value = id;--%>
<%--    document.getElementById("editUsername").value = username;--%>
<%--    document.getElementById("editEmail").value = email;--%>
<%--    document.getElementById("editRoleId").value = roleId;--%>
<%--    const editModal = new bootstrap.Modal(document.getElementById("editModal"));--%>
<%--    editModal.show();--%>
<%--  }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  // Lấy danh sách người dùng hoạt động
  java.util.List<model.User> users = (java.util.List<model.User>) request.getAttribute("users");
  if (users == null) {
    users = new java.util.ArrayList<>();
  }
  pageContext.setAttribute("usersList", users);

// Lấy danh sách người dùng đã bị ẩn
  java.util.List<model.User> deletedUsers = (java.util.List<model.User>) request.getAttribute("deletedUsers");
  if (deletedUsers == null) {
    deletedUsers = new java.util.ArrayList<>();
  }
  pageContext.setAttribute("deletedUsersList", deletedUsers);
%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách người dùng - Fahasa Library</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
      min-height: 100vh;
      padding-top: 80px;
    }

    /* Header */
    .custom-header {
      background: #fff;
      padding: 15px 0;
      border-bottom: 2px solid #ff6f61;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 1000;
    }

    .header-container {
      max-width: 1300px;
      margin: 0 auto;
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
      transform: scale(1.05);
    }

    .search-bar {
      flex-grow: 1;
      max-width: 500px;
      display: flex;
      border: 2px solid #ff6f61;
      border-radius: 25px;
      overflow: hidden;
      margin: 0 20px;
      transition: box-shadow 0.3s ease;
    }

    .search-bar:hover {
      box-shadow: 0 0 10px rgba(255, 111, 97, 0.3);
    }

    .search-input {
      flex: 1;
      padding: 10px 15px;
      border: none;
      outline: none;
      font-size: 14px;
      background: #f9f9f9;
    }

    .search-btn {
      background: #ff6f61;
      border: none;
      padding: 10px 20px;
      color: #fff;
      transition: background 0.3s ease;
    }

    .search-btn:hover {
      background: #e65b50;
    }

    .header-right a {
      color: #ff6f61;
      font-weight: 500;
      text-decoration: none;
      margin-left: 20px;
      display: flex;
      align-items: center;
      transition: color 0.3s ease;
    }

    .header-right a i {
      margin-right: 5px;
    }

    .header-right a:hover {
      color: #e65b50;
    }

    /* Main Content */
    .main-container {
      max-width: 1300px;
      margin: 30px auto;
      padding: 0 20px;
    }

    .page-title {
      font-size: 32px;
      font-weight: 600;
      color: #ff6f61;
      text-align: center;
      margin-bottom: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .table-container {
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      margin-bottom: 30px; /* Thêm khoảng cách giữa hai bảng */
    }

    .table {
      margin-bottom: 0;
    }

    .table thead {
      background: linear-gradient(135deg, #ff6f61, #e65b50);
      color: #fff;
    }

    .table th, .table td {
      padding: 15px;
      text-align: center;
      vertical-align: middle;
    }

    .table-hover tbody tr:hover {
      background: #f9f9f9;
      transition: background 0.2s ease;
    }

    .badge {
      font-size: 12px;
      padding: 6px 12px;
      border-radius: 12px;
    }

    .btn-action {
      padding: 6px 12px;
      font-size: 14px;
      border-radius: 8px;
      transition: transform 0.2s ease, background 0.2s ease;
    }

    .btn-action:hover {
      transform: scale(1.05);
    }

    /* Modal */
    .modal-content {
      border-radius: 15px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
    }

    .modal-header {
      background: #ff6f61;
      color: #fff;
      border-bottom: none;
    }

    .modal-title {
      font-weight: 600;
    }

    .modal-body {
      padding: 20px;
    }

    .form-label {
      font-weight: 500;
      color: #333;
    }

    .form-control {
      border-radius: 8px;
      border: 1px solid #ddd;
      transition: border-color 0.3s ease;
    }

    .form-control:focus {
      border-color: #ff6f61;
      box-shadow: 0 0 5px rgba(255, 111, 97, 0.3);
    }

    /* Responsive */
    @media (max-width: 768px) {
      .header-container {
        flex-direction: column;
        padding: 10px;
      }

      .search-bar {
        width: 100%;
        margin: 10px 0;
      }

      .header-right {
        margin-top: 10px;
      }

      .table th, .table td {
        font-size: 14px;
        padding: 10px;
      }
    }
  </style>
</head>
<body>

<!-- Header -->
<header class="custom-header">
  <div class="header-container">
    <a href="/book">
      <img src="https://th.bing.com/th/id/OIP.Q2amTWlPUanyIlSCtEcoSwHaFZ?w=231&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Logo" class="header-logo">
    </a>
    <form class="search-bar" action="users" method="get">
      <input class="search-input" type="text" name="search" placeholder="Tìm kiếm người dùng..." value="${searchQuery != null ? searchQuery : ''}">
      <button class="search-btn" type="submit"><i class="fas fa-search"></i></button>
    </form>
    <div class="header-right">
      <c:if test="${empty sessionScope.user}">
        <a href="/login"><i class="bi bi-person-fill"></i> Đăng nhập</a>
      </c:if>
      <c:if test="${not empty sessionScope.user}">
        <a href="/logout"><i class="bi bi-box-arrow-right"></i> Đăng xuất</a>
      </c:if>
      <c:if test="${sessionScope.roleId == 1}">
        <a href="/managementBook"><i class="bi bi-book"></i> Quản lý sách</a>
        <a href="/orderDetails"><i class="bi bi-cart"></i> Quản lý đơn hàng</a>
      </c:if>
    </div>
  </div>
</header>

<!-- Main Content -->
<div class="main-container">
  <h2 class="page-title">Danh sách người dùng</h2>

  <!-- Thông báo -->
  <c:if test="${not empty message}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${message}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  </c:if>
  <c:if test="${not empty error}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        ${error}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  </c:if>

  <!-- Bảng danh sách người dùng hoạt động -->
  <div class="table-container">
    <table class="table table-hover">
      <thead>
      <tr>
        <th>ID</th>
        <th>Tên người dùng</th>
        <th>Email</th>
        <th>Vai trò</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
      </tr>
      </thead>
      <tbody>
      <c:if test="${empty usersList}">
        <tr>
          <td colspan="6" class="text-center text-muted py-4">Không có người dùng nào để hiển thị.</td>
        </tr>
      </c:if>
      <c:forEach var="u" items="${usersList}">
        <tr>
          <td>${u.id}</td>
          <td>${u.username}</td>
          <td>${u.email}</td>
          <td>${u.roleId == 1 ? 'Admin' : 'Người dùng'}</td>
          <td>
            <c:choose>
              <c:when test="${u.status == 1}">
                <span class="badge bg-success">Hoạt động</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-danger">Bị ẩn</span>
              </c:otherwise>
            </c:choose>
          </td>
          <td>
            <button class="btn btn-warning btn-action" onclick="openEditModal(${u.id}, '${u.username}', '${u.email}', ${u.roleId})">
              <i class="fas fa-edit"></i> Sửa
            </button>
            <form action="users" method="post" class="d-inline">
              <input type="hidden" name="id" value="${u.id}">
              <input type="hidden" name="action" value="delete">
              <button type="submit" class="btn btn-danger btn-action" onclick="return confirm('Bạn có chắc muốn ẩn người dùng này?')">
                <i class="fas fa-trash"></i> Ẩn
              </button>
            </form>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- Debug: Hiển thị số lượng users hoạt động -->
  <div class="text-muted mt-3">Tổng số người dùng hoạt động: ${usersList.size()}</div>

  <!-- Bảng danh sách người dùng đã bị ẩn -->
  <h2 class="page-title">Danh sách người dùng đã bị ẩn</h2>
  <div class="table-container">
    <table class="table table-hover">
      <thead>
      <tr>
        <th>ID</th>
        <th>Tên người dùng</th>
        <th>Email</th>
        <th>Vai trò</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
      </tr>
      </thead>
      <tbody>
      <c:if test="${empty deletedUsersList}">
        <tr>
          <td colspan="6" class="text-center text-muted py-4">Không có người dùng nào đã bị ẩn.</td>
        </tr>
      </c:if>
      <c:forEach var="u" items="${deletedUsersList}">
        <tr>
          <td>${u.id}</td>
          <td>${u.username}</td>
          <td>${u.email}</td>
          <td>${u.roleId == 1 ? 'Admin' : 'Người dùng'}</td>
          <td>
            <c:choose>
              <c:when test="${u.status == 1}">
                <span class="badge bg-success">Hoạt động</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-danger">Bị ẩn</span>
              </c:otherwise>
            </c:choose>
          </td>
          <td>
            <button class="btn btn-warning btn-action" onclick="openEditModal(${u.id}, '${u.username}', '${u.email}', ${u.roleId})">
              <i class="fas fa-edit"></i> Sửa
            </button>
            <form action="users" method="post" class="d-inline">
              <input type="hidden" name="id" value="${u.id}">
              <input type="hidden" name="action" value="restore">
              <button type="submit" class="btn btn-success btn-action" onclick="return confirm('Bạn có chắc muốn khôi phục người dùng này?')">
                <i class="fas fa-undo"></i> Khôi phục
              </button>
            </form>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- Debug: Hiển thị số lượng users đã bị ẩn -->
  <div class="text-muted mt-3">Tổng số người dùng đã bị ẩn: ${deletedUsersList.size()}</div>
</div>

<!-- Modal chỉnh sửa -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editModalLabel">Chỉnh sửa người dùng</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="editForm" action="users" method="post">
          <input type="hidden" name="id" id="editUserId">
          <input type="hidden" name="action" value="edit">
          <div class="mb-3">
            <label class="form-label">Tên người dùng</label>
            <input type="text" class="form-control" name="username" id="editUsername" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" id="editEmail" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Vai trò (1: Admin, 2: Người dùng)</label>
            <input type="number" class="form-control" name="role_id" id="editRoleId" min="1" max="2" required>
          </div>
          <button type="submit" class="btn btn-success w-100">Lưu thay đổi</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
  function openEditModal(id, username, email, roleId) {
    document.getElementById("editUserId").value = id;
    document.getElementById("editUsername").value = username;
    document.getElementById("editEmail").value = email;
    document.getElementById("editRoleId").value = roleId;
    const editModal = new bootstrap.Modal(document.getElementById("editModal"));
    editModal.show();
  }
</script>
</body>
</html>