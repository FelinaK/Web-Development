<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
    // Check if the user has already submitted the form
    if (request.getParameter("submit") != null) {
        String username = request.getParameter("uname");
        String password = request.getParameter("password");

        // Perform database connectivity
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            // Replace the following with your database credentials
            String dbUrl = "jdbc:mysql://localhost:3306/mini";
            String dbUser = "root";
            String dbPassword = "lion";

            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Prepare a statement to execute SQL queries
            String sql = "SELECT * FROM dlogin WHERE uname=? AND password=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            // Execute the query
            rs = stmt.executeQuery();

            // Check if a matching user is found
            if (rs.next()) {
                // Successful login
                out.println("Login successful!");
                response.sendRedirect("mainhome.html");
            } else {
                // Invalid login
                out.println("INVALID ACCESS!!!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="log1.css">
    <style>
body{
background-color: skyblue;
}
</style>
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        <form action="" method="post">
        <label for="pid">User Name:</label>
            <input type="text" id="username" name="uname" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            <input type="submit" name="submit" value="Login">
        </form>
        
    </div>
</body>
</html>