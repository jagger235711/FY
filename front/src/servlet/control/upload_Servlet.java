package servlet.control;

import bean.data.Fy_Bean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Jagger
 * @ClassName upload_Servlet.java
 * @Description �����ϴ��ķ�����Ϣ���������ݿ�
 * @createTime 2022/1/15
 */
public class upload_Servlet extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
        }
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con;
        Statement sql;
        Fy_Bean reg = new Fy_Bean();
        request.setCharacterEncoding("gb2312");//��ֹ���룡������
        request.setAttribute("register", reg);
        String[][] searchSheet_upload = {{"������ʡ", "����ʡ", "����ʡ"}, {"2006(��һ��)", "2008(�ڶ���)", "2011(������)", "2014(������)", "2021(������)"}, {"�����ѧ", "��ͳ����", "��ͳ�赸", "��ͳϷ��", "����", "��ͳ�������������Ӽ�", "��ͳ����", "��ͳ����", "��ͳҽҩ", "����"}, {"������Ŀ", "��չ��Ŀ"}};
        String[] sqlColumn = {"�걨������λ", "����ʱ��", "���", "����"};
        int select_province = Integer.parseInt(request.getParameter("select-province").trim());
        int select_publishTime = Integer.parseInt(request.getParameter("select-publishTime").trim());
        int select_native = Integer.parseInt(request.getParameter("select-native").trim());
        int select_type = Integer.parseInt(request.getParameter("select-type").trim());
        String select_name = request.getParameter("select-name").trim();
        String select_id = request.getParameter("select-id").trim();
        String remark = request.getParameter("remark").trim();
        String backNews = null;


//        if (select_id == null) select_id = "";
//        if (select_publishTime == null) select_publishTime = "";
//        if (select_type == null) select_type = "";
//        if (remark == null) remark = "";
        try {
            String insertRecord = "('" + select_name + "','" + select_id + "','" + searchSheet_upload[1][select_publishTime - 1] + "','" + searchSheet_upload[2][select_native - 1] + "','" + searchSheet_upload[3][select_type - 1] + "','" + searchSheet_upload[0][select_province - 1] + "','" + remark + "','" + "0" + "')";
            String uri = "jdbc:mysql://127.0.0.1/hrm_db?" + "user=root&password=root&characterEncoding=gb2312";
            con = DriverManager.getConnection(uri);
            String insertCondition = "INSERT INTO fy_inf (NAME,���,����ʱ��,���,����,�걨������λ,REMARK,�Ƿ����) VALUES " + insertRecord;
            sql = con.createStatement();
            sql.executeUpdate(insertCondition);
            con.close();
            backNews = "�ϴ��ɹ�����ȴ����";
        } catch (SQLException exp) {
//            System.out.println(exp);
            backNews = "�ϴ�ʧ�ܡ�����ԭ��" + exp;
//            reg.setBackNews(backNews);
        }
        request.setAttribute("backNews", backNews);
        RequestDispatcher dispatcher = request.getRequestDispatcher("backNews.jsp");//ת��
        dispatcher.forward(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
