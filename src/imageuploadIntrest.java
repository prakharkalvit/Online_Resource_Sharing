

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.websocket.Session;

import com.mysql.jdbc.Blob;


@WebServlet("/imageuploadIntrest")
@MultipartConfig(maxFileSize = 16177215)  
public class imageuploadIntrest extends HttpServlet {
   
	private String dbURL = "jdbc:mysql://localhost:3306/resourcesharing";
    private String dbUser = "root";
    private String dbPass = "123456";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	 PrintWriter out=new PrintWriter(System.out);

    		out.println("jfhh");
        String fromname = request.getParameter("fromname");
        String toname=request.getParameter("toname");
        String name=request.getParameter("name");
        String type = request.getParameter("type");
        String details =request.getParameter("details");	
        String contact=request.getParameter("contact");
         
   
        //InputStream inputStream = null; 
         
     
       // Part filePart = request.getPart("image");
        //if (filePart != null) {
            
         //   System.out.println(filePart.getName());
          //  System.out.println(filePart.getSize());
            //System.out.println(filePart.getContentType());
             
          
         //   inputStream = filePart.getInputStream();
        //}
       
        Connection conn = null; 
       String message = null;  
        try {
           out.println("qwertyui");
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
       //   HttpSession s=request.getSession();
        // Blob i=(Blob)s.getAttribute(name);
            String sql = "insert into intrest(fromname,toname,name,type,details,contact) values(?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,fromname);
            statement.setString(2,toname);
            statement.setString(3,name);
            statement.setString(4,type);
            statement.setString(5,details);
            statement.setString(6,contact);
            
           // statement.setBlob(7,i);
             
         //  if (inputStream != null) {
           //     statement.setBlob(7, inputStream);
            //}

            int row = statement.executeUpdate();
            if (row > 0) {
              out.println("data ha");
            }
        } catch (Exception ex) {
            message = "ERROR: " + ex.getMessage();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ex) {
                }
            }
            request.setAttribute("Message", message);
          //  getServletContext().getRequestDispatcher("/index1.jsp").forward(request, response);

        }
    }

  
}
