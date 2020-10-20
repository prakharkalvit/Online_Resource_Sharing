<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/resourcesharing","root","123456");
Statement st=connection.createStatement();
ResultSet rst = st.executeQuery("select * from product ");
while(rst.next())
{
    Blob image = rst.getBlob("image");
    byte[ ] imgData = null ; 
    imgData = image.getBytes(1,(int)image.length());
    String imgDataBase64=new String(Base64.getEncoder().encode(imgData));



%>
    <tr>
    <td><img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="images Here" width="500px" height="200px"/>
</td>
   
    </tr>
<%} 
}
catch(Exception e)
{
    e.printStackTrace();
}



%>
</table>
</body>
</html>