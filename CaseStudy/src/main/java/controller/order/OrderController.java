package controller.order;

import model.Book;
import model.Order;
import service.impl.order.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderController", urlPatterns = {"/order", "/orderpage"})
public class OrderController extends HttpServlet {
    private OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/order".equals(path)) {
            // Xử lý yêu cầu từ nút "Mua ngay"
            handleOrderCreation(request, response);
        } else if ("/orderpage".equals(path)) {
            // Hiển thị trang thanh toán
            displayOrderPage(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // Xử lý yêu cầu từ nút "Mua ngay"
    private void handleOrderCreation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Lấy thông tin sách từ request
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String imageURL = request.getParameter("imageURL");
        String title = request.getParameter("title");
        double price = Double.parseDouble(request.getParameter("price"));

        // Tạo đối tượng Book
        Book book = new Book();
        book.setId(bookId);
        book.setImageURL(imageURL);
        book.setTitle(title);
        book.setPrice(price);

        // Thêm sách vào giỏ hàng trong session
        HttpSession session = request.getSession();
        List<Book> cart = (List<Book>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        cart.add(book);
        session.setAttribute("cart", cart);

        // Chuyển hướng đến orderpage.jsp
        response.sendRedirect("orderpage");
    }

    // Hiển thị trang thanh toán
    private void displayOrderPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không cần lấy danh sách orders từ database vì orderpage.jsp sử dụng cart từ session
        request.getRequestDispatcher("WEB-INF/view/order/orderpage.jsp").forward(request, response);
    }
}