<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<script>
function login(){
	var userId = document.getElementById("userInfo");
	var postId = document.getElementById("Id");
	postId.value = userId.value;
	document.getElementById("loginForm").submit();
}
</script>
</head>
<body>
<s:form action = "actionLogin.action" id = "loginForm">
<input type="hidden" name="userId" id = "Id" value = ""/>
UserName:<input type = "text" name="user.userId" id = "userInfo"/><br/>
Password:<input type = "text" name="user.password"/><br/>
<input type = "button" value = "login" onclick = "login()"/>
</s:form>
<a href = "register.jsp">Don't has a account,register one</a>
</body>
</html>