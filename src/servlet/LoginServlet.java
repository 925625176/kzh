package servlet;

import entity.User;
import serviceImpl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html,charset=utf-8");
        String name = request.getParameter("name");
        String password = request.getParameter("pwd");
        UserServiceImpl usi = new UserServiceImpl();
        User user = usi.selectUserByLoginIdAndLoginPwd(name, password);
        //user为空说明没查到,账户或密码错误,不为空发送cookie

        if (user != null){
            Cookie c = new Cookie("user1",name+"&"+password);
            c.setMaxAge(1000*60*60*24);
            response.addCookie(c);
            response.getWriter().print("ok");
        }else {
            response.getWriter().print("error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
