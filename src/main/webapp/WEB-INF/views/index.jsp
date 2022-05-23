<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const saveForm = () => {
            location.href = "/board/save";
        }
        const findAll = () => {
            location.href = "/board/findAll";
        }
    //    회원가입: /member-save => /member/save
    //    글쓰기 : /board-save   => /board/save
    </script>
</head>
<body>
    <h2>index.jsp</h2>
    <button class="btn btn-outline-success" onclick="saveForm()">글작성</button>
    <button class="btn btn-outline-success" onclick="findAll()">글목록</button>
</body>
</html>
