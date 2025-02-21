<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOLF</title>
</head>
<body>
	<table id="signupTbl">
		<form action="member.update" method="post" enctype="multipart/form-data">
			<tr>
				<td align="center" colspan="2">
					<input value="${sessionScope.loginMember.gs_id }" name="gs_id" placeholder="ID" autocomplete="off" maxlength="10" class="i1" readonly="readonly">
				</td>
				<!--  <div id="msg"></div>  -->
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input name="gs_pw" placeholder="Password" autocomplete="off" autofocus="autofocus" maxlength="10" type="password" class="i1">
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input name="gs_pwChk"placeholder="Password Check" autocomplete="off" maxlength="10" type="password" class="i1">
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input name="gs_name" placeholder="User Name" autocomplete="off" maxlength="4" class="i1">
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input id="signup_gs_addr1" name="gs_addr1" placeholder="Zip Code" readonly="readonly" class="i1"><br>
					<input id="signup_gs_addr2" name="gs_addr2" placeholder="Address" readonly="readonly" class="i1"><br>
					<input name="gs_addr3" placeholder="Detail Address" autocomplete="off" class="i1">
				</td>
			</tr>
			<tr>
				<td align="left" width="200px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Profile
				</td>
				<td align="left">
					<div class="fileBox">
						<input class="uploadName" value="${sessionScope.loginMember.gs_photo }" placeholder="Profile Pic">
						<label for="gs_photo">파일찾기</label>					
						<input id="gs_photo" name="gs_photo" type="file">
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button>Update</button>
		</form>
					<button id="resignBtn">Resignation</button>
				</td>
			</tr>
	</table>
</body>
</html>