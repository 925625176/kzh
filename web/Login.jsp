<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/29
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>登录</title>
    <%--    <script type="text/javascript"  src="js/jquery-1.8.3.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
登录账号:<input type="text" id="name"  placeholder="请输入用户名" ><br>
登录密码:<input type="password" id="Pwd"  placeholder="请输入密码"><br>
<button id="btn">登录</button>

<script >
    //根据cookie的key获取cookie的方法
    function getCookie(name) {
        var strcookie = document.cookie;
        var arrcookie = strcookie.split("; ");
        for (var i = 0; i < arrcookie.length; i++) {
            var arr = arrcookie[i].split("=");
            if (arr[0] == name) {
                return arr[1];
            }
        }
        return "";
    }


    $(function () {
        //获取cookie法一:
        var cookie1 = "${cookie.user1.value}";
        // //法二
        // var cookie2 = getCookie("user1");


        var split = cookie1.split("&");
        $("#name").val(split[0]);
        $("#Pwd").val(split[1]);








        $("#btn").click(function () {
            $.ajax({
                "url":"<%=basePath%>login",
                "type":"post",
                "data":{
                    "name":$("#name").val(),
                    "pwd":$("#Pwd").val()
                },
                "success":function (data) {
                    if (data=="ok"){
                       window.location.href="<%=basePath%>success.jsp"
                    }else{
                        alert("账号或密码错误!")
                    }
                },
                "error":function () {
                    alert("失败了")
                },
            })
        })
    })


</script>


</body>
</html>
