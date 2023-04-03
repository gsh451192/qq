<%--
  Created by IntelliJ IDEA.
  User: Gao
  Date: 2023/3/25
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>最强网页</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body style="background: url(https://img.1ppt.com/uploads/allimg/2011/1_201110192252_2.JPG);background-size: cover;background-repeat: no-repeat;background-position: 0% 100%;background-attachment: fixed">
欢迎${log.uname}进入最强网页
<table border="1" style="background-color: paleturquoise">
    <h2>短视频类</h2>
    <input type="button" align="center" value="抖音" onclick="douyin()">&nbsp;
    <input type="button" align="center" value="快手" onclick="kuaishou()">&nbsp;
    <input type="button" align="center" value="哔哩哔哩" onclick="bilibili()">&nbsp;
</table>

<table border="1" style="background-color: paleturquoise">
    <h2>影视类</h2>
    <input type="button" align="center" value="爱奇艺" onclick="aiqiyi()">&nbsp;
    <input type="button" align="center" value="腾讯视频" onclick="tengxun()">&nbsp;
    <input type="button" align="center" value="优酷" onclick="youku()">&nbsp;
    <input type="button" align="center" value="芒果TV" onclick="mangguo()">&nbsp;
</table>


</body>
</html>
<script type="text/javascript">
    //抖音
    function douyin(){
        window.open("https://www.douyin.com/?enter=guide");
    }
    //快手
    function kuaishou(){
        window.open("https://www.kuaishou.com/new-reco");
    }
    //哔哩哔哩
    function bilibili(){
        window.open("https://www.bilibili.com/");
    }

    //爱奇艺
    function aiqiyi(){
        window.open("https://www.iqiyi.com/");
    }
    //腾讯
    function tengxun(){
        window.open("https://v.qq.com/");
    }
    //优酷
    function youku(){
        window.open("https://youku.com/channel/webhome");
    }
    //芒果
    function mangguo(){
        window.open("https://www.mgtv.com/");
    }
</script>
