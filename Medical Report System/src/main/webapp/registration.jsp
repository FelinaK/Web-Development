<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<body>
    <div class="container">
        <%-- Check if the form was submitted --%>
        <%
            if (request.getParameter("submit") != null) {
                // Retrieve form data
                String name= request.getParameter("name");
                String email = request.getParameter("email");
                String passwrd = request.getParameter("password");
                String reppwd = request.getParameter("reppwd");
                String contactno = request.getParameter("contactno");

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
                    String sql = "INSERT INTO patient(name,email,password,reppwd,contactno) VALUES (?, ?, ?, ?, ?)";
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, name);
                    statement.setString(2, email);
                    statement.setString(3, password);
                    statement.setString(4, reppwd);
                    statement.setString(5, contactno);
                    
                    statement.executeUpdate();

                    // Display success message
                    out.println("<h2>Registered Successfully!!!</h2>");
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
        </div>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>

<img src="C:\projectimages\8.jpg" height=80% width=100%> 
	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>



</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>