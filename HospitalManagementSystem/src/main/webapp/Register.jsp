<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare HMS - Register</title>
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
        
        .register-container {
            width: 450px;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            z-index: 10;
            position: relative;
            overflow-y: auto;
            max-height: 90vh;
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
        
        .form-group input, 
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        .form-group input:focus,
        .form-group select:focus {
            border-color: #00a8e8;
            box-shadow: 0 0 0 3px rgba(0, 168, 232, 0.2);
            outline: none;
        }
        
        .name-fields {
            display: flex;
            gap: 15px;
        }
        
        .name-fields .form-group {
            flex: 1;
        }
        
        .register-btn {
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
            margin: 20px 0;
        }
        
        .register-btn:hover {
            background-color: #0088c6;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        
        .terms {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .terms input {
            margin-right: 8px;
        }
        
        .terms label {
            font-size: 14px;
            color: #777;
        }
        
        .terms label a {
            color: #00a8e8;
            text-decoration: none;
        }
        
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
        
        .login-link a {
            color: #00a8e8;
            text-decoration: none;
            font-weight: 500;
        }
        
        /* 3D Floating Cards */
        .card {
            position: absolute;
            width: 150px;
            height: 200px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 15px;
            text-align: center;
            color: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            animation: float 20s infinite linear;
            transform-style: preserve-3d;
            transform: perspective(500px) rotateY(20deg);
            transition: all 0.5s;
        }
        
        .card i {
            font-size: 2rem;
            margin-bottom: 10px;
        }
        
        .card:hover {
            transform: perspective(500px) rotateY(20deg) scale(1.1);
            background-color: rgba(255, 255, 255, 0.2);
        }
        
        .card:nth-child(1) {
            top: 15%;
            left: 10%;
            animation-delay: 0s;
        }
        
        .card:nth-child(2) {
            top: 25%;
            right: 10%;
            animation-delay: 4s;
        }
        
        .card:nth-child(3) {
            bottom: 15%;
            left: 15%;
            animation-delay: 8s;
        }
        
        .card:nth-child(4) {
            bottom: 25%;
            right: 15%;
            animation-delay: 12s;
        }
        
        @keyframes float {
            0% { transform: perspective(500px) rotateY(20deg) translate(0, 0); }
            25% { transform: perspective(500px) rotateY(20deg) translate(50px, 50px); }
            50% { transform: perspective(500px) rotateY(20deg) translate(100px, 0); }
            75% { transform: perspective(500px) rotateY(20deg) translate(50px, -50px); }
            100% { transform: perspective(500px) rotateY(20deg) translate(0, 0); }
        }
    </style>
</head>
<body>
    <!-- 3D Floating Cards -->
    <div class="card">
        <i class="fas fa-user-md"></i>
        <h4>Doctor Portal</h4>
    </div>
    <div class="card">
        <i class="fas fa-procedures"></i>
        <h4>Patient Care</h4>
    </div>
    <div class="card">
        <i class="fas fa-prescription-bottle-alt"></i>
        <h4>Pharmacy</h4>
    </div>
    <div class="card">
        <i class="fas fa-file-medical"></i>
        <h4>Records</h4>
    </div>
    
    <div class="register-container">
        <div class="logo">
            <img src="shekharhospitallogo.png" alt="Hospital Logo">
            <h2>Create Account</h2>
        </div>
        
        
        
        
        
        


<!-- 


<%
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");
    HttpSession session1 = request.getSession(false);
%>

<% if ("success".equals(msg) && session1 != null && session1.getAttribute("emailaddress") != null) { %>
    <script>alert("Registration successful! Please login.");</script>
   <%     
     session1.removeAttribute("emailaddress");             
  %>  
<%
     
} else if ("1".equals(error)) {
%>
    <p style="color:red; text-align:center; font-weight: bold;">Invalid login. Please try again.</p>
<%
}
%>

-->






   
 <form action="RegisterServlet" method="POST">
            <div class="name-fields">
                <div class="form-group">
                    <label for="first-name">First Name</label>
                    <input type="text" name="firstname" id="first-name" placeholder="Enter your first name" required>
                </div>
                <div class="form-group">
                    <label for="last-name">Last Name</label>
                    <input type="text" name="lastname" id="last-name" placeholder="Enter your last name" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email"  name="emailaddress" id="email" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password"  id="password" placeholder="Create a password" required>
            </div>
            
              <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" name="confirmpassword" id="confirm-password" placeholder="Confirm your password" required>
            </div>
            
            
            
            
            
   
          
            
            <div class="form-group">
                <label for="role">Registering as</label>
                <select id="role"  name="registeringas"  required>
                    <option value="">Select your role</option>
                    <option value="doctor">Doctor</option>
                    <option value="nurse">Nurse</option>
                    <option value="patient">Patient</option>
                    <option value="admin">Administrator</option>
                </select>
            </div>
            
            <div class="terms">
                <input type="checkbox" id="agree-terms" required>
                <label for="agree-terms">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label>
            </div>
            
            <button type="submit" class="register-btn">Create Account</button>
        </form>
        
         <div class="login-link">
            <p>Already have an account? <a href="Login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>