<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopDto 출력</title>
</head>
<body>
	<h2>SHOP DTO 출력</h2>
	<img src="https://drive.google.com/thumbnail?id=1ls0cMWKLnTXFq7Dj7DbeyDQZGOrN-c5K" alt="이미지"  height="200px" width="aspect-ratio:1">

	<table>
		<colgroup>
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
			<col width="*">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>가수</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>상품내용</th>
			<th>이미지1</th>
			<th>이미지2</th>
			<th>이미지3</th>
			<th>수량</th>
			<th>정가</th>
			<th>할인가</th>
			<th>추가일</th>
		</tr>
		<c:forEach items="${list}" var="sprod">
			<tr>
				<td>${sprod.shop_no}</td>
				<td>${sprod.artistDto.artist_no}</td>
				<td>${sprod.shop_category}</td>
				<td>${sprod.shop_title}</td>
				<td>${sprod.shop_content}</td>
				<td>
				<img src="https://drive.google.com/thumbnail?id=${sprod.shop_image1}" alt="이미지"  height="200px" width="aspect-ratio:1">
				</td>
				<td>
				<img src="https://drive.google.com/thumbnail?id=${sprod.shop_image2}" alt="이미지"  height="200px" width="aspect-ratio:1">
				</td>
				<td>
				<img src="https://drive.google.com/thumbnail?id=${sprod.shop_image3}" alt="이미지"  height="200px" width="aspect-ratio:1">
				</td>
				<td>${sprod.shop_quantity}</td>
				<td>${sprod.shop_price}</td>
				<td>${sprod.shop_discount_price}</td>
				<td>${sprod.shop_date}</td>
			</tr>
		</c:forEach>

	</table>

	<div>
		<a href="/">메인페이지 이동</a>
	</div>



</body>
</html>