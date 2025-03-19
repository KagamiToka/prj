package dao;

import model.OrderDetail;
import repository.connection.DBRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO {
    private Connection conn;

    public OrderDetailDAO(Connection conn) {
        this.conn = conn;
    }

    public List<OrderDetail> getAllOrderDetails() {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT * FROM Order_Details";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(
                        rs.getInt("id"),
                        rs.getInt("book_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("province_city"),
                        rs.getString("district"),
                        rs.getString("ward"),
                        rs.getString("street"),
                        rs.getString("note_order"),
                        rs.getDouble("total_price"),
                        rs.getString("payment_method"),
                        rs.getString("order_status")
                );
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public OrderDetail getOrderDetailById(int id) {
        conn = DBRepository.getConnection();
        // Thay thế bằng phương thức mở kết nối của bạn
        String sql = "SELECT * FROM order_details WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, String.valueOf(id));

            ResultSet rs = stmt.executeQuery();
            System.out.println("Executing SQL: " + stmt.toString());
            if (rs.next()) {
                return new OrderDetail(
                        rs.getInt("id"),
                        rs.getInt("book_id"),
                        rs.getInt("quantity"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("province_city"),
                        rs.getString("district"),
                        rs.getString("ward"),
                        rs.getString("street"),
                        rs.getString("note_order"),
                        rs.getDouble("total_price"),
                        rs.getString("payment_method"),
                        rs.getString("order_status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Xóa chi tiết đơn hàng
    public void deleteOrderDetail(int id) {
        String sql = "DELETE FROM Order_Details WHERE id = ?";
        try (Connection connection = new DBRepository().getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void add(OrderDetail orderDetail) {
        String sql = "INSERT INTO order_details(book_id,full_name,email,phone_number,province_city,district,ward,street,note_order,total_price ,payment_method) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = new DBRepository().getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1,orderDetail.getBookId());
            preparedStatement.setString(2,orderDetail.getFullName());
            preparedStatement.setString(3, orderDetail.getEmail());
            preparedStatement.setString(4, orderDetail.getPhoneNumber());
            preparedStatement.setString(5, orderDetail.getProvinceCity());
            preparedStatement.setString(6, orderDetail.getDistrict());
            preparedStatement.setString(7, orderDetail.getWard());
            preparedStatement.setString(8, orderDetail.getStreet());
            preparedStatement.setDouble(10, orderDetail.getPrice());
            preparedStatement.setString(9, orderDetail.getNoteOrder());
            preparedStatement.setString(11, orderDetail.getPaymentMethod());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi thêm sản phẩm!", e);
        }
    }

    public void updateOrderDetail(OrderDetail orderDetail) {
        String sql = "UPDATE order_details SET full_name = ?, email = ?, phone_number = ?, province_city = ?, district = ?, ward = ?, street = ?, note_order = ?, total_price = ?, payment_method = ?, order_status = ? WHERE id = ?";
        try (Connection conn = new DBRepository().getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, orderDetail.getFullName());
            stmt.setString(2, orderDetail.getEmail());
            stmt.setString(3, orderDetail.getPhoneNumber());
            stmt.setString(4, orderDetail.getProvinceCity());
            stmt.setString(5, orderDetail.getDistrict());
            stmt.setString(6, orderDetail.getWard());
            stmt.setString(7, orderDetail.getStreet());
            stmt.setString(8, orderDetail.getNoteOrder());
            stmt.setDouble(9, orderDetail.getPrice());
            stmt.setString(10, orderDetail.getPaymentMethod());
            stmt.setString(11, orderDetail.getStatus());
            stmt.setInt(12, orderDetail.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
