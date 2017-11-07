<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
<s:form action = "actionLogin.action">
UserName:<s:textfield name="user.userId"/><br/>
Password:<s:textfield name="user.password"/><br/>
<s:submit value = "login"/>
</s:form>
<a href = "register.html">Don't has a account,register one</a>
</body>
</html>