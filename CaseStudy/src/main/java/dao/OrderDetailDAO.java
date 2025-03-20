package dao;

import model.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO {
    private Connection conn;

    public OrderDetailDAO(Connection conn) {
        this.conn = conn;
    }

    public void addOrderDetail(OrderDetail orderDetail) {
        String query = "INSERT INTO order_details (order_id, book_id, quantity, full_name, email, phone_number, province_city, district, ward, street, note_order, price, payment_method, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, orderDetail.getOrderId());
            stmt.setInt(2, orderDetail.getBookId());
            stmt.setInt(3, orderDetail.getQuantity());
            stmt.setString(4, orderDetail.getFullName());
            stmt.setString(5, orderDetail.getEmail());
            stmt.setString(6, orderDetail.getPhoneNumber());
            stmt.setString(7, orderDetail.getProvinceCity());
            stmt.setString(8, orderDetail.getDistrict());
            stmt.setString(9, orderDetail.getWard());
            stmt.setString(10, orderDetail.getStreet());
            stmt.setString(11, orderDetail.getNoteOrder());
            stmt.setDouble(12, orderDetail.getPrice());
            stmt.setString(13, orderDetail.getPaymentMethod());
            stmt.setString(14, orderDetail.getStatus() != null ? orderDetail.getStatus() : "pending");
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi thêm OrderDetail: " + e.getMessage());
        }
    }

    public List<OrderDetail> getAllOrderDetails() {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String query = "SELECT * FROM order_details";
        try (PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(
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
                        rs.getDouble("price"),
                        rs.getString("payment_method"),
                        rs.getString("status")
                );
                orderDetail.setOrderId(rs.getInt("order_id"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy danh sách OrderDetail: " + e.getMessage());
        }
        return orderDetails;
    }

    public OrderDetail getOrderDetailById(int id) {
        String query = "SELECT * FROM order_details WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(
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
                        rs.getDouble("price"),
                        rs.getString("payment_method"),
                        rs.getString("status")
                );
                orderDetail.setOrderId(rs.getInt("order_id"));
                return orderDetail;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy OrderDetail: " + e.getMessage());
        }
        return null;
    }

    public void updateOrderDetail(int id, OrderDetail orderDetail) {
        String query = "UPDATE order_details SET full_name = ?, email = ?, phone_number = ?, province_city = ?, district = ?, ward = ?, street = ?, note_order = ?, price = ?, payment_method = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
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
            stmt.setInt(12, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi cập nhật OrderDetail: " + e.getMessage());
        }
    }

    public void deleteOrderDetail(int id) {
        String query = "DELETE FROM order_details WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi xóa OrderDetail: " + e.getMessage());
        }
    }

    public List<OrderDetail> getOrderDetailsByCustomerName(String name) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String query = "SELECT * FROM order_details WHERE full_name LIKE ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(
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
                        rs.getDouble("price"),
                        rs.getString("payment_method"),
                        rs.getString("status")
                );
                orderDetail.setOrderId(rs.getInt("order_id"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm OrderDetail theo tên: " + e.getMessage());
        }
        return orderDetails;
    }
}