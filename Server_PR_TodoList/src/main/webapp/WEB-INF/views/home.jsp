<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25-001" rel="stylesheet" />
<style>
	* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	}

	table#tdlist tr:hover {
		cursor: pointer;
		background-color: #ddd;
	}
	
	table {
		border-collapse: collapse;
		width: 80%;
		margin: 10px auto;
	}
	
	td, th {
		border:1px solid green;
		padding: 5px;
		text-align: center;
	}
	
	form {
		width: 80%;
		margin: 10px auto;
		text-align: right;
	}
	button.btn_insert {
		outline: 0;
		border: 0;
		width: 100px;
		color: white;
		background-color: red;
		padding: 5px;
		margin: 10px auto;
	}
	
</style>

<script>
document.addEventListener("DOMContentLoaded",function(){
	document.querySelector("table#tdlist").addEventListener("click",function(ev){
		// 가장 안쪽 tag TD의 이름을 가져와라
		let tag_name = ev.target.tagName;
		// 클릭된 게 TD이면, TD를 감싸고 있는 부모태그중에서 TR을 찾아라
		if (tag_name == "TD") {
			let td_seq = ev.target.closest("TR").dataset.seq
			document.location.href="${rootPath}/todo/view?td_seq="+td_seq
		}
	}) // table의 click
	
	
	document
	.querySelector("button.btn_insert")
	.addEventListener("click",function(ev){
		
		document.location.href = "${rootPath}/todo/insert"
		
	})
})
</script>

</head>
<body>
<%@ include file="/WEB-INF/views/include_nav.jsp"%>
	<form>
			<label></label>
			<button class="btn_insert" type="button">추가</button>
	</form>
	
	<table id="tdlist">
		<tr>
			<th>No.</th>
			<th>할일</th>
			<th>작성일자</th>
			<th>작성시각</th>
			<th>장소</th>
		</tr>
		<c:forEach items="${TDLIST}" var="TD" varStatus="index">
			<tr data-seq="${TD.td_seq}">
				<td>${index.count}</td>
				<td>${TD.td_todo}</td>
				<td>${TD.td_date}</td>
				<td>${TD.td_time}</td>
				<td>${TD.td_place}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>