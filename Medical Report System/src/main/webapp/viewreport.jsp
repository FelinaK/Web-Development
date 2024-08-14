<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Medical Reports</title>
    <link rel="stylesheet" type="text/css" href="vrep.css">
    
</head>
<body>
    <div class="container">
        <h2>Medical Reports</h2>
        <table>
            <tr>
                <th>Patient Name</th>
                <th>Diagnosis</th>
                <th>Treatment</th>
            </tr>
            <%-- Retrieve medical report data from the database --%>
            <%
                // Database connection details
                String url = "jdbc:mysql://localhost:3306/mini";
                String username = "root";
                String password = "lion";

                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;

                try {
                    // Establish database connection
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, username, password);

                    // Create and execute SQL query
                    String sql = "SELECT patient_name, diagnosis, treatment FROM medical_reports";
                    statement = connection.prepareStatement(sql);
                    resultSet = statement.executeQuery();

                    // Iterate through the result set and display medical report data
                    while (resultSet.next()) {
                        String patientName = resultSet.getString("patient_name");
                        String diagnosis = resultSet.getString("diagnosis");
                        String treatment = resultSet.getString("treatment");
            %>
            <tr>
                <td><%= patientName %></td>
                <td><%= diagnosis %></td>
                <td><%= treatment %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    // Display error message
                    out.println("<h2>Error occurred while retrieving medical reports.</h2>");
                    e.printStackTrace();
                } finally {
                    // Close resources
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (statement != null) {
                        statement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                }
            %>
        </table>
        <footer>
             <a href="mainhome.html">logout</a>
             </footer>
    </div>
</body>
</html>