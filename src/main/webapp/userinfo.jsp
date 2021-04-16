<%@page import="javax.sql.RowSet"%>
<%@page import="com.sun.glass.ui.Window"%>
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
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		long phno = Long.parseLong(request.getParameter("phno"));
		String address = request.getParameter("add");
/* 
		String qry = "insert into userInfo values('" + fname + "','" + lname + "','" + email + "','" + phno + "','"
		+ address + "')"; */

		
		String qry = "insert into userinfo values(?,?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(qry);
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, email);
		ps.setLong(4, phno);
		ps.setString(5, address);
	
		int result=ps.executeUpdate();
		//ResultSet rs=ps.executeQuery();
		/* if(result!=0){
		out.println("<script>Data inserted Successfully</script>");
		} */
	
		
		conn.close();
		
		response.sendRedirect("charge.jsp");
		
	} catch (Exception e) {
		out.println("Error :" + e);
	}
	%>
</body>
</html>