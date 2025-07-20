package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.company.Utilte.DBUtil;
import com.company.model.HospitalUser;
import com.company.model.PatientDetailes;

public class HospitalDaoIMP implements HospitalDao {
	@Override
	public boolean addUser(HospitalUser user) {
		String query = "INSERT INTO hospitaluser (firstname, lastname, emailaddress, password, registeringas, created_at, updated_at) VALUES (?, ?, ?, ?, ?, NOW(), NOW())";

	    
	    try (Connection connection = DBUtil.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        
	    	preparedStatement.setString(1, user.getFirstname());
	    	preparedStatement.setString(2, user.getLastname());
	    	preparedStatement.setString(3, user.getEmailaddress());
	    	preparedStatement.setString(4, user.getPassword());
	    	preparedStatement.setString(5, user.getRegisteringas());

	        
	        int rows = preparedStatement.executeUpdate();
	        System.out.println("Query executed successfully");
	        return rows > 0;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	 @Override
	    public boolean isValideUser(String emailaddress, String password) {
	        String query = "SELECT * FROM hospitaluser WHERE emailaddress = ? AND password = ?";
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedstatement = connection.prepareStatement(query)) {
	        	preparedstatement.setString(1, emailaddress);
	        	preparedstatement.setString(2, password);
	            ResultSet rs = preparedstatement.executeQuery();
	            return rs.next();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	 @Override
	    public boolean doesEmailExist(String email) {
	        String query = "SELECT * FROM hospitaluser WHERE emailaddress = ?";
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            preparedStatement.setString(1, email);
	            ResultSet rs = preparedStatement.executeQuery();
	            return rs.next();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	    
	    @Override
	    public boolean resetPassword(String email, String newPassword) {
	        String query = "UPDATE hospitaluser SET password = ?, updated_at = NOW() WHERE emailaddress = ?";
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	            preparedStatement.setString(1, newPassword);
	            preparedStatement.setString(2, email);
	            int rows = preparedStatement.executeUpdate();
	            return rows > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

		@Override
		public List<String> searchDoctorsByName(String searchTerm) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public List<PatientDetailes> getPatientsByDoctor(String doctorName) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public boolean addingPatientbilling(PatientDetailes patient) {
			// TODO Auto-generated method stub
			return false;
		}
	}
			
		