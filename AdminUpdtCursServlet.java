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
public class AdminUpdtCursServlet extends HttpServlet {

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
            String ccode = request.getParameter("c_code");
            String cname = request.getParameter("c_name");
            String duration = request.getParameter("c_duration");
            String description = request.getParameter("description");
            String fee = request.getParameter("Fee");
           String path=request.getParameter("path");
            DbConnection db = new DbConnection();
            db.pstmt = db.con.prepareStatement("UPDATE course_mstr SET   c_name = ?,  c_duration = ?,  description = ?,  Fee = ?,  path = ? WHERE c_code = ?;");
            db.pstmt.setString(1, cname);
            db.pstmt.setString(2, duration);
            db.pstmt.setString(3, description);
            db.pstmt.setString(4, fee);
            db.pstmt.setString(5, path);
            db.pstmt.setString(6, ccode);

            int j = db.pstmt.executeUpdate();
            if (j > 0) {
                response.sendRedirect("./adminHome.jsp?msg=1");
            } else {
                response.sendRedirect("./adminHome.jsp?msg=0");
            }
        } catch (Exception e) {
            out.println(e);
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
    protected

void doGet(HttpServletRequest request, HttpServletResponse response)
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
        protected void

doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);


}

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */

        @Override
        public String

getServletInfo() {
        return "Short description";

}// </editor-fold>

}
