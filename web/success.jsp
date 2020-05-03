<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/30
  Time: 0:30
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
    <title>用户页面</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div id="div"></div>
<script>
$(function () {
    $.ajax({
        url:"<%=basePath%>selectAll",
        type:"post",
        datatype:"json",
        success:function (data) {
            var jsonStr = eval(data);
            console.log(jsonStr);
            if (jsonStr.length>0){
                var str ="";
                for (var i=0;i<jsonStr.length;i++){
                    var p = jsonStr[i];
                      str+="<tr><td>"+jsonStr[i]["uId"]+"</td>"+
                        "<td>"+jsonStr[i]["loginId"]+"</td>"+
                        "<td>"+jsonStr[i]["loginPwd"]+"</td>"+
                        "<td>"+jsonStr[i]["creationTime"]+"</td></tr>";
                }
                $("#div").html("<table><tr><td>用户id</td>" +
                    "<td>用户姓名</td>" +
                    "<td>用户密码</td>" +
                    "<td>时间</td></tr>"+
                    str+"</table>")
            }
            $("#table").append(str)
        }

    })
})

</script>

</body>
</html>
