<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Test Result</title>
<style>
body {
    font-family: Arial;
    background: #f4f6f9;
}
.box {
    width: 50%;
    margin: 100px auto;
    background: white;
    padding: 30px;
    text-align: center;
    border-radius: 10px;
}
.score {
    font-size: 30px;
    color: #007bff;
}
.discount {
    font-size: 22px;
    color: green;
}
</style>
</head>
<body>

<%
int score = (Integer) session.getAttribute("score");
int percentage = (Integer) session.getAttribute("percentage");
int discount = (Integer) session.getAttribute("discount");

String emoji = "😢";
if (percentage >= 60) emoji = "😊";
if (percentage == 100) emoji = "🎉";
%>

<div class="box">
    <h2>Test Result</h2>
    <p class="score">Score: <%= score %> / 50</p>
    <p class="score">Percentage: <%= percentage %>% <%= emoji %></p>
    <p class="discount">Discount Offered: <%= discount %>%</p>

    <a href="welcome.jsp">Back to Home</a>
</div>

</body>
</html>
