<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare HMS - Reset Password</title>
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
        
        .reset-container {
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
        
        .instructions {
            text-align: center;
            margin-bottom: 25px;
            color: #555;
            line-height: 1.5;
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
        
        .reset-btn {
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
        
        .reset-btn:hover {
            background-color: #0088c6;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        
        .back-to-login {
            text-align: center;
            margin-top: 20px;
        }
        
        .back-to-login a {
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

        /* Password strength indicator */
        .password-strength {
            margin-top: 5px;
            height: 5px;
            background-color: #eee;
            border-radius: 3px;
            overflow: hidden;
        }

        .strength-meter {
            height: 100%;
            width: 0;
            transition: width 0.3s, background-color 0.3s;
        }

        .weak { background-color: #ff4d4d; width: 33%; }
        .medium { background-color: #ffcc00; width: 66%; }
        .strong { background-color: #00cc66; width: 100%; }

        .password-requirements {
            margin-top: 10px;
            font-size: 13px;
            color: #666;
        }

        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }

        .requirement i {
            margin-right: 5px;
            font-size: 12px;
        }

        .valid {
            color: #00cc66;
        }

        .invalid {
            color: #ff4d4d;
        }
    </style>
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> -->
</head>
<body>
    <!-- 3D Animated Shapes -->
    <div class="shape"><i class="fas fa-heartbeat"></i></div>
    <div class="shape"><i class="fas fa-hospital"></i></div>
    <div class="shape"><i class="fas fa-stethoscope"></i></div>
    <div class="shape"><i class="fas fa-pills"></i></div>
    
    <div class="reset-container">
        <div class="logo">
            <img src="shekharhospitallogo.png" alt="Hospital Logo">
            <h2>MediCare HMS</h2>
        </div>
        
        <p class="instructions">Please enter your email address and we'll send you a link to reset your password.</p>
        
        <form action="ResetPasswordServlet" method="POST">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" name="email" id="email" placeholder="Enter your email address" required>
            </div>
            
            <button type="submit" class="reset-btn">Send Reset Link</button>
        </form>


<% 
HttpSession session1 = request.getSession(false);
if (session1 != null && session1.getAttribute("email") != null) {
    String email1 = (String) session1.getAttribute("email");
%>
    <p style="color:green; text-align:center;">
        Reset the password successfully! <strong><%= email1 %></strong>
    </p>
<%
    session1.removeAttribute("email");
} else if (request.getParameter("error") != null) {
    String error = request.getParameter("error");
    if ("emailNotFound".equals(error)) {
%>
    <p style="color:red; text-align:center;">
        Your Email is not valid. Please try again!
    </p>
<%
    } else if ("passwordMismatch".equals(error)) {
%>
    <p style="color:red; text-align:center;">
        Passwords do not match. Please try again!
    </p>
<%
    } else if ("sessionExpired".equals(error)) {
%>
    <p style="color:red; text-align:center;">
        Session expired. Please start the reset process again.
    </p>
<%
    } else if ("resetFailed".equals(error)) {
%>
    <p style="color:red; text-align:center;">
        Password reset failed. Please try again.
    </p>
<%
    }
}
%>

        
        <div class="back-to-login">
            <a href="Login.jsp"><i class="fas fa-arrow-left"></i> Back to Login</a>
        </div>
    </div>

    <script>
        // Simple password strength checker
        document.getElementById('newPassword').addEventListener('input', function(e) {
            const password = e.target.value;
            const strengthMeter = document.querySelector('.strength-meter');
            const requirements = document.querySelectorAll('.requirement i');
            
            // Reset all
            strengthMeter.className = 'strength-meter';
            requirements.forEach(icon => {
                icon.className = 'fas fa-times invalid';
            });
            
            // Check length
            if (password.length >= 8) {
                requirements[0].className = 'fas fa-check valid';
            }
            
            // Check uppercase
            if (/[A-Z]/.test(password)) {
                requirements[1].className = 'fas fa-check valid';
            }
            
            // Check number
            if (/\d/.test(password)) {
                requirements[2].className = 'fas fa-check valid';
            }
            
            // Check special char
            if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
                requirements[3].className = 'fas fa-check valid';
            }
            
            // Determine strength
            let strength = 0;
            if (password.length >= 8) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/\d/.test(password)) strength++;
            if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) strength++;
            
            if (strength > 0 && strength <= 2) {
                strengthMeter.className = 'strength-meter weak';
            } else if (strength === 3) {
                strengthMeter.className = 'strength-meter medium';
            } else if (strength === 4) {
                strengthMeter.className = 'strength-meter strong';
            }
        });
    </script>
</body>
</html>