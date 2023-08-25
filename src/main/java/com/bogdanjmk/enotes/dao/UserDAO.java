package com.bogdanjmk.enotes.dao;

import com.bogdanjmk.enotes.user.UserDetails;
import lombok.RequiredArgsConstructor;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
