package controller.book;

import model.Book;
import service.impl.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BookController", urlPatterns = {"/book", "/"})
public class BookController extends HttpServlet {
    private final BookService bookService = new BookService();
    private static final int BOOKS_PER_PAGE = 16; // Số sách trên mỗi trang

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); // Đảm bảo mã hóa UTF-8
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("type");
        String searchQuery = req.getParameter("query") != null ? req.getParameter("query").trim() : "";
        String minPriceStr = req.getParameter("minPrice");
        String maxPriceStr = req.getParameter("maxPrice");

        // Debug tham số nhận được
        System.out.println("Received parameters: type=" + action + ", query=" + searchQuery +
                ", minPrice=" + minPriceStr + ", maxPrice=" + maxPriceStr);

        // Lấy trang hiện tại, mặc định là 1 nếu không có
        int currentPage = 1;
        try {
            currentPage = Integer.parseInt(req.getParameter("page"));
            if (currentPage < 1) currentPage = 1;
        } catch (NumberFormatException e) {
            System.out.println("Invalid page parameter: " + e.getMessage());
        }

        List<Book> allBooks = new ArrayList<>();
        if (!searchQuery.isEmpty() || (minPriceStr != null && maxPriceStr != null)) {
            switch (action) {
                case "author":
                    allBooks = bookService.findByAuthor(searchQuery);
                    System.out.println("After findByAuthor with query '" + searchQuery + "', size: " + allBooks.size());
                    break;
                case "author_fr":
                    allBooks = bookService.findByAuthorFr();
                    System.out.println("After findByAuthorFr, size: " + allBooks.size());
                    break;
                case "findByPrice":
                    try {
                        double minPrice = minPriceStr != null ? Double.parseDouble(minPriceStr) : 0.0;
                        double maxPrice = maxPriceStr != null ? Double.parseDouble(maxPriceStr) : Double.MAX_VALUE;
                        System.out.println("Filtering by price: " + minPrice + " - " + maxPrice);
                        allBooks = bookService.findByPrice(minPrice, maxPrice);
                        System.out.println("After findByPrice, size: " + allBooks.size());
                    } catch (NumberFormatException | NullPointerException e) {
                        System.out.println("Invalid price range received: " + e.getMessage());
                        allBooks = bookService.getAll(); // Fallback to all books if error
                    }
                    break;
                default:
                    allBooks = bookService.findByName(searchQuery);
                    System.out.println("Searching by name with query '" + searchQuery + "', size: " + allBooks.size());
                    break;
            }
        } else {
            allBooks = bookService.getAll();
            System.out.println("Loading all books, size: " + allBooks.size());
        }

        // Tính tổng số trang
        int totalBooks = allBooks.size();
        int totalPages = (int) Math.ceil((double) totalBooks / BOOKS_PER_PAGE);

        // Lấy danh sách sách cho trang hiện tại
        int startIndex = (currentPage - 1) * BOOKS_PER_PAGE;
        int endIndex = Math.min(startIndex + BOOKS_PER_PAGE, totalBooks);
        List<Book> books = (startIndex < totalBooks) ? allBooks.subList(startIndex, endIndex) : new ArrayList<>();

        // Đưa các thuộc tính vào request
        req.setAttribute("books", books);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", totalPages);
        req.getRequestDispatcher("WEB-INF/view/book/listBook.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp); // Gọi lại doGet để xử lý POST
    }
}