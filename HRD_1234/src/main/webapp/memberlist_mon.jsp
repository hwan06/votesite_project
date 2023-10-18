<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBconnect.DBconnect" %>
<%

	Connection conn = DBconnect.getConnection();
	String sql = "select mb.custno as custno, mb.custname as custname, " +
        	"case when mb.grade = 'A' then 'VIP' " +
        	"when mb.grade = 'B' then '일반' " +
        	"else '직원' end as grade, " +
        	"sum(price) as sum " + 
        	"from member_tbl_02 mb, money_tbl_02 mo " +
        	"where mb.custno = mo.custno " +
        	"and mo.price is not null " +
        	"group by mb.custno, mb.custname, grade " +
        	"order by sum desc";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/style.css">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<section class="section">
	<h2>회원매출조회</h2>
		<table class="table">
		 
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<% while(rs.next()) { %>
				<tr class = "center">
					<td><%=rs.getString("custno") %></td>
					<td><%=rs.getString("custname") %></td>
					<td><%=rs.getString("grade") %></td>
					<td><%=rs.getString("sum") %></td>
				</tr>
			<%} %>
		</table>
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>nul
	</footer>
	
</body>
</html>