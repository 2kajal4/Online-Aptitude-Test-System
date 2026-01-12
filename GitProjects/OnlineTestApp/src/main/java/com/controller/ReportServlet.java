package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.model.TestResult;
import com.util.HibernateUtil;


/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession hs = request.getSession();
        String username = (String) hs.getAttribute("loggedUser");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Session hibSession = HibernateUtil.getSessionFactory().openSession();

        List<TestResult> list = hibSession.createQuery(
                "from TestResult where username = :u", TestResult.class)
                .setParameter("u", username)
                .list();

        hibSession.close();

        request.setAttribute("list", list);
        request.getRequestDispatcher("reports.jsp").forward(request, response);
    }


	}


