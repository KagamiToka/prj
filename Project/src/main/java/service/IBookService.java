package service;

import model.Book;

import java.util.List;

public interface IBookService {
    List<Book> findByAuthor(String name);
    List<Book> findByAuthorFr();
    void updateBook(Book book);
    List<Book> findByPrice(double minPrice, double maxPrice);

}
