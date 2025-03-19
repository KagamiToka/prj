package repository.book;

import model.Book;
import model.User;
import repository.connection.DBRepository;


import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class BookRepository {
    public static List<Book> findAll() {
        List<Book> books = new ArrayList<>();
        try {
            Statement statement = DBRepository.getConnection().
                    createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * from books where status = 1");
            while (resultSet.next()){
                int idBook =resultSet.getInt("id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                Double price = resultSet.getDouble("price");
                String imageURL = resultSet.getString("ImageURL");
                int quantity = resultSet.getInt("stock_quantity");
                String description = resultSet.getString("book_description");
                books.add(new Book(idBook,title,author,price,imageURL,quantity,description));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }
    public static List<Book> findAllDelete() {
        List<Book> books = new ArrayList<>();
        try {
            Statement statement = DBRepository.getConnection().
                    createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * from books where status = 0");
            while (resultSet.next()){
                int idBook =resultSet.getInt("id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                Double price = resultSet.getDouble("price");
                String imageURL = resultSet.getString("ImageURL");
                int quantity = resultSet.getInt("stock_quantity");
                String description = resultSet.getString("book_description");
                books.add(new Book(idBook,title,author,price,imageURL,quantity,description));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    public static List<Book> findByName(String name) {
        List<Book> books = new ArrayList<>();
        try {
            String query = "SELECT * FROM books WHERE title LIKE ?";
            PreparedStatement preparedStatement = DBRepository.getConnection().prepareStatement(query);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idBook = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String author = resultSet.getString("author");
                Double price = resultSet.getDouble("price");
                String imageURL = resultSet.getString("ImageURL");
                int quantity = resultSet.getInt("stock_quantity");
                String description = resultSet.getString("book_description");
                books.add(new Book(idBook, title, author, price,imageURL, quantity, description));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    public static List<Book> findByAuthor(String author) {
        List<Book> books = new ArrayList<>();
        try {
            String query = "SELECT * FROM books WHERE author LIKE ?";
            PreparedStatement preparedStatement = DBRepository.getConnection().prepareStatement(query);
            preparedStatement.setString(1, "%" + author + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idBook = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String authorName = resultSet.getString("author");
                Double price = resultSet.getDouble("price");
                String imageURL = resultSet.getString("ImageURL");
                int quantity = resultSet.getInt("stock_quantity");
                String description = resultSet.getString("book_description");
                books.add(new Book(idBook, title, authorName, price,imageURL, quantity, description));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }
    public static List<Book> findByAuthorFr() {
        List<Book> books = new ArrayList<>();
        try {
            String query = "SELECT * FROM books WHERE author NOT IN ('Nam Cao', 'Vũ Trọng Phụng', 'Nguyễn Nhật Ánh')";
            PreparedStatement preparedStatement = DBRepository.getConnection().prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int idBook = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String authorName = resultSet.getString("author");
                Double price = resultSet.getDouble("price");
                String imageURL = resultSet.getString("ImageURL");
                int quantity = resultSet.getInt("stock_quantity");
                String description = resultSet.getString("book_description");
                books.add(new Book(idBook, title, authorName, price,imageURL, quantity, description));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }

    public Book findById(int id) {
        Book book = null;
        Connection conn = DBRepository.getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(
                    "SELECT id, title, author, price, ImageURL, stock_quantity,  book_description FROM books WHERE id = ?"
            );
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String author = rs.getString("author");
                Double price = rs.getDouble("price");
                String image = rs.getString("ImageURL");
                int stock = rs.getInt("stock_quantity");
                String description = rs.getString("book_description");
                book = new Book(id,title , author, price,image, stock, description);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return book;
    }
    public void update(Book book) {
        Connection conn = DBRepository.getConnection();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(
                    "UPDATE books SET title = ?,author = ? , price = ?,ImageURL = ?  , stock_quantity = ?, book_description = ?  WHERE id = ?"
            );
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getAuthor());
            preparedStatement.setDouble(3, book.getPrice());
            preparedStatement.setString(4, book.getImageURL());
            preparedStatement.setInt(5, book.getStockQuantity());
            preparedStatement.setString(6, book.getBookDescription());
            preparedStatement.setInt(7, book.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void delete(int id){
        Connection conn = DBRepository.getConnection();
        try (PreparedStatement preparedStatement = conn.prepareStatement(
                "UPDATE books SET status = 0 WHERE id = ?"
        )){

            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Book> findByPrice(double minPrice, double maxPrice) {
        String sql = "SELECT * FROM books WHERE price BETWEEN ? AND ?";
        try (Connection conn = DBRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDouble(1, minPrice);
            stmt.setDouble(2, maxPrice);
            ResultSet rs = stmt.executeQuery();
            List<Book> books = new ArrayList<>();
            while (rs.next()) {
                books.add(new Book(rs.getInt("id"), rs.getString("title"), rs.getString("author"),
                        rs.getDouble("price"), rs.getString("imageURL"), rs.getInt("stock_quantity"), rs.getString("book_description")));
            }
            return books;
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public void add(Book book) {
         // tao ket noi
        Connection conn = DBRepository.getConnection();
        try (PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO books (title,author,price,ImageURL,stock_quantity,book_description) values(?,?,?,?,?,?)")){
            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getAuthor());
            preparedStatement.setDouble(3, book.getPrice());
            preparedStatement.setString(4, book.getImageURL());
            preparedStatement.setInt(5, book.getStockQuantity());
            preparedStatement.setString(6, book.getBookDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
