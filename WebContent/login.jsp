<%@ page import="java.sql.*"%>
	<%
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resourcesharing","root","123456");
	PreparedStatement ps=con.prepareStatement("select * from user where name=? and password=?");
	String name=request.getParameter("name");
	String pass=request.getParameter("pass");
	ps.setString(1,name);
	ps.setString(2,pass);
	ResultSet rs=ps.executeQuery();
	if(name.equals("admin")& pass.equals("12345")){
		response.sendRedirect("adminHome.jsp");
	}
	else{
	if(rs.next())
	{
		String contact=rs.getString("mobile");
		session.setAttribute("username", name);
		session.setAttribute("contact",contact);
		response.sendRedirect("index1.jsp");
		
	}
	
	else
	{
		%>
		<script>
		alert("Wrong Username or Password");
		window.open("login.html","_self");
		</script>
	<%	
		
	}
	}
	}catch(Exception e)
	{
		out.println(e);
	}
	%>