<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="testBean"
             class="bean.data.Example7_10_Bean" scope="session"/>
<HTML>
<body bgcolor=#DEEFF9><font size=2>
    <br><b>
    <jsp:getProperty name="testBean" property="questions"/>
</b>
    <br> <br>
    <jsp:getProperty name="testBean" property="choiceA"/>
    <br> <br>
    <jsp:getProperty name="testBean" property="choiceB"/>
    <br> <br>
    <jsp:getProperty name="testBean" property="choiceC"/>
    <br> <br>
    <jsp:getProperty name="testBean" property="choiceD"/>

    <% String pic = testBean.getImage();
        if (pic != null && pic.length() >= 1) {
    %>
    <br>
    <%--    <image src=images/<%=pic%> width=100 height=60></image>--%>
    <img src="images/<%=pic%>" width="100" height="60" alt="��ĿͼƬ"/>
    <% }
    %>
    <br>
    <% String studentAnswer = request.getParameter("R");
        if (studentAnswer != null && studentAnswer.length() >= 1) {
            testBean.setAnswer(studentAnswer.trim());
        }
    %>
    <b> Ŀǰ������ <jsp:getProperty name="testBean" property="score"/>,
        ��Ϣ�� <jsp:getProperty name="testBean" property="mess"/><br>
        <form action="" method=post name=form>
            <br>ѡ��:<input type="radio" name="R" value=A>A
            <input type="radio" name="R" value=B>B
            <input type="radio" name="R" value=C>C
            <input type="radio" name="R" value=D>D
            <br><input type="submit" value="ȷ��(�ٶ�ȡ��һ��֮ǰ���ɷ���ȷ��)" name="submit">
        </form>
        <b>��Ŀǰ������ѡ����<%=studentAnswer %>
            <form action="readTestServlet" method=post name=form>
                <br><input type="hidden"
                           value="<%=testBean.getId()%>" name="id">
                <br><input type="submit" value="��һ��" name="submit">
            </form>
            <form action="endTestServlet" method=post name=form>
                <input type="submit" value="����" name="submit">
            </form>
</font></body>
</HTML>
