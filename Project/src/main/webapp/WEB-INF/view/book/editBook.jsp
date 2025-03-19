<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Chỉnh sửa sách</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <style>
    body {
      background: linear-gradient(135deg, #1e3c72, #2a5298);
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .form-container {
      background: #fff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
      max-width: 700px;
      width: 100%;
      animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    h2 {
      color: #fff;
      text-align: center;
      background: linear-gradient(135deg, #ff6f61, #e65b50);
      padding: 15px;
      border-radius: 10px 10px 0 0;
      margin: -30px -30px 30px -30px;
      font-size: 24px;
      font-weight: 600;
    }

    .mb-3 {
      margin-bottom: 20px;
    }

    .form-label {
      font-weight: 500;
      color: #34495e;
      margin-bottom: 5px;
      display: block;
    }

    .form-control {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 12px;
      font-size: 14px;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .form-control:focus {
      border-color: #ff6f61;
      box-shadow: 0 0 5px rgba(255, 111, 97, 0.5);
      outline: none;
    }

    .img-preview {
      display: block;
      margin: 15px auto;
      max-width: 200px;
      max-height: 250px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      object-fit: cover;
    }

    .btn-group {
      display: flex;
      justify-content: space-between;
      gap: 15px;
      margin-top: 20px;
    }

    .btn-custom {
      background: linear-gradient(135deg, #ff6f61, #e65b50);
      color: #fff;
      border: none;
      padding: 12px 25px;
      border-radius: 8px;
      font-weight: 500;
      transition: all 0.3s ease;
      width: 100%;
    }

    .btn-custom:hover {
      background: linear-gradient(135deg, #e65b50, #ff6f61);
      transform: translateY(-2px);
      box-shadow: 0 4px 10px rgba(255, 111, 97, 0.3);
    }

    .btn-cancel {
      background: #7f8c8d;
      color: #fff;
    }

    .btn-cancel:hover {
      background: #6c757d;
      transform: translateY(-2px);
      box-shadow: 0 4px 10px rgba(127, 140, 141, 0.3);
    }

    .error {
      color: #e74c3c;
      font-size: 14px;
      text-align: center;
      margin-top: 10px;
      display: none;
    }
  </style>
</head>
<body>
<div class="form-container">
  <h2>Chỉnh sửa sách</h2>
  <form action="managementBook?action=edit" method="post">
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="${book.id}">

    <div class="mb-3">
      <label class="form-label">Tên sách:</label>
      <input type="text" class="form-control" name="title" value="${book.title}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Tác giả:</label>
      <input type="text" class="form-control" name="author" value="${book.author}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Giá (VNĐ):</label>
      <input type="number" step="0.01" class="form-control" name="price" value="${book.price}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Số lượng:</label>
      <input type="number" class="form-control" name="stock_quantity" value="${book.stockQuantity}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">URL Hình ảnh:</label>
      <input type="text" class="form-control" name="ImageURL" value="${book.imageURL}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Mô tả sách:</label>
      <textarea class="form-control" name="book_description" rows="4" required>${book.bookDescription}</textarea>
    </div>

    <div class="text-center mb-3">
      <img src="${book.imageURL}" alt="Book Image" class="img-preview" onerror="this.src='https://via.placeholder.com/200x250?text=Không+có+hình+ảnh'">
    </div>

    <div class="btn-group">
      <a href="/managementBook" class="btn btn-cancel">Hủy</a>
      <button type="submit" class="btn btn-custom">Lưu thay đổi</button>
    </div>

    <c:if test="${not empty errorMessage}">
      <div class="error" style="display: block;">${errorMessage}</div>
    </c:if>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>