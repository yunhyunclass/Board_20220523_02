package com.its.board.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Comment1DTO {
    private Long id;
    private Long commentWriter;
    private String commentContents;
}
