<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/5/1
  Time: 14:29
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
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<input type="checkbox" id="a" name="love"/>
<input type="checkbox" id="b" name="love"/>
<input type="checkbox" id="c" name="love"/>
<input type="checkbox" id="d" name="love"/>
<input type="checkbox" id="e" name="love"/>
<button id="btn">按钮</button>
<script>
    $(function () {
        $("#btn").click(function () {
            if ($("#b").each(":checked")){
                $("#b").removeAttr("checked");
            }else{
                $("#b").attr("checked","checked");
            }
            //全选与全不选
            // if($("input").is(":checked")){
            //     $("input").removeAttr("checked");
            // }else{
            //         $("input").attr("checked","checked");
            // }

            // //反选
            // console.log($("input").length);
            // for (var i=0;i<$("input").length;i++){
            //     if($("input").eq(i).is(":checked")){
            //         $("input").eq(i).removeAttr("checked")
            //     }else{
            //         $("input").eq(i).attr("checked","checked")
            //     }
            // }
            function setAll() {
                 var loves = document.getElementsByName("love");
                 for (var i = 0; i < loves.length; i++) {
                         loves[i].checked = true;
                    }
             }

        })
    })
</script>
</body>
</html>
