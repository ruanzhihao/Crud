<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="http://localhost:8080/SSMMapper/selectAllUser"><h3>管理页面</h3></a>
${message}<br>
用户姓名：${User.userName}<br>
邮箱：${User.email}<br>
角色：${User.roleName}<br>

</body>
</html>