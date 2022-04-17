<%--
  Created by IntelliJ IDEA.
  User: 25258
  Date: 2022/1/15
  Time: 9:26
  To change this template use File | Settings | File Templates.
  非遗大学习哈哈哈哈哈哈哈
--%>
<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="testBean"
             class="bean.data.Example7_10_Bean" scope="session"/>
<html>
<head>
    <title>study</title>
    <%--    <link href="./css/style.css" rel="stylesheet" type="text/css" media="all"/>--%>
    <%--    <link href='http://fonts.googleapis.com/css?family=Glegoo' rel='stylesheet' type='text/css'>--%>
</head>
<body background="images/bg.jpg"><font size=2>
    <jsp:setProperty name="testBean" property="score" value="0"/>
    <jsp:setProperty name="testBean" property="number" value="0"/>
    <h1>欢迎来到非遗大学习！在这里你能学习到许多有趣的小知识！</h1><br>
    <h2> 考题数量是<jsp:getProperty name="testBean" property="testAmount"/>
        <form action="readTestServlet?amount=3" method="post">
            <br>输入考号<input type=text name="id" value=1 size=16>
            <br><input type=submit name="sub" value="开始">
        </form>
</font>
</body>
</html>
