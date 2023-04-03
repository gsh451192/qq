<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/22
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>小高的私人领域</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_2.JPG);background-size: cover;background-repeat: no-repeat;background-position: 0% 100%;background-attachment: fixed">
<h2>消费统计列表主页面</h2>
欢迎${log.uname}进入作者私人领域
<form action="TallyServlet?m=tallyshow" method="post">
    时间段:<input type="date" name="intime" value="${intime}">--
    <input type="date" name="otime" value="${otime}">
    <input type="submit" value="查询">
</form>
<input type="button" value="全选" onclick="qx()">&nbsp;
<input type="button" value="全不选" onclick="qbx()">&nbsp;
<input type="button" value="反选" onclick="fx()">&nbsp;
<input type="button" value="添加" onclick="add()">&nbsp;
<input type="button" value="查看微信列表" onclick="wx()">&nbsp;
<input type="button" value="查看QQ列表" onclick="qq()">&nbsp;

<input type="button" value="小游戏3" onclick="xyx()">&nbsp;

<hr>
<table border="1">
    <tr>
        <td></td>
        <td style="vertical-align: middle;text-align: center">编号</td>
        <td style="vertical-align: middle;text-align: center">时间</td>
        <td style="vertical-align: middle;text-align: center">消费</td>
        <td style="vertical-align: middle;text-align: center">简介</td>
        <td style="vertical-align: middle;text-align: center">操作</td>
    </tr>
    <c:forEach var="z" items="${tlist}" varStatus="zx">
        <tr>
            <td><input type="checkbox" class="ck" value="${zx.count}"></td>
            <td style="vertical-align: middle;text-align: center">${zx.count}</td>
            <td style="vertical-align: middle;text-align: center">${z.time}</td>
            <td style="vertical-align: middle;text-align: center">${z.price}</td>
            <td style="vertical-align: middle;text-align: center">${z.bir}</td>
            <td style="vertical-align: middle;text-align: center">
                <input type="button" value="删除" onclick="dele(${z.id})">
            </td>
        </tr>
    </c:forEach>


</table>
<script type="text/javascript">
        function xyx(){
            location="http://www.zhiwudazhanjiangshi.com/";
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

    function wx(){
        location="WechatServlet?m=wshow";
    }

    function qq(){
        location="ShowServlet?m=show";
    }

    function add(){
        location="tallyadd.jsp";
    }

    function   dele(ids){
        if(confirm("您确认要删除选中的数据吗")){
            $.ajax({
                type:"post",
                url:"TallyServlet?m=tallydele",
                data:{id:ids},
                success:function(msg){
                    if(msg>0){
                        alert("删除成功");
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
