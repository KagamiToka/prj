package service.impl.users;

import model.User;
import repository.connection.DBRepository;
import service.IService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

public class UserServiceImpl implements IService<User> {
    private static final Logger LOGGER = Logger.getLogger(UserServiceImpl.class.getName());
    private Connection conn;

    public UserServiceImpl() {
        this.conn = DBRepository.getConnection();
        if (this.conn == null) {
            LOGGER.log(Level.SEVERE, "Không thể kết nối đến database!");
        } else {
            LOGGER.info("Kết nối database thành công trong UserServiceImpl!");
        }
    }

    // Lấy danh sách tất cả người dùng (Không hiển thị mật khẩu)
    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, username, email, role_id, status FROM Users WHERE status = 1";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        "", // Không lấy password để bảo mật
                        rs.getString("email"),
                        rs.getInt("role_id"),
                        rs.getInt("status")
                );
                users.add(user);
            }
            LOGGER.info("Đã lấy " + users.size() + " người dùng từ database.");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi lấy danh sách user: ", e);
        }
        return users;
    }

    // Lấy danh sách người dùng đã bị xóa (status = 0)
    public List<User> getAllDelete() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, username, email, role_id, status FROM Users WHERE status = 0";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        "", // Không lấy password để bảo mật
                        rs.getString("email"),
                        rs.getInt("role_id"),
                        rs.getInt("status")
                );
                users.add(user);
            }
            LOGGER.info("Đã lấy " + users.size() + " người dùng đã bị xóa.");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi lấy danh sách user đã xóa: ", e);
        }
        return users;
    }

    // Thêm người dùng
    @Override
    public void add(User user) {
        String sql = "INSERT INTO Users (username, password, email, role_id, status) VALUES (?, ?, ?, ?, 1)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getEmail());
            stmt.setInt(4, user.getRoleId());
            stmt.executeUpdate();
            LOGGER.info("Đã thêm user: " + user.getUsername());
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi thêm user: ", e);
        }
    }

    // Xóa người dùng theo ID (chuyển status = 0 thay vì xóa hẳn)
    @Override
    public void remove(int id) {
        String sql = "UPDATE Users SET status = 0 WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Đã ẩn user với ID: " + id);
            } else {
                LOGGER.warning("Không tìm thấy user với ID: " + id + " để ẩn.");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi ẩn user: ", e);
        }
    }

    // Cập nhật thông tin người dùng
    @Override
    public void update(int id, User user) {
        String sql = "UPDATE Users SET username = ?, email = ?, role_id = ? WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setInt(3, user.getRoleId());
            stmt.setInt(4, id);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Đã cập nhật user với ID: " + id);
            } else {
                LOGGER.warning("Không tìm thấy user với ID: " + id + " để cập nhật.");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi cập nhật user: ", e);
        }
    }

    @Override
    public void update(User user) {
        update(user.getId(), user); // Chuyển hướng đến phương thức update(int id, User user)
    }

    // Tìm người dùng theo ID
    @Override
    public User findById(int id) {
        String sql = "SELECT id, username, email, role_id, status FROM Users WHERE id = ? AND status = 1";
        User user = null;

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        "", // Không lấy password để bảo mật
                        rs.getString("email"),
                        rs.getInt("role_id"),
                        rs.getInt("status")
                );
                LOGGER.info("Đã tìm thấy user với ID: " + id);
            } else {
                LOGGER.warning("Không tìm thấy user với ID: " + id);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi tìm user theo ID: ", e);
        }
        return user;
    }

    // Tìm người dùng theo tên
    @Override
    public List<User> findByName(String name) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, username, email, role_id, status FROM Users WHERE username LIKE ? AND status = 1";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        "", // Không lấy password
                        rs.getString("email"),
                        rs.getInt("role_id"),
                        rs.getInt("status")
                ));
            }
            LOGGER.info("Tìm thấy " + users.size() + " user với tên chứa: " + name);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi tìm user theo tên: ", e);
        }
        return users;
    }
}