<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
    <title>상품 삭제</title>
    <script type="text/javascript">
        function deleteConfirm(id){
            if(confirm("해당 상품을 삭제합니다!!") == true)
                location.href = "./deleteProduct.jsp?id=" + id;
            else
                return;
        }
    </script>
</head>
<body>
    <jsp:include page="menu.jsp" />
    <div class="container text-center my-5">
        <h1 class="display-5">상품 편집</h1>
    </div>
    <div class="album py-5 bg-body-tertiary">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <%
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    String sql = "SELECT * FROM product";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while(rs.next()){
                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="./resources/images/<%=rs.getString("p_fileName")%>" class="card-img-top" alt="<%=rs.getString("p_name") %>" style="height: 225px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title"><%=rs.getString("p_name") %></h5>
                            <p class="card-text"><%=rs.getString("p_description") %></p>
                            <p class="card-text"><%=rs.getString("p_UnitPrice") %>원</p>
                            <%
                            	System.out.println(session.getAttribute("userID"));
                            	System.out.println(rs.getString("p_password"));
                            	if (session.getAttribute("userID").equals(rs.getString("p_password")))
                            	{
                            %>
                            <a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger">삭제 &raquo;</a>
                            <%
                            	}
                            %>
                        </div>
                    </div>
                </div>
                <%
                    }
                    if(rs != null) rs.close();
                    if(pstmt != null) pstmt.close();
                    if(conn!= null) conn.close();
                %>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
    <script src="./resources/js/bootstrap.bundle.min.js"></script>
	<jsp:include page="color_mode.jsp"/>    
</body>
</html>