package com.bogdanjmk.enotes.dao;

import com.bogdanjmk.enotes.user.Note;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            e.printStackTrace();
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
            e.printStackTrace();
        }

        return notes;
    }
}
