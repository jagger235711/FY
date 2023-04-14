package servlet.control;

import bean.data.Fy_Bean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

/**
 * @author Jagger
 * @ClassName Fy_Servlet.java
 * @Description ���ڶ�ȡ�Ͱ������������ݿ���fy_inf����Ϣ��������Fy_Bean
 * @createTime 2022/1/12
 */
public class Fy_Servlet extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("gb2312");
//        String dataBase= request.getParameter("dataBase");
//        String tableName= request.getParameter("tableName");
//        String user= request.getParameter("user");
//        String password= request.getParameter("password");
//        boolean boo =( dataBase==null||dataBase.length()==0);
//        boo = boo||( tableName==null||tableName.length()==0);
//        boo = boo||( user==null||user.length()==0);
//        if(boo) {
//            fail(request,response,"��ѯʧ��");
//        }
        request.setCharacterEncoding("gb2312");//��ֹ���룡������
        String dataBase = "hrm_db";
        String tableName = "fy_inf";
        String user = "root";
        String password = "root";
        String[][] searchSheet_upload = {{"������ʡ", "����ʡ", "����ʡ"}, {"2006(��һ��)", "2008(�ڶ���)", "2011(������)", "2014(������)", "2021(������)"}, {"�����ѧ", "��ͳ����", "��ͳ�赸", "��ͳϷ��", "����", "��ͳ�������������Ӽ�", "��ͳ����", "��ͳ����", "��ͳҽҩ", "����"}, {"������Ŀ", "��չ��Ŀ"}};
        String[] sqlColumn = {"�걨������λ", "����ʱ��", "���", "����"};

        //��̬ƴ��sql��������
//        System.out.println(request.getParameter("select-province"));
        int select_province = Integer.parseInt(request.getParameter("select-province").trim());
        int select_publishTime = Integer.parseInt(request.getParameter("select-publishTime").trim());
        int select_native = Integer.parseInt(request.getParameter("select-native").trim());
        int select_type = Integer.parseInt(request.getParameter("select-type").trim());
        String select_name = request.getParameter("select-name").trim();
        String currentSql = "SELECT * FROM " + tableName;

        if (select_name.equals("")) {
            int[] sqlProperty = {select_province, select_publishTime, select_native, select_type};
            int j = 0;
            for (int i = 0; i < sqlProperty.length; i++) {
                if (sqlProperty[i] != 0) {
                    if (j == 0) {
                        currentSql += " where ";
                    } else currentSql += " and ";
                    j++;
                    if (i == 0) {
                        currentSql += sqlColumn[i] + " like '" + searchSheet_upload[i][sqlProperty[i] - 1] + "%'";//ģ������ ֻҪ�����ʡ�ľͶ�Ҫ
                    } else {
                        currentSql += sqlColumn[i] + " = '" + searchSheet_upload[i][sqlProperty[i] - 1] + "'";
                    }
                }
            }
        } else {
            currentSql += " where name = '" + select_name + "'";
        }


        HttpSession session = request.getSession(true);
        Connection con = null;
        Fy_Bean recordBean = null;
        try {
            recordBean = (Fy_Bean) session.getAttribute("recordBean");
            if (recordBean == null) {
                recordBean = new Fy_Bean();  //����Javabean����
                session.setAttribute("recordBean", recordBean);
            }
        } catch (Exception exp) {
            recordBean = new Fy_Bean();
            session.setAttribute("recordBean", recordBean);
        }
        String uri = "jdbc:mysql://127.0.0.1/" + dataBase;
        try {
            con = DriverManager.getConnection(uri, user, password);
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = sql.executeQuery(currentSql);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount(); //�õ������������
            String[] columnName = new String[columnCount];
            for (int i = 0; i < columnName.length; i++) {
                columnName[i] = metaData.getColumnName(i + 1); //�õ�����
            }
            recordBean.setColumnName(columnName);   //����Javabean����ģ��
            rs.last();
            int rowNumber = rs.getRow();  //�õ���¼��
            String[][] tableRecord = recordBean.getTableRecord();
            tableRecord = new String[rowNumber][columnCount];
            rs.beforeFirst();
            int i = 0;
            while (rs.next()) {
                for (int k = 0; k < columnCount; k++)
                    tableRecord[i][k] = rs.getString(k + 1);
                i++;
            }
            recordBean.setTableRecord(tableRecord); //����Javabean����ģ��

            con.close();
            response.sendRedirect("searchSheet.jsp");  //�ض���
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
