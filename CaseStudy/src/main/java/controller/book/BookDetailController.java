package controller;

import model.Book;
import service.impl.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/bookDetail")
public class BookDetailController extends HttpServlet {
    private BookService bookService;

    @Override
    public void init() throws ServletException {
        bookService = new BookService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy bookId từ request
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        // Tìm sách theo bookId
        Book book = bookService.findById(bookId);
        if (book == null) {
            request.setAttribute("error", "Không tìm thấy sách!");
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request, response);
            return;
        }

        // Đặt thông tin sách vào request để hiển thị trên JSP
        request.setAttribute("book", book);
        request.getRequestDispatcher("/WEB-INF/view/book/bookDetail.jsp").forward(request, response);
    }
}