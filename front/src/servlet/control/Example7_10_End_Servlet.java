package servlet.control;

import bean.data.Example7_10_Bean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Example7_10_End_Servlet extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Example7_10_Bean testBean = null;
        HttpSession session = request.getSession(true);
        try {
            testBean = (Example7_10_Bean) session.getAttribute("testBean");
        } catch (Exception exp) {
            response.sendRedirect("study.jsp");
        }
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
        }
        request.setCharacterEncoding("gb2312");
        String id = testBean.getId();
        Connection con;
        Statement sql;
        String condition = "INSERT INTO student VALUES" + "(" + "'" + id + "'," + testBean.getScore() + ")";

        try {
            String uri = "jdbc:mysql://127.0.0.1/hrm_db?" + "user=root&password=root&characterEncoding=gb2312";
            con = DriverManager.getConnection(uri);
            sql = con.createStatement();
            sql.executeUpdate(condition);
            float score = testBean.getScore();
            notify(request, response, id + "最后得分:" + score);
            session.invalidate();              //销毁用户的session对象
        } catch (SQLException exp) {
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void notify(HttpServletRequest request, HttpServletResponse response, String backNews) {
        response.setContentType("text/html;charset=GB2312");
        try {
//            response.getWriter().write("hehe");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h2>" + backNews + "</h2>");
            out.println("</body></html>");
        } catch (IOException exp) {
        }
    }
}
