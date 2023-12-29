<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<script language = "javascript">  // 자바 스크립트 시작

function modifyCheck()
  {
   var form = document.modifyform;
   
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
  }  </script>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <link rel = "stylesheet"
	href = "${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
 <body>
  	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">수정</h1>
		</div>
	</div>
 <%
	request.setCharacterEncoding("euc-kr");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/WebMarketDB?useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	
	String name = "";
	String password = "";
	String title = "";
	String memo = "";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT USERNAME, PASSWORD, TITLE, MEMO FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		
		if(rs.next()){
			
			name = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			memo = rs.getString(4);
		}
		
		rs.close();
		stmt.close();
		conn.close();	}catch(SQLException e) {
		out.println( e.toString() );
	}
	%>
 
 
<table>

   <form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx%>">

   	<div class="container" align = "center">
   		<table align="center">
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input type=text name=title size=50  maxlength=50 value="<%=title%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="10" bgcolor="#FFFFFF"><td colspan="4"></td></tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="10" bgcolor="#FFFFFF"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><%=name%><input type=hidden name=name size=50  maxlength=50 value="<%=name%>"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="10" bgcolor="#FFFFFF"><td colspan="4"></td></tr>
           <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
      <tr height="10" bgcolor="#FFFFFF"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input type=password name="password" id="pass" size=50  maxlength=50 ></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="10" bgcolor="#FFFFFF"><td colspan="4"></td></tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="10" bgcolor="#FFFFFF"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name=memo cols=50 rows=13><%=memo%></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="10" bgcolor="#FFFFFF"><td colspan="4"></td></tr>
     <tr height="10" bgcolor="#FFFFFF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="button" value="수정" OnClick="javascript:modifyCheck();">
      <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr> 
    </table>
    </div>
    </form>

 </table>
</body> 
 </html>