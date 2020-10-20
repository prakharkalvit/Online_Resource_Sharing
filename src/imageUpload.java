

import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;

@WebServlet("/imageUpload")
@MultipartConfig(maxFileSize = 16177215)   
public class imageUpload extends HttpServlet {
	private String dbURL = "jdbc:mysql://localhost:3306/resourcesharing";
    private String dbUser = "root";
    private String dbPass = "123456";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String details =request.getParameter("details");	
        String uname=request.getParameter("uname");
         
        InputStream inputStream = null; 
         
     
        Part filePart = request.getPart("image");
        if (filePart != null) {
            
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
          
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; 
        String message = null;  
         
        try {
           
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
          
            String sql = "insert into product(name,type,details,uname,image) values (?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1,name);
            statement.setString(2,type);
            statement.setString(3,details);
            statement.setString(4,uname);
            
            
             
            if (inputStream != null) {
                statement.setBlob(5, inputStream);
            }
 
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
            request.setAttribute("Message", message);
             
            getServletContext().getRequestDispatcher("/index1.jsp").forward(request, response);
        }
    }
   
  

	

}
