package controller.user;

import model.User;
import service.impl.users.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", urlPatterns = "/users")
public class UserController extends HttpServlet {
    private final UserServiceImpl userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        // Nếu không có user hoặc không phải admin, redirect về login
        if (currentUser == null || currentUser.getRoleId() != 1) {
            response.sendRedirect("login");
            return;
        }

        // Lấy từ khóa tìm kiếm từ request
        String searchQuery = request.getParameter("search");

        List<User> users;
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            users = userService.findByName(searchQuery.trim());
        } else {
            users = userService.getAll();
        }

        System.out.println("Số lượng users sau khi tìm kiếm: " + users.size()); // Debug log

        request.setAttribute("users", users);
        request.setAttribute("searchQuery", searchQuery); // Trả lại giá trị search để giữ trong ô input
        request.getRequestDispatcher("WEB-INF/view/user/list-users.jsp").forward(request, response);
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("delete".equals(action)) {
                int userId = getUserIdFromRequest(request);
                if (userService.findById(userId) != null) {
                    userService.remove(userId);
                } else {
                    request.setAttribute("error", "Người dùng không tồn tại.");
                }
            } else if ("edit".equals(action)) {
                int userId = getUserIdFromRequest(request);
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                int roleId = Integer.parseInt(request.getParameter("role_id"));

                User user = new User(userId, username, "", email, roleId);
                if (userService.findById(userId) != null) {
                    userService.update(userId, user);
                } else {
                    request.setAttribute("error", "Không thể cập nhật, người dùng không tồn tại.");
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi xử lý yêu cầu: " + e.getMessage());
        }

        response.sendRedirect("users");
    }

    private int getUserIdFromRequest(HttpServletRequest request) {
        try {
            return Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            return -1; // Trả về -1 nếu lỗi để tránh bug.
        }
    }
}
