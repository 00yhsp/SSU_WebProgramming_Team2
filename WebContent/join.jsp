<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
   href = "./resources/css/bootstrap.min.css"/>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>

    <div class="container position-absolute top-50 start-50 translate-middle
    w-75 h-50 p-5" align="center">
      <div class="col-md-4 col-md-offset-4">
         <h3 class="form-signin-heading">Please sign up</h3>
         <form method = "post" action="joinAction.jsp">
            <div class="form-group mt-3">
               <input type ="text" class="form-control" placeholder="아이디" name ="userID" required autofocus>
            </div>
            <div class ="form-group mt-3">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" required>
                </div>
                <div class ="form-group mt-3">
                        <input type ="name" class="form-control" placeholder="이름" name ="userName" required>
                </div>
                 <div class ="form-group mt-3" style="text-align: center;">
                       <div class ="btn-group" cata-toggle="buttons">
                          <label class ="btn btn-primary active mx-2"> <!-- 버튼 활성화 -->
                             <input type ="radio" name ="userGender" autocomplete ="off" value = "남자" checked>남자</label>
                          <label class ="btn btn-primary"> <!-- 버튼 활성화 NO -->
                             <input type ="radio" name ="userGender" autocomplete ="off" value = "여자" checked>여자</label>
                       </div>               
                 </div>
                 <div class ="form-group mt-3">
                        <input type ="email" class="form-control" placeholder="이메일" name ="userEmail" required>
                 </div>
             <input type="submit" class="btn btn btn-lg btn-success btn-block mt-3" value="회원가입">
            </form>
      </div>
   </div>
   <script src="./resources/js/bootstrap.bundle.min.js"></script>
   <jsp:include page="color_mode.jsp"/>    
</html>