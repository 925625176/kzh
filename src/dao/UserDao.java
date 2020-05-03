package dao;

import entity.User;

import java.util.List;

public interface UserDao {
    int insert(User user);
    User selectUserByLoginIdAndLoginPwd(String username,String password);
    List<User> selsectAll();
}
