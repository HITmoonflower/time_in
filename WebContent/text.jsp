<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<script type="text/javascript">
    //取得指定id的对象
    function getObj(id){
        return document.getElementById(id);
    }
    //添加行函数
    function addRow(tabName){
        //取得table的对象
        var tab=getObj(tabName);
        //添加行
        var row=tab.insertRow(tab.rows.length);
        //添加三列
        alert(String(tab.rows.length))
        var nameCell=row.insertCell(row.cells.length);
        var addressCell=row.insertCell(row.cells.length);
        var buttonCell=row.insertCell(row.cells.length);
        //给name输入栏和address输入栏赋值
        nameCell.innerHHTML="张三";
        addressCell.innerHTML="北京";
        //在第三列加上删除当前列按钮        
        buttonCell.innerHTML='<input value="删 除"type="button"onclick="deleteRow(this)"/>';
    }
    //删除列函数，删除方法传入参数为行的索引
    function deleteRow(obj){
        var row=obj.parentNode.parentNode;
        var tab=row.parentNode;
        tab.deleteRow(row.rowIndex);
    }
    </script>
</head>
<body>
<input type="button" value="添加"  onclick="addRow('tab')"/>
<table width="350" height="36" border="1" id="tab">
    <tr>
        <th width="64" height="30" scope="col">姓名</th>
        <th width="204" scope="col">地址</th>
        <th width="60" scope="col">操作</th>
    </tr>
</table>
</body>
</html>