<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/13
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QQ列表查询主页面</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_2.JPG);background-size: cover;background-repeat: no-repeat;background-position: 0% 100%;background-attachment: fixed">
欢迎${log.uname}登录
<h2>QQ列表查询主页面</h2>
<form method="post" action="ShowServlet?m=show">
    姓名:<input type="text" name="name" value="${name}">
    QQ号:<input type="text" name="number" value="${number}">
    性别:
    <%--    <input type="text" name="sex" value="${sex}">--%>
    <select name="sex">
        <option value="">---性别---</option>
        <option value="男">男</option>
        <option value="女">女</option>
    </select>
    联系/不联系(1/2):
<%--    <input type="text" name="link1" value="${link1}">--%>
    <select name="link1">
        <option value="">---联系/不联系---</option>
        <option value="1">联系</option>
        <option value="2">不联系</option>
    </select>
    <input type="submit" value="查询">
</form>
<%--欢迎${Admin.uname}用户登录--%>
<hr>
<input type="button" value="全选" onclick="qx()">&nbsp;
<input type="button" value="全不选" onclick="qbx()">&nbsp;
<input type="button" value="反选" onclick="fx()">&nbsp;
<input type="button" value="添加" onclick="add()">&nbsp;
<input type="button" value="查看微信列表" onclick="wx()">&nbsp;
<%--<input type="button" value="消费情况" onclick="xf()">&nbsp;--%>

<input type="button" value="小游戏2" onclick="xyx()">&nbsp;

<input type="button" value="最强网页" onclick="biggao()">&nbsp;

<table border="1" >
    <tr>
        <td></td>
        <td style="vertical-align: middle;text-align: center">id</td>
        <td style="vertical-align: middle;text-align: center">性别</td>
        <td style="vertical-align: middle;text-align: center">姓名</td>
        <td style="vertical-align: middle;text-align: center">号码</td>
        <td style="vertical-align: middle;text-align: center">关系</td>
        <td style="vertical-align: middle;text-align: center">操作</td>
    </tr>

    <c:forEach var="s" items="${qqlist}" varStatus="v">
    <tr>
        <td><input type="checkbox" class="ck" value="${v.count}"></td>
        <td style="vertical-align: middle;text-align: center">${v.count}</td>
        <td style="vertical-align: middle;text-align: center">${s.name}</td>
        <td style="vertical-align: middle;text-align: center">${s.sex}</td>
        <td style="vertical-align: middle;text-align: center">${s.number}</td>
        <td style="vertical-align: middle;text-align: center">
            <c:if test="${s.link==1}"><font color="blue">联系</font></c:if>
            <c:if test="${s.link==2}"><font color="red">不联系</font></c:if>
        </td>
        <td style="vertical-align: middle;text-align: center">
            <a href="sount.jsp"> <input type="button" value="点我"></a>
            <input type="button" value="删除" onclick="dele(${s.id })">
            <input type="button" value="添加QQ" onclick="TJQQ()">
<%--            <input type="button" value="修改" onclick="update(${s.id })">--%>
        </td>
    </tr>
    </c:forEach>
</table>
<script type="text/javascript">

    function biggao(){
        location="Apphtml.jsp";
    }

    function xyx(){
        window.open(" https://www.4399.com/flash/233224_2.htm");
    }


    function TJQQ(){
        window.open("https://im.qq.com/index/");
    }

    function qx(){
        $(".ck").attr("checked",true);
    }
    function qbx(){
        $(".ck").attr("checked",false);
    }
    function fx(){
        $(".ck").each(function (){
            this.checked=!this.checked;
        })
    }
    function add(){
        location="add.jsp";
    }

    function wx(){
        location="WechatServlet?m=wshow";
    }
    function xf(){
        location="TallyServlet?m=tallyshow";
    }

    function up(pid){
        location = "update.jsp?gid=" + pid;
    }

    function   dele(ids){
        if(confirm("您确认要删除选中的数据吗")){
            $.ajax({
                type:"post",
                url:"ShowServlet?m=dele",
                data:{id:ids},
                success:function(msg){
                    if(msg>0){
                        location.reload();
                    }else{
                        alert("删除失败程序报错");
                    }
                },
                dataType:"json"
            })
        }
    }
</script>
</body>
</html>
