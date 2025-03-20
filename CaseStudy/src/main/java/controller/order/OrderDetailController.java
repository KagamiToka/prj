package controller.order;

import dao.OrderDetailDAO;
import model.Book;
import model.CartItem;
import model.OrderDetail;
import repository.connection.DBRepository;
import service.impl.BookService;
import service.impl.OrderDetail.OrderDetailService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/orderDetails")
public class OrderDetailController extends HttpServlet {
    private OrderDetailService orderDetailService;
    private BookService bookService;

    @Override
    public void init() throws ServletException {
        try {
            Connection conn = DBRepository.getConnection();
            this.orderDetailService = new OrderDetailService(conn);
            this.bookService = new BookService();
        } catch (Exception e) {
            throw new ServletException("Lỗi khởi tạo OrderDetailService", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            listOrderDetails(request, response);
        } else {
            switch (action) {
                case "delete":
                    deleteOrderDetail(request, response);
                    break;
                case "edit":
                    editForm(request, response);
                    break;
                case "create":
                    insertOrderDetails(request, response);
                    break;
                default:
                    listOrderDetails(request, response);
                    break;
            }
        }
    }

    private void listOrderDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<OrderDetail> orderDetails = orderDetailService.getAll();
        request.setAttribute("orderDetails", orderDetails);
        request.getRequestDispatcher("WEB-INF/view/order/orders-list.jsp").forward(request, response);
    }

    private void deleteOrderDetail(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu ID để xóa");
            return;
        }

        try {
            int orderDetailId = Integer.parseInt(idParam);
            orderDetailService.remove(orderDetailId);
            response.sendRedirect("orderDetails?action=list");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ: " + idParam);
        }
    }

    private void editForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        OrderDetail orderDetail = orderDetailService.findById(id);
        System.out.println("Editing OrderDetail with ID: " + request.getParameter("id"));
        request.setAttribute("orderDetail", orderDetail);
        request.getRequestDispatcher("/WEB-INF/view/order/edit_orderDetails.jsp").forward(request, response);
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
            case "update":
                updateOrderDetail(request, response);
                break;
            case "create":
                insertOrderDetails(request, response);
                break;
        }
    }

    private void updateOrderDetail(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String provinceCity = request.getParameter("province_city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String street = request.getParameter("street");
        String noteOrder = request.getParameter("note_order");
        Double totalPrice = Double.parseDouble(request.getParameter("total_price"));
        String paymentMethod = request.getParameter("payment_method");
        String orderStatus = request.getParameter("order_status");
        OrderDetail orderDetail = new OrderDetail(id, fullName, email, phoneNumber, provinceCity, district, ward, street, noteOrder, totalPrice, paymentMethod, orderStatus);
        orderDetailService.update(orderDetail);
        response.sendRedirect("orderDetails?action=list");
    }

    private void insertOrderDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart?error=cart_empty");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBRepository.getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Kiểm tra stockQuantity trước khi tạo đơn hàng
            for (CartItem item : cart) {
                int bookId = item.getBook().getId();
                int quantity = item.getQuantity();
                Book book = bookService.findById(bookId);
                if (book == null) {
                    throw new IllegalStateException("Sách không tồn tại: ID " + bookId);
                }
                if (book.getStockQuantity() < quantity) {
                    throw new IllegalStateException("Không đủ hàng trong kho cho sách: " + book.getTitle());
                }
            }

            // Lấy thông tin từ form
            String fullName = request.getParameter("full_name");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phone_number");
            String provinceCity = request.getParameter("province_city");
            String district = request.getParameter("district");
            String ward = request.getParameter("ward");
            String street = request.getParameter("street");
            String noteOrder = request.getParameter("note_order");
            double totalPrice = Double.parseDouble(request.getParameter("total_price"));
            String paymentMethod = request.getParameter("payment_method");

            // Tạo một đơn hàng (Order) trong bảng orders
            String insertOrderQuery = "INSERT INTO orders (full_name, email, phone_number, province_city, district, ward, street, note_order, total_price, payment_method, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(insertOrderQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, phoneNumber);
            stmt.setString(4, provinceCity);
            stmt.setString(5, district);
            stmt.setString(6, ward);
            stmt.setString(7, street);
            stmt.setString(8, noteOrder);
            stmt.setDouble(9, totalPrice);
            stmt.setString(10, paymentMethod);
            stmt.setString(11, "pending");
            stmt.executeUpdate();

            // Lấy ID của đơn hàng vừa tạo
            rs = stmt.getGeneratedKeys();
            int orderId;
            if (rs.next()) {
                orderId = rs.getInt(1);
            } else {
                throw new SQLException("Không thể lấy ID của đơn hàng vừa tạo.");
            }

            // Tạo OrderDetail cho mỗi CartItem
            for (CartItem item : cart) {
                int bookId = item.getBook().getId();
                int quantity = item.getQuantity();
                double price = item.getBook().getPrice() * quantity * 1000; // Nhân 1000 như trong cart.jsp
                OrderDetail orderDetail = new OrderDetail(
                        bookId,
                        quantity,
                        fullName,
                        email,
                        phoneNumber,
                        provinceCity,
                        district,
                        ward,
                        street,
                        noteOrder,
                        price,
                        paymentMethod
                );
                orderDetail.setOrderId(orderId); // Gán orderId cho OrderDetail
                orderDetailService.add(orderDetail);

                // Cập nhật stockQuantity
                bookService.updateStockQuantity(bookId, quantity);
            }

            conn.commit(); // Commit transaction

            // Xóa giỏ hàng trong session sau khi tạo đơn hàng
            session.removeAttribute("cart");

            // Chuyển hướng về trang danh sách sách
            response.sendRedirect("/book?message=order_success");
        } catch (IllegalStateException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/view/cart/cart.jsp").forward(request, response);
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tạo đơn hàng: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}