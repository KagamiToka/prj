package controller.order;

import model.Order;
import service.impl.order.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderController",urlPatterns = "/orderpage")
public class OrderController extends HttpServlet {
    private OrderService OrderService = new OrderService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders = OrderService.getAll();

        // Thêm danh sách bookId vào request
        Map<Integer, Integer> bookIds = new HashMap<>(); // orderId -> bookId
        for (Order order : orders) {
            if (order.getBook() != null) {
                bookIds.put(order.getId(), order.getBook().getId());
            }
        }

        request.setAttribute("orders", orders);
        request.setAttribute("bookIds", bookIds);
        request.getRequestDispatcher("WEB-INF/view/order/orderpage.jsp").forward(request, response);
    }

}