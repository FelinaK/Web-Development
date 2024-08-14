<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medical Report Form</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
body{
background-color: silver;
}
</style>
</head>
<body>
    <div class="container">
        <h2>Sign up</h2>
        <%-- Check if the form was submitted --%>
        <%
            if (request.getParameter("submit") != null) {
                // Retrieve form data
                String  name= request.getParameter("name");
                String  email= request.getParameter("email");
                String  password= request.getParameter("password");
                String contactno= request.getParameter("contactno");
                String patientid= request.getParameter("patientid");


                // Database connection details
                String url = "jdbc:mysql://localhost:3306/mini";
                String your_username = "root";
                String your_password = "lion";

                Connection connection = null;
                PreparedStatement statement = null;

                try {
                    // Establish database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, your_username, your_password);

                    // Create and execute SQL query
                    String sql = "INSERT INTO patient (name,email,password,contactno,patient_id) VALUES (?, ?, ?, ?, ?)";
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, name);
                    statement.setString(2, email);
                    statement.setString(3, password);
                    statement.setString(4, contactno);
                    statement.setString(5, patientid);
                    statement.executeUpdate();

                    // Display success message
                    out.println("<h2>Registered Successfully</h2>");
                } catch (Exception e) {
                    // Display error message
                    out.println("<h2>Error occurred while inserting your details.</h2>");
                    e.printStackTrace();
                } finally {
                    // Close resources
                    if (statement != null) {
                        statement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                }
            }
        %>
        <form action="" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="text" id="password" name="password" required>
             <label for="contactno">Contact No:</label>
             <input type="text" id="contactno" name="contactno" required>

            <button type="submit" name="submit">Register</button>
         
        </form>
        
         <footer>
             <a href="home.html">logout</a>
             </footer>
    </div>
</body>
</html>