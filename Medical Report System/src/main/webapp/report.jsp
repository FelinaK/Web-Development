<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medical Report Form</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
body{
background-color: teal;
}
</style>
</head>
<body>
    <div class="container">
        <h2>Medical Report Form</h2>
        <%-- Check if the form was submitted --%>
        <%
            if (request.getParameter("submit") != null) {
                // Retrieve form data
                String patientid = request.getParameter("patientid");
                String patientName = request.getParameter("patientName");
                String diagnosis = request.getParameter("diagnosis");
                String treatment = request.getParameter("treatment");

                // Database connection details
                String url = "jdbc:mysql://localhost:3306/mini";
                String username = "root";
                String password = "lion";

                Connection connection = null;
                PreparedStatement statement = null;

                try {
                    // Establish database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, username, password);

                    // Create and execute SQL query
                    String sql = "INSERT INTO medical_reports (patient_id,patient_name, diagnosis, treatment) VALUES ( ?, ?, ?, ? )";
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, patientid);
                    statement.setString(2, patientName);
                    statement.setString(3, diagnosis);
                    statement.setString(4, treatment);
                    statement.executeUpdate();

                    // Display success message
                    out.println("<h2>Medical Report inserted successfully!</h2>");
                } catch (Exception e) {
                    // Display error message
                    out.println("<h2>Error occurred while inserting the medical report.</h2>");
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
             <label for="patient_id">Patient ID:</label>
            <input type="text" id="patientid" name="patientid" required>
            <label for="patientName">Patient Name:</label>
            <input type="text" id="patientName" name="patientName" required>
            <label for="diagnosis">Disease:</label>
            <input type="text" id="diagnosis" name="diagnosis" required>
            <label for="treatment">Treatment:</label>
            <input type="text" id="treatment" name="treatment" required>
            <button type="submit" name="submit">Submit</button>
              
            <footer>
             <a href="mainhome.html">logout</a>
             </footer>              
        </form>
    </div>
   
</body>
</html>