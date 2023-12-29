<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE>
<html>
<head>
<link rel = "stylesheet"
	href = "${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
    <title>게시판</title>
</head>
<body>
    <%
    Connection conn = null;
    try {
        String url = "jdbc:mysql://localhost:3306/WebMarketDB?useUnicode=true&characterEncoding=UTF-8";
        String id = "root";
        String pass = "1234";

        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection(url, id, pass);
    } catch (SQLException ex) {
        out.println("데이터베이스 연결에 실패 했습니다.<br>");
        out.println("SQLException: " + ex.getMessage());
    }
    int total = 0;

    try {
        Statement stmt = conn.createStatement();

        String sqlCount = "SELECT COUNT(*) FROM board";
        ResultSet rs = stmt.executeQuery(sqlCount);

        if (rs.next()) {
            total = rs.getInt(1);
        }
        rs.close();

        String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT from board order by REF DESC, STEP ASC";
        rs = stmt.executeQuery(sqlList);
    %>
    <jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">QnA</h1>
		</div>
	</div>
    <div class="container">
        <div style="padding-top: 5px">
            <table class="table table-hover" style="text-align: center">
                <thead class="table-secondary">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    if (total == 0) {
                    %>
                    <tr>
                        <td colspan="5">등록된 글이 없습니다.</td>
                    </tr>
                    <%
                    } else {

                        while (rs.next()) {
                            int idx = rs.getInt(1);
                            String name = rs.getString(2);
                            String title = rs.getString(3);
                            String time = rs.getString(4);
                            int hit = rs.getInt(5);
                            int indent = rs.getInt(6);
                    %>
                    <tr>
                        <td><%=idx %></td>
                        <td align="left">
                            <%
                            for (int j = 0; j < indent; j++) {
                            %>
                            &nbsp;&nbsp;&nbsp;
                            <%
                            }
                            if (indent != 0) {
                            %>
                            <img src='${pageContext.request.contextPath}/resources/images/reply_icon.png' />
                            <%
                            }
                            %>
                            <a href="view.jsp?idx=<%=idx%>"><%=title %></a>
                        </td>
                        <td><%=name %></td>
                        <td><%=time %></td>
                        <td><%=hit %></td>
                    </tr>
                    <%
                        }
                    }
                    %>
                </tbody>
            </table>
            <%
			String userID = null;
			if (session.getAttribute("userID") != null){
    			userID = (String) session.getAttribute("userID");
			}
			if(userID==null){
			%>
            <a href="write.jsp" class="btn btn-primary pull-right disabled">글쓰기</a>
            <%
            }else{
            %>
            <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
            <%
            }
            %>
        </div>
    </div>
    <%
    rs.close();
    stmt.close();
    conn.close();
    } catch (SQLException e) {
        out.println(e.toString());
    }
    %>
</body>
<script src="./resources/js/bootstrap.bundle.min.js"></script>
<jsp:include page="color_mode.jsp"/> 
</html>
