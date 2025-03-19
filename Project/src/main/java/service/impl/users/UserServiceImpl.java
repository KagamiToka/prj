package service.impl.users;

import model.Order;
import model.User;

import repository.connection.DBRepository;
import service.IService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements IService<User> {
    private Connection conn;

    public UserServiceImpl() {
        this.conn = DBRepository.getConnection();
    }

    // Lấy danh sách tất cả người dùng (Không hiển thị mật khẩu)
    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, username, email, role_id FROM Users where status = 1";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        "",  // Không lấy password để bảo mật
                        rs.getString("email"),
                        rs.getInt("role_id")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    public List<User> getAllDelete() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, username, email, role_id FROM Users where status = 0";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        "",  // Không lấy password để bảo mật
                        rs.getString("email"),
                        rs.getInt("role_id")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }




    // Xóa người dùng theo ID
    @Override
    public void remove(int id) {
        String sql = "DELETE FROM Users WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật thông tin người dùng (Không thay đổi mật khẩu)
    @Override
    public void update(int id, User user) {
        String sql = "UPDATE Users SET username = ?, email = ?, role_id = ? WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setInt(3, user.getRoleId());
            stmt.setInt(4, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(User user) {
    }

    // Tìm người dùng theo ID
    @Override
    public User findById(int id) {
        String sql = "SELECT id, username, email, role_id FROM Users WHERE id = ?";
        User user = null;

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        "",  // Không lấy password để bảo mật
                        rs.getString("email"),
                        rs.getInt("role_id")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Tìm người dùng theo tên
    @Override
    public List<User> findByName(String name) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT id, username, email, role_id FROM Users WHERE username LIKE ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        "",
                        rs.getString("email"),
                        rs.getInt("role_id")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public void add(User user) {

    }
}
