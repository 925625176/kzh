package daoImpl;

import dao.UserDao;
import entity.User;
import utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {
    Connection conn = null;
    PreparedStatement prep = null;
    ResultSet resultSet = null;
    int i = -1;
    @Override
    public int insert(User user) {
        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kzh", "root", "root");
            conn = DBUtils.getConnection();
            String sql = "insert into user(LoginId,LoginPwd) values(?,?)";

            prep = conn.prepareStatement(sql);
            prep.setObject(1,user.getLoginId());
            prep.setObject(2,user.getLoginPwd());
            i = prep.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBUtils.clo(null,prep,conn);
            return i;
        }

    }

    @Override
    public User selectUserByLoginIdAndLoginPwd(String username, String password) {
        try {
            conn = DBUtils.getConnection();
            PreparedStatement prep = conn.prepareStatement("select * from user where LoginId=? and LoginPwd=?");
            prep.setObject(1,username);
            prep.setObject(2,password);
            resultSet = prep.executeQuery();
            User user = null ;
            while (resultSet.next()){
                user = new User();
                user.setuId(Integer.parseInt(resultSet.getString(1)));
                user.setLoginId(resultSet.getString(2));
                user.setLoginPwd(resultSet.getString(3));
                user.setCreationTime(resultSet.getString(4));
            }
            return user;

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.clo(resultSet,prep,conn);
        }

        return null;
    }

    @Override
    public List<User> selsectAll() {
        try {
            conn = DBUtils.getConnection();
            PreparedStatement prep = conn.prepareStatement("select * from user ");
            resultSet = prep.executeQuery();
            User user = null ;
            List<User> list = new ArrayList<User>();
            while (resultSet.next()){
                user = new User();
                user.setuId(Integer.parseInt(resultSet.getString(1)));
                user.setLoginId(resultSet.getString(2));
                user.setLoginPwd(resultSet.getString(3));
                user.setCreationTime(resultSet.getString(4));
                list.add(user);
            }
            return list;

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.clo(resultSet,prep,conn);
        }
        return null;
    }
}
