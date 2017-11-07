<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
  <script>var i=3</script>
  <script>
  function getObj(id){
      return document.getElementById(id);
  }
  function addRow(){
      var tab=getObj("pdo");
      var row=tab.insertRow();
      row.className = "form-horizontal form-group ";
      row.style.thmem = "symple";
      var cell0=row.insertCell();
      var cell1=row.insertCell();
      var cell2=row.insertCell();
      temp = String(window.i);
      cell0.innerHTML='<input type="text"  id = "key'+temp+'">';
      cell0.className ="col-sm-4"; 
      cell1.innerHTML='<input type="text" name = "value'+temp+'" id = "value'+temp+'">';
      cell1.className ="col-sm-4";
      cell2.innerHTML='<input value="删除"type="button"onclick="deleteRow(this)"/>';
      cell2.className ="col-sm-4"; 
      i++;
  }
  function deleteRow(obj){
      var row=obj.parentNode.parentNode;
      var tab=row.parentNode;
      tab.deleteRow(row.rowIndex);
      i--;
  }
  function getMap(){
	  // var date = document.getElementById("date");
	  //var spend = document.getElementById("spend");
	  //var place = document.getElementById("place");
	  //date.name = "infoMap.date";
	  //spend.name = "infoMap.spend";
	  //place.name = "infoMap.place";
	  for (var j = 3; j<window.i;j++){
		  var key = document.getElementById("key"+String(j));
		  var value = document.getElementById("value"+String(j));
		  value.name = "infoMap."+key.value;
	  }
	  var url = window.location.search;  
	  if (url.indexOf("?") != -1) {
	        var str = url.substr(1);
	        strs = str.split("=");
	        key = document.getElementById("Id");
	        key.value = strs[1];
	        document.getElementById("pdoForm").submit();
	    }
	  else{
	  alert("Error Happened")
	  }
  }
  </script>
<title>addPdo</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">

          <div class="page-header">
            <h1>AddPdo</h1>
          </div>
          <s:form action="actionAddPdo" Class="form-horizontal" theme="simple" id = "pdoForm">
            <input type="hidden" name="userID" id="Id" />
              <table id = "pdo">
              <tr class="form-group">
                    <th class="col-sm-4">Key</th>
                    <th class="col-sm-4">Value</th>
                    <th class="col-sm-4">Operation</th>
             </tr>
              <tr class="form-group">
                    <td class="col-sm-4" >Date</td>
                    <td class="col-sm-4">
                        <input type="text" name="infoMap.datetime" Class="form-control" id = "date"/>
                    </td>
             </tr>
              <tr class="form-group">
                    <td class="col-sm-4" >Spend</td>
                    <td class="col-sm-4">
                        <input type="text" name="infoMap.spend" Class="form-control" id = "spend"/>
                    </td>
             </tr>
              <tr class="form-group">
                    <td class="col-sm-4">Place</td>
                    <td class="col-sm-4">
                        <input type="text" name="infoMap.place" Class="form-control" id = "place"/>
                    </td>
             </tr>
             </table>
          <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-4">
                        <input type="button" Class="btn btn-primary" value = "AddPdo"
                        onclick = "getMap()"/>
                       <input type ="button" Class="btn btn-primary" value = "AddRow"onclick = "addRow()"/>
                     
                    </div>
            </div>
          </s:form>
          </div>
          </div>
          </div>

</body>
</html>