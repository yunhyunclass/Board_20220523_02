package com.its.board.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    private Long id;
    private String boardWriter;
    private String boardPassword;
    private String boardTitle;
    private String boardContents;
    private Timestamp boardCreatedDate;
    private int boardHits;
}
