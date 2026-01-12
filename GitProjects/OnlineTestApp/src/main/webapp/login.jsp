<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | Online Aptitude Test</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/loginstyle.css">
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="login-container">
    <div class="login-box">
        <h2>Login</h2>
        <p class="login-subtitle">Access your aptitude dashboard</p>

        <!-- ✅ SUCCESS MESSAGE -->
        <%
            String successMsg = (String) session.getAttribute("successMsg");
            if (successMsg != null) {
        %>
            <div class="success-msg"><%= successMsg %></div>
        <%
                session.removeAttribute("successMsg");
            }
        %>

        <!-- ❌ ERROR MESSAGE -->
        <%
            String errorMsg = (String) session.getAttribute("errorMsg");
            if (errorMsg != null) {
        %>
            <div class="error-msg"><%= errorMsg %></div>
        <%
                session.removeAttribute("errorMsg");
            }
        %>
        <%
    String logoutMsg = (String) session.getAttribute("logoutMsg");
    if (logoutMsg != null) {
%>
    <div class="success-msg"><%= logoutMsg %></div>
<%
        session.removeAttribute("logoutMsg");
    }
%>
        

        <form action="LoginServlet" method="post" autocomplete="off">

            <div class="form-group">
                <input type="email" name="email" placeholder="Email Address"
       autocomplete="off" required>
            </div>

            <div class="form-group">
                <input type="password" name="password" placeholder="Password"
       autocomplete="new-password" required>
            </div>

            <button type="submit" class="btn login-btn">Login</button>
        </form>

        <p class="register-link">
            Don’t have an account?
            <a href="register.jsp">Register here</a>
        </p>
    </div>
</div>

</body>
</html>
