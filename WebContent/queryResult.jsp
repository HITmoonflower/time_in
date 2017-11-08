<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>QueryPdo</title>
</head>
<body>
<table class="table table-striped">
  <s:iterator value = "queryRes" var = "pdo" status = "sta">
    <tr>
      <s:iterator value="#pdo.infoMap" status="ss" var = "map">
      <td><s:property value="%{#map.key}" /></td>
      </s:iterator>
    <tr/>
    <tr>
      <s:iterator value="#pdo.infoMap" status="ss" var = "map">
      <td><s:property value="%{#map.value}" /></td>
      </s:iterator>
    </tr>
  </s:iterator>
</table>
</body>
</html>