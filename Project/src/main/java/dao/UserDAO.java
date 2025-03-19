package dao;

import model.User;
import org.mindrot.jbcrypt.BCrypt;
import repository.connection.DBRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {
    private static final Logger LOGGER = Logger.getLogger(UserDAO.class.getName());

    private static final String GET_USER_BY_USERNAME =
            "SELECT id, username, password, email, role_id, status FROM users WHERE username = ?";

    private static final String GET_ALL_USERS =
            "SELECT id, username, email, role_id FROM users WHERE status = 1"; // Chỉ lấy user chưa bị xóa

    private static final String UPDATE_USER_STATUS =
            "UPDATE users SET status = ? WHERE id = ?";

    public User getUserByUsername(String username) {
        User user = null;

        try (Connection conn = DBRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(GET_USER_BY_USERNAME)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next() && rs.getInt("status") == 1) { // Chỉ lấy user chưa bị xóa
                    user = new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("password"), // Mật khẩu đã mã hóa
                            rs.getString("email"),
                            rs.getInt("role_id"),
                            rs.getInt("status")
                    );
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi lấy user theo username: ", e);
        }
        return user;
    }



    public User getUserByUsernameAndPassword(String username, String password) {
        User user = getUserByUsername(username);
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            return user; // Đúng tài khoản & mật khẩu
        }
        return null; // Sai mật khẩu hoặc tài khoản không tồn tại
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        try (Connection conn = DBRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(GET_ALL_USERS);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        null, // Không trả về mật khẩu
                        rs.getString("email"),
                        rs.getInt("role_id"),
                        1 
                ));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi lấy danh sách user: ", e);
        }
        return users;
    }

    // Xóa mềm user (Cập nhật status = 0)
    public void removeUser(int userId) {
        updateUserStatus(userId, 0);
    }

    // Khôi phục user (Cập nhật status = 1)
    public void restoreUser(int userId) {
        updateUserStatus(userId, 1);
    }

    private void updateUserStatus(int userId, int status) {
        try (Connection conn = DBRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_USER_STATUS)) {

            stmt.setInt(1, status);
            stmt.setInt(2, userId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi cập nhật trạng thái user: ", e);
        }
    }



}