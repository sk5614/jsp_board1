<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>

<%		request.setCharacterEncoding("UTF-8");
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String bId = request.getParameter("bId");
        String title = request.getParameter("bTitle");
        String content = request.getParameter("bContent");

        if (bId != null && !bId.trim().isEmpty() && title != null && !title.trim().isEmpty() && content != null && !content.trim().isEmpty()) {
            BoardDTO board = new BoardDTO();
            board.setbId(Integer.parseInt(bId));
            board.setbTitle(title);
            board.setbContent(content);

            BoardDAO boardDAO = new BoardDAO(MyBatisConfig.getSqlSessionFactory());
            boardDAO.replyBoard(board);

            response.sendRedirect("board_list.jsp");
        } else {
            out.println("<p>모든 필드를 입력하세요.</p>");
        }
    }
%>
<html>
<head>
    <title>게시글 수정 처리</title>
</head>
<body>
    <p>수정 처리 중...</p>
</body>
</html>