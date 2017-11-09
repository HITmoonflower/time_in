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
function addRelation(){
	var checkBox = document.getElementsByName("pdoItem");
	var t = 0,num = 0;
	var pdoId = new Array();
	for (var i=0;i<checkBox.length;i++){
		if (checkBox[i].checked){
			pdoId[num] = checkBox[i].value;
			num++;
			t++;
		}
	}
	if (t == 2){
		document.getElementById("pdoId1").value = pdoId[0];
		document.getElementById("pdoId2").value = pdoId[1];
		document.getElementById("relation").submit();
	}
	else{
		alert("请选择两个pdo")
	}
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
<!-- showAllPdo
<input type = "button" onclick = 'showAllPdoUrl("<s:property value = 'user.userId'/>")'value = "shwoAll"/>
 -->
<br/>
<s:form action = "actionAddRelatePdo.action" id = "relation">
<input type="hidden" name="userId" id = "Id" value = '<s:property value = "userId"/>'/>
<input type="hidden" name="pdo1" id="pdoId1"/>
<input type="hidden" name="pdo2" id="pdoId2"/>
</s:form>
<table class="table table-striped">
  <s:iterator value = "queryRes" var = "pdo" status = "sta">
    <tr>
    <td rowspan = "2"><input type = "checkbox" name = "pdoItem" value = '<s:property value = "#pdo.pdoID"/>'></td>
      <s:iterator value="#pdo.infoMap" status="ss" var = "map">
      <td><s:property value="%{#map.key}" /></td>
      </s:iterator>
    <td rowspan = "2">
    <form action = "actionForm">
      <input type="hidden" name="userId" value = '<s:property value="#pdo.userID" />'/>
      <input type="hidden" name="pdoId" value = '<s:property value="#pdo.pdoID" />'/>
      <input type="submit" value="generateForm"/> 
    </form>
    </td>
    <tr/>
    <tr>
    <!-- 单元格无内容占位？？？ -->
      <td></td>
      <s:iterator value="#pdo.infoMap" status="ss" var = "map">
      <td><s:property value="%{#map.value}" /></td>
      </s:iterator>
      <td></td>
    </tr>
  </s:iterator>
</table>
<input type = "button" onclick = 'addRelation()'value = "addRelation"/>
</body>
</html>