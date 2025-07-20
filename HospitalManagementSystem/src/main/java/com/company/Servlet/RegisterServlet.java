package com.company.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.dao.HospitalDao;
import com.company.dao.HospitalDaoIMP;
import com.company.model.HospitalUser;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static  HospitalDao  hospitaldao=new  HospitalDaoIMP();
   
    public RegisterServlet() {
        super();
       
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String emailaddress = request.getParameter("emailaddress");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        String registeringas = request.getParameter("registeringas");

        
        if (!password.equals(confirmpassword)) {
            response.sendRedirect("Register.jsp?error=PasswordMismatch");
            return;
        }

        HospitalUser user = new HospitalUser();
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setEmailaddress(emailaddress);
        user.setPassword(password);
        user.setRegisteringas(registeringas);
        

        if (hospitaldao.addUser(user)) {
            HttpSession session = request.getSession();
            session.setAttribute("emailaddress", emailaddress); 
            response.sendRedirect("Login.jsp?msg=success");
        } else {
            response.sendRedirect("Register.jsp?error=failed");
        }

    }
}
