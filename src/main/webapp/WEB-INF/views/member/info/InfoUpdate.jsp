<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	@author		한서라
	@since		2022.05.23
	@version	v.1.0
	
				작업이력	]
						2022.05.23	-	담당자 : 한서라
										내	용 : 회원정보수정 페이지 제작
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
	<link rel="stylesheet" type="text/css" href="/viseo/resource/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="/viseo/resource/css/base.css">
	<link rel="stylesheet" type="text/css" href="/viseo/resource/css/main.css">
	<link rel="stylesheet" type="text/css" href="/viseo/resource/css/menu.css">
	<script type="text/javascript" src="/viseo/resource/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/viseo/resource/js/main.js"></script>
	<script type="text/javascript" src="/viseo/resource/js/menu.js"></script>
	<script type="text/javascript" src="/viseo/resource/js/edit.js"></script>
	<script src="https://kit.fontawesome.com/e0f46f82c6.js"></script>
<style type="text/css">
/* 	#repwmsg {
		display: none;
	}  */ 
	
	#preview{
		width: 250px; 
	}
</style>

<script type="text/javascript">
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
		}
</script> 
</head>
<body>

   <div class="menu">
      <i class="fa-solid fa-bars menu-btn menu-btn--white"></i>
      <div class="menu-bar bg-primary">
         <ul>
			<li class="profileBtn"><i class="fa-solid fa-user-astronaut"></i>Profile</li>
			<li class="settingBtn"><i class="fa-solid fa-gear"></i>Settings</li>
			<li class="logoutBtn"><i class="fa-solid fa-arrow-right-from-bracket"></i>Log out</li>
         </ul>
      </div>
   </div>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/viseo/main.blp">VISEO</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="profile">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="/viseo/member/info/ProfileUpdate.blp">프로필 수정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/viseo/member/info/InfoUpdate.blp">회원정보 수정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/viseo/member/info/withdrawal.blp">회원탈퇴</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<br>

<div class="row input-center" style="width: 100%">
       <div style="width: 50%; float:none; margin:0 auto" >
	<h5 class="text-primary"><b>Edit member information</b></h5>
	<hr>
	
	<form action="/viseo/member/info/InfoUpdateProc.blp" method="get" name="frm" id="frm">
		<input type="hidden" id="tname" value="${DATA.name}">
		<input type="hidden" id="tmail" value="${DATA.mail}">
		<input type="hidden" id="ttel" value="${DATA.tel}">
		<input type="hidden" id="taddr" value="${DATA.addr}">
		<input type="hidden" id="tid" value="${DATA.id}">
		
	    <div class="form-group">
		      <label for="name" class="form-label mt-4 text-muted"><h6>Name</h66></label>
		      <input type="text" class="form-control col-8" name="name" value="${DATA.name}" readonly>
		 </div>	    
	    <div class="form-group">
		      <label for="id" class="form-label mt-4 text-muted"><h6>ID</h6></label>
		      <input type="text" class="form-control col-8" name="id" value="${DATA.id}" readonly >
		 </div>
		<div class="form-group">
		      <label for="Password1"class="form-label mt-4 text-muted"><h6>Password</h6></label> 
		      <input type="password" class="form-control col-8" id="Password1" name="Password1" placeholder="변경할 비밀번호">
		      <p id="pw-text1"></p>
		</div>
		<div class="form-group">
		      <input type="password" class="form-control col-8" id="Password2" name="Password2" placeholder="비밀번호 확인">
		 	  <p id="checkbox"></p>
		 </div>
	    
	    <div class="form-group">
		  <label class="form-label mt-4 text-muted"><h6>E-mail</h6></label>
		  <div class="form-floating mb-3">
			    <input type="email" class="form-control" id="mail" name="mail" value="${DATA.mail}" >
			    <label for="floatingInput">name@example.com</label>
			    <p id="email_check"></p>
 		 </div>
 		</div>
 		 
 		 <div class="form-group">
		  <label class="form-label mt-4t text-muted"><h6>Tel</h6></label>
		  <div class="form-floating mb-3">
			    <input type="tel" class="form-control" id="tel" name="tel" value="${DATA.tel}" >
			    <label for="floatingInput">010-0000-0000</label>
			    <p id="tel_check"></p>
 		 </div>
 		 </div>
<%-- 
	    <div class="form-group">
		      <label for="address" class="form-label mt-4 text-muted"><h6>Address</h6></label>
		      <input type="text" class="form-control col-8" id="address" name="address" value="${DATA.addr}">
	    </div>
	     --%>
		<!-- 주소 -->
		<div class="form-group">
				<label for="aname" class="form-label mt-4">주소</label>
				<input id="hiddenAreaName" type="hidden" value="${DATA.areaname}">
				<input id="hiddenAddrNo" name="addr" type="hidden" value="${DATA.addr}">
				
				<select class="form-select" id="aname">
				<option>지역 선택</option>
<c:forEach var="loc" items="${JDATA}">
						<option value="${loc}">${loc}</option>
</c:forEach>
					</select>
						<small class="form-text text-muted">area name</small>
					
					<select class="form-select" id="city" name="address"  style="display: none;">
						<option>도시 선택</option>						
					</select>
						<small id="citymsg" class="form-text text-muted" style="display: none;">city name</small>
				</div>
	    
	    <fieldset class="form-group">
               <label for="gen" class="form-label mt-4 text-muted"><h6>Gender</h6></label>
                <input type="text" class="form-control col-8" id="gender" name="gender" value="${DATA.gen eq 'M' ? '남자': '여자' }" readonly>
       </fieldset>
	    
	    
		<div class="form-group">
          	<label for="bir" class="form-label mt-4 text-muted"><h6>Birth</h6></label>
                <select class="form-select watchBirth" name="yy" id="year">
			    </select><small class="form-text text-muted">태어난 년도를 선택해 주세요.</small>
			    <select class="form-select watchBirth" name="mm" id="month">
			    </select><small class="form-text text-muted">태어난 월을 선택해 주세요.</small>
			    <select class="form-select watchBirth" name="dd" id="day">
			    </select><small class="form-text text-muted">태어난 일을 선택해 주세요.</small>
			    <input type="hidden" name="birth" id="birth" value="${DATA.birth}">    	
		</div>       

	    
	    <button type="submit" class="btn btn-primary" id="edit">EDIT</button>
	    <button type="reset" class="btn btn-primary">RESET</button>
	    <button type="button" class="btn btn-primary exit-btn">EXIT</button>
	</form>
	</div>
</div>
</body>
</html>