<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/16
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QQ修改页面</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_2.JPG);background-size: cover;background-repeat: no-repeat;background-position: 0% 100%;background-attachment: fixed">
<h2>QQ修改页面</h2>
<form method="post" action="ShowServlet?m=update">
    姓名: <input type="text" name="name" value="${s.name}"><br>
    性别:
    <input type="radio" name="sex" value="男" value="${s.sex=='男'?'checked':''}">男
    <input type="radio" name="sex" value="女" value="${s.sex=='女'?'checked':''}">女<br>
    关系:
    <input type="radio" name="link" value="1" value="${s.link==1?'checked':''}">联系
    <input type="radio" name="link" value="2" value="${s.link==2?'checked':''}">不联系<br>

    QQ号: <input type="text" name="number" value="${s.number}"><br>
    <input type="button" value="修改" onclick="up()">
</form>
<script type="text/javascript">
    var g =${param.gid}

        $.post(
            "ShowServlet?m=showid",
            {gid:g},
            function (mag){
                if (mag!=null){
                    alert(JSON.stringify(mag));

                    $("[name=gid]").val(mag.gid);
                    $("[name=gname]").val(mag.gname);
                    $("[name=price]").val(mag.price);
                    $("[name=kcl]").val(mag.kcl);
                    $("[name=idcard]").val(mag.idcard);
                    $("[name=pdate]").val(mag.pdate);
                    $("[name=newdate]").val(mag.newdate);
                    $("[name=edate]").val(mag.ename);
                    $("[name=status] option[value="+mag.status+"]").attr("selected",true);
                    $("[name=tid] option[value="+mag.tid+"]").attr("selected",true);
                }else {
                    alert("回显失败");
                }
            },"json"
        )

    function up(){
        $.post(
            "ShowServlet?m=update",
            $("form").serialize(),
            function (mag){
                if (mag>0){
                    alert("修改成功");
                    location="ShowServlet?m=show";
                }else {
                    alert("修改失败");

                }
            },
            "json"
        )
    }
</script>
</body>
</html>
