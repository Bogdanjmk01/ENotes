package com.bogdanjmk.enotes.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            session.removeAttribute("userDetails");

            HttpSession session2 = request.getSession();
            session2.setAttribute("logoutMessage", "You have been logged out successfully!");

            response.sendRedirect("login.jsp");
        } catch (Exception e) {
           throw new RuntimeException(e.getMessage());
        }
    }
}
