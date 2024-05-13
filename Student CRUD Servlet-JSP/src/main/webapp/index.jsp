<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
 <%@ page import="java.sql.*" %>
 
 <% 
 
 
 	if(request.getParameter("submit") != null)
 	{
 		String name = request.getParameter("sname"); // data form the 'name=""' - property
 		
 		String course = request.getParameter("course");
 		
 		String fee = request.getParameter("fee");
 		
 		Connection con;
 		PreparedStatement pst;
 		ResultSet rs;
 		
 		Class.forName("com.mysql.cj.jdbc.Driver");
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentjsp","root","sidd123");
 		
 		pst = con.prepareStatement("insert into records (stname,course,fee) values(?,?,?)");
 		pst.setString(1, name);
 		pst.setString(2, course);
 		pst.setString(3, fee);
 		
 		pst.executeUpdate();
 		
 		
 		%>
 		
 		<script type="text/javascript">

 			alert("Record Added");
 		
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
	

	<h1>Student Registeration System Crud</h1>
	
	<br>
	
	<div class="row">
		<div class="col-sm-4">
		
			<!-- form creation -->
			
			<form method="post" action="#">
			
				<div align="left">
					<label class="form-label">Student Name</label>
					<input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required>
				</div>
				
				<div align="left">
					<label class="form-label">Course</label>
					<input type="text" class="form-control" placeholder="Course" name="course" id="course" required>
				</div>
				
				<div align="left">
					<label class="form-label">Fee</label>
					<input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required>
				</div>
				
				<br>
				
				<div align="right">
					<input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
					<input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
					
				</div>
			
			</form>
			
		</div>
		
		<div class="col-sm-4">
		
			<div class="panel-body">
			
				<table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%" >
				
					<thead>
						<tr>
							<th>Student Name</th>
							<th>Course</th>
							<th>Fee</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					
					<%
						
						Connection con;
				 		PreparedStatement pst;
				 		ResultSet rs;
				 		
				 		Class.forName("com.mysql.cj.jdbc.Driver");
				 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentjsp","root","sidd123");
				 		
				 		String query = "select * from records";
				 		
				 		Statement st = con.createStatement();
				 		
				 		rs = st.executeQuery(query);
				 		
				 		while(rs.next())
				 		{
				 			String id = rs.getString("id");				 // all id sort the 'id' variable 			
				 		
				 			
				 			
					
					%>
					
					
					
						<tr>
							<td><%= rs.getString("stname") %></td>
							<td><%= rs.getString("course") %></td>
							<td><%= rs.getInt("fee") %></td>
							<td> <a href="update.jsp?id= <%= id %> ">Edit</a> </td> <!-- we called it as Called String ,we pass it to One-page to Another-page -->
							<td> <a href="delete.jsp?id= <%= id %> ">Delete</a> </td>					
						</tr>
					
					
					
					<%
					
					
					
				 		}
					
					%>
					
					
				</table>
			
			</div>
			
			
			
		
		</div>
	</div>

</body>
</html>





























