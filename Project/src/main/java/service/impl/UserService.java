package service.impl;

import model.Order;
import model.User;
import repository.user.UserRepository;
import service.IService;
import service.IUserService;


import java.util.List;

public class UserService implements IService , IUserService {
    private final UserRepository userRepository = new UserRepository();

    @Override
    public List<User> getAll() {
        return userRepository.getAllUsers();
    }

    @Override
    public void remove(int id) {

    }

    @Override
    public void update(int id, Object o) {

    }

    @Override
    public void update(Object o) {

    }


    @Override
    public Object findById(int id) {
        return null;
    }

    @Override
    public List findByName(String name) {
        return null;
    }

    @Override
    public void add(Object o) {
    }

    @Override
    public void add(User user) {
        userRepository.saveUser(user);
    }


    @Override
    public User login(String userName, String password) {
        return userRepository.login(userName,password);
    }
}
