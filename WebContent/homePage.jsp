<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>HomePage</title>
<script>
function addPdoUrl(userId){
	window.location.href="addPdo.jsp?userId="+userId;
}
function queryPdoUrl(userId){
	window.location.href="queryPdo.jsp?userId="+userId;
}
//function showAllPdoUrl(userId){
	//  window.location.href="actionShowAll.action?userId="+userId;
//}
</script>
</head>
<body>
<!-- 
<a href="addPdo.jsp?userId=<s:property value = 'user.userId'/>">AddPdo</a>
 -->
<input type = "button" onclick = 'addPdoUrl("<s:property value = 'user.userId'/>")'value = "addPdo"/>
<input type = "button" onclick = 'queryPdoUrl("<s:property value = 'user.userId'/>")'value = "queryPdo"/>
<!-- <s:url var= "idUser" action = "actionShowAll">
              <s:param name = "userId">
                <s:property value = "user.userId"/>
              </s:param>
            </s:url>
<s:a href = "%{idUser}"><input type = "button" value="showAll"/></s:a> -->
<!-- showAllPdo
<input type = "button" onclick = 'showAllPdoUrl("<s:property value = 'user.userId'/>")'value = "shwoAll"/>
 -->
<br/>

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