package controller;

import model.Book;
import model.CartItem;
import service.impl.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    private BookService bookService;

    @Override
    public void init() throws ServletException {
        bookService = new BookService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            // Hiển thị giỏ hàng
            displayCart(request, response);
        } else {
            switch (action) {
                case "add":
                    addToCart(request, response);
                    break;
                case "remove":
                    removeFromCart(request, response);
                    break;
                case "update":
                    updateQuantity(request, response);
                    break;
                default:
                    displayCart(request, response);
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // Hiển thị giỏ hàng
    private void displayCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Tính tổng giá
        double totalPrice = 0.0;
        for (CartItem item : cart) {
            totalPrice += item.getSubtotal() * 1000; // Nhân 1000 như trong cart.jsp gốc
        }
        totalPrice += 30000; // Phí vận chuyển cố định 30,000 VNĐ

        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("/WEB-INF/view/cart/cart.jsp").forward(request, response);
    }

    // Thêm sách vào giỏ hàng
    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        Book book = bookService.findById(bookId);
        if (book != null) {
            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }

            // Kiểm tra xem sách đã có trong giỏ hàng chưa
            boolean found = false;
            for (CartItem item : cart) {
                if (item.getBook().getId() == bookId) {
                    if (item.getQuantity() + 1 > book.getStockQuantity()) {
                        response.sendRedirect("cart?error=not_enough_stock");
                        return;
                    }
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }
            if (!found) {
                if (1 > book.getStockQuantity()) {
                    response.sendRedirect("cart?error=not_enough_stock");
                    return;
                }
                cart.add(new CartItem(book, 1));
            }
            session.setAttribute("cart", cart);
            request.setAttribute("message", "Đã thêm sách vào giỏ hàng!");
        } else {
            request.setAttribute("error", "Không tìm thấy sách!");
        }
        response.sendRedirect("cart");
    }

    // Xóa sách khỏi giỏ hàng
    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null) {
            cart.removeIf(item -> item.getBook().getId() == bookId);
            session.setAttribute("cart", cart);
            request.setAttribute("message", "Đã xóa sách khỏi giỏ hàng!");
        }
        response.sendRedirect("cart");
    }

    // Cập nhật số lượng sách trong giỏ hàng
    private void updateQuantity(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null) {
            Book book = bookService.findById(bookId);
            if (book == null) {
                response.sendRedirect("cart?error=book_not_found");
                return;
            }
            if (quantity > book.getStockQuantity()) {
                response.sendRedirect("cart?error=not_enough_stock");
                return;
            }
            for (CartItem item : cart) {
                if (item.getBook().getId() == bookId) {
                    if (quantity <= 0) {
                        cart.remove(item); // Xóa nếu số lượng <= 0
                    } else {
                        item.setQuantity(quantity);
                    }
                    break;
                }
            }
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("cart");
    }
}