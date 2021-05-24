<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
document.addEventListener("DOMContentLoaded",function(){
	document.querySelector("button.btn_save")
	.addEventListener("click",function(ev){
		let dom = document;
		let td_todo = dom.querySelector("textarea");
		let td_place = dom.querySelector("input[name='td_place']");
		
		if (td_todo.value == "") {
			alert("할일을 입력하세요")
			td_todo.focus()
			return false;
		}
		
		dom.querySelector("form.v1").submit()
		
	})
})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include_nav.jsp"%>
	<form class="v1" method="POST">
		<div>
			<input name="td_date" type="date" value="${TD.td_date}">
			<input name="td_time" type="time" value="${TD.td_time}">
		</div>
		<div>
			<textarea name="td_todo" rows="10">${TD.td_todo}</textarea>
		</div>
		<div>
			<input name="td_place" type="text" value="${TD.td_place}">
		</div>
		<div>
			<label></label>
			<button class="btn_save" type="button">저장</button>
		</div>
	</form>
</body>
</html>