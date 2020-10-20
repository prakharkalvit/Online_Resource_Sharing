<%@ page import="java.sql.*"%>
<%@page import="java.util.Base64"%>

	<html>
    <head>
    <title>HomePage</title>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>  

    </head>
    
    <body>
        <div class="container-fluid">
            <div class="row" style="min-height: 12.7%">
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

              	
              	
              	 <h1 class="h1 text-center mt-5">Requests</h1>
            <table id="example" class="table  table-bordered table-dark" style="width:100%">
        <thead style="text-align: center;">
            <tr>
            	<th>From</th>
                <th>Name</th>
                <th>Type</th>
                <th>Details</th>
                <th>Contact</th>
                <th>Action</th>
                
            </tr>
        </thead>
        <tbody style="text-align: center;">
            <tr>
                
                <%
                String toname1=(String)session.getAttribute("username");
    		try
    			{
    				Class.forName("com.mysql.jdbc.Driver");
    				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resourcesharing","root","123456");
    				PreparedStatement ps=con.prepareStatement("select * from intrest where toname=?");
    				ps.setString(1,toname1);
    				ResultSet rs=ps.executeQuery();
    				if(rs.next())
    				{
    					do
    					{
    						String id=rs.getString("id");
    						String fromname=rs.getString("fromname");
    						String toname=rs.getString("toname");
    						String name=rs.getString("name");
    						String type=rs.getString("type");
    						String details=rs.getString("details");
    						String contact=rs.getString("contact");
    						
    						
    		%>
    		 	 <td><%=fromname %></td>
                <td><%=name %></td>
                <td><%=type %></td>
                <td><%=details %></td>
                <td><%=contact %></td>
                <td><a href="delRequest.jsp?id=<%=id %>" class="btn btn-danger">Delete</a></td>
    	 </tr>
    	<% 
    		}while(rs.next());
    					con.close();
    	}
    	}catch(Exception e)
    	{
    	out.println(e);	
    	}
            %>
                
                
                
                
               
               
           
           
        </tbody>
        <tfoot style="text-align: center;">
            <tr>
          	    <th>From</th>
                <th>Name</th>
                <th>Type</th>
                <th>Details</th>
                <th>Contact</th>
                <th>Action</th>
                
            </tr>
        </tfoot>
    </table>
        
              	
        </div>
         <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
        integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
        crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
        integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
        crossorigin="anonymous"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
        <script>
        $(document).ready(function() {
            $('#example').DataTable();
        } );
        </script>
    </body>
</html>