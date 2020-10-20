<%@ page import="java.sql.*"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
 
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Admin Home</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
        integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="style3.css">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
        integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
        crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
        integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
        crossorigin="anonymous"></script>

</head>

<body>

    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar" style="background-color: black;">
            <div id="dismiss" style="background-color: black;">
                <i class="fas fa-arrow-left"></i>
            </div>

            <div class="sidebar-header" style="background-color: black;">
                <h1 class="h1 text-white mt-4"><strong><em> Resource Sharing</em></strong></h1>
            </div>

            <ul class="list-unstyled components">

                <li>
                    <a href="adminHome.jsp" >Home</a>
                </li>
                <li>
                    <a href="request.jsp">Requests</a>
                </li>
                <li>
                    <a href="logout.jsp">Logout</a>
                </li>
            </ul>


        </nav>

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-dark">
                        <i class="fas fa-align-left"></i>
                    </button>
                </div>
            </nav>

            <h1 class="h1 text-center">Home</h1>
            <table id="example" class="table table-bordered  table-dark" style="width:100%">
        <thead style="text-align: center;">
            <tr>
            	
                <th>Name</th>
                <th>Type</th>
                <th>Details</th>
                <th>Image</th>
                <th>Action</th>
                
            </tr>
        </thead>
        <tbody  style="text-align: center;">
            <tr>
                
                <%
    		try
    			{
    				Class.forName("com.mysql.jdbc.Driver");
    				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/resourcesharing","root","123456");
    				PreparedStatement ps=con.prepareStatement("select * from product ");
    				ResultSet rs=ps.executeQuery();
    				if(rs.next())
    				{
    					do
    					{
    						String id=request.getParameter("id");
    						String name=rs.getString("name");
    						String type=rs.getString("type");
    						String details=rs.getString("details");
    						 Blob image = rs.getBlob("image");
    						    byte[ ] imgData = null ; 
    						    imgData = image.getBytes(1,(int)image.length());
    						    String imgDataBase64=new String(Base64.getEncoder().encode(imgData));
    						
    		%>
    		 	 <td><%=name %></td>
                <td><%=type %></td>
                <td><%=details %></td>
                <td>  <img src="data:image/gif;base64,<%=imgDataBase64 %>" class="img img-fluid" style="height:5rem;width:5rem"></td>
                <td> <a href="adminDenyReqest.jsp?id=<%=id %>" class="btn btn-danger ml-5">Delete</a></td>
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
                <th>Name</th>
                <th>Type</th>
                <th>Details</th>
                <th>Image</th>
                <th>Action</th>
                
            </tr>
        </tfoot>
    </table>
        </div>
    </div>

    <div class="overlay"></div>

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
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#dismiss, .overlay').on('click', function () {
                $('#sidebar').removeClass('active');
                $('.overlay').removeClass('active');
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').addClass('active');
                $('.overlay').addClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });
       
    </script>
    <script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable();
    } );
    </script>
</body>

</html>