package com.company.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.HospitalDao;
import com.company.dao.HospitalDaoIMP;
import com.company.model.HospitalUser;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static HospitalDao hospitaldao = new HospitalDaoIMP();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	// Handle password reset request
    	String email = request.getParameter("email");
    	String newPassword = request.getParameter("newPassword");
    	String confirmPassword = request.getParameter("confirmPassword");

    	if (newPassword == null) {
    	    // Step 1: Verify email
    	    if (hospitaldao.doesEmailExist(email)) {
    	        // Store email in session for verification in step 2
    	        request.getSession().setAttribute("resetEmail", email);
    	        response.sendRedirect("ResetPasswordForm.jsp");
    	    } else {
    	        response.sendRedirect("ResetPassword.jsp?error=emailNotFound");
    	    }
    	} else {
    	    // Step 2: Handle password reset
    	    if (!newPassword.equals(confirmPassword)) {
    	        response.sendRedirect("ResetPasswordForm.jsp?error=passwordMismatch");
    	        return;
    	    }
    	    
    	    String emailFromSession = (String) request.getSession().getAttribute("resetEmail");
    	    if (emailFromSession == null) {
    	        response.sendRedirect("ResetPassword.jsp?error=sessionExpired");
    	        return;
    	    }
    	    
    	    if (hospitaldao.resetPassword(emailFromSession, newPassword)) {
    	        // Clear the session and show success
    	        request.getSession().removeAttribute("resetEmail");
    	        request.getSession().setAttribute("email", emailFromSession);  // For success message
    	        response.sendRedirect("ResetPassword.jsp");
    	    } else {
    	        response.sendRedirect("ResetPasswordForm.jsp?error=resetFailed");
    	    }
    	}
    }
}