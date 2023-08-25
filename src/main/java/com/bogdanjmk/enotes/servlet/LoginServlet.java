package com.bogdanjmk.enotes.servlet;

import com.bogdanjmk.enotes.dao.UserDAO;
import com.bogdanjmk.enotes.db.DBConnection;
import com.bogdanjmk.enotes.user.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDetails userDetails = new UserDetails();
        userDetails.setEmail(email);
        userDetails.setPassword(password);

        UserDAO dao = new UserDAO(DBConnection.getConnection());
        boolean loginUser = dao.loginUser(userDetails);
        HttpSession session;

        if (loginUser) {
            response.sendRedirect("home.jsp");
        } else {
            session = request.getSession();
            session.setAttribute("failed-message", "Email or password invalid!");
            response.sendRedirect("login.jsp");
        }
    }
}
