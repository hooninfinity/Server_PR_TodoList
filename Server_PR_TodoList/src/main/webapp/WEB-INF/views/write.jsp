<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	form.v1 {
		width: 80%;
		margin: 10px auto;
	}
	
	form.v1 fieldset {
		border: 1px solid blue;
		border-radius: 10px;
		padding: 5px;
	}
	
	/* label과 input 공통 속성을 한번에 지정하기 */
	form.v1 label,
	form.v1 input,
	form.v1 textarea {
		display: inline-block;
		padding: 5px;
		margin: 5px;
	}
	
	form.v1 label {
		width: 150px;
		text-align: right;
	}
	
	form.v1 input, form.v1 textarea {
		width: 300px;
		border: 1px solid green;
		border-radius: 5px;
	}
	
	div.view_btn {
		margin: 10px auto;
		text-align: right;
	}
	
	div.view_btn button {
		margin: 5px;
		padding: 8px;
		outline: none;
		border: none;
		color: white;
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
//script를 본문 어디에나 두기 위해 document.addEventListener("DOMContentLoaded" 써놓음. 이게 없으면 화면 맨 뒤로 가야함
document.addEventListener("DOMContentLoaded",function(){
	
	document.querySelector("button.btn_save")
	.addEventListener("click",function(ev){
		
		let dom = document;
		let td_place = dom.querySelector("input[name='td_place']");
		let td_todo = dom.querySelector("textarea");
		
		if (td_todo.value == "") {
			alert("할일은 반드시 입력해야 합니다")
			td_todo.focus();
			return false;
		}
		
		// 서버로 제출
		dom.querySelector("form.v1").submit();
	})
	
	document.querySelector("button.btn_home")
	.addEventListener("click",function(ev){
		// 클릭된 tag의 클래스이름 가져오기
		let className = ev.target.className;
		if (className == "btn_home") {
			document.location.href = "${rootPath}/"
		}
	})
	
})
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/include_nav.jsp" %>
	<form class="v1" method="POST">
		<fieldset>
			<legend>할일 수정</legend>
		<div>
			<label>작성일자</label>
			<input name="td_date" type="date" value="${TD.td_date}">
		</div>
		<div>
			<label>작성시각</label>
			<input name="td_time" type="time" value="${TD.td_time}">
		</div>
		<div>
			<label>장소</label>
			<input name="td_place" type="text" value="${TD.td_place}">
		</div>
		<div>
			<label>할일</label>
			<textarea name="td_todo" rows="20">${TD.td_todo}</textarea>
		</div>
		</fieldset>
	<div class="view_btn">
		<button class="btn_save" type="button">저장</button>
		<button type="reset">다시작성</button>
		<button class="btn_home" type="button">처음으로</button>
	</div>
	</form>
	
	
</body>
</html>