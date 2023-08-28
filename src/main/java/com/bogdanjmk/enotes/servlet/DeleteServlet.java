package com.bogdanjmk.enotes.servlet;

import com.bogdanjmk.enotes.dao.NoteDAO;
import com.bogdanjmk.enotes.db.DBConnection;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long noteId = Long.parseLong(request.getParameter("note_id"));
        NoteDAO dao = new NoteDAO(DBConnection.getConnection());

        boolean deleteNote = dao.deleteNote(noteId);
        HttpSession session = request.getSession();

        if (deleteNote) {
            session.setAttribute("deleteNoteMessageSuccess", "Note has been deleted successfully!");
        } else {
            session.setAttribute("deleteNoteMessageFail", "Note could not be deleted!");
        }

        response.sendRedirect("showNotes.jsp");
    }

}
