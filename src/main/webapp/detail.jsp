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
	<meta charset="UTF-8">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>게시글 상세</title>
</head>
<body>
<h1>게시글 상세</h1>
	<div class="container mt-3">
			<h2><%= board.getbTitle() %></h2>
			
			<p>작성일: <%= board.getbDate() %></p>
			<p><%= board.getbContent() %></p>
			<a href="index.jsp">목록으로</a>
	</div>
</body>
</html>
