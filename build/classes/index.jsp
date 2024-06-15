<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>

<%
    BoardDAO boardDAO = new BoardDAO(MyBatisConfig.getSqlSessionFactory());
    List<BoardDTO> boardList = boardDAO.boardList();
%>
<!DOCTYPE html>
<html>
<head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <title>게시판</title>
</head>
<body>

<button type="button" class="btn btn-outline-primary" onclick="goToWrite()"> 글쓰기 </button>
    <script>
        function goToWrite() {
            window.location.href = "write.jsp";
        }
    </script>
    <h1>게시판</h1>
 <div class="container mt-3">

	<table class="table table-hover" style="width:50%">
		 <thead>
	    	<tr>
		        <td style="width:5%;">ID</td>
		        <td style="width:70%;">Title</td>
		        <td style="width:25%;">Date</td>
	        </tr>
	   	 </thead>
	    <%
	        for (BoardDTO board : boardList) {
	    %>
	     <tbody>
	     	<tr>
		        <td><%= board.getbId() %></td>
		        <td><a href="detail.jsp?bId=<%= board.getbId() %>"><%= board.getbTitle() %></a></td>
		         <td style="font-size: 0.8em;"><%= board.getbDate() %></td>
	   		</tr>
	   	</tbody>	
	    <%
	        }
	    %>
	</table>
</div>
</body>
</html>