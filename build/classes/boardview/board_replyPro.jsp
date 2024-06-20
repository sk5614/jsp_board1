<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="board.BoardDTO, board.BoardDAO, board.MyBatisConfig" %>

<%		request.setCharacterEncoding("UTF-8");
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String bId = request.getParameter("bId");
        String title = request.getParameter("bTitle");
        String content = request.getParameter("bContent");
        String group = request.getParameter("bGroup");
        String order = request.getParameter("bOrder");
        String depth = request.getParameter("bDepth");

        if (bId != null && !bId.trim().isEmpty() && title != null && !title.trim().isEmpty()) {
            BoardDTO board = new BoardDTO();
            board.setbId(Integer.parseInt(bId));
            board.setbTitle(title);
            board.setbContent(content);
            board.setbGroup(Integer.parseInt(group));
            board.setbOrder(Integer.parseInt(order));
            board.setbDepth(Integer.parseInt(depth));

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
    <title>게시글 답글 처리</title>
</head>
<body>
</body>
</html>