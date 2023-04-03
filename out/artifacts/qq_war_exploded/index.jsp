<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/13
  Time: 18:58
  To change this template use File | Settings | File Templates.

background-size: contain;background-origin:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录页面</title>
    <script type="text/javascript"   src="js/jquery-1.8.3.min.js"></script>
  </head>
  <body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_2.JPG);background-size: cover;background-repeat: no-repeat;background-position: 0% 100%;background-attachment: fixed">



  <form style="text-align: center">
    <br><br><br><br><br><br><br><br>
<%--    <div style="width: 250px;height: 120px;background-color: pink">--%>
      <font size="5cm" color="#ffc0cb">&nbsp;欢迎登录</font><br>
      账号:<input type="text" name="name" class="aaa"><br>
      密码:<input type="password" name="pwd" class="bbb"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="登录"  onclick="T1()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="注册" onclick="T2()"><br>
<%--    </div>--%>

  </form>
  <script type="text/javascript">
    function T2(){
      location="enroll.jsp";
    }

    function T1(){
        let aa = $(".aaa").val();
        let bb = $(".bbb").val();
        if(aa!=null && aa!="" && bb!=null && bb!=""){
            $.post(
                "ShowServlet?m=login",
                $("form").serialize(),
                function (msg){
                    if (msg!=null){
                        alert("登录成功");
                        location="ShowServlet?m=show";
                    }else {
                        alert("登录失败,账号或密码输入错误");
                    }
                },
                "json"
            )
        }else {
            window.alert("请输入账号和密码");
        }

    }
  </script>
  </body>
</html>
