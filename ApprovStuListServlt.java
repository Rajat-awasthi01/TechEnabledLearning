/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

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
public class ApprovStuListServlt extends HttpServlet {

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
        String name = null;
        try {
            HttpSession session = request.getSession(true);
            name = (String) session.getAttribute("name");
            // System.out.println(enroll);
            if (name != null) {
                //System.out.println("if  " + enroll);

                session.setAttribute("name", name);
            } else {
                // System.out.println("else  " + enroll);
                response.sendRedirect("UserLogin.jsp?error=Please Login");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        try {
            String enroll = request.getParameter("enroll").trim();

            System.out.println(enroll);

            String type = request.getParameter("type").trim();
            System.out.println(type);
            DbConnection db = new DbConnection();
            if (type.equals("Dissp")) {
                db.pstmt = db.con.prepareStatement("UPDATE stu_login SET approval=0  WHERE enrol_no = ?;");
            }
            if (type.equals("Apprvd")) {
                db.pstmt = db.con.prepareStatement("UPDATE stu_login SET approval=1  WHERE enrol_no = ?;");
            }
            db.pstmt.setString(1, enroll);



            int j = db.pstmt.executeUpdate();
            System.out.println(j);
            if (j > 0) {
                if (type.equals("Dissp")) {
                    response.sendRedirect("./adminApprvdStuList.jsp");
                } else {
                    response.sendRedirect("./adminNtApprvdStuList.jsp");
                }
            } else {
                response.sendRedirect("./adminHome.jsp?msg=0");
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
