<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Requests</title>
</head>
<body>
	<%
		String fromname=request.getParameter("fromname");
		String toname=request.getParameter("toname");
		String name=request.getParameter("name");
		String type=request.getParameter("type");
		String details=request.getParameter("details");
		String contact=request.getParameter("contact");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resourcesharing","root","123456");
			PreparedStatement ps=con.prepareStatement("insert into intrest(fromname,toname,name,type,details,contact) values(?,?,?,?,?,?)");
			ps.setString(1,fromname);
			ps.setString(2,toname);
			ps.setString(3,name);
			ps.setString(4,type);
			ps.setString(5,details);
			ps.setString(6,contact);
			
			int p=ps.executeUpdate();
			if(p==1)
			{
				//response.sendRedirect("index1.jsp");		
			%>
				<script>
				alert("Intrest is sended to Uploader");
				window.open("index1.jsp","_self");
				</script>
			<%
			
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