package com.bogdanjmk.enotes.dao;

import com.bogdanjmk.enotes.user.Note;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
public class NoteDAO {

    private final Connection connection;

    public boolean addNotes(String title, String content, Long userId) {
        boolean f = false;

        try {
            String query = """
                    INSERT INTO notes(title, content, user_id) VALUES (?, ?, ?);
                    """;

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setLong(3, userId);

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return f;
    }

    public List<Note> getNote(Long id) {
        List<Note> notes = new ArrayList<>();
        Note note;

        try {
            String query = """
                    SELECT * FROM notes WHERE user_id = ? ORDER BY id DESC;
                    """;
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setLong(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                note = new Note();
                note.setId(rs.getLong(1));
                note.setTitle(rs.getString(2));
                note.setContent(rs.getString(3));
                note.setDate(rs.getTimestamp(4));
                note.setUserId(rs.getLong(5));

                notes.add(note);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return notes;
    }

    public Note getNoteById(Long id) {
        Note note = null;

        try {
            String query = """
                    SELECT * FROM notes WHERE id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setLong(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                note = new Note();
                note.setId(rs.getLong("id"));
                note.setTitle(rs.getString("title"));
                note.setContent(rs.getString("content"));
                note.setDate(rs.getTimestamp("date"));
                note.setUserId(rs.getLong("user_id"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return note;
    }

    public boolean deleteNote(Long id) {
        boolean f = false;

        try {
            String query = """
                    DELETE FROM notes WHERE id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setLong(1, id);
            int x = ps.executeUpdate();

            if (x == 1) {
                f = true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return f;
    }

    public boolean editNote(Long id, String title, String content) {
        boolean f = false;

        try {
            String query = """
                    UPDATE notes SET title = ?, content = ? WHERE id = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setLong(3, id);
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return f;
    }
}
