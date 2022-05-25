<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-24
  Time: 오전 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>detail.jsp</h2>
    글번호: ${board.id} <br>
    제목: ${board.boardTitle} <br>
    작성자: ${board.boardWriter} <br>
    비밀번호: ${board.boardPassword} <br>
    내용: ${board.boardContents} <br>
    작성일자: ${board.boardCreatedDate} <br>
    조회수: ${board.boardHits} <br>
    <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
         alt="" height="100" width="100">

    <button onclick="boardUpdate()">수정</button>
    <button onclick="boardDelete()">삭제</button>
    <button onclick="findAll()">목록</button>
    <button onclick="paging()">페이징목록</button>
</body>
<script>
    const paging = () => {
        location.href = "/board/paging?page=${page}"; // 직전에 있었던 페이지 값을 컨트롤러로 요청
    }
    const boardUpdate = () => {
        // 수정을 위한 화면(update.jsp)을 출력하고, 비밀번호를 입력받아서
        // 비밀번호 일치하면 수정처리, 일치하지 않으면 alert(회원 수정이랑 프로세스 같음.)
        location.href = "/board/update?id=${board.id}";
    }
    const boardDelete = () => {
        // 비밀번호 체크를 위한 화면(passwordCheck.jsp)을 출력하고, 비밀번호 입력받아서
        // 비밀번호 일치하면 삭제처리 후 목록 출력, 일치하지 않으면 alert 띄우고 상세화면으로
        location.href = "/board/passwordCheck?id=${board.id}";
    }
    const findAll = () => {
        location.href = "/board/findAll";
    }
</script>
</html>
