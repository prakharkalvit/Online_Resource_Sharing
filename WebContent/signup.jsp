<%@ page import="java.sql.*"%>

	<%
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String pass=request.getParameter("pass");
		String email=request.getParameter("email");
		String number=request.getParameter("number");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resourcesharing","root","123456");
			PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?)");
			ps.setString(1,id);
			ps.setString(2,name);
			ps.setString(3,pass);
			ps.setString(4,number);
			ps.setString(5,email);
		
			int p=ps.executeUpdate();
			if(p==1)
			{
				response.sendRedirect("index.jsp");
			}
			else
			{
				out.println("SOMETHING WENT WRONG");
			}
		}catch(Exception e)
		{
			out.println(e);
		}
	%>
