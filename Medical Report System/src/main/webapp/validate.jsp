<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
String uname = request.getParameter("uname");
String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");// MySQL database connection
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","lion");
out.println("connection success");
PreparedStatement pst = conn.prepareStatement("Select uname,password from Admin where uname=? and password=?");
pst.setString(1, uname);
pst.setString(2, password);
ResultSet rs = pst.executeQuery();
if(rs.next())
response.sendRedirect("mainpg.html");
else
out.println("Invalid login credentials");
}
catch(Exception e)
{
out.println("Something went wrong !! Please try again");
}
%>
</body>
</html>