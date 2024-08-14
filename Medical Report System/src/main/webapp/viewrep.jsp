<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Report</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Patient Report</h2>
        <table>
            <tr>
                <th>Patient Name</th>
                <th>Diagnosis</th>
                <th>Treatment</th>
            </tr>
            <%-- Retrieve medical report data from the database --%>
            <%
                // Retrieve the logged-in login ID from the session
                String loggedInLoginID = (String) session.getAttribute("p.patient_id");

                // Retrieve the patient ID from the request parameter
                String patientID = request.getParameter("p.patient_id");

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

                    // Create and execute SQL query with the WHERE clause to match the login ID and patient ID
                    String sql = "SELECT patient_name, diagnosis, treatment FROM medical_reports m WHERE patient_id = ? AND m.patientID = ?";
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, loggedInLoginID);
                    statement.setString(2, patientID);
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
                    out.println("<h2>Error occurred while retrieving the patient report.</h2>");
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
    </div>
</body>
</html>