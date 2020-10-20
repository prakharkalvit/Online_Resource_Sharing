<%@page import="java.sql.*" %>
<%@page import="java.util.Base64"%>

<html>
	<head>
		<title>Product</title>
		
		<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	.zoom:hover {
  -ms-transform: scale(1.5); /* IE 9 */
  -webkit-transform: scale(1.5); /* Safari 3-8 */
  transform: scale(1.5); 
}
</style>
	</head>
	<body class="container-fluid">
		<div class="row " style="min-height: 12.7%">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <a class="navbar-brand" href="#"><h1 class="h1 text-white"> Resource Sharing</h1></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                  <ul class="navbar-nav">
                    <li class="nav-item ">
                      <a class="nav-link text-white ml-3" href="index1.jsp" style="font-size:x-large;"><i class="fa fa-home mr-2"></i>Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle ml-3 text-white" style="font-size:x-large;" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size:larger;">
                          Type
                        </a>
                        <div class="dropdown-menu bg-dark" aria-labelledby="navbarDropdownMenuLink">
                          <a class="dropdown-item " href="type1.jsp?type=Electronics">Electronics</a>
                          <a class="dropdown-item" href="type1.jsp?type=Books">Books</a>
                          <a class="dropdown-item" href="type1.jsp?type=Stationary">Stationary</a>
                        </div>
                      </li>
                    <li class="nav-item">
                      <a class="nav-link text-white " style="font-size: x-large;" href="#"><i class="fa fa-bell-o"></i>
                        Requests</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link text-white " style="font-size: x-large;" href="addProject.html" ><i class="fa fa-cloud-upload mr-2"></i>Upload</a>
                      </li>
                    <form class="form-inline ml-3" style="margin: auto;">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-secondary " type="submit">Search</button>
                      </form>
                      <li class="nav-item ">
                        <a class="  btn btn-outline-secondary text-white ml-5" style="font-size: x-large;" href="logout.jsp"><i class="fa fa-power-off mr-2"></i>
                            Logout</a>
                      </li>
                  </ul>
                </div>
              </nav>
            </div>

        
	
		<%	
		String fromname=(String)session.getAttribute("username");
		String contact=(String)session.getAttribute("contact");
			try
    			{
					String id=request.getParameter("id");
    				Class.forName("com.mysql.jdbc.Driver");
    				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resourcesharing","root","123456");
    				PreparedStatement ps=con.prepareStatement("select * from product where id=?");
    				ps.setString(1,id);
    				ResultSet rs=ps.executeQuery();
    				if(rs.next())
    				{
    					do
    					{
    						
    						String name=rs.getString("name");
    						String type=rs.getString("type");
    						String details=rs.getString("details");
    						 Blob image = rs.getBlob("image");
    						    byte[ ] imgData = null ; 
    						    imgData = image.getBytes(1,(int)image.length());
    						    String imgDataBase64=new String(Base64.getEncoder().encode(imgData));
    						   
    						   
    						   String uname=rs.getString("uname");
    						
    	%>
    		
        
		
		<div class="container-fluid">
			<div class="row mt-5">
				<div class="col-lg-6 ">
					<img src="data:image/gif;base64,<%=imgDataBase64 %>" class="img img-fluid zoom" style="height:400px;width:400px">
				</div>
				<div class="col-lg-6 mt-5" style="text-align: center;">
					<h3 class="h2"><strong><em><%=name %></em></strong></h3><br><br>
					<h3 class="h3"><strong><em><%=details %></em></strong></h3>
					
					
					<form action="sendShowIntrest.jsp" method="post">
					<input type="hidden" value="<%=fromname %>" name="fromname">
					<input type="hidden" value="<%=uname %>" name="toname">
					<input type="hidden" value="<%=name %>" name="name">
					<input type="hidden" value="<%=type %>" name="type">
					<input type="hidden" value="<%=details %>" name="details">
					<input type="hidden" value="<%=contact%>" name="contact">				
					<input type="submit" class="btn btn-dark btn-lg mt-5" value="Show Intrest" > 
					</form>
					
					
				</div>	
			</div>
			<%
			}while(rs.next());
    					con.close();
    	}
    	}catch(Exception e)
    	{
    	out.println(e);	
    	}
            %>
		</div>
	</body>
</html>