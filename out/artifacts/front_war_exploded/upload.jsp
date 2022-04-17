<%--
  Created by IntelliJ IDEA.
  User: 25258
  Date: 2022/1/14
  Time: 17:39
  To change this template use File | Settings | File Templates.

  申请非遗页面。INSERT INTO fy_inf (NAME,REMARK) VALUES ('heheheh','heheheheh')
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>upload</title>
</head>
<body>
<Font size=2>
    <CENTER>
        <FORM action="uploadServlet" name=form method=post>
            <table>
                输入非遗信息，带*号项必须填写。
                <tr>
                    <td>非遗名称:</td>
                    <td><Input type=text name="select-name">*</td>
                </tr>
                <tr>
                    <td>非遗编号:</td>
                    <td><Input type=text name="select-id"></td>
                </tr>
                <tr>
                    <td>申报地区或单位:</td>
                    <td><select name="select-province">
                        <%--                <option>所属地区</option>--%>
                        <option value="1">黑龙江省</option>
                        <option value="2">吉林省</option>
                        <option value="3">辽宁省</option>
                    </select>*</td>
                </tr>

                <tr>
                    <td>类别:</td>
                    <td><select name="select-native">
                        <%--                <option>类别</option>--%>
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
                    </select>*
                    </td>
                </tr>
                <tr>
                    <td>公布时间:</td>
                    <td><select name="select-publishTime">
                        <%--                <option>公布时间</option>--%>
                        <option selected="selected" disabled="disabled" style='display: none' value=''></option>
                        <option value="1">2006(第一批)</option>
                        <option value="2">2008(第二批)</option>
                        <option value="3">2011(第三批)</option>
                        <option value="4">2014(第四批)</option>
                        <option value="5">2021(第五批)</option>
                    </select>*</td>
                </tr>
                <tr>
                    <td>类型:</td>
                    <td><select name="select-type">
                        <option selected="selected" disabled="disabled" style='display: none' value=''></option>
                        <option value="1">新增项目</option>
                        <option value="2">扩展项目</option>
                    </select>*</td>
                </tr>
            </table>
            <table>
                <tr>
                    <td><Font size=2>输入您的描述：</Font></td>
                </tr>
                <tr>
                    <td><TextArea name="remark" Rows="6" Cols="30"></TextArea></td>
                </tr>
                <tr>
                    <td><Input type=submit name="g" value="提交"></td>
                </tr>
            </table>
        </Form>
    </CENTER>
</body>
</html>
