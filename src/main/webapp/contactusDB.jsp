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
		try {
		Class.forName("org.postgresql.Driver").newInstance();
		Connection conn = DriverManager.getConnection("jdbc:postgresql://ec2-54-155-208-5.eu-west-1.compute.amazonaws.com:5432/d79bi2rgccst7k", "ljvttuttcqsnck", "97d5588536968135d3f0ccd80f9139de38ae61a6cc6c8f3db2897cfe4ab6365f");
		
		//Statement st = conn.createStatement();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
	//	long phno = Long.parseLong(request.getParameter("phno"));	
		String phno = request.getParameter("phno");
		String city = request.getParameter("city");
		String massege = request.getParameter("massege");
/* 
		String qry = "insert into userInfo values('" + fname + "','" + lname + "','" + email + "','" + phno + "','"
		+ address + "')"; */

		
		String qry = "insert into contactus values(?,?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(qry);
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, phno);
		ps.setString(4, city);
		ps.setString(5, massege);
	
		int result=ps.executeUpdate();
		//ResultSet rs=ps.executeQuery();
		/* if(result!=0){
		out.println("<script>Data inserted Successfully</script>");
		} */
	
		
		conn.close();
		
		response.sendRedirect("contactus.jsp");
		
		
	} catch (Exception e) {
		out.println("Error :" + e);
	}
	%>


</body>
</html>