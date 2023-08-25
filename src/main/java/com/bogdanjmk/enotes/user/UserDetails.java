package com.bogdanjmk.enotes.user;

import lombok.*;

@Data
@NoArgsConstructor
public class UserDetails {
    private String name;
    private String email;
    private String password;
}
