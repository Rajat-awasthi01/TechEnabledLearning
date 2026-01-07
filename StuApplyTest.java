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

/**
 *
 * @author chandan
 */
public class StuApplyTest extends HttpServlet {

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

        String enroll = null;
        String sname = null;
        try {
            HttpSession session = request.getSession(true);
            enroll = (String) session.getAttribute("enrol_no");
            sname = (String) session.getAttribute("sname");
            // System.out.println(enroll);
            if (enroll != null || sname != null) {
                //System.out.println("if  " + enroll);
                session.setAttribute("enrol_no", enroll);
                session.setAttribute("sname", sname);
            } else {
                // System.out.println("else  " + enroll);
                response.sendRedirect("UserLogin.jsp?error=Please Login");
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        try {


            DbConnection db = new DbConnection();
            db.rst = db.stmt.executeQuery("select applied from test where enrol_no='" + enroll + "'");
          if(db.rst.next())
          {
            System.out.println(enroll);
            if (db.rst.getString(1).equals("0")) {
                db.pstmt = db.con.prepareStatement("UPDATE test SET  applied=1  WHERE enrol_no = '" + enroll + "'");
                int j = db.pstmt.executeUpdate();
                if (j > 0) {
                    response.sendRedirect("./studentHome.jsp?msg=3");
                } else {
                    response.sendRedirect("./studentHome.jsp?msg=0");
                }

            } else {
                response.sendRedirect("./studentHome.jsp?msg=2");
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
