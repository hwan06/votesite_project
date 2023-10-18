<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/style.css">
<script type="text/javascript">
	function checkNull() {
		if(!document.data.jumin.value) {
			alert("주민번호가 입력되지 않았습니다!");
			data.jumin.focus();
			return false;
		}else if(!document.data.name.value) {
			alert("성명이 입력되지 않았습니다!");
			data.name.focus();
			return false;
		}else if(!document.data.votenum.value) {
			alert("후보번호가 선택되지 않았습니다!");
			data.votenum.focus();
			return false;
		}else if(!document.data.votetime.value){
			alert("투표 시간이 입력되지 않았습니다!");
			data.votetime.focus();
			return false;
		}else if(!document.data.voteplace.value) {
			alert("투표 장소가 입력되지 않았습니다!");
			data.voteplace.focus();
			return false;
		}else if(!document.data.v_confirm.value) {
			alert("유권자확인이 선택되지 않았습니다!");
			data.v_confirm.focus();
			return false;
		}else {
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
	
	<section class="section">
	<h2>투표하기</h2>
		<form name="data" method = "post" action="vote_p.jsp" onsubmit="return checkNull()">
			<table class="table">
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="jumin"> <p style="display: inline">예: 8906153154726</p></td>
				</tr>
				
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				
				<tr>
					<th>투표번호</th>
					<td>
					<select name = "votenum">
						<option value = "">선택</option>
						<option value = "1">[1]김후보</option>
						<option value = "2">[2]이후보</option>
						<option value = "3">[3]박후보</option>
						<option value = "4">[4]조후보</option>
						<option value = "5">[5]최후보</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<th>투표시간</th>
					<td><input type = "text" name="votetime"></td>
				</tr>
				
				<tr>
					<th>투표장소</th>
					<td><input type = "text" name="voteplace"></td>
				</tr>
				
				<tr>
					<th>유권자확인</th>
					<td>
						<input type = "radio" name="v_confirm" value="Y"> 확인
						<input type = "radio" name="v_confirm" value="N"> 미확인
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center">
					<input type="submit" value="투표하기">
					<input type="button" value="다시하기">
					</td>
				</tr>
				
			</table>
		
		</form>
	</section>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>