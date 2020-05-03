package servlet;

import entity.User;
import serviceImpl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/regist")
public class RegistServlet1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd1");
        User u = new User();
        UserServiceImpl usi = new UserServiceImpl();
        User user = usi.selectUserByLoginIdAndLoginPwd(name, pwd);

        //user为空说明没查到,可插入
        if(user != null){
            response.getWriter().print(0);
        }else{
            u.setLoginId(name);
            u.setLoginPwd(pwd);
            int result = usi.insert(u);
            if (result>0){
                response.getWriter().print(1);
            }else{
                response.getWriter().print(-1);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
