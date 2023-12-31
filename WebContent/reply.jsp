<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>  
<script language = "javascript">  // 자바 스크립트 시작

function replyCheck()
  {
   var form = document.replyform;
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>
 
 <%
 	int idx = Integer.parseInt(request.getParameter("idx"));
 	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/WebMarketDB?useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	String title = "";
	
	try {
		
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		
		String sql = "SELECT TITLE FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

 		if(rs.next()){
			title = rs.getString(1);
 		}
			
	rs.close();
	stmt.close();
	conn.close();
 	
} catch(SQLException e) {

}
%>
<!DOCTYPE html>
<html>
<link rel = "stylesheet"
	href = "${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
 <head>
 <title>게시판</title>
 </head>
 <body>
  	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">글쓰기</h1>
		</div>
	</div>
<form name=replyform method=post action="reply_ok.jsp?idx=<%=idx%>">
	<div class="container" align = "center">
   		<table align="center">
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td>답변 완료<input type=hidden name="title" size="50" maxlength="100" value = "답변 완료"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	 <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><%=(String) session.getAttribute("userID") %><input type=hidden name="name" size="50" maxlength="50" value="<%=(String) session.getAttribute("userID") %>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	 <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input name="password" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
	 <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
	 <tr height="3" bgcolor="#FFFFFF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="등록"  OnClick="javascript:replyCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
 </table>
 </div>
</body> 
   
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="color_mode.jsp"/>   
 </html>