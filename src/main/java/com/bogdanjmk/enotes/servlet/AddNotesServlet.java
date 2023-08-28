package com.bogdanjmk.enotes.servlet;

import com.bogdanjmk.enotes.dao.NoteDAO;
import com.bogdanjmk.enotes.db.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long userId = Long.parseLong(request.getParameter("userId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        NoteDAO dao = new NoteDAO(DBConnection.getConnection());
        boolean f = dao.addNotes(title, content, userId);

        if (f) {
            System.out.println("Merge insertul catre baze de date in tabela notes!");
            response.sendRedirect("showNotes.jsp");
        } else {
            System.out.println("Nu merge insertul!");
        }
    }
}
