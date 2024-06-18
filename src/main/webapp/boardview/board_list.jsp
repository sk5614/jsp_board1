<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>



<%
		int pag = 1;
		int limit = 10;
		if (request.getParameter("page") != null) {
		    pag = Integer.parseInt(request.getParameter("page"));
		}
		int offset = (pag - 1) * limit;
		
		BoardDAO boardDAO = new BoardDAO(MyBatisConfig.getSqlSessionFactory());
		List<BoardDTO> boardList = boardDAO.boardList(offset, limit);
		int totalBoards = boardDAO.countBoard();
		int totalPages = (int) Math.ceil((double) totalBoards / limit);
		
        // 페이지네이션 범위 계산
        int paginationSize = 5; // 페이지네이션에 표시할 페이지 수
        int currentBlock = (int) Math.ceil((double) pag / paginationSize);
        int startPage = (currentBlock - 1) * paginationSize + 1;
        int endPage = Math.min(startPage + paginationSize - 1, totalPages);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
        <style>
        .re-tag {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container mt-3">
        <h1>게시판</h1>

        <button type="button" class="btn btn-outline-primary" onclick="goToWrite()">글쓰기</button>
        <script>
            function goToWrite() {
                window.location.href = "board_write.jsp";
            }
        </script>

        <table class="table table-hover">
            <thead>
                <tr>
                    <th style="width:5%;">ID</th>
                    <th style="width:70%;">Title</th>
                    <th style="width:25%;">Date</th>
                </tr>
            </thead>
            <tbody>
                <% for (BoardDTO board : boardList) { %>
                    <tr>
                        <td><%= board.getbId() %></td>
                        <td>
                            <% if (board.getbDepth() > 0) { %>
                               <span class="re-tag">RE:</span>  
                            <% } %>
                        <a href="board_info.jsp?bId=<%= board.getbId() %>"><%= board.getbTitle() %></a></td>
                        <td style="font-size: 0.8em;"><%= board.getbDate() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>

       <nav aria-label="Page navigation">
            <ul class="pagination">
                <% if (startPage > 1) { %>
                    <li class="page-item">
                        <a class="page-link" href="board_list.jsp?page=<%= startPage - 1 %>">&laquo; Previous</a>
                    </li>
                <% } %>
                <% for (int i = startPage; i <= endPage; i++) { %>
                    <li class="page-item <%= (i == pag) ? "active" : "" %>">
                        <a class="page-link" href="board_list.jsp?page=<%= i %>"><%= i %></a>
                    </li>
                <% } %>
                <% if (endPage < totalPages) { %>
                    <li class="page-item">
                        <a class="page-link" href="board_list.jsp?page=<%= endPage + 1 %>">Next &raquo;</a>
                    </li>
                <% } %>
            </ul>
        </nav>
    </div>
</body>
</html>
