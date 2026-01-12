package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.Question;
import com.model.TestResult;
import com.util.HibernateUtil;

@WebServlet("/SubmitTestServlet")
public class SubmitTestServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession hs = request.getSession();
        String username = (String) hs.getAttribute("loggedUser");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Session hibSession = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = hibSession.beginTransaction();

        // fetch correct answers
        List<Question> list = hibSession
                .createQuery("from Question", Question.class)
                .list();

        Map<Integer, String> correct = new HashMap<>();
        for (Question q : list) {
            correct.put(q.getQno(), q.getCorrectAnswer());
        }

        // user answers
        String q1 = request.getParameter("q1");
        String q2 = request.getParameter("q2");
        String q3 = request.getParameter("q3");
        String q4 = request.getParameter("q4");
        String q5 = request.getParameter("q5");

        int score = 0;
        if (q1.equals(correct.get(1))) score += 10;
        if (q2.equals(correct.get(2))) score += 10;
        if (q3.equals(correct.get(3))) score += 10;
        if (q4.equals(correct.get(4))) score += 10;
        if (q5.equals(correct.get(5))) score += 10;

        int percentage = score * 100 / 50;

        String discount;
        if (percentage == 100) discount = "50%";
        else if (percentage >= 60) discount = "30%";
        else if (percentage >= 40) discount = "10%";
        else discount = "0%";

        // manual ID (NULL SAFE)
        Integer maxId = (Integer) hibSession
                .createQuery("select max(id) from TestResult")
                .uniqueResult();
        int id = (maxId == null) ? 1 : maxId + 1;

        TestResult tr = new TestResult();
        tr.setId(id);
        tr.setUsername(username);
        tr.setQ1(q1);
        tr.setQ2(q2);
        tr.setQ3(q3);
        tr.setQ4(q4);
        tr.setQ5(q5);
        tr.setScore(score);
        tr.setPercentage(percentage);
        tr.setDiscount(discount);

        hibSession.save(tr);
        tx.commit();
        hibSession.close();

        request.setAttribute("percentage", percentage);
        request.setAttribute("discount", discount);
        request.setAttribute("score", score);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }


    }

