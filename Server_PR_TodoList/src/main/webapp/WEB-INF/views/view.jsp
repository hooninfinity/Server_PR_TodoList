<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25-003" rel="stylesheet" />
<style>
	table {
		font-size: 20px;
	}

	div.view_btn {
		width: 80%;
		margin: 10px auto;
		text-align: right;
	}
	
	div.view_btn button {
		margin: 5px;
		padding: 8px;
		outline: none;
		border: none;
		color: white;
		font-size: 20px;
		border-radius: 10px;
	}
	
	div.view_btn button:nth-child(1) {
		background-color: blue;
	}
	
	div.view_btn button:nth-child(2) {
		background-color: green;
	}
	
	div.view_btn button:nth-child(3) {
		background-color: red;
	}
	
	div.view_btn button:hover {
		box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.3);
	}
</style>
<script>
document
.addEventListener("DOMContentLoaded",function(ev) {
	
	document
	.querySelector("div.view_btn")
	.addEventListener("click",function(ev){
		
		// 클릭된 tag의 클래스이름 가져오기
		let className = ev.target.className;
		if (className == "btn_home") {
			
			document.location.href = "${rootPath}/"
			
		} else if (className == "btn_update") {
			
			document.location.href = "${rootPath}/todo/update?td_seq=" + ${TD.td_seq}
			
		} else if (className == "btn_delete") {
			
			if (confirm("작성내용을 삭제합니다!!!")) {
				
				// document.location.href = url 와
				// document.location.replace( url )
				
				// href 는 새로운 페이지를 열고 URL에서 res(response)한 정보를 보여준다.
				// 새로운 페이지에서 뒤로가기를 하면 현재 페이지로 되돌아 올 수 있다.
				
				// replace() 는 현재 페이지에서 URL에서 res(response)한 정보를 보여준다.
				// 새로운 페이지에서 뒤로 가기를 했을때 현재 페이지를 볼 수 없다.
				document.location.replace( "${rootPath}/todo/delete?td_seq="+${TD.td_seq} )
			}
		}
	})
	
})
</script>

</head>
<body>
<%@ include file="/WEB-INF/views/include_nav.jsp"%>
	<table>
		<tr>
			<th>작성일자</th>
			<td>${TD.td_date}</td>
			<th>작성시각</th>
			<td>${TD.td_time}</td>
		</tr>
		<tr>
			<th>장소</th>
			<td>${TD.td_place}</td>
			<th>할일</th>
			<td>${TD.td_todo}</td>
		</tr>
	</table>

	<div class="view_btn">
		<button class="btn_home">처음으로</button>
		<button class="btn_update">수정하기</button>
		<button class="btn_delete">삭제하기</button>
	</div>
</body>
</html>