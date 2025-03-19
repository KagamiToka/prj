package model;

public class Book {
    private int id;
    private String title;
    private String author;
    private double price;
    private int stockQuantity;
    private String imageURL;
    private String bookDescription;
    private int status;
    public Book(String title, String author, double price, String imageURL, int stockQuantity, String bookDescription) {
        this.title = title;
        this.author = author;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.imageURL = imageURL;
        this.bookDescription = bookDescription;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Book(int id, String title, String author, double price, int stockQuantity, String imageURL, String bookDescription, int status) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.imageURL = imageURL;
        this.bookDescription = bookDescription;
        this.status = status;
    }

    public Book() {}

    public Book(int id, String title, String author, double price, String imageURL, int stockQuantity,String bookDescription) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.imageURL = imageURL;
        this.bookDescription = bookDescription;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }
    public String getImageURL() { return imageURL; }
    public void setImageURL(String imageURL) { this.imageURL = imageURL; }

    public String getBookDescription() {
        return bookDescription;
    }

    public void setBookDescription(String bookDescription) {
        this.bookDescription = bookDescription;
    }
}

