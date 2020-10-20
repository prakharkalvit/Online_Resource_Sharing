<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%
session.invalidate();
//response.sendRedirect("index.jsp");
%>
<script>
alert("You successfully logout");
window.open("index.jsp","_self");
</script>