<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%@ page import="java.sql.*"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.PreparedStatement"%>
	<%@ page import="java.sql.SQLException"%>
	<%@ page import="java.sql.Connection"%>
	
	<% 
	
				if(request.getParameter("email")!=null)
				{
				String user_name=request.getParameter("email");
				try{
				Class.forName("org.postgresql.Driver"); 
				Connection con=DriverManager.getConnection("jdbc:postgresql://ec2-54-155-208-5.eu-west-1.compute.amazonaws.com:5432/d79bi2rgccst7k", "ljvttuttcqsnck", "97d5588536968135d3f0ccd80f9139de38ae61a6cc6c8f3db2897cfe4ab6365f");
					PreparedStatement pstmt=null; //create statement

					pstmt=con.prepareStatement("select * from register where email = ?  "); 
					pstmt.setString(1,user_name);
					ResultSet rs=pstmt.executeQuery();
			 if(rs.next()){
				 %>
				 <span class="text-danger">Sorry, <%=rs.getString("email") %> Already Exits !</span>
		
			 <%
		}
		else{
				%>
			<span class="text-success">User is available</span>
			<%
			}
			con.close(); //close connection
	}
			catch(Exception e){
					e.printStackTrace();
					}
	}
	
%>
</body>
</html>