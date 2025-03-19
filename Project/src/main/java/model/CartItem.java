package model;

public class CartItem {
    private int id;
    private String name;
    private double price;
    private int quantity;
    private String image;

    public CartItem(int id, String name, double price, int quantity, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }
    public String getImage() { return image; }

    public void setQuantity(int quantity) { this.quantity = quantity; }
}
