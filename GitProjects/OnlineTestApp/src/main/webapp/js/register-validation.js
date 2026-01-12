function validateRegisterForm() {

    let valid = true;

    // Get values
    let name = document.getElementById("name").value.trim();
    let email = document.getElementById("email").value.trim();
    let mobile = document.getElementById("mobile").value.trim();
    let password = document.getElementById("password").value.trim();

    // Clear previous errors
    document.getElementById("nameError").innerHTML = "";
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("mobileError").innerHTML = "";
    document.getElementById("passwordError").innerHTML = "";

    // Name validation
    let namePattern = /^[A-Za-z ]+$/;
    if (name === "") {
        document.getElementById("nameError").innerHTML = "Name is required";
        valid = false;
    } else if (!namePattern.test(name)) {
        document.getElementById("nameError").innerHTML = "Only letters allowed";
        valid = false;
    }

    // Email validation
    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") {
        document.getElementById("emailError").innerHTML = "Email is required";
        valid = false;
    } else if (!emailPattern.test(email)) {
        document.getElementById("emailError").innerHTML = "Invalid email format";
        valid = false;
    }

    // Mobile validation
    let mobilePattern = /^[0-9]{10}$/;
    if (mobile === "") {
        document.getElementById("mobileError").innerHTML = "Mobile number is required";
        valid = false;
    } else if (!mobilePattern.test(mobile)) {
        document.getElementById("mobileError").innerHTML = "Enter 10 digit mobile number";
        valid = false;
    }

    // Password validation
    if (password === "") {
        document.getElementById("passwordError").innerHTML = "Password is required";
        valid = false;
    } else if (password.length < 6) {
        document.getElementById("passwordError").innerHTML = "Password must be at least 6 characters";
        valid = false;
    }

    return valid; // if false → form won't submit
}
/**
 * 
 */