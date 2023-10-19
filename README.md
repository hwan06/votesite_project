# 투표사이트

## 홈화면
![image](https://github.com/hwan06/votesite_project/assets/114748934/cb408574-9726-4763-8615-3b42e2fdfdf9)

## 후보조회 화면
![image](https://github.com/hwan06/votesite_project/assets/114748934/ab94eb1f-291f-4717-84ee-b06a780fbc54)   
### 문제에 제시된 형식으로 데이터를 검색하는 SQL문 작성
```java
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
```
### 지시자를 이용해 주민번호의 데이터 형식을 자바를 이용하여 설정하고 while문을 이용해 테이블에 순서대로 출력
```java
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
```

## 투표하기 화면
![image](https://github.com/hwan06/votesite_project/assets/114748934/9016381d-9f51-46c7-9000-a43866655fc3)   
### 빈칸 유효성 검사 자바스크립트 코드
```js
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
```
### 모든 유효성 검사를 통과하면 실행되는 vote_p.jsp의 SQL코드
```java
Connection conn = DBconnect.getConnection();
	String sql = "insert into tbl_vote_202005 values(?, ?, ?, ?, ?, ?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, request.getParameter("jumin"));
	ps.setString(2, request.getParameter("name"));
	ps.setString(3, request.getParameter("votenum"));
	ps.setString(4, request.getParameter("votetime"));
	ps.setString(5, request.getParameter("voteplace"));
	ps.setString(6, request.getParameter("v_confirm"));
```
## 투표검수조회 화면
![image](https://github.com/hwan06/votesite_project/assets/114748934/2648faa0-d463-4594-b822-42e92c75f374)   
### 만나이와 시간을 형식에 맞게 검색하는 SQL코드
```java
<%

	Connection conn = DBconnect.getConnection();
	String sql = "select v_name, v_jumin, 2021 - to_number(substr(v_jumin, 1, 2) + 1900) -1 as age, m_no, substr(v_time, 1, 2) || ':' || substr(v_time, 3,2) as v_time, v_confirm"
			+ " from tbl_vote_202005" 
			+ " where v_area = '제1투표장'"; 
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery(); 
	
%>
```
### 나머지 형식들은 자바를 이용하여 맞춰주고 while문을 이용하여 가져온 데이터를 테이블에 출력
```java
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
```

## 후보자등수 화면
![image](https://github.com/hwan06/votesite_project/assets/114748934/61fb89f9-51b3-4689-ab6b-89527c89df15)   
### 투표 테이블에서 유권자 확인이 'Y'인 데이터의 투표수를 count하는 SQL코드
```java
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
```
