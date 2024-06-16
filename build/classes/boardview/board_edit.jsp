<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>

<%	
    String bId = request.getParameter("bId");
    BoardDAO boardDAO = new BoardDAO(MyBatisConfig.getSqlSessionFactory());
    BoardDTO board = boardDAO.boardInfo(Integer.parseInt(bId));
%>
<html>
<head>
    <title>게시글 수정</title>
</head>
<body>
<h1>게시글 수정</h1>
<form action="board_editPro.jsp" method="post">
    <input type="hidden" name="bId" value="<%= board.getbId() %>"/>
    <label>제목: <input type="text" name="bTitle" value="<%= board.getbTitle() %>"/></label><br/>
    <label>내용: <textarea name="bContent"><%= board.getbContent() %></textarea></label><br/>
    <input type="submit" value="수정"/>
</form>
</body>
</html>