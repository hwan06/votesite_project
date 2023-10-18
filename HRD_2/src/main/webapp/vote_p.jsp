<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBconnect" %>
<%
	
	Connection conn = DBconnect.getConnection();
	String sql = "insert into tbl_vote_202005 values(?, ?, ?, ?, ?, ?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, request.getParameter("jumin"));
	ps.setString(2, request.getParameter("name"));
	ps.setString(3, request.getParameter("votenum"));
	ps.setString(4, request.getParameter("votetime"));
	ps.setString(5, request.getParameter("voteplace"));
	ps.setString(6, request.getParameter("v_confirm"));
	ResultSet rs = ps.executeQuery();
	//String jumin = rs.getString("M_JUMIN").substring(0,6) + "-" + rs.getString("M_JUMIN").substring(6) ; 
	//char gender = jumin.charAt(8);
	//System.out.println(gender);	

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>