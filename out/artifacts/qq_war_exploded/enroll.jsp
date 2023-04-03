<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/23
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_2.JPG);background-size: cover;background-repeat: no-repeat;background-position: 10% 100%;background-attachment: fixed">
<h2>注册页面</h2>
<form>
    账号: <input type="text" name="uname" ><br>
    密码: <input type="text" name="upwd" class="aa"><br>
    请再次输入密码: <input type="text" name="upwd" class="bb"><br>
    <input type="button" value="提交" onclick="to()">
</form>
<script type="text/javascript">

    function  to(){
        let aa = $(".aa").val();
        let bb = $(".bb").val();
        if(aa===bb){
            $.post(
                "ShowServlet?m=enroll",
                $("form").serialize(),
                function(msg){
                    if(msg>0){
                        alert("添加成功");
                        location="index.jsp";
                    }else{
                        alert("添加失败");
                    }
                },
                "json"
            )
        }else{
            alert("输入的密码不正确!请重新输入");
        }


    }


</script>
</body>
</html>
