package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.Register;
import com.util.HibernateUtil;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        Session hibSession = null;
        Transaction tx = null;

        try {
            hibSession = HibernateUtil.getSessionFactory().openSession();
            tx = hibSession.beginTransaction();

            Register reg = new Register();
            reg.setName(name);
            reg.setEmail(email);
            reg.setMobile(mobile);
            reg.setPassword(password); // hashing later

            hibSession.save(reg);
            tx.commit();

            // HTTP session for success message
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("successMsg", 
                    "Registration successful! Please login.");

            response.sendRedirect("login.jsp");

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();

            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("errorMsg", 
                    "Registration failed. Please try again.");

            response.sendRedirect("register.jsp");

        } finally {
            if (hibSession != null) {
                hibSession.close();
            }
        }
    }
}
