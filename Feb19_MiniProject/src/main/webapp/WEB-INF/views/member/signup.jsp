<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOLF</title>
</head>
<body>
<form action="member.signup" method="post" enctype="multipart/form-data">
		<table id="signupTbl">
			<tr>
				<td align="center" colspan="2">
					<input id="signup_gs_id" name="gs_id" placeholder="ID" autocomplete="off" autofocus="autofocus" maxlength="10" class="i1">
					<div id="msg"></div>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input name="gs_pw" placeholder="Password" autocomplete="off" maxlength="10" type="password" class="i1">
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
				<td align="right">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Profile
				</td>
				<td align="center">
					<div class="fileBox">
						<input class="uploadName" value="Profile Pic" placeholder="Profile Pic">
						<label for="gs_photo">파일찾기</label>					
						<input id="gs_photo" name="gs_photo" type="file">
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" class="roleTd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Role</td>
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="gs_role" type="radio" value="m">Manager
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="gs_role" type="radio" value="m" checked="checked">PRO
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button>Sign Up</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

