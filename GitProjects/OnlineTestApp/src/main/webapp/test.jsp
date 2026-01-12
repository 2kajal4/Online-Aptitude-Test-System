<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Online Test</title>

<style>
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, sans-serif;
    background: Black;
}

/* Main container */
.container {
    width: 75%;
    max-width: 900px;
    margin: 40px auto;
    background: #ffffff;
    padding: 30px 40px;
    border-radius: 10px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
}

/* Heading */
h2 {
    text-align: center;
    color: #333;
    margin-bottom: 10px;
}

/* Timer */
#timer {
    background: #fff3cd;
    color: #856404;
    padding: 10px 15px;
    border-radius: 6px;
    font-weight: bold;
    width: fit-content;
    margin-left: auto;
    border: 1px solid #ffeeba;
}

/* Question block */
.question {
    margin-top: 25px;
    padding: 15px 20px;
    background: #f8f9fa;
    border-left: 5px solid #4e73df;
    border-radius: 6px;
}

/* Question text */
.question b {
    display: block;
    margin-bottom: 10px;
    color: #222;
}

/* Options */
.question input[type="radio"] {
    margin-right: 8px;
}

.question label {
    display: block;
    margin-bottom: 8px;
    cursor: pointer;
}

/* Submit button */
button {
    display: block;
    margin: 30px auto 0;
    padding: 12px 35px;
    background: linear-gradient(to right, #4e73df, #224abe);
    color: #fff;
    border: none;
    border-radius: 30px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: linear-gradient(to right, #224abe, #4e73df);
    transform: scale(1.05);
}
</style>


<script>
    let timeLeft = 40; // 🔥 20 seconds timer

    let timer = setInterval(function () {

        let minutes = Math.floor(timeLeft / 60);
        let seconds = timeLeft % 60;

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        document.getElementById("timer").innerText =
            "Time Left: " + minutes + ":" + seconds;

        if (timeLeft <= 0) {
            clearInterval(timer);
            alert("Time is up! Your test will be submitted automatically.");
            document.getElementById("testForm").submit();
        }

        timeLeft--;

    }, 1000);
</script>

</head>
<body>

<div class="container">

<h2>Online Aptitude Test</h2>

<h3 id="timer" style="color:red; text-align:right;">
    Time Left: 00:20
</h3>

<form id="testForm" action="SubmitTestServlet" method="post">

<div class="question">
    <b>1. Which testing is also known as white-box testing?</b>

    <label>
        <input type="radio" name="q1" value="Structural testing" required>
        Structural testing
    </label>

    <label>
        <input type="radio" name="q1" value="Error guessing technique">
        Error guessing technique
    </label>

    <label>
        <input type="radio" name="q1" value="Design based testing">
        Design based testing
    </label>

    <label>
        <input type="radio" name="q1" value="None">
        None of the above
    </label>
</div>

<div class="question">
    <b>2. What is the size of float and double in Java?</b>

    <label>
        <input type="radio" name="q2" value="64 and 32" required>
        64 and 32
    </label>

    <label>
        <input type="radio" name="q2" value="32 and 32">
        32 and 32
    </label>

    <label>
        <input type="radio" name="q2" value="64 and 64">
        64 and 64
    </label>

    <label>
        <input type="radio" name="q2" value="32 and 64">
        32 and 64
    </label>
</div>

<div class="question">
    <b>3. Which word is used to prevent changes in a variable in C?</b>

    <label>
        <input type="radio" name="q3" value="immutable" required>
        immutable
    </label>

    <label>
        <input type="radio" name="q3" value="mutable">
        mutable
    </label>

    <label>
        <input type="radio" name="q3" value="const">
        const
    </label>

    <label>
        <input type="radio" name="q3" value="volatile">
        volatile
    </label>
</div>

<div class="question">
    <b>4. Identify the JDBC method used to add batch?</b>

    <label>
        <input type="radio" name="q4" value="Remove()" required>
        Remove()
    </label>

    <label>
        <input type="radio" name="q4" value="Deletebatch()">
        Deletebatch()
    </label>

    <label>
        <input type="radio" name="q4" value="Setbatch()">
        Setbatch()
    </label>

    <label>
        <input type="radio" name="q4" value="Addbatch()">
        Addbatch()
    </label>
</div>

<div class="question">
    <b>5. Which technologies are also used with ASP.NET?</b>

    <label>
        <input type="radio" name="q5" value="CSS" required>
        CSS
    </label>

    <label>
        <input type="radio" name="q5" value="Javascript">
        Javascript
    </label>

    <label>
        <input type="radio" name="q5" value="Ajax">
        Ajax
    </label>

    <label>
        <input type="radio" name="q5" value="All">
        All
    </label>
</div>

<button type="submit">Submit Exam</button>

</form>

</div>

</body>
</html>
