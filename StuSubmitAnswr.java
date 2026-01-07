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
public class StuSubmitAnswr extends HttpServlet {

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
        String []rans = new String[10];
        String []op = new String[10];
        HttpSession session = request.getSession(true);
        try {

            enroll = (String) session.getAttribute("enrol_no");
            sname = (String) session.getAttribute("sname");
            // System.out.println(enroll);
            if (enroll != null || sname != null) {
                //System.out.println("if  " + enroll);
               // session.setAttribute("enroll", enroll);
                //session.setAttribute("sname", sname);
            } else {
                // System.out.println("else  " + enroll);
                response.sendRedirect("UserLogin.jsp?error=Please Login");
            }
        } catch (Exception e) {
            System.out.println(e);

        }
        try {
            //   String sno = request.getParameter("sno").trim();
//            int ik = Integer.parseInt(sno);
//            System.out.println("Servlet   " + ik);
//            String ransr = request.getParameter("ransr").trim();
//            String ans = request.getParameter("ans").trim();
//            System.out.println(sno + " " + ransr + " " + ans);
             op[0] = request.getParameter("op0");
             op[1] = request.getParameter("op1");
             op[2] = request.getParameter("op2");
             op[3] = request.getParameter("op3");
             op[4] = request.getParameter("op4");
             op[5] = request.getParameter("op5");
             op[6] = request.getParameter("op6");
             op[7] = request.getParameter("op7");
             op[8] = request.getParameter("op8");
             op[9] = request.getParameter("op9");

            rans[0] = request.getParameter("rans0");
             rans[1] = request.getParameter("rans0");
             rans[2] = request.getParameter("rans0");
             rans[3] = request.getParameter("rans0");
             rans[4] = request.getParameter("rans0");
             rans[5] = request.getParameter("rans0");
             rans[6] = request.getParameter("rans0");
             rans[7] = request.getParameter("rans0");
             rans[8] = request.getParameter("rans0");
             rans[9] = request.getParameter("rans0");
             int total=0;
for(int i=0;i<10;i++)
{
    if(op[i].equals(rans[i]))
    {
        total++;
    }
}
            DbConnection db = new DbConnection();
    
    
                db.pstmt = db.con.prepareStatement("update test set totalquestno='" + String.valueOf(total) + "' where enrol_no='" + enroll + "' ");
                int j = db.pstmt.executeUpdate();
                

                if (j > 0) {
                    
                    out.println("<html><head></head><body><a href ='stuReport.jsp'>View Report</a></body></html>");
                    //response.sendRedirect("stuStartTest.jsp?sno='" + sno + "'");
                }
            
//            db.rst = db.stmt.executeQuery("SELECT  quest, opt1, opt2, opt3, opt4, right_ans FROM c where sno='" + sno + "'");

//            if (db.rst.next()) {
//            }
        } catch (Exception e) {
            e.printStackTrace();
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
