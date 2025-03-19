package service;

import model.User;

public interface IUserService {
    void add(User user);

    User login(String userName, String password);
}
