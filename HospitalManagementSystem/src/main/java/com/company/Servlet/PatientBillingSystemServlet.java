package com.company.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.PatientUserDao;
import com.company.dao.PatientUserDaoIMP;
import com.company.model.PatientDetailes;

@WebServlet("/PatientBillingSystemServlet")
public class PatientBillingSystemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static PatientUserDao patientdetailes = new PatientUserDaoIMP();

    public PatientBillingSystemServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Patient Information
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        int age = parseIntOrZero(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String patientId = request.getParameter("patientId");
        String contactNumber = request.getParameter("contactNumber");
        String emailAddress = request.getParameter("emailAddress");
        String address = request.getParameter("address");

        // Diagnosis & Medical Info
        String diseaseDiagnosis = request.getParameter("diseaseDiagnosis");
        String symptoms = request.getParameter("symptoms");
        String doctorName = request.getParameter("doctorName");
        String department = request.getParameter("department");
        String admissionDate = request.getParameter("admissionDate");
        String dischargeDate = request.getParameter("dischargeDate");
        String roomWardNo = request.getParameter("roomWardNo");
        String treatmentDetails = request.getParameter("treatmentDetails");
        String labTests = request.getParameter("labTests");
        String medicationPrescribed = request.getParameter("medicationPrescribed");

        // Billing Information
        String billingDate = request.getParameter("billingDate");
        String billingTime = request.getParameter("billingTime");
        double consultationFee = parseDoubleOrZero(request.getParameter("consultationFee"));
        double medicationFee = parseDoubleOrZero(request.getParameter("medicationFee"));
        double labCharges = parseDoubleOrZero(request.getParameter("labCharges"));
        double surgeryCharges = parseDoubleOrZero(request.getParameter("surgeryCharges"));
        double otherCharges = parseDoubleOrZero(request.getParameter("otherCharges"));
        double discounts = parseDoubleOrZero(request.getParameter("discounts"));
        String paymentMethod = request.getParameter("paymentMethod");
        String paymentStatus = request.getParameter("paymentStatus");
        String remarks = request.getParameter("remarks");

        // Create patient object
        PatientDetailes patient = new PatientDetailes();

        // Set patient data
        patient.setFirstName(firstName);
        patient.setMiddleName(middleName);
        patient.setLastName(lastName);
        patient.setAge(age);
        patient.setGender(gender);
        patient.setPatientId(patientId);
        patient.setContactNumber(contactNumber);
        patient.setEmailAddress(emailAddress);
        patient.setAddress(address);

        // Set medical data
        patient.setDiseaseDiagnosis(diseaseDiagnosis);
        patient.setSymptoms(symptoms);
        patient.setDoctorName(doctorName);
        patient.setDepartment(department);
        patient.setAdmissionDate(admissionDate);
        patient.setDischargeDate(dischargeDate);
        patient.setRoomWardNo(roomWardNo);
        patient.setTreatmentDetails(treatmentDetails);
        patient.setLabTests(labTests);
        patient.setMedicationPrescribed(medicationPrescribed);

        // Set billing data
        patient.setBillingDate(billingDate);
        patient.setBillingTime(billingTime);
        patient.setConsultationFee(consultationFee);
        patient.setMedicationFee(medicationFee);
        patient.setLabCharges(labCharges);
        patient.setSurgeryCharges(surgeryCharges);
        patient.setOtherCharges(otherCharges);
        patient.setDiscounts(discounts);
        patient.setPaymentMethod(paymentMethod);
        patient.setPaymentStatus(paymentStatus);
        patient.setRemarks(remarks);

        // Save patient billing info
        if (patientdetailes.addingPatientbilling(patient)) {
            response.sendRedirect("PatientBillingSystem.jsp?msg=success");
            System.out.println("✅ Patient Billing added successfully");
        } else {
            response.sendRedirect("PatientBillingSystem.jsp?msg=error");
            System.out.println("❌ Failed to add Patient Billing");
        }
    }

    private double parseDoubleOrZero(String param) {
        try {
            return (param != null && !param.trim().isEmpty()) ? Double.parseDouble(param.trim()) : 0.0;
        } catch (NumberFormatException e) {
            return 0.0;
        }
    }

    private int parseIntOrZero(String param) {
        try {
            return (param != null && !param.trim().isEmpty()) ? Integer.parseInt(param.trim()) : 0;
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}