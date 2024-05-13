<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
    
    <% 
 
 		String id = request.getParameter("id"); // data form the 'name=""' - property
 		
 		Connection con;
 		PreparedStatement pst;
 		ResultSet rs;
 		
 		Class.forName("com.mysql.cj.jdbc.Driver");
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentjsp","root","sidd123");
 		
 		pst = con.prepareStatement("delete from records where id = ?");
 		pst.setString(1, id);
 		
 		pst.executeUpdate();
 		
 		
 		// Small Java Script Code
 	%>
 		
	<script type="text/javascript">

		alert("Record Deleted");
	
	</script>
 		
 		
 	<% if(id != null)
 		{ 			
 			response.sendRedirect("index.jsp"); 		
 		}
 	%>