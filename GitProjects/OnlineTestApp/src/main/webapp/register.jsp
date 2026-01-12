<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register | Online Aptitude Test</title>

    <!-- Register Page CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/registerstyle.css">
    <script src="<%= request.getContextPath() %>/js/register-validation.js"></script>
    
</head>
<body>

<!-- Navbar -->
<%@ include file="navbar.jsp" %>

<!-- Register Section -->
<div class="register-container">
    <div class="register-box">
        <h2>Create Account</h2>
        <p class="register-subtitle">Join Online Aptitude Test Platform</p>

      <form action="RegisterServlet" method="post"
      onsubmit="return validateRegisterForm()">


    <div class="form-group">
        <input type="text" id="name" name="name" placeholder="Full Name" autocomplete="off">
        <span class="error" id="nameError"></span>
    </div>

    <div class="form-group">
        <input type="email" id="email" name="email" placeholder="Email Address" autocomplete="new-email">
        <span class="error" id="emailError"></span>
    </div>

    <div class="form-group">
        <input type="text" id="mobile" name="mobile" placeholder="Mobile Number" maxlength="10" autocomplete="off">
        <span class="error" id="mobileError"></span>
    </div>

    <div class="form-group">
        <input type="password" id="password" name="password" placeholder="Password" autocomplete="new-password">
        <span class="error" id="passwordError"></span>
    </div>

    <button type="submit" class="btn">Register</button>
</form>


        <p class="login-link">
            Already have an account?
            <a href="login.jsp">Login here</a>
        </p>
    </div>
</div>

</body>
</html>
