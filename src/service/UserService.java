package service;

import entity.User;

import java.util.List;

public interface UserService {
    int insert(User user);
    User selectUserByLoginIdAndLoginPwd(String username,String password);
    List<User> selsectAll();

}
