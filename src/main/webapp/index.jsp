<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value=" ${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- easyui依赖的jquery库-->   
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- easyui的插件库-->      
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/default/easyui.css">
<!-- easyui的系统图标-->   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/color.css">

<!-- easyui的汉化包 -->
<script type="text/javascript" src=" ${pageContext.request.contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- 公共的js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/datagrid-detailview.js"></script>

</head>

<script type="text/javascript">
$(function() {
	var empdatagrid;
	var  empdlg;
	var fm;
	empdatagrid= $("#empdatagrid");
	empdlg=$("#empdlg");
	fm=$('#fm');
	var cmdObj={
		"reload":function(){
			//刷新函数方法
			empdatagrid.datagrid("reload");
		},
		"add":function(){
			
			//打开对话框
			empdlg.dialog('open').dialog('setTitle','添加');
			//清楚表单缓存
			fm.form('clear');
		},
		"update":function(){
			//获取当前现则的行数据
			var row = empdatagrid.datagrid('getSelected');
			if(!row){
			//没有选择行报错
				$.messager.alert('提示','请至少选择一行数据','error');
				 return;
			}else{
				//打开对话框
				empdlg.dialog('open').dialog('setTitle','修改');
				//清楚表单缓存
				fm.form('clear');
				//回显数据
				empdlg.form('load',row)
			}
		},
		"delete":function(){
			//获取当前现则的行数据
			 var row = empdatagrid.datagrid('getSelected');
			 if(!row){
			//	没有选择行报错
				 $.messager.alert('提示','请至少选择一行数据','error');
				 return;
			 }
	         if (row){
				// 发出确认删除信息
	             $.messager.confirm('信息','您确定要删除这条数据吗?',function(r){
	                 if (r){
					//	收到确认删除请求 ,ajax发送后台删除,回调删除结果
	                     $.post('/emp/del',{id:row.id},function(result){
	                         if (result.success){
							//	 删除成功
	                        	 $.messager.alert('提示','删除成功','info');
	                        	 empdatagrid.datagrid('reload'); 
	                         } else {
								//	 删除失败
	                        	 $.messager.alert('提示',result.message+'删除失败','error');
	                        	 empdatagrid.datagrid('reload'); 
	                         }
	                     },'json');
	                 }
	             });
	         }
		},
		"save":function(){
			// 保存按钮点击后提交表单数据到后台
			 fm.form('submit',{
	             url: "/emp/save",
	             onSubmit: function(){
	                 return $(this).form('validate');
	             },
	//   函数返回json对象
	             success: function(result){
	        		try {
//	         			将json对象转换成json字符串
	        			 var result = $.parseJSON(result);
//	                   var result = eval('('+result+')');
//	 					成功保存提示
	                     if (result.success){
	                    	 empdlg.dialog('close');       
	                    	 empdatagrid.datagrid('reload');
	                         $.messager.alert('提示','保存成功','info');
	                     } else {
//	                     	 失败保存提示
	                         empdlg.dialog('close');        
	                         empdatagrid.datagrid('reload');
	                         $.messager.alert('提示','保存失败'+result.message,'error');
	                     }
					} catch (e) {
//	 					解析返回数据格式问题
						$.messager.alert('提示','数据解析错误','error');
					}	
	            	
	             }
	         });
		},
		"cancel":function(){
			empdlg.dialog('close');
		}
	}
	
	$("a[data-cmd]").click(function(){
		var cmd = $(this).data("cmd");
		if(cmd &&!$(this).hasClass("l-btn-disabled")){
			cmdObj[cmd]();
		}
	})	
})
</script>
</head>
<body>
<!-- 表格 -->
	<table id="empdatagrid" title="员工管理" class="easyui-datagrid" style="width:700px;height:250px" url="/emp/list"
            toolbar="#empToolbar" pagination="true" 
            rownumbers="true" fitColumns="true" singleSelect="true" fit="true">
        <thead>
            <tr>
                <th hidden="true" field="id" width="50">ID</th>
                <th field="username" width="50">员工账号</th>
                <th field="realName" width="50">真实姓名</th>
                <th field="password" width="50" >密码</th>
                <th field="tel" width="50" >电话</th>
                <th field="email" width="50" >邮箱</th>
                <th field="dept" width="50" formatter="objFormatter">部门</th>
                <th field="inputTime" width="50" >入职时间</th>
                <th field="state" width="50" >状态</th>
            </tr>
        </thead>
    </table>
    <!-- 表格按钮 -->
    <div id="empToolbar">
        <a  data-cmd="add" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" >添加</a>
        <a  data-cmd="update" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" >修改</a>
        <a  data-cmd="delete" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" >删除</a>
        <a  data-cmd="reload" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" >刷新</a>
    </div>
    
    <!-- 编辑对话框 -->
    <div id="empdlg" class="easyui-dialog" style="width:400px;"
            closed="true" buttons="#dlgButtons">
        <!-- 对话框表单 -->
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
			<!-- 隐藏域提交id -->
			<input name="id" type="hidden"/>
			<table>
				<tr>
					<td>员工账号:</td>
					<td><input name="username" type="text"/></td>
				</tr>
				<tr>
					<td>真实姓名:</td>
					<td><input name="realName" type="text"/></td>
				</tr>
				<tr>
					<td>电话:</td>
					<td><input name="tel" type="text"/></td>
				</tr>
				<tr>
					<td>邮箱:</td>
					<td><input name="email" type="text"/></td>
				</tr>
				<tr>
					<td>部门:</td>
					<td><input name="dept" type="text"/></td>
				</tr>
				<tr>
					<td>入职时间:</td>
					<td><input name="inputTime" type="text"/></td>
				</tr>
				<tr>
					<td>状态:</td>
					<td><input name="state" type="text"/></td>
				</tr>
			</table>
		</form>
    </div>
    
	<!-- 编辑对话框按钮 -->
    <div id="dlgButtons">
        <a data-cmd="save" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
        <a data-cmd="cancel" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" >取消</a>
    </div>
    
</body>
</html>