<%@page import="java.sql.*" %>
<html>
	<head>
		<title></title>
	</head>
	<body>
		<%
			String id=request.getParameter("id");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resourcesharing","root","123456");
			PreparedStatement ps=con.prepareStatement("update product set status=? where id=?");
			ps.setString(1,"Yes");
			ps.setString(2,id);
			
			int p=ps.executeUpdate();
			if(p!=0)
			{
				
				response.sendRedirect("request.jsp");
			}
			else
			{
				out.println("SOMETHING WENT WRONG");
			}
			con.close();
		}catch(Exception e)
		{
			out.println(e);
		}


		%>
	</body>
</html>