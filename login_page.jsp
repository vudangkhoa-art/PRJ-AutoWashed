<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - G6 Car Wash Member</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #0f172a; 
            color: #f8fafc;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; 
        }

        .login-container {
            background-color: #1e293b; 
            width: 100%;
            max-width: 420px;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.5);
            border: 1px solid #334155;
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h2 {
            font-size: 28px;
            color: #fff;
            margin-bottom: 8px;
        }

        .login-header h2 span {
            color: #38bdf8;
        }

        .login-header p {
            color: #94a3b8;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #cbd5e1;
            font-weight: 500;
        }

        .input-box {
            position: relative;
        }

        .input-box i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #64748b;
            font-size: 16px;
        }

        .input-box input {
            width: 100%;
            padding: 12px 16px 12px 45px;
            background-color: #0f172a;
            border: 1px solid #334155;
            border-radius: 8px;
            color: #fff;
            font-size: 15px;
            outline: none;
            transition: all 0.3s;
        }

        .input-box input:focus {
            border-color: #38bdf8;
            box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.15);
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
            margin-bottom: 25px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #94a3b8;
            cursor: pointer;
        }

        .forgot-pass {
            color: #38bdf8;
            text-decoration: none;
        }

        .forgot-pass:hover {
            text-decoration: underline;
        }

        .btn-submit {
            width: 100%;
            background: linear-gradient(135deg, #38bdf8 0%, #0284c7 100%);
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(56, 189, 248, 0.3);
            transition: all 0.3s;
        }

        .btn-submit:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        .register-redirect {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #334155;
            font-size: 14px;
            color: #94a3b8;
        }

        .register-redirect a {
            color: #38bdf8;
            text-decoration: none;
            font-weight: 600;
            margin-left: 5px;
            transition: color 0.2s;
        }

        .register-redirect a:hover {
            color: #0ea5e9;
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-container">
        
        <div class="login-header">
            <h2>G6 <span>CARWASH</span></h2>
            <p>Login to earn points and more!</p>
        </div>

        <form action="LoginController" method="POST">
            
            <div class="form-group">
                <label for="username">Email</label>
                <div class="input-box">
                    <i class="fa-solid fa-user"></i>
                    <input type="text" id="username" name="username" placeholder="Enter your emsil" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-box">
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
            </div>

            <button type="submit" class="btn-submit">Log in</button>
            
        </form>

        <div class="register-redirect">
            Don't have a member account yet?
            <a href="register_page.jsp">Sign up here</a>
        </div>

    </div>

</body>
</html>