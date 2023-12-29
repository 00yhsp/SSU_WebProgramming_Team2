
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<script language = "javascript">  // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
 </head>
 <body> 
 
  <div class="container w-75 mt-5">
  <form name="writeform" method=post action="write_ok.jsp">
  <div class="row mb-3">
    <label for="title" class="col-sm-2 col-form-label">제목</label>
    <div class="col-sm-10">
    <input id="title" name="title" class="form-control">
    </div>
  </div>
  <div class="row mb-3">
    <label for="name" class="col-sm-2 col-form-label">ID</label>
    <div class="col-sm-10">
      <input id="name" class="form-control" name="name" maxlength="50" value="<%= session.getAttribute("userID") %>" readonly>
    </div>
  </div>
    <div class="row mb-3">
    <label for="name" class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10">
      <input id="password" type="password" name="password" maxlength="50" class="form-control">
    </div>
  </div>
      <div class="row mb-3">
    <label for="memo" class="col-sm-2 col-form-label">내용</label>
    <div class="col-sm-10">
      <textarea id="memo" name="memo" cols="50" rows="13" class="form-control"></textarea>
    </div>
  </div>
     <input class="btn btn-primary" type="button" value="등록" OnClick="javascript:writeCheck();">
    <input class="btn btn-primary" type="button" value="취소" OnClick="javascript:history.back(-1)">
</form>
 
 
</div>
 <script src="./resources/js/bootstrap.bundle.min.js"></script>
      <jsp:include page="./color_mode.jsp"/>
</body>
 </html>