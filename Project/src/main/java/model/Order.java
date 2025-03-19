package model;

import java.time.LocalDateTime;

public class Order {
    private int id;
    private int bookId;
    private int customerId;
    private LocalDateTime orderDate;
    private double totalPrice;
    private String status;

    public Order() {}


    public Order(int id, int bookId, int customerId, LocalDateTime orderDate, double totalPrice, String status) {
        this.id = id;
        this.bookId = bookId;
        this.customerId = customerId;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Order getBook() {
        return null;
    }
}