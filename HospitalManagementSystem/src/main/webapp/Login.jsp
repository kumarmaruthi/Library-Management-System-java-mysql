<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare HMS - Login</title>
   
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #005b96, #00a8e8);
            color: #333;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
        }
        
        .login-container {
            width: 400px;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            z-index: 10;
            position: relative;
        }
        
        .logo {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .logo img {
            height: 60px;
            margin-bottom: 10px;
        }
        
        .logo h2 {
            color: #005b96;
            font-size: 1.8rem;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        .form-group input:focus {
            border-color: #00a8e8;
            box-shadow: 0 0 0 3px rgba(0, 168, 232, 0.2);
            outline: none;
        }
        
        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
        }
        
        .remember-me input {
            margin-right: 8px;
        }
        
        .forgot-password a {
            color: #00a8e8;
            text-decoration: none;
        }
        
        .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #00a8e8;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-bottom: 20px;
        }
        
        .login-btn:hover {
            background-color: #0088c6;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        
        .social-login {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .social-login p {
            margin-bottom: 15px;
            color: #777;
            position: relative;
        }
        
        .social-login p::before,
        .social-login p::after {
            content: "";
            position: absolute;
            top: 50%;
            width: 30%;
            height: 1px;
            background-color: #ddd;
        }
        
        .social-login p::before {
            left: 0;
        }
        
        .social-login p::after {
            right: 0;
        }
        
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        
        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: transform 0.3s;
        }
        
        .social-icon:hover {
            transform: translateY(-3px);
        }
        
        .facebook { background-color: #3b5998; }
        .google { background-color: #db4437; }
        .twitter { background-color: #1da1f2; }
        
        .register-link {
            text-align: center;
            margin-top: 20px;
        }
        
        .register-link a {
            color: #00a8e8;
            text-decoration: none;
            font-weight: 500;
        }
        
        /* 3D Animation Elements */
        .shape {
            position: absolute;
            background-color: rgba(255, 255, 255, 0.15);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            animation: float 15s infinite linear;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: rgba(255, 255, 255, 0.7);
        }
        
        .shape:nth-child(1) {
            width: 100px;
            height: 100px;
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }
        
        .shape:nth-child(2) {
            width: 150px;
            height: 150px;
            top: 70%;
            left: 15%;
            animation-delay: 3s;
        }
        
        .shape:nth-child(3) {
            width: 80px;
            height: 80px;
            top: 30%;
            right: 10%;
            animation-delay: 6s;
        }
        
        .shape:nth-child(4) {
            width: 120px;
            height: 120px;
            bottom: 10%;
            right: 15%;
            animation-delay: 9s;
        }
        
        @keyframes float {
            0% { transform: translate(0, 0) rotate(0deg); }
            25% { transform: translate(50px, 50px) rotate(90deg); }
            50% { transform: translate(100px, 0) rotate(180deg); }
            75% { transform: translate(50px, -50px) rotate(270deg); }
            100% { transform: translate(0, 0) rotate(360deg); }
        }
    </style>
</head>
<body>
    <!-- 3D Animated Shapes -->
    <div class="shape"><i class="fas fa-heartbeat"></i></div>
    <div class="shape"><i class="fas fa-hospital"></i></div>
    <div class="shape"><i class="fas fa-stethoscope"></i></div>
    <div class="shape"><i class="fas fa-pills"></i></div>
    
    <div class="login-container">
        <div class="logo">
            <img src="shekharhospitallogo.png" alt="Hospital Logo">
            <h2>MediCare HMS</h2>
        </div>
        


<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");
    HttpSession session1 = request.getSession(false);
%>

<% if ("success".equals(msg) && session1 != null && session1.getAttribute("emailaddress") != null) { %>
    <script>alert("Registration successful! Please login.");</script>
<%
    session1.removeAttribute("emailaddress"); 
} else if ("1".equals(error)) {
%>
    <p style="color:red; text-align:center; font-weight:bold;">Invalid login. Please try again.</p>
<%
} else if ("failed".equals(error)) {
%>
    <p style="color:red; text-align:center; font-weight:bold;">Registration failed. Please try again.</p>
<%
}
%>


 <form action="LoginServlet" method="POST">
            <div class="form-group">
                <label for="emailaddress">Email </label>
                <input type="email" name="emailaddress"  id="username" placeholder="Enter your username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
               <input type="password" name="password" id="password" placeholder="Enter your password" required>

            </div>
            
            <div class="remember-forgot">
                <div class="remember-me">
                    <input type="checkbox" id="remember">
                    <label for="remember">Remember me</label>
                </div>
                <div class="forgot-password">
                    <a href="ResetPassword.jsp">Forgot password?</a>
                </div>
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>
        
   
             
        <div class="register-link">
            <p>Don't have an account? <a href="Register.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>