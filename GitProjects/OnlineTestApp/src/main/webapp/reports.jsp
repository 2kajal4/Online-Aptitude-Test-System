<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Test Report</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f4f4;
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

/* Container */
.container {
    width: 80%;
    margin: 40px auto;
    background: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

h1 {
    text-align: center;
    margin-bottom: 30px;
    color: #000;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #000;
    color: #fff;
    padding: 12px;
}

td {
    padding: 12px;
    text-align: center;
    color: #333;
}

tr:nth-child(even) {
    background: #f2f2f2;
}

tr:hover {
    background: #e0e0e0;
}

/* Footer */
.footer {
    text-align: center;
    margin-top: 30px;
    color: #666;
    font-size: 14px;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Online Test System</h2>
    <div>
        <a href="test.jsp">Take Test</a>
        <a href="result.jsp">Result</a>
        <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h1>Your Test Report</h1>

    <table>
        <tr>
            <th>Name</th>
            <th>Score</th>
            <th>Percentage</th>
            <th>Discount</th>
        </tr>

        <c:forEach var="r" items="${list}">
        <tr>
            <td>${r.username}</td>
            <td>${r.score}</td>
            <td>${r.percentage}%</td>
            <td>${r.discount}</td>
        </tr>
        </c:forEach>

    </table>

    <div class="footer">
        © 2025 Online Aptitude Test System
    </div>
</div>

</body>
</html>
