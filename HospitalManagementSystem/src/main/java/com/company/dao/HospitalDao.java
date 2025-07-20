package com.company.dao;

import java.util.List;
import com.company.model.HospitalUser;
import com.company.model.PatientDetailes;

public interface HospitalDao {
    // User management methods
    boolean addUser(HospitalUser user);
    boolean isValideUser(String emailaddress, String password);
    boolean doesEmailExist(String email);
    boolean resetPassword(String emailFromSession, String newPassword);
    
    // Doctor-patient methods
    List<String> searchDoctorsByName(String searchTerm);
    List<PatientDetailes> getPatientsByDoctor(String doctorName);
    boolean addingPatientbilling(PatientDetailes patient);
}