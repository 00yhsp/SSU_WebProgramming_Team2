<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
   href = "./resources/css/bootstrap.min.css"/>
<title>Login</title>
</head>
<body>
    <jsp:include page="menu.jsp"/>
   <div class="container position-absolute top-50 start-50 translate-middle
    w-75 h-50 p-5" align="center">
      <div class="col-md-4 col-md-offset-4">
         <h3 class="form-signin-heading">Please sign in</h3>
         <%
            String error = request.getParameter("error");
            if(error != null){
               out.println("<div class='alert alert-danger'>");
               out.println("아이디와 비밀번호를 확인해주세요");
               out.println("</div>");
            }
         %>
         <form class = "form-signin" action="loginAction.jsp" method="post">
            <div class="form-group mt-2">
               <label for="inputUserName" class = "sr-only">User Name</label>
               <input type = "text" class = "form-control" placeholder="아이디" name = 'userID' required autofocus>
            </div>
            <div class="form-group mt-2">
               <label for="inputPassword" class = "sr-only">Password</label>
               <input type = "password" class = "form-control" placeholder="비밀번호" name = 'userPassword' required>
            </div>
            <button class="btn btn btn-lg btn-success btn-block mt-3" type = "submit">로그인</button>
         </form>
      </div>
   </div>
   
    
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="color_mode.jsp"/>    

</body>
</body>
</html>