/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chandan
 */
public class ImgDisp extends HttpServlet {

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
            DbConnection dbcon1 = new DbConnection();
           String enroll=request.getParameter("enroll").trim();
         System.out.println("hhhhhhhhhh......."+enroll);
            String strQuery =  "SELECT photo FROM stu_mstr WHERE enrol_no='"+enroll+"'";

            dbcon1.rst= dbcon1.stmt.executeQuery(strQuery);
            //System.out.println("hhhhhhhhhh.......");
            String imgLen = "";
            // System.out.println(imgLen);
            if (dbcon1.rst.next()) {
                imgLen = dbcon1.rst.getString(1);
                // System.out.println(imgLen);
            }
            dbcon1.rst = dbcon1.stmt.executeQuery(strQuery);
            if (dbcon1.rst.next()) {
                int len = imgLen.length();
                // System.out.println(len);
                byte[] rb = new byte[len];
                // System.out.println(rb);
                InputStream readImg = dbcon1.rst.getBinaryStream(1);
                int index = readImg.read(rb, 0, len);
                //System.out.println(index);
                dbcon1.rst.close();
                response.reset();
                response.getOutputStream().write(rb, 0, len);
                response.getOutputStream().flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
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
