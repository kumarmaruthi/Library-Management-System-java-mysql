package com.company.Servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.company.dao.PatientUserDao;
import com.company.dao.PatientUserDaoIMP;
import com.company.model.PatientDetailes;

@WebServlet("/SearchDoctonamer")
public class SearchDoctonamer extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static PatientUserDao patientdetailes = new PatientUserDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Set character encoding
            request.setCharacterEncoding("UTF-8");
            
            // Get search parameter
            String doctorName = request.getParameter("doctor-search");
            System.out.println("Searching for doctor: " + doctorName);
            
            // Search for patients
            List<PatientDetailes> patients = patientdetailes.searchDoctonamers(doctorName);
            System.out.println("Found " + patients.size() + " patients");
            
            // Set attributes for JSP
            request.setAttribute("patients", patients);
            request.setAttribute("doctorName", doctorName);
            
            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("SearchDoctonamer.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing search");
        }
    }
}