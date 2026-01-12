package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.model.Register;
import com.util.HibernateUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            Query<Register> query = session.createQuery(
                    "from Register where email = :email", Register.class);
            query.setParameter("email", email);

            Register user = query.uniqueResult();
            HttpSession httpSession = request.getSession();

            if (user != null && user.getPassword().equals(password)) {
                // ✅ login success
                httpSession.setAttribute("loggedUser", user.getName());
                response.sendRedirect("welcome.jsp");
            } else {
                httpSession.setAttribute("errorMsg", "Invalid email or password");
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMsg", "Something went wrong!");
            response.sendRedirect("login.jsp");
        } finally {
            if (session != null) session.close();
        }
    }
}
