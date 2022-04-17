<%--
  Created by IntelliJ IDEA.
  User: 25258
  Date: 2022/1/10
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
    <link href="./css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href='http://fonts.googleapis.com/css?family=Glegoo' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="./js/move-top.js"></script>
    <script type="text/javascript" src="./js/easing.js"></script>
    <%--    <script type="text/javascript">--%>
    <%--        jQuery(document).ready(function ($) {--%>
    <%--            $(".scroll").click(function (event) {--%>
    <%--                event.preventDefault();--%>
    <%--                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);--%>
    <%--            });--%>
    <%--        });--%>
    <%--    </script>--%>
</head>
<body>
<!---start-wrap---->
<div class="wrap">
    <!---start-header---->
    <div class="header" id="home">
        <!---start-logo---->
        <div class="logo">
            <a href="#"><img src="./images/logo1.png" title="logo" width="100%"/></a>
        </div>
        <!---End-logo---->
        <!---start-top-nav---->
        <div class="top-nav">
            <ul>
                <li><A href="main.jsp" target="body" class="scroll"> 主页 </A></li>
                <li><A href="study.jsp" target="body" class="scroll"> 非遗大学习 </A></li>
                <li><A href="upload.jsp" target="body" class="scroll"> 上传非遗 </A></li>
                <li><A href="browse.jsp" target="body" class="scroll"> 浏览非遗 </A></li>
                <%--                <li><A href="message.jsp" target="body" class="scroll"> 留言板 </A></li>--%>
                <%--                <li><A href="backstage.jsp" target="body" class="scroll"> 管理员后台 </A></li>--%>
                <li><A href="http://localhost:8082/hrmapp_war_exploded/main" target="_top" class="scroll"> 管理员后台 </A>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
        <!---end-top-nav---->
    </div>
    <!---End-header---->
</div>
</body>
</html>
