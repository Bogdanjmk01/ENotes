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
            e.printStackTrace();
        }

        return isUserInserted;
    }

    public UserDetails loginUser(UserDetails userDetails) {
        UserDetails user = null;

        try {
            String query = """
                        SELECT * FROM users WHERE email = ? AND password = ?;
                    """;

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, userDetails.getEmail());
            ps.setString(2, userDetails.getPassword());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new UserDetails();
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
