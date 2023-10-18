<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBconnect.DBconnect" %>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = DBconnect.getConnection();
	String sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno = ?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, request.getParameter("custname"));
	ps.setString(2, request.getParameter("phone"));
	ps.setString(3, request.getParameter("address"));
	ps.setString(4, request.getParameter("join_date"));
	ps.setString(5, request.getParameter("grade"));
	ps.setString(6, request.getParameter("city"));
	ps.setInt(7, Integer.parseInt(request.getParameter("custno")));
	ps.executeUpdate();

%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="memberlist.jsp"></jsp:forward>
</body>
</html>