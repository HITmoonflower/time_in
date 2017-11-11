<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>relativePdo</title>
</head>
<body>
<s:iterator value = "relateRes" var = "pdo" status = "sta">
<s:property value = "#pdo.pdoId"/>
<table>

<s:iterator value="#pdo.infoMap" status="ss" var = "map">
<tr>
<td><s:property value="%{#map.key}" /></td>
<td><s:property value="%{#map.value}" /></td>
</tr>
</s:iterator>
</table>
<s:form action = "actionShowRelate">
<input type = "text" name = "pdoId" value ='<s:property value = "#pdo.pdoID"/>'/>
<input type = "submit" value = "RelativaPdo"/>
</s:form>
</s:iterator>
</body>
</html>