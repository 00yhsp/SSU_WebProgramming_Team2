<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page errorPage = "exceptionNoProductId.jsp" %>
<jsp:useBean id="productDAO" class = "dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
    <title>상품 정보</title>
</head>
<body>
	<script>
    function chatWinOpen(id) {
        window.open("ChatWindow.jsp?chatId=" + id, "", "width=320,height=400");
    }
    </script>
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron">
        <div class="container mt-5">
            <h1 class="display-3 text-center">상품 정보</h1>
        </div>
    </div>
    <%@ include file="dbconn.jsp" %>
    <%
        String id = request.getParameter("id");
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from product where p_id=" + "'" + id + "'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        rs.next();
    %>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
			    <img src="./resources/images/<%=rs.getString("p_fileName") %>" class="img-responsive" style="max-width:800px; max-height:600px; margin-bottom:20px;">
			</div>

            <div class="col-md-6 mt-5 py-3">
                <h3><%=rs.getString("p_name") %></h3>
                <h4 class="mt-4"><b>상품 상세정보 :</b></h4>
                <p><%=rs.getString("p_description") %></p>
                <h4 class="mt-4"><%=rs.getString("p_unitPrice") %>원</h4>
                <form class="mt-4" name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id") %>" method="post">
                    <a href="#" class="btn btn-info mx-1" onclick="chatWinOpen('<%= session.getAttribute("userID") %>')">채팅 &raquo;</a>
                    <a href="#" class="btn btn-primary mx-1" onclick="showPhoneNumber()">연락처 보기 &raquo;</a>
                    <a href="./products.jsp" class="btn btn-secondary mx-1">상품 목록 &raquo;</a>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
    <script type="text/javascript">
        function addToCart(){
            if(confirm("상품을 장바구니에 추가하시겠습니까?")){
                document.addForm.submit();
            } else {
                document.addForm.reset();
            }
        }
        
        function showPhoneNumber() {
            var phoneNumber = '<%= rs.getString("p_phone") %>';
            alert('연락처: ' + phoneNumber);
        }
    </script>
    <script src="./resources/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="color_mode.jsp"/>
</body>
</html>