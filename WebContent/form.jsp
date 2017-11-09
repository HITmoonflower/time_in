<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form</title>
<script>var i=3</script>
<script>
function commit(){
	for (var j = 3; j<window.i;j++){
	      var key = document.getElementById("key"+String(j));
	      var value = document.getElementById("value"+String(j));
	      value.name = "infoMap."+key.value;
	 }
	document.getElementById("addPdoForm").submit();
}
function getObj(id){
    return document.getElementById(id);
}
function addRow(){
    var tab=getObj("pdoInfo");
    var row=tab.insertRow();
    var cell0=row.insertCell();
    var cell1=row.insertCell();
    var cell2=row.insertCell();
    temp = String(window.i);
    cell0.innerHTML='<input type="text"  id = "key'+temp+'">';
    cell1.innerHTML='<input type="text" name = "value'+temp+'" id = "value'+temp+'">';
    cell2.innerHTML='<input value="删除"type="button"onclick="deleteRow(this)"/>';
    i++;
}
function deleteRow(obj){
    var row=obj.parentNode.parentNode;
    var tab=row.parentNode;
    tab.deleteRow(row.rowIndex);
    i--;
}
</script>
</head>
<body>
<form id = "addPdoForm">
<input type="hidden" name="userID" value = "userId"/>
<table id = "pdoInfo">
<s:iterator value = "formHeader" var = "header" status = "sta">
<tr>
<td><s:property value="#header"/></td>
<td><input type = "text" name = 'info.<s:property value="#header"/>'/>
</tr>
</s:iterator>
</table>
<input type = "button" onclick = "commit()" value = "addPdo"/>
<input type ="button" value = "AddRow"onclick = "addRow()"/>
</form>
</body>
</html>