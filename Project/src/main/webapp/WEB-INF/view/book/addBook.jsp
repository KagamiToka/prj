<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thêm Sách</title>
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
  </style>
</head>
<body>

<div class="container mt-5">
  <div class="form-container">
    <h2>Thêm Sách Mới</h2>
    <form action="managementBook?action=add" method="post">

      <div class="mb-3">
        <label class="form-label">Tên sách:</label>
        <input type="text" class="form-control" name="title" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Tác giả:</label>
        <input type="text" class="form-control" name="author" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Giá (VNĐ):</label>
        <input type="number" step="0.01" class="form-control" name="price" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Số lượng:</label>
        <input type="number" class="form-control" name="stockQuantity" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Mô tả:</label>
        <textarea class="form-control" name="bookDescription" rows="3"></textarea>
      </div>

      <div class="mb-3">
        <label class="form-label">URL Hình ảnh:</label>
        <input type="text" class="form-control" name="imageURL" required>
      </div>

      <div class="d-flex justify-content-between">
        <a href="managementBook" class="btn btn-secondary">Quay lại</a>
        <button type="submit" class="btn btn-custom">Thêm Sách</button>
      </div>

    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
