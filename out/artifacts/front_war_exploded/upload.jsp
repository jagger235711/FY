<%--
  Created by IntelliJ IDEA.
  User: 25258
  Date: 2022/1/14
  Time: 17:39
  To change this template use File | Settings | File Templates.

  �������ҳ�档INSERT INTO fy_inf (NAME,REMARK) VALUES ('heheheh','heheheheh')
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
                ���������Ϣ����*���������д��
                <tr>
                    <td>��������:</td>
                    <td><Input type=text name="select-name">*</td>
                </tr>
                <tr>
                    <td>���ű��:</td>
                    <td><Input type=text name="select-id"></td>
                </tr>
                <tr>
                    <td>�걨������λ:</td>
                    <td><select name="select-province">
                        <%--                <option>��������</option>--%>
                        <option value="1">������ʡ</option>
                        <option value="2">����ʡ</option>
                        <option value="3">����ʡ</option>
                    </select>*</td>
                </tr>

                <tr>
                    <td>���:</td>
                    <td><select name="select-native">
                        <%--                <option>���</option>--%>
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
                    </select>*
                    </td>
                </tr>
                <tr>
                    <td>����ʱ��:</td>
                    <td><select name="select-publishTime">
                        <%--                <option>����ʱ��</option>--%>
                        <option selected="selected" disabled="disabled" style='display: none' value=''></option>
                        <option value="1">2006(��һ��)</option>
                        <option value="2">2008(�ڶ���)</option>
                        <option value="3">2011(������)</option>
                        <option value="4">2014(������)</option>
                        <option value="5">2021(������)</option>
                    </select>*</td>
                </tr>
                <tr>
                    <td>����:</td>
                    <td><select name="select-type">
                        <option selected="selected" disabled="disabled" style='display: none' value=''></option>
                        <option value="1">������Ŀ</option>
                        <option value="2">��չ��Ŀ</option>
                    </select>*</td>
                </tr>
            </table>
            <table>
                <tr>
                    <td><Font size=2>��������������</Font></td>
                </tr>
                <tr>
                    <td><TextArea name="remark" Rows="6" Cols="30"></TextArea></td>
                </tr>
                <tr>
                    <td><Input type=submit name="g" value="�ύ"></td>
                </tr>
            </table>
        </Form>
    </CENTER>
</body>
</html>
