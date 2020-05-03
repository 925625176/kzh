package utils;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DBUtils {
    private static String driverClass;
    private static String url;
    private static String username;
    private static String password;
    static {
        try {
            Properties pro = new Properties();
            InputStream resource = DBUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            pro.load(resource);
            driverClass = pro.getProperty("driverClass");
            url = pro.getProperty("url");
            username = pro.getProperty("username");
            password = pro.getProperty("password");
            Class.forName(driverClass);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取连接方法
     * @return
     */
    public static Connection getConnection()  {
        try {
            return DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 关闭资源
     */
    public static void clo(ResultSet res,PreparedStatement prep,Connection conn){
        try {
            if(res!=null){
                res.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(prep!=null){
                prep.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(conn!=null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
