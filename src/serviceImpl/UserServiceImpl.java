package serviceImpl;

import daoImpl.UserDaoImpl;
import entity.User;
import service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserDaoImpl udi = new UserDaoImpl();
    @Override
    public int insert(User user) {
        return udi.insert(user);
    }

    @Override
    public User selectUserByLoginIdAndLoginPwd(String username, String password) {
        return udi.selectUserByLoginIdAndLoginPwd(username,password);
    }

    @Override
    public List<User> selsectAll() {
        return udi.selsectAll();
    }
}
