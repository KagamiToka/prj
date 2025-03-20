package controller.cart;

import model.CartItem;
import model.Book;
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

@WebServlet("/buy")
public class BuyController extends HttpServlet {
    private BookService bookService;

    @Override
    public void init() throws ServletException {
        bookService = new BookService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
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
                        response.sendRedirect("/book?error=not_enough_stock");
                        return;
                    }
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }
            if (!found) {
                if (1 > book.getStockQuantity()) {
                    response.sendRedirect("/book?error=not_enough_stock");
                    return;
                }
                cart.add(new CartItem(book, 1));
            }

            session.setAttribute("cart", cart);
            response.sendRedirect("/orderpage");
        } else {
            response.sendRedirect("/book?error=bookNotFound");
        }
    }
}