<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-24
  Time: 오전 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

    <style>
        #comment-write {
            max-width: 600px;
        }
    </style>
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

<div class="container mt-5">
    <div id="comment-write" class="input-group mb-3">
        <div class="form-floating">
            <input type="text" id="commentWriter" class="form-control" placeholder="작성자">
            <label for="commentWriter">작성자</label>
        </div>
        <div class="form-floating">
            <input type="text" id="commentContents" class="form-control" placeholder="내용">
            <label for="commentContents">내용</label>
        </div>
        <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
    </div>

    <div id="comment-list">
        <table class="table">
            <tr>
                <th>댓글번호</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성시간</th>
            </tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.commentWriter}</td>
                    <td>${comment.commentContents}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>

</body>
<script>
    $("#comment-write-btn").click(function (){
       // alert("나 눌렀어?");
    // 댓글 작성자, 내용을 가져오고
    // ajax 문법을 활용하여 /comment/save 주소로 post 방식으로 작성자, 내용, 글번호 이렇게
    // 세개의 값을 보내는 코드를 작성하십시오.
        const cWriter = document.getElementById("commentWriter").value;
        const cContents = $("#commentContents").val();
        const boardId = '${board.id}';
        $.ajax({
           type: "post",
           url: "/comment/save",
           data: {
               "commentWriter": cWriter,
               "commentContents": cContents,
               "boardId": boardId
           },
           dataType: "json",
           success: function (result) {
               console.log(result);
               let output = "<table class='table'>";
               output += "<tr><th>댓글번호</th>";
               output += "<th>작성자</th>";
               output += "<th>내용</th>";
               output += "<th>작성시간</th></tr>";
               for(let i in result){
                   output += "<tr>";
                   output += "<td>"+result[i].id+"</td>";
                   output += "<td>"+result[i].commentWriter+"</td>";
                   output += "<td>"+result[i].commentContents+"</td>";
                   output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                   output += "</tr>";
               }
               output += "</table>";
               document.getElementById('comment-list').innerHTML = output;
               document.getElementById('commentWriter').value='';
               document.getElementById('commentContents').value='';
           },
           error: function () {
               alert("어디가 틀렸을까");
           }
        });
    });

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
