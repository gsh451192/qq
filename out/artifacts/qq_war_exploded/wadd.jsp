<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/16
  Time: 11:45
  To change this template use File | Settings | File Templates.

  onclick="toadd()"
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WeChat新增页面</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_2.JPG);background-size: cover;background-repeat: no-repeat;background-position: 0% 100%;background-attachment: fixed">
<h2>WeChat新增页面</h2>
欢迎${log.uname}进入WeChat新增页面
<form onsubmit="return tijiao()" action="">
    姓名:
    <input type="text" name="wname" id="wname" onblur="wxingming()"><span id="wnamemsg"></span><br>
    性别:
    <input type="radio" name="wsex" value="男">男
    <input type="radio" name="wsex" value="女">女<br>
    关系:
    <input type="radio" name="lid" value="1">家人
    <input type="radio" name="lid" value="2">同学
    <input type="radio" name="lid" value="3">朋友<br>
    微信号:
    <input type="text" name="wtel" id="wtel" onblur="wtel1()"><span id="wtelmsg"></span><br>
    <input type="submit" value="添加" onclick="toadd()">
</form>
<script type="text/javascript">
    function tijiao(){
        let a = wxingming();
        let b = wtel1();
        if(a==false && b==false){
            close("请验证信息");
        }
        return a&&b;
    }

    function wxingming(){
        let wname = document.getElementById("wname").value;
        let zz = /^[\u4e00-\u9fa5]{1,3}$/;
        let flg = zz.test(wname);
        let wnameobj = document.getElementById("wnamemsg");
        if(flg){
            wnameobj.innerHTML = "<font color='white'>√</font>";
        }else{
            wnameobj.innerHTML = "<font color='red'>请输入正确的用户名</font>";
        }
        return flg;
    }

    function wtel1(){
        let wtel = document.getElementById("wtel").value;
        let zz = /^\w{2,}$/;
        let flg = zz.test(wtel);
        let wtelobj = document.getElementById("wtelmsg");
        if(flg){
            wtelobj.innerHTML = "<font color='white'>√</font>";
        }else{
            wtelobj.innerHTML = "<font color='red'>请正确输入Wechat号</font>";
        }
        return flg;
    }

    function  toadd(){
        $.post(
            "WechatServlet?m=wadd",
            $("form").serialize(),
            function(msg){
                if(msg>0){
                    alert("添加成功");
                    location="WechatServlet?m=wshow";
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
