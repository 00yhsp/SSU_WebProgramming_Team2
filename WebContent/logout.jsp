<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	session.invalidate();
	response.sendRedirect("addProduct.jsp");
	%>