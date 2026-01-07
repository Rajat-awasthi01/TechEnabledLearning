/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Student;

import DB.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.Session;

/**
 *
 * @author chandan
 */
public class UserLoginServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String usrlogin = request.getParameter("user").trim();
            String pswd = request.getParameter("pswd").trim();
            String role = request.getParameter("role").trim();
            System.out.println(usrlogin);
            DbConnection dc = new DbConnection();
            if (role.equals("stu")) {
                dc.rst = dc.stmt.executeQuery("SELECT  enrol_no FROM stu_login WHERE user_id='" + usrlogin + "' and pswd= '" + pswd + "' and approval=1 ");
                if (dc.rst.next()) {
                    String enroll = dc.rst.getString(1);
                    dc.rst = dc.stmt.executeQuery("SELECT  sname FROM stu_mstr WHERE enrol_no= '" + enroll + "'  ");
                    dc.rst.next();
                    HttpSession session = request.getSession();
                    session.setAttribute("enrol_no", enroll);
                    session.setAttribute("sname", dc.rst.getString(1));
                    response.sendRedirect("studentHome.jsp");
                } else {
                    response.sendRedirect("UserLogin.jsp?error=Sorry ! Either You aren't approved or  Wrong User Name /Password ! Plz contact to Admin or try again");
                }
            }
            if (role.equals("techr")) {
                dc.rst = dc.stmt.executeQuery("SELECT  t_id,tname FROM teacher_mstr WHERE t_id='" + usrlogin + "' and pswd='" + pswd + "'");
                if (dc.rst.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("t_id", dc.rst.getString(1));
                    session.setAttribute("tname", dc.rst.getString(2));
                    response.sendRedirect("techrHome.jsp");
                } else {
                    response.sendRedirect("UserLogin.jsp?error=Invalid Teacher ID/Password !");
                }
            }
            if (role.equals("admin")) {
                dc.rst = dc.stmt.executeQuery("SELECT  login FROM admin WHERE login='" + usrlogin + "' and pswd='" + pswd + "'");
                if (dc.rst.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("name", dc.rst.getString(1));
                    response.sendRedirect("adminHome.jsp");
                } else {
                    response.sendRedirect("UserLogin.jsp?error=Invalid User Name/Password !");
                }
            }


        } catch (Exception e) {
            System.out.println(e);

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
