package Student;

import DB.DbConnection;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class StuRegistr extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String[] value = new String[11];  // 11 text inputs
        File photoFile = null;

        try {
            MultipartParser mps = new MultipartParser(request, 5 * 1024 * 1024); // 5MB max
            Part part;
            int i = 0;

            while ((part = mps.readNextPart()) != null) {
                if (part.isParam()) {
                    ParamPart paramPart = (ParamPart) part;
                    value[i] = paramPart.getStringValue();
                    i++;
                } else if (part.isFile()) {
                    FilePart filePart = (FilePart) part;
                    String fileName = filePart.getFileName();
                    if (fileName != null && !fileName.equals("")) {
                        // Save the file temporarily
                        photoFile = File.createTempFile("upload_", "_" + fileName);
                        filePart.writeTo(photoFile);
                    }
                }
            }

            FileInputStream fis = new FileInputStream(photoFile);

            DbConnection db = new DbConnection();
            db.pstmt = db.con.prepareStatement(
                "INSERT INTO stu_mstr (enrol_date, sname, f_name, d_o_b, clas, College, city, state, country, mob, course, photo, email) " +
                "VALUES (CURDATE(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );

            db.pstmt.setString(1, value[0]);  // sname
            db.pstmt.setString(2, value[1]);  // f_name
            db.pstmt.setString(3, value[2]);  // d_o_b
            db.pstmt.setString(4, value[3]);  // clas
            db.pstmt.setString(5, value[4]);  // College
            db.pstmt.setString(6, value[5]);  // city
            db.pstmt.setString(7, value[6]);  // state
            db.pstmt.setString(8, value[7]);  // country
            db.pstmt.setString(9, value[8]);  // mob
            db.pstmt.setString(10, value[9]); // course
            db.pstmt.setBinaryStream(11, fis, (int) photoFile.length()); // photo
            db.pstmt.setString(12, value[10]); // email

            int j = db.pstmt.executeUpdate();

            if (j > 0) {
                // Registration successful
                response.sendRedirect("./stuCompltRegist.jsp");
            } else {
                // Registration failed
                response.sendRedirect("./stuFailRegist.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace(); // Log full error
            response.sendRedirect("./stuFailRegist.jsp");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Student Registration Servlet";
    }
}
