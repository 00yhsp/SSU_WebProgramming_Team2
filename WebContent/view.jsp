<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/WebMarketDB?useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT USERNAME, TITLE, MEMO, TIME, HIT FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		 if(rs.next()){
				String name = rs.getString(1);
				String title = rs.getString(2);
				String memo = rs.getString(3);
				String time = rs.getString(4);
				int hit = rs.getInt(5);
				hit++;
		
%>
<!DOCTYPE>
<html>
<link rel = "stylesheet"
	href = "${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
 <head>
 <title>게시판</title>
 </head>
 <body>
<table>
 	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">내용</h1>
		</div>
	</div>
	<div class="container" align = "center">
   		<table align="center">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=idx%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	 <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">조회수</td>
      <td width="319"><%=hit%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	 <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">이름</td>
      <td width="319"><%=name%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="319"><%=time%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
      <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제목</td>
      <td width="319"><%=title%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
                <tr>
      <td width="0"></td>
                   <td width="399" colspan="2" height="200"><%=memo %>
                </tr>
                <% 
 	sql = "UPDATE board SET HIT=" + hit + " where NUM=" +idx;
 	stmt.executeUpdate(sql);
 	rs.close();
 	stmt.close();
 	conn.close();
	 	} 
	}catch(SQLException e) {
}

%>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399"><input type=button value="글쓰기"  OnClick="window.location='write.jsp'">
	<%	
	String userID = null;
	if (session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");
	}
	if(userID !=null && userID.equals("admin")){
	%>
	<input type=button value="답글" OnClick="window.location='reply.jsp?idx=<%=idx%>'">
	<% 
	}
	%>
	<input type=button value="목록" OnClick="window.location='list.jsp'">
	<input type=button value="수정" OnClick="window.location='modify.jsp?idx=<%=idx%>'">
	<input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>'">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
    </div>
 </table>
</body>
 </html>