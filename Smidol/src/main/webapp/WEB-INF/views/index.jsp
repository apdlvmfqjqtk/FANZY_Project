<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인화면</title>
		<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
		<style>
			body {
				font-family: "Pretendard Variable", sans-serif;
			}
		</style>
	</head>
	<body>
		<h2>메인화면</h2>
		<a>로그인정보</a><br />
		<a>${session_id}</a><br />
		<a>${session_nickname}</a>
		<ul>
			<li><a href="/smain">상점 메인</a></li>
			<li><a href="/sprods">물건배열 (못들어감)</a></li>
			<li><a href="/sprodview">물건세부 (못들어감)</a></li>
			<li><a href="/sptwind">물건결제</a></li>
			<li><a href="/sptdone">결제완료</a></li>
			<li><a href="/test">출력테스트_shopdto</a></li>
			<li><a href="/login">로그인</a></li>
		</ul>
	</body>
</html>