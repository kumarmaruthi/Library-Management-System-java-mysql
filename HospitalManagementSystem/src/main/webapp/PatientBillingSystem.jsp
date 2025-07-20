<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCare HMS - Patient Billing</title>    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: #f5f7fa;
            color: #333;
            min-height: 100vh;
            padding: 20px;
        }
        
        .billing-container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(135deg, #005b96, #00a8e8);
            color: white;
            padding: 20px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 1.8rem;
            margin-bottom: 5px;
        }
        
        .header p {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        .form-section, .bill-section {
            padding: 30px;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }
        
        .form-group {
            flex: 1;
            min-width: 200px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        
        .form-group input, 
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 15px;
            transition: all 0.3s;
        }
        
        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #00a8e8;
            box-shadow: 0 0 0 3px rgba(0, 168, 232, 0.2);
            outline: none;
        }
        
        .form-group textarea {
            min-height: 80px;
            resize: vertical;
        }
        
        .btn {
            padding: 12px 20px;
            background-color: #00a8e8;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-right: 10px;
        }
        
        .btn:hover {
            background-color: #0088c6;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        
        .btn-print {
            background-color: #28a745;
        }
        
        .btn-print:hover {
            background-color: #218838;
        }
        
        .btn-reset {
            background-color: #dc3545;
        }
        
        .btn-reset:hover {
            background-color: #c82333;
        }
        
        .bill-section {
            display: none;
            background-color: #f8f9fa;
            border-top: 1px solid #eee;
        }
        
        .bill-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .bill-header h2 {
            color: #005b96;
            margin-bottom: 10px;
        }
        
        .bill-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        
        .patient-info, .hospital-info {
            flex: 1;
        }
        
        .bill-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        
        .bill-table th, .bill-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        .bill-table th {
            background-color: #005b96;
            color: white;
        }
        
        .bill-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        .bill-total {
            text-align: right;
            margin-top: 20px;
            font-size: 1.2rem;
            font-weight: bold;
        }
        
        .bill-footer {
            margin-top: 30px;
            text-align: center;
            font-style: italic;
            color: #777;
        }
        
        .section-title {
            font-size: 16px;
            color: #005b96;
            margin: 25px 0 15px;
            padding-bottom: 8px;
            border-bottom: 2px solid #00a8e8;
        }
        
        @media print {
            body * {
                visibility: hidden;
            }
            .billing-container, .billing-container * {
                visibility: visible;
            }
            .form-section {
                display: none;
            }
            .bill-section {
                display: block !important;
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                padding: 20px;
                box-shadow: none;
                border: none;
                background-color: white;
            }
            .no-print {
                display: none !important;
            }
            .bill-table th {
                color: white !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
        }
        
        @media (max-width: 400px) {
            .form-group {
                min-width: 100%;
            }
        }
        .btn-submit {
            background-color: #7c54da;
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-submit:hover {
            background-color: #4c00ff;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        .logoo{
            width: 40px;
            border-radius: 10px 10px 10px 10px;
            margin-top: 10px;
        }
        .unchangeable-field {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            font-family: monospace;
        }
        
        /* Success and error messages */
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
        }
        
        .alert-success {
            color: #3c763d;
            background-color: #dff0d8;
            border-color: #d6e9c6;
        }
        
        .alert-error {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }
    </style>
</head>
<body>
    <div class="billing-container">
        <div class="header">
            <h1> <img class="logoo" src="shekharhospitallogo.png" alt="Hospital Logo">  MediCare Hospital Management System</h1>
            <p>Patient Billing System</p>
        </div>
        
        <!-- Display success/error messages -->
        <% 
        String msg = request.getParameter("msg");
        if("success".equals(msg)) { %>
        
          <script>
      var confirmed = confirm("Patient billing information saved successfully!");
       </script>
    
        <% } else if("error".equals(msg)) { %>
            <div class="alert alert-error">
                Error saving patient billing information. Please try again.
            </div>
            
        <% }
        %>
        
        <div class="form-section">
            <form action="PatientBillingSystemServlet" method="POST" onsubmit="return validateForm()">
                <h3 class="section-title">Patient Information</h3>
                <div class="form-row">
                    <div class="form-group">
                        <label for="first-name">First Name *</label>
                        <input type="text" name="firstName" id="first-name" placeholder="Patient first name" required>
                    </div>
                    <div class="form-group">
                        <label for="middle-name">Middle Name</label>
                        <input type="text" name="middleName" id="middle-name" placeholder="Patient middle name">
                    </div>
                    <div class="form-group">
                        <label for="last-name">Last Name *</label>
                        <input type="text" name="lastName" id="last-name" placeholder="Patient last name" required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="age">Age *</label>
                        <input type="number" name="age" id="age" placeholder="Patient age" required min="0" max="120">
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender *</label>
                        <select id="gender" name="gender" required>
                            <option value="">Select gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="patient-id">Patient ID / UHID *</label>
                        <input type="text" name="patientId" id="patient-id" placeholder="Unique hospital ID" required>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="contact-number">Contact Number *</label>
                        <input type="tel" name="contactNumber" id="contact-number" placeholder="Mobile or phone number" required
                               pattern="[0-9]{10,15}" title="Please enter a valid phone number (10-15 digits)">
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" name="emailAddress" id="email" placeholder="Patient email address">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="address">Address *</label>
                        <textarea id="address" name="address" placeholder="Full residential address" required></textarea>
                    </div>
                </div>
                
                <h3 class="section-title">Medical Information</h3>
                <div class="form-row">
                    <div class="form-group">
                        <label for="disease">Disease/Diagnosis *</label>
                        <input type="text" name="diseaseDiagnosis" id="disease" placeholder="Diagnosed disease" required>
                    </div>
                    <div class="form-group">
                        <label for="symptoms">Symptoms</label>
                        <textarea id="symptoms" name="symptoms" placeholder="Symptoms reported by patient"></textarea>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="doctor">Doctor Name *</label>
                        
                        <select id="doctor" name="doctorName" required>
                            <option value="">Select doctor</option>
                            <option value="Dr. Rohan Sharma">Dr. Rohan Sharma</option>
                            <option value="Dr. Ananya Patel">Dr. Ananya Patel</option>
                            <option value="Dr. Vikram Singh">Dr. Vikram Singh</option>
                            <option value="Dr. Neha Gupta">Dr. Neha Gupta</option>
                            <option value="Dr. Arjun Reddy">Dr. Arjun Reddy</option>
                            <option value="Dr. Meera Iyer">Dr. Meera Iyer</option>
                            <option value="Dr. Aditya Malhotra">Dr. Aditya Malhotra</option>
                            <option value="Dr. Kavita Joshi">Dr. Kavita Joshi</option>
                            <option value="Dr. Rahul Desai">Dr. Rahul Desai</option>
                       </select>
                      </div>
                    <div class="form-group">
                        <label for="department">Department *</label>
                        <select id="department" name="department" required>
                            <option value="">Select department</option>
                            <option value="General Medicine">General Medicine</option>
                            <option value="Cardiology">Cardiology</option>
                            <option value="Neurology">Neurology</option>
                            <option value="Orthopedics">Orthopedics</option>
                            <option value="Pediatrics">Pediatrics</option>
                            <option value="Gynecology">Gynecology</option>
                            <option value="Oncology">Oncology</option>
                            <option value="ENT">ENT</option>
                            <option value="Dermatology">Dermatology</option>
                            <option value="Ophthalmology">Ophthalmology</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="admission-date">Admission Date</label>
                        <input type="date" name="admissionDate" id="admission-date">
                    </div>
                    <div class="form-group">
                        <label for="discharge-date">Discharge Date</label>
                        <input type="date" name="dischargeDate" id="discharge-date">
                    </div>
                    <div class="form-group">
                        <label for="room-ward">Room/Ward No.</label>
                        <input type="text" name="roomWardNo" id="room-ward" placeholder="Room or ward number">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="treatment">Treatment Details</label>
                        <textarea id="treatment" name="treatmentDetails" placeholder="Treatment description"></textarea>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="lab-tests">Lab Tests</label>
                        <textarea id="lab-tests" name="labTests" placeholder="List of lab tests performed"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="medication-prescribed">Medication Prescribed</label>
                        <textarea id="medication-prescribed" name="medicationPrescribed" placeholder="Names of medicines prescribed"></textarea>
                    </div>
                </div>
                
                <h3 class="section-title">Billing Information</h3>
            <div class="form-row">
    <div class="form-group">
        <label>Billing Date *</label>
        <div class="unchangeable-field" id="dateDisplay"><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></div>
        <input type="hidden" name="billingDate" id="date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
    </div>
    <div class="form-group">
        <label>Billing Time *</label>
        <div class="unchangeable-field" id="timeDisplay"><%= new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date()) %></div>
        <input type="hidden" name="billingTime" id="time" value="<%= new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date()) %>" required>
    </div>
</div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="consultation-fee">Consultation Fee (₹) *</label>
                        <input type="number" name="consultationFee" id="consultation-fee" placeholder="0.00" step="0.01" min="0" required>
                    </div>
                    <div class="form-group">
                        <label for="medication-fee">Medication Fee (₹) *</label>
                        <input type="number" name="medicationFee" id="medication-fee" placeholder="0.00" step="0.01" min="0" required>
                    </div>
                    <div class="form-group">
                        <label for="lab-charges">Lab Charges (₹)</label>
                        <input type="number" name="labCharges" id="lab-charges" placeholder="0.00" step="0.01" min="0">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="surgery-charges">Surgery Charges (₹)</label>
                        <input type="number" name="surgeryCharges" id="surgery-charges" placeholder="0.00" step="0.01" min="0">
                    </div>
                    <div class="form-group">
                        <label for="other-fee">Other Charges (₹)</label>
                        <input type="number" name="otherCharges" id="other-fee" placeholder="0.00" step="0.01" min="0">
                    </div>
                    <div class="form-group">
                        <label for="discounts">Discounts (₹)</label>
                        <input type="number" name="discounts" id="discounts" placeholder="0.00" step="0.01" min="0">
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="payment-method">Payment Method *</label>
                        <select id="payment-method" name="paymentMethod" required>
                            <option value="">Select payment method</option>
                            <option value="Cash">Cash</option>
                            <option value="Credit Card">Credit Card</option>
                            <option value="Debit Card">Debit Card</option>
                            <option value="UPI">UPI</option>
                            <option value="Net Banking">Net Banking</option>
                            <option value="Insurance">Insurance</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="payment-status">Payment Status *</label>
                        <select id="payment-status" name="paymentStatus" required>
                            <option value="">Select status</option>
                            <option value="Paid">Paid</option>
                            <option value="Unpaid">Unpaid</option>
                            <option value="Partially Paid">Partially Paid</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="remarks">Remarks</label>
                        <textarea id="remarks" name="remarks" placeholder="Notes or special instructions"></textarea>
                    </div>
                </div>
                
                <div class="form-row no-print">
                    <button type="button" class="btn" id="generateBill">Generate Bill</button>
                    <button type="submit" class="btn btn-submit">Submit</button>
                    <button type="reset" class="btn btn-reset">Reset Form</button>
                </div>
            </form>
        </div>
        
        <div class="bill-section" id="billSection">
            <div class="bill-header">
                <h2> <img class="logoo" src="shekharhospitallogo.png" alt="Hospital Logo">    MEDICAL INVOICE</h2>
                <p>Invoice #<span id="invoice-number">INV-2023-001</span></p>
            </div>
            
            <div class="bill-details">
                <div class="patient-info">
                    <h3>Patient Details</h3>
                    <p><strong>Name:</strong> <span id="bill-name"></span></p>
                    <p><strong>Patient ID:</strong> <span id="bill-patient-id"></span></p>
                    <p><strong>Age/Gender:</strong> <span id="bill-age-gender"></span></p>
                    <p><strong>Contact:</strong> <span id="bill-contact"></span></p>
                    <p><strong>Address:</strong> <span id="bill-address"></span></p>
                    <p><strong>Diagnosis:</strong> <span id="bill-disease"></span></p>
                    <p><strong>Symptoms:</strong> <span id="bill-symptoms"></span></p>
                    <p><strong>Doctor:</strong> <span id="bill-doctor"></span> (<span id="bill-department"></span>)</p>
                    <p><strong>Admission:</strong> <span id="bill-admission"></span></p>
                    <p><strong>Discharge:</strong> <span id="bill-discharge"></span></p>
                    <p><strong>Room/Ward:</strong> <span id="bill-room"></span></p>
                </div>
                
                <div class="hospital-info">
                    <h3>MediCare Hospital</h3>
                    <p>123 Health Street, Medical City</p>
                    <p>Phone: (123) 456-7890</p>
                    <p>Email: info@medicare.com</p>
                    
                    <p><strong>Billing Date/Time:</strong> <span id="bill-date-time"></span></p>
                    
                    <p><strong>Payment Method:</strong> <span id="bill-payment-method"></span></p>
                    <p><strong>Payment Status:</strong> <span id="bill-payment-status"></span></p>
                </div>
            </div>
            
            <table class="bill-table">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>Amount (₹)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Consultation Fee</td>
                        <td id="bill-consultation">0.00</td>
                    </tr>
                    <tr>
                        <td>Medication Charges</td>
                        <td id="bill-medication">0.00</td>
                    </tr>
                    <tr>
                        <td>Lab Tests Charges</td>
                        <td id="bill-lab">0.00</td>
                    </tr>
                    <tr>
                        <td>Surgery Charges</td>
                        <td id="bill-surgery">0.00</td>
                    </tr>
                    <tr>
                        <td>Other Charges</td>
                        <td id="bill-other">0.00</td>
                    </tr>
                    <tr>
                        <td>Discounts</td>
                        <td id="bill-discount">0.00</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Total Amount</th>
                        <th id="bill-total">0.00</th>
                    </tr>
                </tfoot>
            </table>
            
            <div class="form-row">
                <div class="form-group">
                    <p><strong>Treatment Details:</strong> <span id="bill-treatment"></span></p>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <p><strong>Lab Tests:</strong> <span id="bill-lab-tests"></span></p>
                </div>
                <div class="form-group">
                    <p><strong>Medication Prescribed:</strong> <span id="bill-medication-prescribed"></span></p>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <p><strong>Remarks:</strong> <span id="bill-remarks"></span></p>
                </div>
            </div>
            
            <div class="bill-footer">
                <p>Thank you for choosing MediCare Hospital. Please bring this invoice for any queries.</p>
                <p>This is computer generated document and does not require signature.</p>
            </div>
            
            <div class="no-print" style="text-align: center; margin-top: 30px;">
                <button class="btn btn-print" onclick="printBill()">Print Bill</button>
                <button class="btn" id="editBill">Edit Bill</button>
            </div>
        </div>
    </div>

    <script>
        // Update date and time in real-time
        function updateLiveTime() {
            const now = new Date();
            
            // Format Date (YYYY-MM-DD)
            const dateStr = now.toISOString().split('T')[0];
            
            // Format Time (HH:MM:SS)
            const timeStr = now.toTimeString().split(' ')[0];
            
            // Update display (visible to user)
            document.getElementById('dateDisplay').textContent = dateStr;
            document.getElementById('timeDisplay').textContent = timeStr;
            
            // Update hidden inputs (for form submission)
            document.getElementById('date').value = dateStr;
            document.getElementById('time').value = timeStr;
            
            // Update every second
            setTimeout(updateLiveTime, 1000);
        }

        // Initialize
        updateLiveTime();
        
        // Generate bill button click handler
        document.getElementById('generateBill').addEventListener('click', function() {
            // Validate required fields first
            if(!validateBillForm()) {
                return;
            }
            
            // Get form values
            const firstName = document.getElementById('first-name').value;
            const middleName = document.getElementById('middle-name').value;
            const lastName = document.getElementById('last-name').value;
            const age = document.getElementById('age').value;
            const gender = document.getElementById('gender').value;
            const patientId = document.getElementById('patient-id').value;
            const contact = document.getElementById('contact-number').value;
            const email = document.getElementById('email').value;
            const address = document.getElementById('address').value;
            const date = document.getElementById('date').value;
            const time = document.getElementById('time').value;
            const disease = document.getElementById('disease').value;
            const symptoms = document.getElementById('symptoms').value;
            const doctor = document.getElementById('doctor').value;
            const department = document.getElementById('department').value;
            const admissionDate = document.getElementById('admission-date').value;
            const dischargeDate = document.getElementById('discharge-date').value;
            const roomWard = document.getElementById('room-ward').value;
            const treatment = document.getElementById('treatment').value;
            const labTests = document.getElementById('lab-tests').value;
            const medicationPrescribed = document.getElementById('medication-prescribed').value;
            const consultationFee = parseFloat(document.getElementById('consultation-fee').value) || 0;
            const medicationFee = parseFloat(document.getElementById('medication-fee').value) || 0;
            const labCharges = parseFloat(document.getElementById('lab-charges').value) || 0;
            const surgeryCharges = parseFloat(document.getElementById('surgery-charges').value) || 0;
            const otherFee = parseFloat(document.getElementById('other-fee').value) || 0;
            const discounts = parseFloat(document.getElementById('discounts').value) || 0;
            const paymentMethod = document.getElementById('payment-method').value;
            const paymentStatus = document.getElementById('payment-status').value;
            const remarks = document.getElementById('remarks').value;
            
            // Calculate total
            const subtotal = consultationFee + medicationFee + labCharges + surgeryCharges + otherFee;
            const total = subtotal - discounts;
            
            // Format dates
            const formattedDate = new Date(date).toLocaleDateString('en-IN');
            const formattedAdmission = admissionDate ? new Date(admissionDate).toLocaleDateString('en-IN') : 'N/A';
            const formattedDischarge = dischargeDate ? new Date(dischargeDate).toLocaleDateString('en-IN') : 'N/A';
            
            // Format time
            const formattedTime = new Date(`${date}T${time}`).toLocaleTimeString('en-IN', {
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: true
            });
            
            // Set bill values
            document.getElementById('bill-name').textContent = `${firstName} ${middleName ? middleName + ' ' : ''}${lastName}`;
            document.getElementById('bill-patient-id').textContent = patientId;
            document.getElementById('bill-age-gender').textContent = `${age} years / ${gender}`;
            document.getElementById('bill-contact').textContent = `${contact}${email ? ' | ' + email : ''}`;
            document.getElementById('bill-address').textContent = address;
            document.getElementById('bill-disease').textContent = disease;
            document.getElementById('bill-symptoms').textContent = symptoms || 'N/A';
            document.getElementById('bill-doctor').textContent = doctor;
            document.getElementById('bill-department').textContent = department;
            document.getElementById('bill-admission').textContent = formattedAdmission;
            document.getElementById('bill-discharge').textContent = formattedDischarge;
            document.getElementById('bill-room').textContent = roomWard || 'N/A';
            document.getElementById('bill-date-time').textContent = `${formattedDate} at ${formattedTime}`;
            document.getElementById('bill-payment-method').textContent = paymentMethod;
            document.getElementById('bill-payment-status').textContent = paymentStatus;
            document.getElementById('bill-consultation').textContent = consultationFee.toFixed(2);
            document.getElementById('bill-medication').textContent = medicationFee.toFixed(2);
            document.getElementById('bill-lab').textContent = labCharges.toFixed(2);
            document.getElementById('bill-surgery').textContent = surgeryCharges.toFixed(2);
            document.getElementById('bill-other').textContent = otherFee.toFixed(2);
            document.getElementById('bill-discount').textContent = discounts.toFixed(2);
            document.getElementById('bill-total').textContent = total.toFixed(2);
            document.getElementById('bill-treatment').textContent = treatment || 'N/A';
            document.getElementById('bill-lab-tests').textContent = labTests || 'N/A';
            document.getElementById('bill-medication-prescribed').textContent = medicationPrescribed || 'N/A';
            document.getElementById('bill-remarks').textContent = remarks || 'N/A';
            
            // Generate random invoice number
            const invoiceNumber = 'INV-' + new Date().getFullYear() + '-' + Math.floor(1000 + Math.random() * 9000);
            document.getElementById('invoice-number').textContent = invoiceNumber;
            
            // Show bill section
            document.getElementById('billSection').style.display = 'block';
            
            // Scroll to bill section
            document.getElementById('billSection').scrollIntoView({ behavior: 'smooth' });
        });
        
        // Edit bill button click handler
        document.getElementById('editBill').addEventListener('click', function() {
            document.getElementById('billSection').style.display = 'none';
        });
        
        // Print bill function
        function printBill() {
            window.print();
        }
        
        // Form validation for bill generation
        function validateBillForm() {
            const requiredFields = [
                'first-name', 'last-name', 'age', 'gender', 'patient-id', 
                'contact-number', 'address', 'disease', 'doctor', 'department',
                'consultation-fee', 'medication-fee', 'payment-method', 'payment-status'
            ];
            
            let isValid = true;
            
            for (const fieldId of requiredFields) {
                const field = document.getElementById(fieldId);
                if (!field.value.trim()) {
                    field.style.borderColor = 'red';
                    isValid = false;
                } else {
                    field.style.borderColor = '#ddd';
                }
            }
            
            if (!isValid) {
                alert('Please fill all required fields marked in red before generating the bill.');
                return false;
            }
            
            return true;
        }
        
        // Form validation for submission
        function validateForm() {
            return validateBillForm(); // Reuse the same validation for now
        }
        
        
        
        
        
    </script>
</body>
</html>