<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>  
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	try{
		String url = "jdbc:mysql://localhost:3306/WebMarketDB?useUnicode=true&characterEncoding=UTF-8";
		String user = "root";
		String password = "1234";
	
		Class.forName("com.mysql.jdbc.Driver");
	
		conn = DriverManager.getConnection(url, user, password);
	}catch(SQLException ex){
		out.println("데이터베이스 연결에 실패 했습니다.<br>");
		out.println("SQLException: "+ex.getMessage());
	}
	
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	
	int max = 0;
	
	try {	

		Statement stmt = conn.createStatement();
		
		String sql = "SELECT MAX(NUM) FROM board";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			max=rs.getInt(1);
		}
		
		sql = "INSERT INTO board(USERNAME,PASSWORD,TITLE,MEMO,REF) VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, max+1);
		
		pstmt.execute();
		pstmt.close();
		stmt.close();
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp"; 
   </script>