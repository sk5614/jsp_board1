<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String bTitle = request.getParameter("bTitle");
        String bContent = request.getParameter("bContent");
        //String writer = request.getParameter("writer");

        BoardDTO board = new BoardDTO();
        board.setbTitle(bTitle);
        board.setbContent(bContent);
        //board.setbWriter(writer);

        BoardDAO boardDAO = new BoardDAO(MyBatisConfig.getSqlSessionFactory());
        boardDAO.writeBoard(board);

        response.sendRedirect("index.jsp");
    }
%>
<html>
<head>
    <title>글쓰기</title>
</head>
<body>
<h1>글쓰기</h1>
<form action="write.jsp" method="post">
    <label>제목: <input type="text" name="bTitle"/></label><br/>
    <label>내용: <textarea name="bContent"></textarea></label><br/>
 <!--    <label>작성자: <input type="text" name="writer"/></label><br/> -->
    <input type="submit" value="등록"/>
</form>
</body>
</html>