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
function showAllPdoUrl(userId){
	  window.location.href="actionShowAll.action?userId="+userId;
}
function queryPdoUrl(){
	var startDate = document.getElementById("startDate");
	var endDate = document.getElementById("endDate");
	var maxSpend = document.getElementById("maxSpend");
	var minSpend = document.getElementById("minSpend");
	var placeIn = document.getElementById("place");
	if (startDate.value ==""){
		startDate.value = "2001-1-1";
	}
	if (endDate.value ==""){
	    endDate.value = "2100-1-1";
	}
	if (minSpend.value == ""){
		minSpend.value ="0";
	}
	if (maxSpend.value == ""){
		maxSpend.value ="100000";
	}
	if (placeIn.value == ""){
		placeIn.value = "noPlaceInput";
	}
	document.getElementById("queryForm").submit();
}
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
<input type = "button" onclick = 'showAllPdoUrl("<s:property value = 'user.userId'/>")'value = "shwoAll"/>
<br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
          <div class="page-header">
            <h1>Query</h1>
          </div>
          <s:form action="actionQueryPdo" Class="form-horizontal" theme="simple" id = "queryForm">
            <input type="hidden" name="userId" value = "<s:property value = 'user.userId'/>"/>
              <table>
              <tr class="form-group">
                    <td class="col-sm-4" >Date:</td>
                    <td class="col-sm-4">
                        <input type="text" name="info.startDate" Class="form-control" id = "startDate"/>
                    </td>
                    <td class="col-sm-4">
                        <input type="text" name="info.endDate" Class="form-control" id = "endDate"/>
                    </td>
             </tr>
              <tr class="form-group">
                    <td class="col-sm-4" >Spend</td>
                    <td class="col-sm-4">
                        <input type="text" name="info.minSpend" Class="form-control" id = "minSpend"/>
                    </td>
                    <td class="col-sm-4">
                        <input type="text" name="info.maxSpend" Class="form-control" id = "maxSpend"/>
                    </td>
             </tr>
              <tr class="form-group">
                    <td class="col-sm-4">Place</td>
                    <td class="col-sm-4">
                        <input type="text" name="info.place" Class="form-control" id = "place"/>
                    </td>
                    <td></td>
             </tr>
             </table>
             <input type = "button" onclick="queryPdoUrl()" value = "queryPdo"/>
             </s:form>
             </div>
             </div>
             </div>
          



</body>
</html>