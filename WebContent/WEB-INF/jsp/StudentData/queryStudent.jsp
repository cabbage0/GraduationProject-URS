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
	    url:'${bathPath}StudentController/showStudent', 
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
			text:'录入新生数据',
			handler: function(){
				//打开新增窗口
				parent.$("#win").window({    
					title :'录入新生数据',
				    width:900,    
				    height:500,    
				    modal:true,
				    content:"<iframe src='<%=basePath%>StudentController/loadInsert' height='100%' width='100%' frameborder='0px' ></iframe>"  
				}); 
			}
    	},'-',{
			text:"<form action='${bathPath}StudentController/insertStuByExcel' method='post' enctype='multipart/form-data'><span>从Excel导入新生数据：</span><input type='file' id='insertStuByExcel' name='insertStuByExcel'/><input type='submit' id='submit' value='导入'/></form>",
			
		},'-',{
			text:"请输入考生号或身份证号查询：<input type='text' id='cdNumberOrIdCard' name='cdNumberOrIdCard'/>",					
		}],			       
	    

		columns : [[{
			checkbox:true,
		},{
			field : 'candidatenumber',
			title : '考生号',
			width : 70
		},{
			field : 'studentname',
			title : '学生姓名',
			width : 70
		},{
			field : 'gender',
			title : '性别',
			width : 30,
			formatter: function(value,row,index){
				switch(value){
				case 0:
					return "女"
				case 1:
					return "男"
				}
			}
		},{
			field : 'instituteid',
			title : '所属学院编号',
			width : 70
		},{
			field : 'majorid',
			title : '所属专业编号',
			width : 70
		},{
			field : 'scores',
			title : '高考成绩',
			width : 70
		},{
			field : 'idcard',
			title : '身份证号',
			width : 100
		},{
			field : 'birthday',
			title : '出生年月',
			width : 70
		},{
			field : 'national',
			title : '民族',
			width : 70
		},{
			field : 'political',
			title : '政治面貌',
			width : 70
		},{
			field : 'studenttype',
			title : '学生类别',
			width : 70
		}]]
});
	
	//通过关键字查询
	$('#cdNumberOrIdCard').searchbox({ 
		searcher:function(value,name){ 
			$('#dg').datagrid('load',{
				keyWord:''+value+''					
			});					
		}, 
		prompt:'请输入查询信息' 
	}); 

});

/* $('#submit').click(function(){
	alert("1");
	$.ajax({
		url: "${bathPath}StudentController/insertStuByExcel",
		type:"POST",
		//设置为传统方式传送参数
		traditional:true,
		dataType:'Text',
		success: function(html){
			if(html>0){
			 	alert("恭喜您 ，导入成功");
			}else{
			  	alert("对不起 ，导入失败");
			}
			//重新刷新页面
			$("#dg").datagrid("reload");
			//请除所有勾选的行
			$("#dg").datagrid("clearSelections");
			},
		error: function (XMLHttpRequest, textStatus, errorThrown) {
		    $.messager.alert('导入错误','请联系管理员！','error');
		}
	});
}) */


</script>
</head>
<body>

	<table id="dg"></table>
</body>
</html>