package com.its.board.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Member1DTO {
    private Long id;
    private String memberId;
    private String memberPassword;
    private String memberName;

    private Board1DTO board1DTO;
    private Comment1DTO comment1DTO;
}
