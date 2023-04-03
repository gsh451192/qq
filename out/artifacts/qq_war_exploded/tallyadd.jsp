<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/22
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>小高的私人领域</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_2.JPG);background-size: cover;background-repeat: no-repeat;background-position: 0% 100%;background-attachment: fixed">
<h2>新增消费页面</h2>
欢迎${log.uname}进入作者私人领域
<form>
    时间: <input type="date" name="time" ><br>
    消费: <input type="text" name="price"><br>
    简介: <input type="text" name="bir"><br>
    <input type="button" value="添加" onclick="toadd()">
</form>
<script type="text/javascript">
    function  toadd(){
        $.post(
            "TallyServlet?m=tallyadd",
            $("form").serialize(),
            function(msg){
                if(msg>0){
                    alert("添加成功");
                    location="TallyServlet?m=tallyshow";
                }else{
                    alert("添加失败");
                }
            },
            "json"
        )
    }

</script>
</body>
</html>
