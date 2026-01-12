<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar">
    <div class="nav-container">
        <div class="nav-left">
            OnlineAptitudeTest
        </div>

        <div class="nav-right">
            <a href="index.jsp">Home</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
            <a href="reports.jsp">Reports</a>
            <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
            
        </div>
    </div>
</nav>



</body>
</html>