package com.company.dao;

import com.company.model.PatientDetailes;
import java.util.List;

public interface PatientUserDao {
    boolean addingPatientbilling(PatientDetailes patient);


	List<PatientDetailes> searchDoctonamers(String doctorName);
}