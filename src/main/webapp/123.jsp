<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理员主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${ctx }/css/bootstrap.min.css">
	<link rel="stylesheet" href="${ctx }/css/jquery.dataTables.min.css">
	<script type="text/javascript" src="${ctx }/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${ctx }/js/datatables/1.10.10/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${ctx }/js/datatables/1.10.10/fnReloadAjax.js"></script>
	<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
	<style>
	body{padding: 5px;min-height: auto;}
	tbody{background-color:#fff;}
	.pd-cus .text-c {padding-top: 5px;}
	.htz{color:#444b50;margin-left:10px;}
	.pd-cus .r {padding-right: 40px;padding-top: 5px;}
	.tablelist{ padding-top: 30px;  padding-bottom: 30px;}
	</style>
  </head>
  
  <body>
   	<div class="pd-15">
		<div class="cl pd-cus" id="search_div"> 
			<span class="l text-c">
				<label class="selfsty">用户名:</label>
				<input type="text" class="input-text" style="width:150px" id="username" name="username">
				<button type="submit"  class="btn btn-sear radius" onclick="javascript:reload_datatables();">搜索</button>
			</span>
			<button type="button"  class="btn btn-sear radius" onclick="javascript:$('#saveModal').modal('show')">添加</button>
		</div>
		<div class="tablelist">
		<table class="table table-border table-bordered table-hover table-bg table-sort" width="100%">
			<thead>
				<tr class="text-l">
	        		<th class="htz">用户名</th>
	        		<th class="htz">类型</th>
	        		<th class="htz">状态</th>
	        		<th class="htz">操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		</div>
	</div>
	<!-- 保存模态框 -->
    <div id="saveModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog " style="width:600px">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						保存用户
					</h4>
				</div>
				<div id="save" class="form-horizontal">
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">用户名:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="username" id="username" placeholder="用户名">
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">密码:</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="password" id="password" placeholder="密码">
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">类型:</label>
							<div class="col-sm-5">
								<select class="form-control" id="type" name="type">
									     <option value="1">管理员</option>
									     <option value="2">普通用户</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<input type="button" class="btn btn-primary" id='savebtn' value="提交">
					</div>
				</div>
	  		</div>
	  	</div>
    </div>
    <!-- 保存模态框 -->
    <!-- 编辑模态框 -->
    <div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog " style="width:600px">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						编辑用户
					</h4>
				</div>
				<div id="edit" class="form-horizontal">
					<input type="hidden" id="id">
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">用户名:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="username" id="username" placeholder="用户名">
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">类型:</label>
							<div class="col-sm-5">
								<select class="form-control" id="type" name="type">
									     <option value="1">管理员</option>
									     <option value="2">普通用户</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">状态:</label>
							<div class="col-sm-5">
								<select class="form-control" id="status" name="status">
									     <option value="0">禁用</option>
									     <option value="1">正常</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<input type="button" class="btn btn-primary" id='editbtn' value="提交">
					</div>
				</div>
	  		</div>
	  	</div>
    </div>
    <!-- 编辑模态框 -->
    <!-- 详情模态框 -->
    <div id="infoModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog " style="width:600px">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						用户详情
					</h4>
				</div>
				<div id="info" class="form-horizontal">
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">用户名:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" readonly="true" name="username" id="username" placeholder="用户名">
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">类型:</label>
							<div class="col-sm-5">
								<select class="form-control" id="type" readonly="true" name="type">
									     <option value="1">管理员</option>
									     <option value="2">普通用户</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">状态:</label>
							<div class="col-sm-5">
								<select class="form-control" id="status" readonly="true" name="status">
									     <option value="0">禁用</option>
									     <option value="1">正常</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
					</div>
				</div>
	  		</div>
	  	</div>
    </div>
    <!-- 编辑模态框 -->
  </body>
  <script type="text/javascript">
  	var tables;
  	$(function(){
  		tables = $('.table-sort').dataTable({
  			"bSort":false,
  			"bStateSave": true,//状态保存
  			"bServerSide": true,
  			"bFilter":false,
  			"sPaginationType":"full_numbers",
  			"sAjaxSource": "${ctx}/admin/queryUserList",
  			"oLanguage":{
  				"oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                }
  			},
  	        "createdRow": function ( row, data, index ) {$(row).addClass('text-l');},
  			"aoColumns":[      
  	        		{"mDataProp" : "username"},
  	        		{"mDataProp" : "type"},
  	        		{"mDataProp" : "status"},
  	        		{"mDataProp" : "id"}
  			] ,
  			"aoColumnDefs": [
  			                 {"aTargets":1,"mRender": function(data, type, row, meta) {return data==0?"超级管理员":data==1?"管理员":"用户";}},
  			               {"aTargets":2,"mRender": function(data, type, row, meta) {return data==0?"禁用":"正常";}},
  			               {"aTargets":3,"mRender": function(data, type, row, meta) {return row.type==0?'超级管理员不可修改':'<a href=\"javascript:void(0)\" onclick=\"query(\''+data+'\',1)\">查看</a>|'+
  			            	 '<a href=\"javascript:void(0)\" onclick=\"query(\''+data+'\',2)\">修改</a>'+
  			            	'|<a href=\"javascript:void(0)\" onclick=\"deluser(\''+data+'\',\''+row.type+'\')\">删除</a>';}
  			                 }
  			                 ],
  	        "fnServerData": function(sSource,aoData,fnCallback){
  	        	var data = {"pagenum":aoData[3].value,"pagesize":aoData[4].value,
  				       			username:$("#username").val()};
  	        	retrieveData( sSource, data, fnCallback );}
  		});
	  	function retrieveData( sSource, data, fnCallback ) {
		  $.ajax( {"type": "POST", "url": sSource, "data": data,
		      "success": function(resp) {
		    	  resp=eval("("+resp+")");fnCallback(resp);
		    }
		  });
		}
  	})
  function reload_datatables(){tables.fnReloadAjax();}
  	$("#savebtn").click(function(){
  		var save=$('#save');
  		var u=save.find("#username").val();
  		if(!u){alery("用户名不能为空");return}
  		var p=save.find("#password").val();
  		if(!p){alery("密码不能为空");return;};
  		var t=save.find("#type option:selected").val();
  		$.ajax({
  			url:'saveUser',
  			type:'post',
  			data:{username:u,password:p,type:t},
  			success:function(res){
  				res=eval("("+res+")")
  				if(res.isok){
  					$("#saveModal").modal('hide');
  					reload_datatables();
  				}else{
  					alert("添加失败")
  				}
  			},
  			error:function(){
  				alert("系统异常")
  			}
  		})
  	})
  	$("#editbtn").click(function(){
  		var save=$('#edit');
  		var u=save.find("#username").val();
  		var id=save.find("#id").val();
  		if(!u){alert("用户名不能为空");return;}
  		var t=save.find("#type option:selected").val();
  		var s=save.find("#status option:selected").val();
  		$.ajax({
  			url:'updateUser',
  			type:'post',
  			data:{id:id,username:u,type:t,status:s},
  			success:function(res){
  				res=eval("("+res+")")
  				if(res.isok){
  					$("#editModal").modal('hide');
  					reload_datatables();
  				}else{
  					alert("更新失败")
  				}
  			},
  			error:function(){
  				alert("系统异常")
  			}
  		})
  	})
  	function deluser(id,type){
  		if(!confirm("确定要删除吗?"))return;
  		$.ajax({
  			url:'delUser',
  			type:'post',
  			data:{id:id,type:type},
  			success:function(res){
  				res=eval("("+res+")")
  				if(res.isok){
  					reload_datatables();
  				}else{
  					alert("删除失败")
  				}
  			},
  			error:function(){
  				alert("系统异常")
  			}
  		})
  	}
  	function query(id,l){
  		$.ajax({
  			url:'queryUser',
  			type:'post',
  			data:{id:id},
  			async:false,
  			success:function(res){
  				if(!res)return;
  				res=eval("("+res+")")
  				var modal;
  				if(l==1){
  					modal=$("#infoModal")
  				}else{
  					modal=$("#editModal")
  					modal.find("#id").val(res.id);
  				}
  				modal.find("#username").val(res.username);
  				modal.find("#type option[value='"+res.type+"']").attr("selected",true);
  				modal.find("#status option[value='"+res.status+"']").attr("selected",true);
  				modal.modal('show')
  			},
  			error:function(){
  				alert("系统异常")
  			}
  		})
  	}
  </script>
</html>
