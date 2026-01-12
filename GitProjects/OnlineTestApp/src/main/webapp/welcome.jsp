<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome | Online Aptitude Test</title>

<style>
/* ===== NAVBAR ===== */
.navbar {
    width: 100%;
    height: 70px;
    background: linear-gradient(90deg, #1f1c2c, #928dab);
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
}

.nav-container {
    max-width: 1200px;
    height: 100%;
    margin: auto;
    padding: 0 20px;
    display: flex;
    align-items: center;
}

.nav-left {
    color: #fff;
    font-size: 22px;
    font-weight: bold;
}

.nav-right {
    margin-left: auto;
    display: flex;
    gap: 25px;
}

.nav-right a {
    color: #fff;
    text-decoration: none;
    font-size: 15px;
}

.nav-right a:hover {
    color: #ffd369;
}

/* ===== BODY BACKGROUND ===== */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background:
        linear-gradient(rgba(102, 126, 234, 0.75), rgba(118, 75, 162, 0.75)),
        url("images/welcome-bg.jpeg") no-repeat center center fixed;
    background-size: cover;
}

/* ===== CONTAINER ===== */
.welcome-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    padding-top: 70px;
}

/* ===== CARD ===== */
.welcome-box {
    background: rgba(255, 255, 255, 0.9);
    padding: 45px;
    width: 430px;
    text-align: center;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.25);
    backdrop-filter: blur(8px);
    animation: fadeIn 0.8s ease-in-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.welcome-box h2 {
    margin-bottom: 10px;
    color: #333;
    font-size: 26px;
}

.welcome-subtitle {
    color: #555;
    margin-bottom: 30px;
    font-size: 15px;
}

/* ===== BUTTONS ===== */
.welcome-actions a {
    display: block;
    text-decoration: none;
    padding: 14px;
    margin: 12px 0;
    border-radius: 30px;
    font-weight: bold;
    transition: all 0.3s ease;
    font-size: 15px;
}

/* Start Test Button */
.start-test {
    background: linear-gradient(90deg, #00c6ff, #0072ff);
    color: white;
}

.start-test:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(0,114,255,0.4);
}

/* Logout Button */
.logout {
    background: linear-gradient(90deg, #ff416c, #ff4b2b);
    color: white;
}

.logout:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(255,75,43,0.4);
}
</style>

</head>

<body>
<%@ include file="navbar.jsp" %>

<%
    String user = (String) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="welcome-container">
    <div class="welcome-box">
        <h2>Welcome, <%= user %> 👋</h2>
        <p class="welcome-subtitle">You are successfully logged in</p>

        <div class="welcome-actions">
            <a href="test.jsp" class="start-test">Start Test</a>
            <a href="<%= request.getContextPath() %>/LogoutServlet" class="logout">Logout</a>

        </div>
    </div>
</div>

</body>
</html>
