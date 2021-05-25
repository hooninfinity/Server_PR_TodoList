<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

h1.main {
	color: white;
	text-align: center;
	background-color: navy;
	
	padding: 2rem;
}

nav#main {
	background-color: blue;
}

nav#main ul {
	margin: 0px;
	background-color: blue;
}

nav#main li {
	display: inline-block;
	list-style: none;
	margin: 0px;
	padding: 10px;
	color: white;
}

nav#main li:hover {
	background-color: gray;
	color: black;
	cursor: pointer;
}

nav#main a {
	display: inline-block; /* box style로 변경 */
	color: inherit; /* 글자색은 a tag를 감싼 tag에서 상속받기 */
	text-decoration: none; /* text에 언더라인 제거 */
}
</style>


<h1 class="main">TO DO List</h1>

<nav id="main">
	
</nav>
