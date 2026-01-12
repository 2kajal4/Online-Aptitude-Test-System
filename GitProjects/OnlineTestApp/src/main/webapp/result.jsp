<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Result</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;

    background: 
        linear-gradient(rgba(244,246,249,0.9), rgba(244,246,249,0.9)),
        url("images/award.jpg");

    background-size: cover;
    background-position: center;
    background-attachment: fixed;
}

/* Navbar */
.navbar {
    background: #000;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar h2 {
    color: #fff;
    margin: 0;
}

.navbar a {
    color: #fff;
    text-decoration: none;
    margin-left: 20px;
    font-weight: bold;
}

.navbar a:hover {
    color: #ccc;
}

/* Result Card */
.box {
    width: 40%;
    margin: auto;
    background: #fff;
    padding: 30px;
    margin-top: 90px;
    text-align: center;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.25);
}

.box h2 {
    color: #000;
}

.score {
    font-size: 22px;
    margin: 10px 0;
    color: #333;
}

.percentage {
    font-size: 26px;
    margin: 20px 0;
    color: #000;
}

.status {
    font-size: 22px;
    margin: 15px 0;
    color: #444;
}

.discount {
    font-size: 24px;
    color: #1e7e34;
    margin-top: 20px;
}

/* Button */
.btn {
    display: inline-block;
    margin-top: 25px;
    padding: 12px 25px;
    background: #000;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
}

.btn:hover {
    background: #333;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Online Test System</h2>
    <div>
        <a href="test.jsp">Take Test</a>
        <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
    </div>
</div>

<!-- RESULT -->
<div class="box">
    <h2>Your Result</h2>

    <div class="score">
        Score: <b>${score} / 50</b>
    </div>

    <div class="percentage">
        Percentage: <b>${percentage}%</b>
    </div>

    <div class="status">
        <c:choose>
            <c:when test="${percentage == 100}">
                🎉 Excellent Performance!
            </c:when>
            <c:when test="${percentage >= 60}">
                😊 Very Good Performance!
            </c:when>
            <c:when test="${percentage >= 40}">
                🙂 Good Performance!
            </c:when>
            <c:otherwise>
                😔 Try Again
            </c:otherwise>
        </c:choose>
    </div>

    <div class="discount">
        Discount Offered: ${discount}
    </div>

    <a href="ReportServlet" class="btn">View Report</a>
</div>

</body>
</html>
