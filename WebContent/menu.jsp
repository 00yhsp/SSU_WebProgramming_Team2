<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String userID = null;
    if (session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="./welcome.jsp">당근나라</a>
        </div>
        <div>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link text-light" href="./products.jsp">상품 목록</a></li>
                <li class="nav-item"><a class="nav-link" href="./products.jsp?category=Electronics">전자제품</a></li>
                <li class="nav-item"><a class="nav-link" href="./products.jsp?category=Clothes">의류</a></li>
                <li class="nav-item"><a class="nav-link" href="./products.jsp?category=Furnitures">가구</a></li>
            </ul>
        </div>
        <div>
            <ul class="navbar-nav mr-auto">
                <% if (userID == null) { %>
                    <!-- 로그인 전 메뉴 -->
                    <li class="nav-item"><a class="nav-link" href="<c:url value="login.jsp"/>">로그인</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value="join.jsp"/>">회원 가입</a></li>
                <% } else { %>
                    <!-- 로그인 후 메뉴 -->
                    <li style="padding-top: 7px; color: white">[<%= session.getAttribute("userID") %>님]</li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value="logoutAction.jsp"/>">로그아웃</a></li>
                    <li class="nav-item"><a class="nav-link" href="./addProduct.jsp">상품 등록</a></li>
                    <li class="nav-item"><a class="nav-link" href="./editProduct.jsp">상품 삭제</a></li>
                    <li class="nav-item"><a class="nav-link" href="./list.jsp">Q&A</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
