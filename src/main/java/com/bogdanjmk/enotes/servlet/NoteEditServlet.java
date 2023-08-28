package com.bogdanjmk.enotes.servlet;

import com.bogdanjmk.enotes.dao.NoteDAO;
import com.bogdanjmk.enotes.db.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {

            Long noteId = Long.parseLong(request.getParameter("noteId"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            NoteDAO noteDAO = new NoteDAO(DBConnection.getConnection());
            boolean f = noteDAO.editNote(noteId, title, content);

            if (f) {
                System.out.println("Note-ul a fost updated!");
                HttpSession session = request.getSession();
                session.setAttribute("updatedMessage", "The note has been updated successfully!");

                response.sendRedirect("showNotes.jsp");
            } else {
                System.out.println("Note-ul nu a putut fi updated!");
                HttpSession session = request.getSession();
                session.setAttribute("errorUpdateMessage", "The note could not be updated!");

                response.sendRedirect("showNotes.jsp");
            }
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }
}
