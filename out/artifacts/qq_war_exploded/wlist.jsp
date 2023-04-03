<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/16
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WeChat页面</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_2.JPG);background-size: cover;background-repeat: no-repeat;background-position: 0% 100%;background-attachment: fixed;align: center">
<h2>WeChat页面</h2>
欢迎${log.uname}进入WeChat主页面
<form  method="post" action="WechatServlet?m=wshow">
    姓名:<input type="text" name="wname" value="${wname}">
    性别:
<%--    <input type="text" name="wsex" value="${wsex}">--%>
    <select name="wsex">
        <option value="">---性别---</option>
        <option value="男">男</option>
        <option value="女">女</option>
    </select>

    微信号:<input type="text" name="wtel" value="${wtel}">
    <input type="submit" value="查询">
</form>
<hr>

<input type="button" align="center" value="全选" onclick="qx() ">&nbsp;
<input type="button" align="center" value="全不选" onclick="qbx()">&nbsp;
<input type="button" align="center" value="反选" onclick="fx()">&nbsp;
<input type="button" align="center" value="添加" onclick="add()">&nbsp;
<input type="button" align="center" value="查看QQ列表" onclick="qq()">&nbsp;
<%--<input type="button" align="center" value="消费情况" onclick="xf()">&nbsp;--%>

<input type="button" align="center" value="小游戏" onclick="xyx()">&nbsp;

<table border="2" style="background-color: paleturquoise">
    <tr>
        <td></td>
        <td style="vertical-align: middle;text-align: center;color: lightseagreen">id</td>
        <td style="vertical-align: middle;text-align: center;color: lightseagreen">姓名</td>
        <td style="vertical-align: middle;text-align: center;color: lightseagreen">性别</td>
        <td style="vertical-align: middle;text-align: center;color: lightseagreen">号码</td>
        <td style="vertical-align: middle;text-align: center;color: lightseagreen">关系</td>
        <td style="vertical-align: middle;text-align: center;color: lightseagreen">操作</td>
    </tr>

    <c:forEach var="s" items="${wlist}" varStatus="v">
        <tr>
            <td><input type="checkbox" class="ck" value="${v.count}"></td>

            <td style="vertical-align: middle;text-align: center">${v.count}</td>

            <td style="vertical-align: middle;text-align: center;color:black">${s.wsex}</td>
            <td style="vertical-align: middle;text-align: center;color:black">${s.wname}</td>
            <td style="vertical-align: middle;text-align: center;color:black">${s.wtel}</td>
            <td style="vertical-align: middle;text-align: center">
                <c:if test="${s.lid==1}"><font color="black">家人</font></c:if>
                <c:if test="${s.lid==2}"><font color="red">同学</font></c:if>
                <c:if test="${s.lid==3}"><font color="blue">朋友</font></c:if>
            </td>
            <td style="vertical-align: middle;text-align: center">

                <a href="sount.jsp"> <input type="button" value="点我"></a>
                <input type="button" value="删除" onclick="dele(${s.wid })">
                <input type="button" value="添加微信" onclick="TJWE()">
            </td>
        </tr>
    </c:forEach>
</table>
<script type="text/javascript">

    function xyx(){
        window.open("https://www.4399.com/special/241.htm");
    }


    function TJWE(){
        window.open("https://weixin.qq.com/");
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
        location="wadd.jsp";
    }

    function xf(){
        location="TallyServlet?m=tallyshow";
    }

    function qq(){
        location="ShowServlet?m=show";
    }

    function   dele(ids){
        if(confirm("您确认要删除选中的数据吗")){
            $.ajax({
                type:"post",
                url:"WechatServlet?m=wdele",
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
