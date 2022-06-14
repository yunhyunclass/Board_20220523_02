package com.its.board.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Board1DTO {
    private Long id;
    private Long boardWriter;
    private String boardTitle;
    private String boardContents;
}
