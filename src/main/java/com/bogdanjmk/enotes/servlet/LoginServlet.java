package com.bogdanjmk.enotes.servlet;

import com.bogdanjmk.enotes.dao.UserDAO;
import com.bogdanjmk.enotes.db.DBConnection;
import com.bogdanjmk.enotes.user.UserDetails;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO(DBConnection.getConnection());
        UserDetails user = dao.getUserByEmail(email);
        HttpSession session;

        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            session = request.getSession();
            session.setAttribute("userDetails", user);

            response.sendRedirect("home.jsp");
        } else {
            session = request.getSession();
            session.setAttribute("failed-message", "Email or password invalid!");

            response.sendRedirect("login.jsp");
        }
    }
}
