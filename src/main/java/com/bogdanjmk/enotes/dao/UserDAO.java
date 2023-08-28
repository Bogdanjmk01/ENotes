package com.bogdanjmk.enotes.dao;

import com.bogdanjmk.enotes.user.UserDetails;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@RequiredArgsConstructor
public class UserDAO {

    private final Connection connection;

    public boolean addUser(UserDetails user) {
        boolean isUserInserted = false;

        try {
            String query = """
                    INSERT INTO users(name, email, password) VALUES(?, ?, ?);
                    """;

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            int i = preparedStatement.executeUpdate();

            if (i == 1) {
                isUserInserted = true;
            }

        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }

        return isUserInserted;
    }

    public UserDetails getUserByEmail(String email) {
        UserDetails user = null;

        try {
            String query = """
                    SELECT * FROM users WHERE email = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                user = new UserDetails();
                user.setId(rs.getLong("id"));
                user.setEmail(rs.getString("email"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        return user;
    }
}
