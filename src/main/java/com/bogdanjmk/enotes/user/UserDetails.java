package com.bogdanjmk.enotes.user;

import lombok.*;

import java.beans.Transient;

@Data
@NoArgsConstructor
public class UserDetails {
    private String name;
    private String email;
    private String password;

    @Transient
    public String getFirstName(String name) {
        int idx = name.lastIndexOf(' ');
        if (idx == -1) {
            throw new IllegalArgumentException("Only a single name " + name);
        }

        return name.substring(0, idx);
    }
}
