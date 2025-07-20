package com.company.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.company.dao.HospitalDao;
import com.company.dao.HospitalDaoIMP;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static HospitalDao hospitaldao = new HospitalDaoIMP();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    
    
    {
    	
    	String emailaddress = request.getParameter("emailaddress");
    	String password = request.getParameter("password");

    	HttpSession session = request.getSession();

    	if (hospitaldao.isValideUser(emailaddress, password)) {
    	    session.setAttribute("emailaddress", emailaddress);
    	    response.sendRedirect("Welcome.jsp?msg=success");
    	} else {
    	    // Invalid credentials: stay on login page with error message
    	    response.sendRedirect("Login.jsp?error=1");
    	}
}
    
}