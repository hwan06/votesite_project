<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBconnect.DBconnect" %>
<%

	Connection conn = DBconnect.getConnection();
	String sql = "select max(custno) from member_tbl_02 ";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	rs.next();
	int num = rs.getInt(1) + 1;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/style.css">
<script type="text/javascript">
	
	function check() {
		if(!document.data.custname.value) {
			alert("성명을 입력하세요.");
			data.custname.focus();
			return false;
		}
		else if(!document.data.phone.value) {
			alert("전화번호를 입력하세요.");
			data.phone.focus();
			return false;
		}
		else if(!document.data.address.value) {
			alert("주소를 입력하세요.");
			data.address.focus();
			return false;
		}
		else if(!document.data.join_date.value) {
			alert("가입일을 입력하세요.");
			data.join_date.focus();
			return false;
		}
		else if(!document.data.grade.value) {
			alert("등급을 입력하세요.");
			data.grade.focus();
			return false;
		}else if(!document.data.city.value) {
			alert("도시를 입력하세요.");
			data.city.focus();
			return false;
		}else {
			alert("회원가입에 성공하였습니다.");
			return true;
		}
		
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<section class = "section">
	<form name = "data" action = "join_p.jsp" method = "post" onsubmit="return check()">
		<h2>홈쇼핑 회원 등록</h2>
			<table class = "table">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input name="custno" type="text" value="<%=num%>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input name="custname" type="text"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input name="phone" type="text"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input name="address" type="text"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input name="join_date" type="text"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td><input name="grade" type="text"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input name="city" type="text"></td>
				</tr>
				<tr class="center">
					<td colspan="2"><input type="submit" value="등록">
					<input type= "submit" value="조회" onclick="location.href='memberlist.jsp'"></td>
					
				</tr>
				
			</table>
		</form>
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>