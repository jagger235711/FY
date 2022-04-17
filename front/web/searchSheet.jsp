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

<h1>浏览非遗</h1>
<form action="searchFy" method="post" accept-charset="GB2312">
    <table>
        <tr>
            <th>所属地区</th>
            <th>公布时间</th>
            <th>类别</th>
            <th>类型</th>
            <th>关键词：项目名称</th>
        </tr>
        <tr>
            <td><select name="select-province">
                <%--                <option>所属地区</option>--%>
                <option value="0">全部</option>
                <option value="1">黑龙江省</option>
                <option value="2">吉林省</option>
                <option value="3">辽宁省</option>
            </select></td>
            <td><select name="select-publishTime">
                <%--                <option>公布时间</option>--%>
                <option value="0">全部</option>
                <option value="1">2006(第一批)</option>
                <option value="2">2008(第二批)</option>
                <option value="3">2011(第三批)</option>
                <option value="4">2014(第四批)</option>
                <option value="5">2021(第五批)</option>
            </select></td>
            <td><select name="select-native">
                <%--                <option>类别</option>--%>
                <option value="0">全部</option>
                <option value="1">民间文学</option>
                <option value="2">传统音乐</option>
                <option value="3">传统舞蹈</option>
                <option value="4">传统戏剧</option>
                <option value="5">曲艺</option>
                <option value="6">传统体育、游艺与杂技</option>
                <option value="7">传统美术</option>
                <option value="8">传统技艺</option>
                <option value="9">传统医药</option>
                <option value="10">民俗</option>
            </select>
            </td>
            <td><select name="select-type">
                <%--                <option>类型</option>--%>
                <option value="0">全部</option>
                <option value="1">新增项目</option>
                <option value="2">扩展项目</option>
            </select></td>
            <td><input type="text" name="select-name"></td>
            <td>
                <button type="submit" id="submit">搜索</button>
            </td>
        </tr>
    </table>
</form>
<table border="1">
    <%
        String[][] table = recordBean.getTableRecord();
        if (table == null) {
            out.print("没有记录");
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

//        out.println("全部记录数" + table.length); //全部记录数
            out.println("全部记录数" + k); //全部记录数
        } catch (Exception e) {
            out.print(e);
            out.print("输入搜索条件");
        }

    %>
</table>
</body>
</html>