function stateFormatter(v,r,i){
	return v == 0?"<front style='color:green'>正常</front>":"<front style='color:red'>停用</front>";
}

function aftersaleFormatter(v,r,i){
	return v == 0?"<front style='color:green'>正常</front>":"<front style='color:red'>作废</front>";
}

function contractFormatter(v,r,i){
	return v == 0?"<front style='color:green'>正常</front>":"<front style='color:red'>作废</front>";
}

function orderFormatter(v,r,i){
	if(v == -1){
		return "<front style='color:red'>作废</front>";
	}else if(v ==0){
		return "<front style='color:blue'>待审核</front>"
	}else if(v ==1){
		return "<front style='color:green'>已审核</front>"
	}	
}



function objFormatter(v,r,i){
	if(v){
		return v.name||v.realName||v.title||v.sn;
	}
	
}




//抽取的公共的查询条件form
$.fn.serializeForm=function(){
	//封装查询对象
	obj={}
	 var queryParam = $(this).serializeArray(); 
	//循环把查询条件封装成对象 
	$.each(queryParam,function(index,objTemp){
		 obj[objTemp.name]=objTemp.value;
	 })
	return obj;
}


function arrayFormatter(v,r,i){
	var result ="";
	if(v){
		$.each(v,function(index,obj){
			if(index!=v.length-1){
				result += objFormatter(obj)+","
			}else{
				result += objFormatter(obj);
			}
		});
	}
	return result;
}