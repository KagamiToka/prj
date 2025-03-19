<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Chỉnh sửa sách</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .form-container {
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      margin: auto;
    }
    h2 {
      color: #ff7f00;
      text-align: center;
    }
    .btn-custom {
      background-color: #ff7f00;
      color: white;
      border: none;
    }
    .btn-custom:hover {
      background-color: #e67300;
    }
    .img-thumbnail {
      display: block;
      margin: auto;
      max-width: 150px;
      max-height: 200px;
      border-radius: 5px;
    }
  </style>
</head>
<body>

<div class="container mt-5">
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
        <input type="text" class="form-control" name="ImageURL" value="${book.imageURL}">
      </div>

      <div class="mb-3">
        <label class="form-label">Mô tả sách:</label>
        <textarea class="form-control" name="book_description" rows="3">${book.bookDescription}</textarea>
      </div>

      <div class="text-center mb-3">
        <img src="${book.imageURL}" alt="Book Image" class="img-thumbnail">
      </div>

      <div class="d-flex justify-content-between">
        <a href="/managementBook" class="btn btn-secondary">Hủy</a>
        <button type="submit" class="btn btn-custom">Lưu thay đổi</button>
      </div>

    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
