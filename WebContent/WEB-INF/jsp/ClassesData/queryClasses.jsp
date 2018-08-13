<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/statics/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#dg').datagrid({    
	    //支持多条件查询
	    url:'${bathPath}classesController/showClasses', 
	    fitColumns:true,
	    nowrapL:true,
	    idField:'id',
	    rownumbers:true,
	    pagination:true,
	    pageSize:5,
	    pageList:[1,5,10,20],
	    
	     queryParams: {
			supName: '%%'			
		}, 
				    
	    toolbar: [{
	    	iconCls: 'icon-add',
			text:'录入新的班级数据',
			handler: function(){
				//打开新增窗口
				parent.$("#win").window({    
					title :'录入班级数据',
				    width:900,    
				    height:500,    
				    modal:true,
				    content:"<iframe src='<%=basePath%>classesController/loadInsert' height='100%' width='100%' frameborder='0px' ></iframe>"  
				}); 
			}
	    },{
			iconCls: 'icon-edit',
			text:'修改班级类型',
			handler: function(){
				
				//判断是否选中一行，并且只能选中一行进行修改
				var array = $('#dg').datagrid("getSelections");
				
				if(array.length!=1){
					alert("请选择需要修改的记录，并且只能选中一条！");
					return false;							
				}
				
				//打开修改窗口
				parent.$("#win").window({    
					title :'修改班级类型',
				    width:600,    
				    height:400,    
				    modal:true,
				    content:"<iframe src='<%=basePath%>classesController/loadUpdate' height='100%' width='100%' frameborder='0px' ></iframe>"  
				}); 
			}
		},'-',{
			iconCls: 'icon-remove',
			text:'删除',
			handler: function(){
				var array = $('#dg').datagrid("getSelections");
				if(array.length>0){
					//定义数组，通过下边的用来存储选中记录的Id
					var classidArray = new Array();
					for (var i = 0; i < array.length; i++) {
						classidArray[i] = array[i].classid;
					}
					//如果需要锁整个页面，前面加parent.
					parent.$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
						if (r) {
							$.ajax({
							  url: "${bathPath}classesController/delete",
							  type:"POST",
							  //设置为传统方式传送参数
							  traditional:true,
							  data:{classid:classidArray},
							  dataType:'json',
							  success: function(html){
								  if(html>0){
								  	alert("恭喜您 ，删除成功，共删除了"+html+"条记录");
								  }else{
								  	alert("对不起 ，删除失败");
								  }
							  //重新刷新页面
							    $("#dg").datagrid("reload");
							    //请除所有勾选的行
							    $("#dg").datagrid("clearSelections");
							  },
							  error: function (XMLHttpRequest, textStatus, errorThrown) {
								    $.messager.alert('删除错误','请联系管理员！','error');
								}
							  
							});
						}
					});
				}else{
					alert("请选择需要删除的记录！");
				}
			}
		},'-',{
			text:"请输入班级编号：<input type='text' id='classid' name='classid'/>",					
		}],			       
	    

		columns : [[{
			checkbox:true,
		},{
			field : 'classid',
			title : '班级编号',
			width : 70
		},{
			field : 'classtype',
			title : '班级类型',
			width : 70,
			formatter: function(value,row,index){
				switch(value){
				case 0:
					return "实验班"
				case 1:
					return "普通班"
				}
			}
		},{
			field : 'majorid',
			title : '所属专业',
			width : 70,
			formatter: function(value,row,index){
				switch(value){
				case "1401":
					return "软件工程"
				case "0403":
					return "生物工程"
				case "1501":
					return "音乐表演"
				}
			}
	}]]
});
	
	//通过关键字查询
	$('#classid').searchbox({ 
		searcher:function(value,name){ 
			$('#dg').datagrid('load',{
				keyWord:''+value+''					
			});					
		}, 
		prompt:'请输入查询信息' 
	}); 

});



</script>
</head>
<body>

	<table id="dg"></table>
</body>
</html>