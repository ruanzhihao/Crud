<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr>
<td>ID</td>
<td>用户名</td>
<td>邮箱</td>
<td>角色</td>
<th colspan="4">操作</th>
</tr>
<c:forEach var="users" items="${Users}">
<tr>
<td>${users.id}</td>
<td>${users.userName}</td>
<td>${users.email}</td>
<td>${users.roleName }</td>
<td><a href="addUser">添加</a></td>
<td><a href="updateUserForm">编辑</a></td>
<td><a href="<c:url value="deleteUser/${users.id}">
</c:url>">删除</a></td>
<td><a href="<c:url value="selectUser/${users.id}"></c:url>
">查看</a></td>
<td></td>
</tr>
</c:forEach>
</table>
</body>
</html>