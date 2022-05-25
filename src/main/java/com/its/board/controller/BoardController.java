package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    // 글쓰기 화면 요청
//    @GetMapping("/board/save") // RequestMapping 미적용
    @GetMapping("/save") // RequestMapping 적용
    public String saveForm() {
        return "boardPages/save"; //=> views/board/save.jsp
    }

    // 글쓰기 처리
//    @PostMapping("/board/save") // RequestMapping 미적용
    @PostMapping("/save") // RequestMapping 적용
    public String save(@ModelAttribute BoardDTO boardDTO) {
        boolean result = boardService.save(boardDTO);
        if (result) {
//            return "redirect:/board/findAll"; // => /board/findAll 주소 요청
            // 글쓰기 성공 후 페이징 목록이 보이게
            return "redirect:/board/paging";
        } else {
            return "boardPages/save-fail";
        }
    }

    // 목록 출력
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "boardPages/list";
    }

    // 상세조회
    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
        return "boardPages/detail";
    }

    // 비밀번호 체크 페이지
    @GetMapping("/passwordCheck")
    public String passwordCheck(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardPages/passwordCheck";
    }

    // 삭제 처리
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/findAll";
    }

    // 수정 화면 요청
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardUpdate", boardDTO);
        return "boardPages/update";
    }

    // 수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO) {
        boardService.update(boardDTO);
        return "redirect:/board/detail?id="+boardDTO.getId(); // 수정처리 후 해당 글의 상세페이지 요청
    }

    // 글작성화면(파일)
    @GetMapping("/saveFile")
    public String saveFileForm() {
        return "boardPages/saveFile";
    }

    // 파일첨부 글작성 처리
    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.saveFile(boardDTO);
        return "redirect:/board/findAll";
    }

    // 페이징 처리
    @GetMapping("/paging")
//    /board/paging?page=1
//    required=false로 하면 /board/paging 요청도 가능
//    별도의 페이지 값을 요청하지 않으면 첫페이지(pgae=1)를 보여주자.
    public String paging(@RequestParam(value="page", required=false, defaultValue="1") int page,
                         Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "boardPages/pagingList";
    }







}












