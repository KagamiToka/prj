package controller.login;

import model.User;
import service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns ="/login")
public class LoginController extends HttpServlet {
    private static UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("WEB-INF/view/login/loginPage.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login" :
                handleLogin(request, response);
                break;
            case "register":
                addUser(request,response);
                break;
        }
    }
    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Username nhập vào: " + username);
        System.out.println("Password nhập vào: " + password);

        User user = userService.login(username, password);
        System.out.println("Kết quả trả về từ UserService: " + (user != null ? "Đăng nhập thành công" : "Sai mật khẩu hoặc tài khoản"));

        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            session.setAttribute("roleId", user.getRoleId());

            // Nếu là admin, luôn lấy danh sách user mới từ DB
            if (user.getRoleId() == 1) {
                List<User> users = userService.getAll();
                System.out.println("Số lượng users sau khi đăng nhập: " + users.size()); // Debug log
                session.setAttribute("users", users);
            }

            response.sendRedirect("/book"); // Chuyển hướng tới danh sách sách
        } else {
            response.sendRedirect("login?error=1");
        }
    }


    private void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = new User(userName, password, email);
        userService.add(user);

        response.sendRedirect("login?success=1");
    }

}
