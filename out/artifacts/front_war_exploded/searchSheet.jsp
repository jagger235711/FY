<%--
  Created by IntelliJ IDEA.
  User: 25258
  Date: 2022/1/11
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="recordBean" class="bean.data.Fy_Bean" scope="session"/>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>�������</h1>
<form action="searchFy" method="post" accept-charset="GB2312">
    <table>
        <tr>
            <th>��������</th>
            <th>����ʱ��</th>
            <th>���</th>
            <th>����</th>
            <th>�ؼ��ʣ���Ŀ����</th>
        </tr>
        <tr>
            <td><select name="select-province">
                <%--                <option>��������</option>--%>
                <option value="0">ȫ��</option>
                <option value="1">������ʡ</option>
                <option value="2">����ʡ</option>
                <option value="3">����ʡ</option>
            </select></td>
            <td><select name="select-publishTime">
                <%--                <option>����ʱ��</option>--%>
                <option value="0">ȫ��</option>
                <option value="1">2006(��һ��)</option>
                <option value="2">2008(�ڶ���)</option>
                <option value="3">2011(������)</option>
                <option value="4">2014(������)</option>
                <option value="5">2021(������)</option>
            </select></td>
            <td><select name="select-native">
                <%--                <option>���</option>--%>
                <option value="0">ȫ��</option>
                <option value="1">�����ѧ</option>
                <option value="2">��ͳ����</option>
                <option value="3">��ͳ�赸</option>
                <option value="4">��ͳϷ��</option>
                <option value="5">����</option>
                <option value="6">��ͳ�������������Ӽ�</option>
                <option value="7">��ͳ����</option>
                <option value="8">��ͳ����</option>
                <option value="9">��ͳҽҩ</option>
                <option value="10">����</option>
            </select>
            </td>
            <td><select name="select-type">
                <%--                <option>����</option>--%>
                <option value="0">ȫ��</option>
                <option value="1">������Ŀ</option>
                <option value="2">��չ��Ŀ</option>
            </select></td>
            <td><input type="text" name="select-name"></td>
            <td>
                <button type="submit" id="submit">����</button>
            </td>
        </tr>
    </table>
</form>
<table border="1">
    <%
        String[][] table = recordBean.getTableRecord();
        if (table == null) {
            out.print("û�м�¼");
            return;
        }
        String[] columnName = recordBean.getColumnName();
        if (columnName != null) {
            out.print("<tr>");
            for (int i = 0; i < columnName.length; i++) {
                out.print("<th>" + columnName[i] + "</th>");
            }
            out.print("</tr>");
        }
        try {
            int k = 0;
            for (int i = 0; i < table.length; i++) {
                if (!table[i][9].equals("0")) {
                    out.print("<tr>");
                    for (int j = 0; j < columnName.length; j++) {
                        out.print("<td>" + table[i][j] + "</td>");
                    }
                    out.print("</tr>");
                    k++;
                }

            }

//        out.println("ȫ����¼��" + table.length); //ȫ����¼��
            out.println("ȫ����¼��" + k); //ȫ����¼��
        } catch (Exception e) {
            out.print(e);
            out.print("������������");
        }

    %>
</table>
</body>
</html>