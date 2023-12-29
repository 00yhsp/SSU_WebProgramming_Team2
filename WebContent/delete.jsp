<%@ page contentType="text/html; charset=utf-8"%>
<script language = "javascript">  // 자바 스크립트 시작

function deleteCheck()
  {
   var form = document.deleteform;
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
 		form.submit();
  }
 </script>
 <%
 	int idx = Integer.parseInt(request.getParameter("idx"));
 %>
<!DOCTYPE>
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
<table>
<form name=deleteform method=post action="delete_ok.jsp?idx=<%=idx%>">
	<div class="container" align = "center">
	삭제
    </div>
   <div class="container" align = "center">
   		<table align="center">
     <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input name="password" type="password" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="삭제" OnClick="javascript:deleteCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>

  </form>
 </table>
</body> 
 </html>