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
 * @Description 接收上传的非遗信息并存入数据库
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
        request.setCharacterEncoding("gb2312");//防止乱码！！！！
        request.setAttribute("register", reg);
        String[][] searchSheet_upload = {{"黑龙江省", "吉林省", "辽宁省"}, {"2006(第一批)", "2008(第二批)", "2011(第三批)", "2014(第四批)", "2021(第五批)"}, {"民间文学", "传统音乐", "传统舞蹈", "传统戏剧", "曲艺", "传统体育、游艺与杂技", "传统美术", "传统技艺", "传统医药", "民俗"}, {"新增项目", "扩展项目"}};
        String[] sqlColumn = {"申报地区或单位", "公布时间", "类别", "类型"};
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
            String insertCondition = "INSERT INTO fy_inf (NAME,编号,公布时间,类别,类型,申报地区或单位,REMARK,是否审核) VALUES " + insertRecord;
            sql = con.createStatement();
            sql.executeUpdate(insertCondition);
            con.close();
            backNews = "上传成功，请等待审核";
        } catch (SQLException exp) {
//            System.out.println(exp);
            backNews = "上传失败。错误原因：" + exp;
//            reg.setBackNews(backNews);
        }
        request.setAttribute("backNews", backNews);
        RequestDispatcher dispatcher = request.getRequestDispatcher("backNews.jsp");//转发
        dispatcher.forward(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
