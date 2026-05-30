<%-- 
    Document   : register_page
    Created on : May 28, 2026, 4:26:17 PM
    Author     : Admin
--%>

```jsp id="xgh2k1"
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>

    <style>

        body{
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .register-container{
            width: 400px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }

        h2{
            text-align: center;
            margin-bottom: 25px;
        }

        label{
            font-weight: bold;
        }

        input[type=text],
        input[type=password],
        input[type=email]{
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type=submit]{
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type=submit]:hover{
            background-color: #218838;
        }

        .policy{
            margin-bottom: 20px;
        }

        .policy a{
            text-decoration: none;
            color: blue;
        }

        .policy a:hover{
            text-decoration: underline;
        }

        .error{
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }

        /* Modal */

        .modal{
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content{
            background-color: white;
            margin: auto;
            padding: 20px;
            width: 50%;
            border-radius: 10px;
        }

        .close{
            float: right;
            font-size: 28px;
            cursor: pointer;
        }

    </style>
</head>

<body>

<div class="register-container">

    <h2>Create Account</h2>

    <p class="error">
        ${requestScope.error}
    </p>

    <form action="register" method="post">

        <label>Full Name</label>
        <input type="text" name="fullname"
               placeholder="Enter your full name" required>

        <label>Email</label>
        <input type="email" name="email"
               placeholder="Enter your email" required>

        <label>Password</label>
        <input type="password" name="password"
               placeholder="Enter your password" required pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$">

        <label>Phone Number</label>
        <input type="text" name="phone"
               placeholder="Enter your phone number" required pattern="^0\d{9}$>

        <div class="policy">

            <input type="checkbox"
                   name="agree"
                   required>

            I agree to the
            <a href="#" onclick="openModal()">
                Privacy Policy
            </a>

        </div>

        <input type="submit" value="Register">

    </form>

</div>

<!-- Privacy Policy Modal -->

<div id="policyModal" class="modal">

    <div class="modal-content">

        <span class="close"
              onclick="closeModal()">&times;</span>

        <h2>Privacy Policy</h2>

        <p>
            Your personal information will be protected and
            only used for booking and loyalty services.
        </p>

        <p>
            We do not share your information with third parties.
        </p>

        <p>
            By registering an account, you agree to our terms
            and conditions.
        </p>

    </div>

</div>

<script>

    function openModal(){
        document.getElementById("policyModal").style.display = "block";
    }

    function closeModal(){
        document.getElementById("policyModal").style.display = "none";
    }

    window.onclick = function(event){

        let modal = document.getElementById("policyModal");

        if(event.target === modal){
            modal.style.display = "none";
        }
    }

</script>

</body>
</html>


