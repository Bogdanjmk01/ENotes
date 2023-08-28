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
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO(DBConnection.getConnection());

        if (dao.doesUserAlreadyExists(email)) {
            HttpSession session = request.getSession();
            session.setAttribute("user-already-exists", "User already exists with this email!");
            response.sendRedirect("register.jsp");

            return;
        }

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        UserDetails userDetails = new UserDetails();
        userDetails.setName(name);
        userDetails.setEmail(email);
        userDetails.setPassword(hashedPassword);

        boolean isUserInserted = dao.addUser(userDetails);
        HttpSession session = request.getSession();

        if (isUserInserted) {
            session.setAttribute("reg-success", "User registered successfully!");
            response.sendRedirect("login.jsp");
        } else {
            session.setAttribute("failed-message", "Something went wrong on the server side!");
            response.sendRedirect("register.jsp");
        }
    }
}
