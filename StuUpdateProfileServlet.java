package Student;

import DB.DbConnection;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StuUpdateProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String enroll = null, sname = null;

        try {
            HttpSession session = request.getSession(true);
            enroll = (String) session.getAttribute("enrol_no");
            sname = (String) session.getAttribute("sname");

            if (enroll != null && sname != null) {
                session.setAttribute("enrol_no", enroll);
                session.setAttribute("sname", sname);
            } else {
                response.sendRedirect("UserLogin.jsp?error=Please Login");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("UserLogin.jsp?error=Session Error");
            return;
        }

        String[] value = new String[17];
        File f = null;
        int i = 0;

        try {
            MultipartParser mps = new MultipartParser(request, 5 * 1024 * 1024); // 5 MB
            Part part;

            while ((part = mps.readNextPart()) != null) {
                if (part.isParam()) {
                    ParamPart paramPart = (ParamPart) part;
                    value[i] = paramPart.getStringValue();
                    i++;
                } else if (part.isFile()) {
                    FilePart filePart = (FilePart) part;
                    String fileName = filePart.getFileName();

                    if (fileName != null && !fileName.isEmpty()) {
                        f = new File(System.getProperty("java.io.tmpdir") + File.separator + fileName);
                        filePart.writeTo(f);
                    }
                }
            }

            DbConnection db = new DbConnection();
            FileInputStream fis = null;
            if (f != null && f.exists()) {
                fis = new FileInputStream(f);
            }

            db.pstmt = db.con.prepareStatement("UPDATE stu_mstr SET sname = ?, f_name = ?, d_o_b = ?, clas = ?, College = ?, city = ?, state = ?, country = ?, mob = ?, photo = ?, email = ? WHERE enrol_no = ?");
            db.pstmt.setString(1, value[2]);
            db.pstmt.setString(2, value[3]);
            db.pstmt.setString(3, value[4]);
            db.pstmt.setString(4, value[5]);
            db.pstmt.setString(5, value[6]);
            db.pstmt.setString(6, value[7]);
            db.pstmt.setString(7, value[8]);
            db.pstmt.setString(8, value[9]);
            db.pstmt.setString(9, value[10]);

            if (fis != null) {
                db.pstmt.setBinaryStream(10, fis, fis.available());
            } else {
                db.pstmt.setBinaryStream(10, null, 0);
            }

            db.pstmt.setString(11, value[12]);
            db.pstmt.setString(12, enroll);

            int j = db.pstmt.executeUpdate();

            if (j > 0) {
                db.pstmt = db.con.prepareStatement("UPDATE stu_login SET hint_question = ?, hint_answr = ? WHERE enrol_no = ?");
                db.pstmt.setString(1, value[13]);
                db.pstmt.setString(2, value[14]);
                db.pstmt.setString(3, enroll);

                j = db.pstmt.executeUpdate();

                if (j > 0) {
                    response.sendRedirect("./studentHome.jsp?msg=1");
                } else {
                    response.sendRedirect("./studentHome.jsp?msg=0");
                }
            } else {
                response.sendRedirect("./studentHome.jsp?msg=0");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("./studentHome.jsp?msg=0");
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
        return "Updates student profile information";
    }
}
