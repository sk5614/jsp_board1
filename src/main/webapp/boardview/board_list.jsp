<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>

<%
    int size = 10; // 페이지당 표시할 게시글 수
    int pag = 1; // 현재 페이지 기본값
    String pageParam = request.getParameter("page");
    if (pageParam != null && !pageParam.isEmpty()) {
        pag = Integer.parseInt(pageParam); // 요청한 페이지 번호
    }else{pag=1;
    }
    
    
    // BoardDAO를 사용하여 게시글 목록 조회
    BoardDAO boardDAO = new BoardDAO(MyBatisConfig.getSqlSessionFactory());
    List<BoardDTO> boardList = boardDAO.boardList(pag, size);
    
    // 전체 게시글 수 조회
    int totalBoards = boardDAO.countBoard();
    int totalPages = (int) Math.ceil((double) totalBoards / size);

    // 페이지네이션을 위한 시작 페이지와 끝 페이지 계산
    int startPage = Math.max(1, pag - 4);
    int endPage = Math.min(startPage + 5, totalPages);
    int nowPage = pag;
    List<Integer> pageNumbers = new ArrayList<>();
    for (int i = startPage; i <= endPage; i++) {
        pageNumbers.add(i);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
                        <td><a href="board_info.jsp?bId=<%= board.getbId() %>"><%= board.getbTitle() %></a></td>
                        <td style="font-size: 0.8em;"><%= board.getbDate() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${startPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="board_list.jsp?page=${startPage - 1}&size=${size}" aria-label="Previous">
                            &laquo; Previous
                        </a>
                    </li>
                </c:if>
                <c:forEach var="pageNum" items="${pageNumbers}">
                    <li class="page-item">
                        <c:choose>
                            <c:when test="${pageNum == nowPage}">
                                <a class="page-link active" href="board_list.jsp?page=${pageNum}&size=${size}">
                                    <strong>${pageNum}</strong>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a class="page-link" href="board_list.jsp?page=${pageNum}&size=${size}">
                                    ${pageNum}
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:forEach>
                <c:if test="${endPage < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="board_list.jsp?page=${endPage + 1}&size=${size}" aria-label="Next">
                            Next &raquo;
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</body>
</html>
