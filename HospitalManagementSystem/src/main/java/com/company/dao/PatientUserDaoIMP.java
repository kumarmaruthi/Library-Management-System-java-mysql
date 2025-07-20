package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.company.Utilte.DBUtil;
import com.company.model.PatientDetailes;

public class PatientUserDaoIMP implements PatientUserDao  {

	  @Override
	    public boolean addingPatientbilling(PatientDetailes patient) {
		  String query = "INSERT INTO patient_billings (" +
				    "first_name, middle_name, last_name, age, gender, patient_id, contact_number, email_address, address, " +
				    "disease_diagnosis, symptoms, doctor_name, department, admission_date, discharge_date, room_ward_no, " +
				    "treatment_details, lab_tests, medication_prescribed, " +
				    "billing_date, billing_time, consultation_fee, medication_fee, lab_charges, surgery_charges, " +
				    "other_charges, discounts, payment_method, payment_status, remarks" +
				    ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";



	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

	            preparedStatement.setString(1, patient.getFirstName());
	            preparedStatement.setString(2, patient.getMiddleName());
	            preparedStatement.setString(3, patient.getLastName());
	            preparedStatement.setInt(4, patient.getAge());
	            preparedStatement.setString(5, patient.getGender());
	            preparedStatement.setString(6, patient.getPatientId());
	            preparedStatement.setString(7, patient.getContactNumber());
	            preparedStatement.setString(8, patient.getEmailAddress());
	            preparedStatement.setString(9, patient.getAddress());

	            preparedStatement.setString(10, patient.getDiseaseDiagnosis());
	            preparedStatement.setString(11, patient.getSymptoms());
	            preparedStatement.setString(12, patient.getDoctorName());
	            preparedStatement.setString(13, patient.getDepartment());
	            preparedStatement.setString(14, patient.getAdmissionDate());
	            preparedStatement.setString(15, patient.getDischargeDate());
	            preparedStatement.setString(16, patient.getRoomWardNo());

	            preparedStatement.setString(17, patient.getTreatmentDetails());
	            preparedStatement.setString(18, patient.getLabTests());
	            preparedStatement.setString(19, patient.getMedicationPrescribed());

	            preparedStatement.setString(20, patient.getBillingDate());
	            preparedStatement.setString(21, patient.getBillingTime());
	            preparedStatement.setDouble(22, patient.getConsultationFee());
	            preparedStatement.setDouble(23, patient.getMedicationFee());
	            preparedStatement.setDouble(24, patient.getLabCharges());
	            preparedStatement.setDouble(25, patient.getSurgeryCharges());
	            preparedStatement.setDouble(26, patient.getOtherCharges());
	            preparedStatement.setDouble(27, patient.getDiscounts());
	            preparedStatement.setString(28, patient.getPaymentMethod());
	            preparedStatement.setString(29, patient.getPaymentStatus());
	            preparedStatement.setString(30, patient.getRemarks());

	            int rows = preparedStatement.executeUpdate();
	            System.out.println("Patient billing record inserted successfully.");
	            return rows > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	   }
	  
	  @Override
	    public List<PatientDetailes> searchDoctonamers(String doctorName) {
	        List<PatientDetailes> patients = new ArrayList<>();
	        String query = "SELECT first_name, middle_name, last_name, age, gender, patient_id, " +
	                      "contact_number, email_address, address, disease_diagnosis, symptoms, department " +
	                      "FROM patient_billings WHERE doctor_name = ?";
	        
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            
	            preparedStatement.setString(1, doctorName);
	            ResultSet rs = preparedStatement.executeQuery();
	            
	            while (rs.next()) {
	                PatientDetailes patient = new PatientDetailes();
	                patient.setFirstName(rs.getString("first_name"));
	                patient.setMiddleName(rs.getString("middle_name"));
	                patient.setLastName(rs.getString("last_name"));
	                patient.setAge(rs.getInt("age"));
	                patient.setGender(rs.getString("gender"));
	                patient.setPatientId(rs.getString("patient_id"));
	                patient.setContactNumber(rs.getString("contact_number"));
	                patient.setEmailAddress(rs.getString("email_address"));
	                patient.setAddress(rs.getString("address"));
	                patient.setDiseaseDiagnosis(rs.getString("disease_diagnosis"));
	                patient.setSymptoms(rs.getString("symptoms"));
	                patient.setDepartment(rs.getString("department"));
	                
	                patients.add(patient);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return patients;
	    }
}
