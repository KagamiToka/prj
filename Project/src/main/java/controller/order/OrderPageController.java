package controller.order;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import model.Book;

@WebServlet(urlPatterns = "/order")
public class OrderPageController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookId = request.getParameter("bookId");

        if (bookId == null || bookId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing bookId parameter");
            return;
        }

        String imageURL = request.getParameter("imageURL");
        String title = request.getParameter("title");
        String price = request.getParameter("price");

        try {
            int id = Integer.parseInt(bookId);

            Book book = new Book();
            book.setId(id);
            book.setImageURL(imageURL);
            book.setTitle(title);
            book.setPrice(Double.parseDouble(price));
            request.setAttribute("book", book);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/order/orderpage.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid bookId format");
        }
    }
}
