package com.bogdanjmk.enotes.user;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class Note {
    private String title;
    private String content;
    private Date date;
    private Long userId;
}
