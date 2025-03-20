package service.impl.OrderDetail;

import dao.OrderDetailDAO;
import model.OrderDetail;
import repository.connection.DBRepository;
import service.IService;

import java.sql.Connection;
import java.util.List;

public class OrderDetailService implements IService<OrderDetail> {
    private OrderDetailDAO orderDetailDAO;

    public OrderDetailService(Connection conn) {
        this.orderDetailDAO = new OrderDetailDAO(conn);
    }

    @Override
    public List<OrderDetail> getAll() {
        return orderDetailDAO.getAllOrderDetails();
    }

    @Override
    public void remove(int id) {
        orderDetailDAO.deleteOrderDetail(id);
    }

    @Override
    public void update(int id, OrderDetail orderDetail) {
        orderDetailDAO.updateOrderDetail(id, orderDetail);
    }

    @Override
    public void update(OrderDetail orderDetail) {
        orderDetailDAO.updateOrderDetail(orderDetail.getId(), orderDetail);
    }

    @Override
    public OrderDetail findById(int id) {
        return orderDetailDAO.getOrderDetailById(id);
    }

    @Override
    public List<OrderDetail> findByName(String name) {
        return orderDetailDAO.getOrderDetailsByCustomerName(name);
    }

    @Override
    public void add(OrderDetail orderDetail) {
        orderDetailDAO.addOrderDetail(orderDetail);
    }
}