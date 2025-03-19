<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa đơn hàng</title>
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
        <h2 class="text-center mb-4">Chỉnh sửa đơn hàng</h2>
        <form action="orderDetails?action=update" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${orderDetail.id}">

            <div class="mb-3">
                <label class="form-label">Họ và tên:</label>
                <input type="text" class="form-control" name="full_name" value="${orderDetail.fullName}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email:</label>
                <input type="email" class="form-control" name="email" value="${orderDetail.email}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Số điện thoại:</label>
                <input type="text" class="form-control" name="phone_number" value="${orderDetail.phoneNumber}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Tỉnh/Thành phố:</label>
                <input type="text" class="form-control" name="province_city" value="${orderDetail.provinceCity}" required>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Quận/Huyện:</label>
                    <input type="text" class="form-control" name="district" value="${orderDetail.district}" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Phường/Xã:</label>
                    <input type="text" class="form-control" name="ward" value="${orderDetail.ward}" required>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Địa chỉ cụ thể:</label>
                <input type="text" class="form-control" name="street" value="${orderDetail.street}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Ghi chú:</label>
                <textarea class="form-control" name="note_order" rows="3">${orderDetail.noteOrder}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Tổng giá:</label>
                <input type="number" class="form-control" name="total_price" value="${orderDetail.price}" step="0.01" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phương thức thanh toán:</label>
                <input type="text" class="form-control" name="payment_method" value="${orderDetail.paymentMethod}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Trạng thái đơn hàng:</label>
                <select class="form-control" name="order_status" required>
                    <option value="Đang xử lý" ${orderDetail.status == 'Đang xử lý' ? 'selected' : ''}>Đang xử lý</option>
                    <option value="Đã xử lý" ${orderDetail.status == 'Đã xử lý' ? 'selected' : ''}>Đã xử lý</option>
                </select>
            </div>


            <div class="d-flex justify-content-between">
                <a href="orderDetails?action=list" class="btn btn-secondary">Quay lại</a>
                <button type="submit" class="btn btn-custom">Cập nhật</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
