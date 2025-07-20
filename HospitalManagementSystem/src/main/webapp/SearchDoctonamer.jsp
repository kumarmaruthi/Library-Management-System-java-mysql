<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Search | MediCare HMS</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 15px;
        }
        
        header {
            background-color: #9457c7;
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
        }
        
        .logo img {
            height: 50px;
            margin-right: 15px;
        }
        
        .logo h1 {
            font-size: 1.8rem;
            font-weight: 600;
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 20px;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        
        nav ul li a:hover {
            background-color: rgba(209, 75, 75, 0.2);
        }
        
        .login-btn {
            background-color: #69129b;
            padding: 8px 20px;
            border-radius: 4px;
        }
        
        .login-btn:hover {
            background-color: #844ecc;
        }
        
        .search-section {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }
        
        .section-title {
            color: #5b59c4;
            margin-bottom: 1.5rem;
            padding-bottom: 10px;
            border-bottom: 2px solid #00a8e8;
        }
        
        .search-form-container {
            display: flex;
            align-items: center;
            gap: 10px;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .search-input-container {
            flex: 1;
            position: relative;
        }
        
        #doctor-search {
            width: 100%;
            padding: 12px 15px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: all 0.3s;
        }
        
        #doctor-search:focus {
            border-color: #00a8e8;
            box-shadow: 0 0 0 3px rgba(0, 168, 232, 0.2);
            outline: none;
        }
        
        #search-results {
            position: absolute;
            width: 100%;
            max-height: 300px;
            overflow-y: auto;
            border: 1px solid #ddd;
            border-top: none;
            background: white;
            z-index: 1000;
            display: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 0 0 4px 4px;
        }
        
        .search-result-item {
            padding: 12px 15px;
            cursor: pointer;
            border-bottom: 1px solid #eee;
            transition: background-color 0.3s;
        }
        
        .search-result-item:hover {
            background-color: #f5f5f5;
        }
        
        .search-btn {
            background-color: #6559d4;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            white-space: nowrap;
            height: 46px; /* Match input height */
        }
        
        .search-btn:hover {
            background-color: #4cae4c;
        }
        
        .loading-indicator {
            display: none;
            padding: 10px;
            text-align: center;
            color: #666;
        }
        
        .results-section {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-top: 2rem;
        }
        
        .patient-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        .patient-table th, .patient-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        
        .patient-table th {
            background-color: #f2f2f2;
            position: sticky;
            top: 0;
        }
        
        .table-container {
            max-height: 500px;
            overflow-y: auto;
            margin-top: 20px;
        }
        
        .no-results {
            color: #d9534f;
            padding: 20px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }
        
        footer {
            background-color: #002d4a;
            color: white;
            padding: 2rem 0 1rem;
            margin-top: 2rem;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            margin-bottom: 2rem;
        }
        
        .footer-column h3 {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer-column h3::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 2px;
            background-color: #00a8e8;
        }
        
        .footer-column ul {
            list-style: none;
        }
        
        .footer-column ul li {
            margin-bottom: 10px;
        }
        
        .footer-column ul li a {
            color: #b3cde0;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-column ul li a:hover {
            color: white;
        }
        
        .copyright {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #b3cde0;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                text-align: center;
            }
            
            nav ul {
                margin-top: 1rem;
                justify-content: center;
                flex-wrap: wrap;
            }
            
            nav ul li {
                margin: 5px;
            }
            
            .search-form-container {
                flex-direction: column;
                align-items: stretch;
            }
            
            .search-btn {
                width: 100%;
            }
            
            .patient-table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
    <script>
        function validateForm() {
            const searchTerm = document.getElementById('doctor-search').value.trim();
            if (!searchTerm) {
                alert("Please enter a doctor's name");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <header>
        <div class="container header-container">
            <div class="logo">
                <img src="images/logo.png" alt="MediCare Logo">
                <h1>MediCare HMS</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="services.jsp">Services</a></li>
                    <li><a href="doctors.jsp">Doctors</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="Login.jsp" class="login-btn">Login</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
        <div class="search-section">
            <h2 class="section-title">Find a Doctor</h2>
            <form action="${pageContext.request.contextPath}/SearchDoctonamer" method="POST" onsubmit="return validateForm()">
                <div class="search-form-container">
                    <div class="search-input-container">
                        <input type="text" id="doctor-search" name="doctor-search" placeholder="Start typing doctor's name..." required>
                        <div id="search-results"></div>
                    </div>
                    <button type="submit" class="search-btn">Search</button>
                </div>
            </form>
        </div>
        
        <div id="doctor-patients-results" class="results-section" 
             <c:if test="${empty patients}">style="display:none;"</c:if>>
            <h3>Patients for <span id="doctor-name-display">${doctorName}</span></h3>
            
            <c:choose>
                <c:when test="${not empty patients}">
                    <div class="table-container">
                        <table class="patient-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>
                                    <th>Middle Name</th>
                                    <th>Last Name</th>
                                    <th>Age</th>
                                    <th>Gender</th>
                                    <th>Patient ID</th>
                                    <th>Contact</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>Diagnosis</th>
                                    <th>Symptoms</th>
                                    <th>Department</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${patients}" var="patient" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${patient.firstName}</td>
                                        <td>${not empty patient.middleName ? patient.middleName : '-'}</td>
                                        <td>${patient.lastName}</td>
                                        <td>${patient.age}</td>
                                        <td>${patient.gender}</td>
                                        <td>${patient.patientId}</td>
                                        <td>${patient.contactNumber}</td>
                                        <td>${patient.emailAddress}</td>
                                        <td>${patient.address}</td>
                                        <td>${patient.diseaseDiagnosis}</td>
                                        <td>${patient.symptoms}</td>
                                        <td>${patient.department}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:when test="${not empty doctorName}">
                    <p class="no-results">No patients found for Dr. ${doctorName}</p>
                </c:when>
            </c:choose>
        </div>
    </div>

    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-column">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="services.jsp">Services</a></li>
                        <li><a href="doctors.jsp">Doctors</a></li>
                        <li><a href="appointment.jsp">Appointments</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Services</h3>
                    <ul>
                        <li><a href="#">Emergency Care</a></li>
                        <li><a href="#">Diagnostic Services</a></li>
                        <li><a href="#">Surgical Services</a></li>
                        <li><a href="#">Pharmacy</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Contact Us</h3>
                    <ul>
                        <li>123 Medical Drive</li>
                        <li>Health City, HC 12345</li>
                        <li>Phone: (123) 456-7890</li>
                        <li>Email: info@medicare.com</li>
                    </ul>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; 2023 MediCare Hospital Management System. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>