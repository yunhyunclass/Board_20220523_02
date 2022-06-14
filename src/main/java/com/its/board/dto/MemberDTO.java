package com.its.board.dto;

import lombok.Data;

@Data
public class MemberDTO {
    private Long id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private int memberAge;
    private String memberPhone;
    private BoardDTO boardDTO;
    private CommentDTO commentDTO;
}
