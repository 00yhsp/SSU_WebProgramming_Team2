<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <title>상품 목록</title>
</head>
<body>
    <jsp:include page="menu.jsp" />
    <div class="container text-center my-5">
        <h1 class="display-5 fw-bold">상품 목록</h1>
    </div>
    <div class="album py-5 bg-body-tertiary">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <%
                    String category = request.getParameter("category");
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    String sql;

                    if (category != null && !category.isEmpty()) {
                        sql = "SELECT * FROM product WHERE p_category = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, category);
                    } else {
                        sql = "SELECT * FROM product";
                        pstmt = conn.prepareStatement(sql);
                    }

                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="./resources/images/<%=rs.getString("p_fileName") %>" class="card-img-top" alt="<%=rs.getString("p_name") %>" style="height: 225px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title"><%=rs.getString("p_name") %></h5>
                            <p class="card-text"><%=rs.getString("p_description") %></p>
                            <p class="card-text"><%=rs.getString("p_UnitPrice") %>원</p>
                            <a href="./product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-primary rounded-pill px-3">상세정보 &raquo;</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                    if(rs!=null) rs.close();
                    if(pstmt != null) pstmt.close();
                    if(conn!=null) conn.close();
                %>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
    <script src="./resources/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="color_mode.jsp"/>
</body>
</html>