<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsps/common.jsp" %>
</head>
<body class="easyui-layout">

	<table id="datagrid" title="My Users" class="easyui-datagrid"
		style="width: 550px; height: 250px" url="http://localhost:8080/test3/findAll"
		toolbar="#toolbar" rownumbers="true" fitColumns="true"
		singleSelect="true">
		<thead>
			<tr>
				<th field="id" width="50">ID</th>
				<th field="username" width="50">username</th>
				<th field="address" width="50">address</th>
				<th field="phone" width="50">phone</th>
				<th field="remark" width="50">remark</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="newUser()">New User</a> 
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="editUser()">Edit User</a> 
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="destroyUser()">Remove User</a>
	</div>
	
</body>
</html>