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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	button{
   
padding: 0;
border: none;
background: none;

 }
 .zoom:hover {
  -ms-transform: scale(1.5); /* IE 9 */
  -webkit-transform: scale(1.5); /* Safari 3-8 */
  transform: scale(1.5); 
}
 .container {
 
  width: 100%;
  height:auto;
  overflow: hidden;
}

.container img {
  width: 100%;
  height: 100%;
      transition: all 2s ease-in-out;
}

.container:hover img {
      transform: scale(2,2)
}
</style>	
	</head>
		<body>
		<div class="container-fluid">
		     <div class="row " >
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark w-100" style="position: fixed;z-index: 100">
                <a class="navbar-brand" href="#"><h1 class="h1 text-white"> Resource Sharing</h1></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                  <ul class="navbar-nav">
                    <li class="nav-item ">
                      <a class="nav-link text-white ml-3" href="index.jsp" style="font-size:x-large;"><i class="fa fa-home mr-2"></i>Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle ml-3 text-white" style="font-size:x-large;" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size:larger;">
                          Type
                        </a>
                        <div class="dropdown-menu bg-dark" aria-labelledby="navbarDropdownMenuLink">
                          <a class="dropdown-item " href="type.jsp?type=Electronics">Electronics</a>
                          <a class="dropdown-item" href="type.jsp?type=Books">Books</a>
                          <a class="dropdown-item" href="type.jsp?type=Stationary">Stationary</a>
                        </div>
                      </li>
                    <li class="nav-item">
                      <a class="nav-link text-white " style="font-size: x-large;" href="#" onclick="alert('You need to login First')"><i class="fa fa-bell-o"></i>
                        Requests</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-white "  style="font-size: x-large;" href="#"><button class="bg-dark text-white " style="font-size: x-large;" data-toggle="modal" data-target="#myModal">Login/SignUp</button></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " style="font-size: x-large;" href="#" onclick="alert('You need to login First')"><i class="fa fa-cloud-upload mr-2"></i>Upload</a>
                      </li>
                    <form class="form-inline ml-3" style="margin: auto;">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-secondary " type="submit">Search</button>
                      </form>
                  </ul>
                </div>
              </nav>
            </div>
	
		<%	
			String username=(String)session.getAttribute("username");
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
    		
        
		
	
			<div class="row mt-5">
				<div class="col-lg-6 mt-5 container">
					<img src="data:image/gif;base64,<%=imgDataBase64 %>" class="img img-fluid " style="height:400px;width:400px">
				</div>
				<div class="col-lg-6 mt-5" style="text-align: center;">
					<h3 class="h2"><strong><em><%=name %></em></strong></h3><br><br>
					<h3 class="h3"><strong><em><%=details %></em></strong></h3>
					<a class="btn btn-dark btn-lg mt-5" href="#" onclick="alert('You need to login first')">Show Interest</a>
				</div>	
			</div>
				<form action="sendShowIntrest.jsp" method="post">
					<input type="hidden" name="fromname" value="<%=username%>">
					
				</form>
			<%
			}while(rs.next());
    					con.close();
    	}
    	}catch(Exception e)
    	{
    	out.println(e);	
    	}
            %>
		
		<!--Modal-->
           <!-- The Modal -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h1 class="modal-title">SignUp</h1>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-2 "></div>
                            <div class="col-md-8 bg-light">
                                <form action="signup.jsp">
                                    <h1 class=" h1 text-secondary ">Create Your Account</h1>
                                    <div class="form-group ">
                                      <label for="id" class="text-body" style="font-size: x-large;"><b>
                                              Enrollment Number:</b></label>
                                      <input type="text" class="form-control" id="id"
                                          placeholder="Enter your enrollnment number" name="id" required>
                                  </div>
                                    <div class="form-group ">
                                        <label for="Name" class="text-body" style="font-size: x-large;"><b>
                                                Name:</b></label>
                                        <input type="text" class="form-control" id="productName"
                                            placeholder="Enter your name" name="name" required>
                                    </div>
                                    <div class="form-group ">
                                        <label for="pass" class="text-body"
                                            style="font-size: x-large;"><b>Password</b></label>
                                        <input type="password" class="form-control" id="pass"
                                            placeholder="Enter your password" name="pass" required>
                                    </div>
                                    <div class="form-group ">
                                        <label for="email" class="text-body"
                                            style="font-size: x-large;"><b>Email</b></label>
                                        <input type="email" class="form-control" id="email"
                                            placeholder="Enter your email" name="email" required>
                                    </div>
                                    <div class="form-group ">
                                        <label for="number" class="text-body"
                                            style="font-size: x-large;"><b>Number</b></label>
                                        <input type="number" class="form-control" id="number"
                                            placeholder="Enter your number" name="number" required>
                                    </div>
                                    <button type="submit" class="btn btn-dark mb-3">Submit</button>
                                </form>
                                <a href="login.html">Already have an account Login</a>
                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
			
		
		</div>
	</body>
</html>