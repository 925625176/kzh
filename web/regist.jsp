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
    <title>注册</title>
<%--    <script type="text/javascript"  src="js/jquery-1.8.3.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
登录账号:<input type="text" id="name"  placeholder="请输入用户名" ><br>
登录密码:<input type="password" id="Pwd1"  placeholder="请输入密码"><br>
确认密码:<input type="password" id="Pwd2"   placeholder="请输入确认密码"><br>
<button id="btn">立即注册</button>

<script >
    var flag=false;
    $(function () {
        $("#btn").click(function () {
            var regexName = /^[a-zA-Z][\w]{5,19}$/;
            if($("#name").val()!=null&&$("#name").val().match(regexName)){
                if($("#Pwd1").val().length>=6){
                    if($("#pwd1").val() == $("#pwd2").val()){
                        flag=true;
                    }else{
                        alert("两次密码不一致")
                    }
                }else{
                    alert("请输入合法的密码")
                }
            }else {
                alert("请输入合法的用户名")
            }
            if (flag){
                $.ajax({
                    url:"${pageContext.request.contextPath}/regist",
                    type:"post",
                    data:{
                        "name":$("#name").val(),
                        "pwd1":$("#Pwd1").val(),
                        "pwd2":$("#Pwd2").val()
                    },
                    success:function (data) {
                        if(data==1){
                            window.location.href="<%=basePath%>Login.jsp"
                        }else if(data==0){
                            alert("用户名已存在")
                        }else{
                            alert("注册失败")
                        }
                    }
                });
            }
        })
    });
</script>


</body>
</html>
