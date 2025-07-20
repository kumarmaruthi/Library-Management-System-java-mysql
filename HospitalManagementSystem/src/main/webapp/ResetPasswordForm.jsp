<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MediCare HMS - Reset Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .reset-container {
            max-width: 500px;
            margin: 80px auto;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
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
            font-size: 1.5rem;
            margin: 0;
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #333;
        }

        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            outline: none;
        }

        .reset-btn {
            width: 100%;
            padding: 12px;
            background-color: #00a8e8;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .reset-btn:hover {
            background-color: #0088c6;
        }

        .back-to-login {
            margin-top: 20px;
            text-align: center;
        }

        .back-to-login a {
            text-decoration: none;
            color: #005b96;
            font-weight: 500;
        }

        .password-strength {
            height: 5px;
            background-color: #ddd;
            border-radius: 4px;
            margin-top: 8px;
            transition: all 0.3s;
        }

        .strength-meter.weak {
            background-color: #ff4d4d;
            width: 33%;
        }

        .strength-meter.medium {
            background-color: #ffa500;
            width: 66%;
        }

        .strength-meter.strong {
            background-color: #28a745;
            width: 100%;
        }

        .password-requirements {
            margin-top: 10px;
        }

        .requirement {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #999;
            font-size: 0.9rem;
        }

        .requirement .valid {
            color: green;
        }

        .requirement .invalid {
            color: red;
        }

        p {
            margin: 10px 0;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>
    <div class="reset-container">
        <div class="logo">
            <img src="shekharhospitallogo.png" alt="Hospital Logo">
            <h2>Reset Your Password</h2>
        </div>
        
        
      
  
   <% 
        String error = request.getParameter("error");
        if ("passwordMismatch".equals(error)) {
        %>
            <p style="color:red; text-align:center;">Passwords do not match. Please try again.</p>
        <% 
        } else if ("resetFailed".equals(error)) {
        %>
            <p style="color:red; text-align:center;">Password reset failed. Please try again.</p>
        <% 
        }
        %>

        <form action="ResetPasswordServlet" method="POST">
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" name="newPassword" id="newPassword" placeholder="Enter new password" required>
                <div class="password-strength">
                    <div class="strength-meter"></div>
                </div>
                <div class="password-requirements">
                    <div class="requirement">
                        <i class="fas fa-times invalid"></i>
                        <span>At least 8 characters</span>
                    </div>
                    <div class="requirement">
                        <i class="fas fa-times invalid"></i>
                        <span>At least one uppercase letter</span>
                    </div>
                    <div class="requirement">
                        <i class="fas fa-times invalid"></i>
                        <span>At least one number</span>
                    </div>
                    <div class="requirement">
                        <i class="fas fa-times invalid"></i>
                        <span>At least one special character</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm new password" required>
            </div>

            <button type="submit" class="reset-btn">Reset Password</button>
        </form>

        <div class="back-to-login">
            <a href="Login.jsp"><i class="fas fa-arrow-left"></i> Back to Login</a>
        </div>
    </div>

    <script>
        // Password strength checker
        document.getElementById('newPassword').addEventListener('input', function(e) {
            const password = e.target.value;
            const strengthMeter = document.querySelector('.strength-meter');
            const requirements = document.querySelectorAll('.requirement i');

            // Reset all icons
            strengthMeter.className = 'strength-meter';
            requirements.forEach(icon => {
                icon.className = 'fas fa-times invalid';
            });

            let strength = 0;

            if (password.length >= 8) {
                requirements[0].className = 'fas fa-check valid';
                strength++;
            }
            if (/[A-Z]/.test(password)) {
                requirements[1].className = 'fas fa-check valid';
                strength++;
            }
            if (/\d/.test(password)) {
                requirements[2].className = 'fas fa-check valid';
                strength++;
            }
            if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
                requirements[3].className = 'fas fa-check valid';
                strength++;
            }

            if (strength === 1 || strength === 2) {
                strengthMeter.classList.add('weak');
            } else if (strength === 3) {
                strengthMeter.classList.add('medium');
            } else if (strength === 4) {
                strengthMeter.classList.add('strong');
            }
        });
    </script>
</body>
</html>
