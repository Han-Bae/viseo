<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	@author		전다빈
	@since		2022.05.23
	@version	v.1.0
	
				작업이력	]
						2022.05.23	-	담당자 : 전다빈
										내	용 : 헤더, 캘린더, 메뉴, 카테고리 체크 박스 틀 잡기
										
						2022.05.26	-	담당자 : 전다빈
										내	용 : 기온, 날씨 데이터 적용
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>viseo</title>
<link rel="stylesheet" type="text/css" href="/viseo/resource/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/viseo/resource/css/base.css">
<link rel="stylesheet" type="text/css" href="/viseo/resource/css/main.css">
<link rel="stylesheet" type="text/css" href="/viseo/resource/css/menu.css">
<script type="text/javascript" src="/viseo/resource/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/viseo/resource/js/main.js"></script>
<script src="https://kit.fontawesome.com/e0f46f82c6.js"></script>
<style>
</style>
<script type="text/javascript">
</script>
</head>
<body class="main-tagbody">	
	<!-- 메뉴 -->
	<div class="menu">
		<i class="fa-solid fa-bars menu-btn"></i>
		<div class="menu-bar bg-primary">
			<ul>
				<li><i class="fa-solid fa-user-astronaut"></i>Profile</li>
				<li><i class="fa-solid fa-gear"></i>Settings</li>
				<li><i class="fa-solid fa-arrow-right-from-bracket"></i>Log out</li>
			</ul>
		</div>
	</div>
	
	
	<!-- 메인 페이지 -->
	<div class="main-page">
	
		<!-- 헤더 -->
		<div class="main-header">
			<img src="/viseo/resource/icon/logo.png" width="150px">
			<div class="mainDate">
				<div class="main-year"><span class="mainYear">2022</span>/</div>
				<h1 style="margin: 0px; font-weight: bold; font-size: 50px;" class="mainMonth">08</h1>
			</div>
			<div class="main-weather">
				<div class="main-weather-loc">
					<i class="fa-solid fa-location-dot"></i>
					<span>서울시 용산구</span>
				</div>
<c:if test="${not empty wDATA}">
				<div class="main-weather-tmp">
					<i class="fa-solid fa-temperature-half"></i>
					<span>${wDATA.TMP}</span>
				</div>
	<%-- 하늘상태(SKY)코드 :맑음(1), 구름많음(3), 흐림(4) --%>
	<%-- 강수형태(PTY)코드 :없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4) --%>
	<c:if test="${wDATA.PTY eq 0}">
		<c:if test="${wDATA.SKY eq 1}">
				<i class="fa-solid fa-sun"></i>
		</c:if>
		<c:if test="${wDATA.SKY eq 3}">
				<i class="fa-solid fa-clouds"></i>
		</c:if>
		<c:if test="${wDATA.SKY eq 4}">
				<i class="fa-solid fa-smog"></i>
		</c:if>
	</c:if>
	<c:if test="${wDATA.PTY eq 1}">
				<i class="fa-solid fa-cloud-rain"></i>
	</c:if>
	<c:if test="${wDATA.PTY eq 2}">
				<i class="fa-solid fa-cloud-sleet"></i>
	</c:if>
	<c:if test="${wDATA.PTY eq 3}">
				<i class="fa-solid fa-cloud-snow"></i>
	</c:if>
	<c:if test="${wDATA.PTY eq 4}">
				<i class="fa-solid fa-cloud-showers"></i>
	</c:if>
</c:if>
			</div>
		</div>
		
		<div class="main-body">
			<!-- 캘린더 -->
			<table id="calender" class="table">
				<thead class="main-days">
					<tr>
						<th style="color:#ff0039;">Sun</th>
						<th>Mon</th>
						<th>Tue</th>
						<th>Wed</th>
						<th>Thu</th>
						<th>Fri</th>
						<th>Sat</th>
					</tr>
				</thead>
				<tbody class="main-dates">
					<!-- 1주 -->
					<tr class="date-row">
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
					</tr>
					<!-- 2주 -->
					<tr class="date-row">
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
					</tr>
					<!-- 3주 -->
					<tr class="date-row">
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
					</tr>
					<!-- 4주 -->
					<tr class="date-row">
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
					</tr>
					<!-- 5주 -->
					<tr class="date-row">
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
						<td class="border-primary"></td>
					</tr>
				</tbody>
			</table>
			
			<div class="category">
				<label><input type="checkbox">회사</label>
				<label><input type="checkbox">가족</label>
				<label><input type="checkbox">친구</label>
			</div>
		</div>
		
	</div>
	
	<div class="card border-primary self-modal" style="max-width: 20rem;">
	  <div class="card-header self-modal-header">
		<button type="button" class="btn-close self-modal-close-btn"></button>
	  </div>
	  <div class="card-body self-modal-body">
	    <p class="card-text">달력 페이지 변경</p>
		<input type="month" id="dateInput">
		<button type="button" class="btn btn-primary btn-sm changePageBtn">변경</button>
	  </div>
	</div>
	
	<form action="" name="mainForm" class="hidden">
		<input type="hidden">
		<input type="hidden">
	</form>
	
</body>
</html>