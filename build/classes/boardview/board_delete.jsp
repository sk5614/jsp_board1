<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>

<% 
	int id = Integer.parseInt(request.getParameter("bId"));
	BoardDTO board = new BoardDTO();
	board.setbId(id);
	BoardDAO boardDAO = new BoardDAO(MyBatisConfig.getSqlSessionFactory());
	boardDAO.deleteBoard(board);
	response.sendRedirect("board_list.jsp");
%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
</head>
<body>

</body>
</html>