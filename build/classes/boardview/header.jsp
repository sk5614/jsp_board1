<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%
    UserDTO user = (UserDTO) session.getAttribute("user");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">My Board</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <% if (user != null) { %>
                <li class="nav-item">
                    <span class="nav-link">로그인된 사용자: <strong><%= user.getUsername() %></strong></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">로그아웃</a>
                </li>
            <% } else { %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">로그인</a>
                </li>
            <% } %>
        </ul>
    </div>
</nav>
