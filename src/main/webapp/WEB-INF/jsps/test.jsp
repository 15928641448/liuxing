<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js">
</script>
<meta charset="UTF-8">
<title>人员表</title>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		   type: "POST",
		   url: "http://localhost:8080/test3/findAll",
		   //data: {sdate:date},
		   dataType: "json",
		   success: function(data){
			   console.log(data);
		       var str = "";
		       for(var i=0; i < 1; i++) {
		    	   str += "<tr>";
		    	   str += "<th colspan='5' style='text-align:center;'>" + "person表" + "</th></tr>";
		       }
		       str += "<tr><th style='text-align:center;'>ID</th><th style='text-align:center;'>姓名</th><th style='text-align:center;'>地址</th><th style='text-align:center;'>电话</th><th style='text-align:center;'>评论</th></tr>";
		       for(var i=0; i < data.length; i++) {
		    	   //data[i]
		    	   //console.log(data[i]);
		    	   //alert(data[i].con);
		    	   str += "<tr>";
		    	   str += "<td style='text-align:center;'>" + data[i].id + "</td>";
		    	   //alert(data[i].mman);
		    	   str += "<td>" + data[i].username + "</td>";
		    	   str += "<td>" + data[i].address + "</td>";
		    	   str += "<td>" + data[i].phone + "</td>";
		    	   str += "<td>" + data[i].remark + "</td>";
		    	   str += "<tr>";
		       }
		       /* for(var i in data){
		    	   console.log(i);
		    	   str += "<tr>";
		    	   str += "<td>" + i.mman + "</td>";
		    	   alert(i.mman);
		    	   str += "<td>" + i.verdict + "</td>";
		    	   str += "<td>" + i.reason + "</td>";
		    	   str += "<td>" + i.nopartreason + "</td>";
		    	   str += "<tr>";
		       } */
		       $("#hs").append(str);
		   }
	 	});
	
	
	//查询
	$("#123").click(function(){
	$.ajax({
	   type: "POST",
	   url: "http://localhost:8080/test3/findAll",
	   //data: {sdate:date},
	   dataType: "json",
	   success: function(data){
		   console.log(data);
	       var str = "";
	       for(var i=0; i < 1; i++) {
	    	   str += "<tr>";
	    	   str += "<th colspan='5' style='text-align:center;'>" + "person表" + "</th></tr>";
	       }
	       str += "<tr><th style='text-align:center;'>ID</th><th style='text-align:center;'>姓名</th><th style='text-align:center;'>地址</th><th style='text-align:center;'>电话</th><th style='text-align:center;'>评论</th></tr>";
	       for(var i=0; i < data.length; i++) {
	    	   //data[i]
	    	   //console.log(data[i]);
	    	   //alert(data[i].con);
	    	   str += "<tr>";
	    	   str += "<td style='text-align:center;'>" + data[i].id + "</td>";
	    	   //alert(data[i].mman);
	    	   str += "<td>" + data[i].username + "</td>";
	    	   str += "<td>" + data[i].address + "</td>";
	    	   str += "<td>" + data[i].phone + "</td>";
	    	   str += "<td>" + data[i].remark + "</td>";
	    	   str += "<tr>";
	       }
	       /* for(var i in data){
	    	   console.log(i);
	    	   str += "<tr>";
	    	   str += "<td>" + i.mman + "</td>";
	    	   alert(i.mman);
	    	   str += "<td>" + i.verdict + "</td>";
	    	   str += "<td>" + i.reason + "</td>";
	    	   str += "<td>" + i.nopartreason + "</td>";
	    	   str += "<tr>";
	       } */
	       $("#hs").append(str);
	   }
 	});
	});
	
});
</script>
</head>
<body>
<button  id="123" >查询</button>
	<table id= "hs" class="table table-striped table-bordered table-condensed"></table> 
</body>
</html>