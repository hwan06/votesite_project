<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBconnect" %>
<%

	Connection conn = DBconnect.getConnection();
	String sql = "select v_name, v_jumin, 2021 - to_number(substr(v_jumin, 1, 2) + 1900) -1 as age, m_no, substr(v_time, 1, 2) || ':' || substr(v_time, 3,2) as v_time, v_confirm"
			+ " from tbl_vote_202005" 
			+ " where v_area = '제1투표장'"; 
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery(); 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/style.css">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<section class="section">
	<h2>투표검수조회</h2>
		<table class="table" style="text-align: center; width: 1000px">
			<tr>
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
			
			<tr>
			<%while(rs.next()) { %>
			<%
				String year = rs.getString("v_jumin"); 
				String year2 = year.substring(0);
				String total = "19" + year2.substring(0,2) + "년" + year2.substring(2, 4) + "월" + year2.substring(4, 6) + "일생";
				
				String gender1 = year.substring(6,7);  
				String gender2 = "";
				
				if(gender1.equals("1")) {
					gender2 = "남";
				}else {
					gender2 = "여";
				}
				
				String yes = rs.getString("v_confirm");
				String yes2 = "";
				
				if(yes.equals("Y")) {
					yes2 = "확인";
				}else {
					yes2 = "미확인";
				}
				%>
				<td><%=rs.getString("v_name") %></td>
				<td><%=total %></td>
				<td><%="만 " +rs.getString("age") + "세"%></td>
				<td><%=gender2 %></td>
				<td><%=rs.getString("m_no") %></td>
				<td><%=rs.getString("v_time") %></td>
				<td><%=yes2 %></td>
			</tr>
		<%} %>
		</table>
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>