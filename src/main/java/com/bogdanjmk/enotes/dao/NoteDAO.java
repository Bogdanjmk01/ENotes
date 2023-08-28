package com.bogdanjmk.enotes.dao;

import com.bogdanjmk.enotes.user.Note;
import com.bogdanjmk.enotes.user.UserDetails;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
