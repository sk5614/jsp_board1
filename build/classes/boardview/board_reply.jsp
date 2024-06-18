<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>

<%	
    String bId = request.getParameter("bId");
    BoardDAO boardDAO = new BoardDAO(MyBatisConfig.getSqlSessionFactory());
    BoardDTO board = boardDAO.boardInfo(Integer.parseInt(bId));
%>
<html>
<head>
    <title>답글</title>
</head>
<body>
<h1>답글</h1>
<form action="board_replyPro.jsp" method="post">
    <input type="hidden" name="bId" value="<%= board.getbId() %>"/>
    <input type="hidden" name="bGroup" value="<%= board.getbGroup() %>"/>
    <input type="hidden" name="bOrder" value="<%= board.getbOrder() %>"/>
    <input type="hidden" name="bDepth" value="<%= board.getbDepth() %>"/>
    <label>제목: <input type="text" name="bTitle" value="<%= board.getbTitle() %>"/></label><br/>
    <label>내용: <textarea name="bContent"><%= board.getbContent() %></textarea></label><br/>
    <input type="submit" value="답글"/>
</form>
</body>
</html>