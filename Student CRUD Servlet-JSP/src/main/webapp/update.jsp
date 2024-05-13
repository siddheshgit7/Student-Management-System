<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.sql.*" %>
  
  
  <% 
 
 
 	if(request.getParameter("submit") != null)
 	{
 		String id = request.getParameter("id"); // data form the 'name=""' - property

 		String name = request.getParameter("sname"); // data form the 'name=""' - property
 		
 		String course = request.getParameter("course");
 		
 		String fee = request.getParameter("fee");
 		
 		Connection con;
 		PreparedStatement pst;
 		ResultSet rs;
 		
 		Class.forName("com.mysql.cj.jdbc.Driver");
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentjsp","root","sidd123");
 		
 		pst = con.prepareStatement("update records set stname = ? ,course = ?, fee= ? where id = ?");
 		pst.setString(1, name);
 		pst.setString(2, course);
 		pst.setString(3, fee);
 		pst.setString(4, id);
 		
 		pst.executeUpdate();
 		
 		
 		%>
 		
 		<script type="text/javascript">

 			alert("Record Updated");
 		
		</script>
 		
 		<% 
 		
 		
 		
 		
 		
 	}
 
 
 %>
  
  
  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	
	<link href="bootstrap-5.1.3-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link href="bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

</head>
<body>

	<h1>Student Update</h1>
	
	<div class="row">
		
		<div class="col-sm-4">
		
			<!-- form creation -->
			
			<form class="form" method="post" action="#">
			
				<%
				
					Connection con;
			 		PreparedStatement pst;
			 		ResultSet rs;
			 		
			 		Class.forName("com.mysql.cj.jdbc.Driver");
			 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentjsp","root","sidd123");
			 		
			 		String id = request.getParameter("id");
			 		
			 		pst = con.prepareStatement("select * from records where id = ?");
			 		pst.setString(1, id);
			 		
			 		rs = pst.executeQuery();
			 		
			 		while(rs.next())
			 		{
			 			
			 		
				//	String name = rs.getString(2);
				//  String course = rs.getString(3);
				//	int fee = rs.getInt(3);
					
					
				
				
				%>
			
			
			
			
			
			
			
			
				<div align="left">
					<label class="form-label">Student Name</label> 								<!-- using the "value" attribute the Form TextFields with get Filled Witht the value coming form the database  -->
					<input type="text" class="form-control" placeholder="Student Name" name="sname" value=" <%= rs.getString("stname") %> " id="sname" required>
				</div>
				
				<div align="left">
					<label class="form-label">Course</label>
					<input type="text" class="form-control" placeholder="Course" name="course" value=" <%= rs.getString("course") %> " id="course" required>
				</div>
				
				<div align="left">
					<label class="form-label">Fee</label>
					<input type="text" class="form-control" placeholder="Fee" name="fee" value=" <%= rs.getString("fee") %> " id="fee" required>
				</div>
				
				
				
				<%			
					}				
				%>
				
				
				
				
				<br>
				
				<div align="left">  <!--  When the User click the Submit Button the Request go to Upper code Written code for Update -->
					<input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
					<input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
					
				</div>
				
				<!-- Link -->
				<div align="right">
					
						<p> <a href="index.jsp"> Click Back </a> </p>
					
				</div>
				
			
			</form>
			
		</div>
	
	</div>
	

</body>
</html>