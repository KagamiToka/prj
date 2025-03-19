package service;

import model.Order;
import model.User;

import java.util.List;

public interface IService<T> {
    List<T> getAll();
    void remove(int id);
    void update(int id, T t);
    void update(T t);
    T findById(int id);
    List<T> findByName(String name);
    void add(T t);

}
