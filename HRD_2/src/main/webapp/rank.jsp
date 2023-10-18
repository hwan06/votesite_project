<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBconnect" %>
<%

	Connection conn = DBconnect.getConnection();
	String sql = "select tm.m_no, tm.m_name, count(tv.m_no) as total"
			  + " from tbl_member_202005 tm, tbl_vote_202005 tv"
			  + " where tm.m_no = tv.m_no and tv.v_confirm = 'Y'"
			  + " group by tm.m_no, tm.m_name"
			  + " order by total desc";
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
		<h2>후보자등수</h2>
			<table class="table">
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>총투표건수</th>
				</tr>
				
				<%while(rs.next()) { %>
				<tr>
					<td><%=rs.getString("m_no") %></td>
					<td><%=rs.getString("m_name") %></td> 
					<td><%=rs.getString("total") %></td>
					
				</tr>
				<%} %>
			
			
			</table>
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>