<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBconnect" %>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = DBconnect.getConnection();
	String sql="select mem.M_NO, mem.M_NAME, "
			+ " case "
		    + " when mem.P_CODE ='P1' then 'A정당' when mem.P_CODE ='P2' then 'B정당' "
		    + " when mem.P_CODE ='P3' then 'C정당' when mem.P_CODE ='P4' then 'D정당' "
		    + " when mem.P_CODE ='P5' then 'E정당' end as P_CODE, "
			+ " case " 
			+ " when P_SCHOOL = '1' then '고졸' when P_SCHOOL = '2' then '학사' "
			+ " when P_SCHOOL = '3' then '석사' else '박사' end as P_SCHOOL, "
		    + " M_JUMIN, M_CITY, "
		    + " P_TEL1 || '-' || P_TEL2 || '-' || P_TEL3 AS P_PHONE"
		    + " from TBL_MEMBER_202005 mem, tbl_party_202005 par"
		    + " where mem.p_code = par.p_code";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<section class="section">
	<h2>후보조회</h2>
		<table class = "table">
			<tr class="center">
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>	
			</tr>
			<%while(rs.next()) { %>
			<% 
				String jumin = rs.getString("M_JUMIN").substring(0,6) + "-" + rs.getString("M_JUMIN").substring(6);
				
			%>
			<tr class="center">
				<td><%=rs.getString("m_no") %></td>
				<td><%=rs.getString("m_name") %></td>
				<td><%=rs.getString("P_CODE") %></td>
				<td><%=rs.getString("P_SCHOOL") %></td>
				<td><%=jumin %></td>
				<td><%=rs.getString("m_city") %></td>
				<td><%=rs.getString("p_phone") %>
			</tr>
			<%} %>
		</table>
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>