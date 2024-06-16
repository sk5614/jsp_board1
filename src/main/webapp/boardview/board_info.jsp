<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>
<%
    int id = Integer.parseInt(request.getParameter("bId"));
    BoardDAO boardDAO = new BoardDAO(MyBatisConfig.getSqlSessionFactory());
    BoardDTO board = boardDAO.boardInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>게시글 상세</title>
</head>
<body>
<h1>게시글 상세</h1>
	<div class="container mt-3">
			<h2><%= board.getbTitle() %></h2>
			
			<p>작성일: <%= board.getbDate() %></p>
			<p><%= board.getbContent() %></p>
			<a href="board_list.jsp">목록으로</a>
			<a href="board_delete.jsp?bId=<%= board.getbId() %>">삭제</a>
			<a href="board_edit.jsp?bId=<%= board.getbId() %>">수정</a>
	</div>
</body>
</html>
