package service.impl.order;

import dao.OrderDAO;
import dao.OrderDetailDAO; // Thêm DAO nếu cần cho OrderDetail
import model.Order;
import model.OrderDetail;

import repository.connection.DBRepository;
import service.IService;

import java.sql.Connection;
import java.util.List;

public class OrderService implements IService<Order> {
    private OrderDAO orderDAO;
    private OrderDetailDAO orderDetailDAO; // Thêm DAO cho OrderDetail nếu cần

    public OrderService() {
        Connection conn = DBRepository.getConnection();
        this.orderDAO = new OrderDAO(conn);
        this.orderDetailDAO = new OrderDetailDAO(conn); // Khởi tạo nếu cần
    }

    @Override
    public List<Order> getAll() {
        return orderDAO.getAllOrders();
    }

//    public List<OrderDetail> findAllOrderDetails() {
//        return orderRepository.findAllOrderDetails();
//    }

    @Override
    public void remove(int id) {
        orderDAO.deleteOrder(id);
    }

    @Override
    public void update(int id, Order order) { // Đảm bảo đúng kiểu Order
        orderDAO.updateOrder(id, order);
    }

    @Override
    public void update(Order order) {

    }


    @Override
    public Order findById(int id) {
        return orderDAO.getOrderById(id);
    }

    @Override
    public List<Order> findByName(String name) {
        return orderDAO.getOrdersByCustomerName(name);
    }

    @Override
    public void add(Order order) {

    }
}
