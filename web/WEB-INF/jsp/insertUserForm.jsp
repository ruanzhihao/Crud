<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>添加用户</h3>
<form action="saveUser">
<table>
<tr><td>用户名：</td><td><input name="userName"></td></tr>
<tr><td>用户密码：</td><td><input name="userPassword" type="password"></td></tr>
<tr><td>用户邮箱：</td><td><input name="email"></td></tr>
<tr><td>用户类型：</td><td><input name="roleName"></td></tr>
</table>
<input type="submit">
</form>
</body>
</html>