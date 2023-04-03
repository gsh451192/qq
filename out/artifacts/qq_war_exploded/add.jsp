<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/13
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QQ添加页面</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_4.JPG);background-size: cover;background-repeat: no-repeat;background-position: 0% 100%;background-attachment: fixed">
<h2>QQ新增页面</h2>
欢迎${log.uname}进入QQ新增页面
<form>
    姓名: <input type="text" name="name" id="name" onblur="xingming(this)"><span id="namemsg"></span><br>
    性别: <input type="radio" name="sex" value="男">男
         <input type="radio" name="sex" value="女">女<br>
    关系: <input type="radio" name="link" value="1">联系
         <input type="radio" name="link" value="2">不联系<br>
    QQ号: <input type="text" name="number" id="number" onblur="zhanghao(this)"><span id="numbermsg"></span><br>
    <input type="button" value="添加" onclick="toadd()">
</form>
<script type="text/javascript">
    function xingming(vaa){
        let name = vaa.value;
        let zz = /^[\u4e00-\u9fa5]{1,3}$/;
        let flg = zz.test(name);
        let nameobj = document.getElementById("namemsg");
        if(flg){
            nameobj.innerHTML = "<font color='white'>√</font>";
        }else{
            nameobj.innerHTML = "<font color='red'>请输入正确的用户名</font>"
        }
    }

    function zhanghao(vaa){
        let number = vaa.value;
        let zz = /^[0-9]{8,10}$/;
        let flg = zz.test(number);
        let numberobj = document.getElementById("numbermsg");
        if(flg){
            numberobj.innerHTML = "<font color='white'>√</font>";
        }else{
            numberobj.innerHTML = "<font color='red'>请正确输入QQ号</font>"
        }
    }




    function  toadd(){
        $.post(
            "ShowServlet?m=add",
            $("form").serialize(),
            function(msg){
                if(msg>0){
                    alert("添加成功");
                    location="ShowServlet?m=show";
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
