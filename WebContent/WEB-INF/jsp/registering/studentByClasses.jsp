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
	    url:'${bathPath}AssignStudentId/showStudentByClass', 
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
			text:'请选择一个班级：<select id="majorid1" name="majorid1" class="easyui-combobox" panelHeight="auto" style="width:100px"><c:forEach items="${major}" var="m"><option>${m.majorname}</option></c:forEach></select>',
			handler:function(){ 
				
			 	$('#majorid1').combobox({  
					 url:'${bathPath}AssignStudentId/getMajorId',   
			         editable:false, //不可编辑状态  
			         cache: false,  
			         panelHeight: 'auto',  
			         valueField:'majorid',     
			         textField:'majorname',
			         
			       onHidePanel:function(){
			    	   $("#classid1").combobox("setValue",'');//清空班级
			    	   var majorid = $('#majorid1').combobox('getValue');
			    	   $.ajax({
			    		   url:"${bathPath}AssignStudentId/getClassId",
			    		   type:"POST",
			    		   cache:false,
			    		   traditional:true,
						   data:{majorid:majorid},
			    		   dataType:"json",
			    		   success:function(result){
			    			   $("#classid1").combobox("loadData",result);
			    		   },
			    		   error: function (XMLHttpRequest, textStatus, errorThrown) {
							    $.messager.alert('出错了','请联系管理员！','error');
							}
			    	   });
			       }  
				});
				$('#classid1').combobox({
			         cache: false,  
			         panelHeight: 'auto',//自动高度适合  
			         valueField:'classid',     
			         textField:'classid'
				}); 
			}   				
		},{
			text:'<select id="classid1" name="classid1" class="easyui-combobox" panelHeight="auto" style="width:100px"></select>',
			handler:function(){
				$('#classid1').combobox({
					onSelect: function(){
						var classid=$('#classid1').combobox('getValue');
						/* flag = classid; */
						$('#dg').datagrid('load',{
							keyWord:''+classid+''
						});
				 	}
				});
			}
		},'-',{
	    	iconCls: 'icon-remove',
			text:'为这个班级的学生编制学号',
			handler: function(){
				var classid = $('#classid1').combobox('getValue');
				//如果需要锁整个页面，前面加parent.
				 parent.$.messager.confirm('编制学号对话框', '确认要为这些学生编制学号吗？', function(r) {
					if (r) {
						$.ajax({
						  url: "${bathPath}AssignStudentId/assignStudentId",
						  type:"POST",
						  //设置为传统方式传送参数
						  traditional:true,
						  data:{classid:classid},
						  dataType:'text', 
						  success: function(html){
							  if(html){
							  	alert("恭喜您 ，学号已经编制成功");
							  }else{
							  	alert("对不起 ，学号编制失败");
							  }
						  //重新刷新页面
						    $("#dg").datagrid("reload");
						    //请除所有勾选的行
						    $("#dg").datagrid("clearSelections");
						  },
						  error: function (XMLHttpRequest, textStatus, errorThrown) {
							    $.messager.alert('分配错误','请联系管理员！','error');
							}
						  
						});
					}
					});
			}
	    }],	 		       
		columns : [[{
			checkbox:true,
			hidden:true
		},{
			field : 'candidatenumber',
			title : '考生号',
			width : 80
		},{
			field : 'classid',
			title : '班级编号',
			width : 70,
			formatter: function(value,row,index){
				switch(value){
					case "0":
						return "暂未分配"
					default:
						return value 
				}
			}
		},{
			field : 'studentid',
			title : '学号',
			width : 70,
			formatter: function(value,row,index){
				switch(value){
					case "0":
						return "暂未分配"
					default:
						return value 
				}
			}
		},{
			field : 'studentname',
			title : '学生姓名',
			width : 50
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
			width : 50
		},{
			field : 'majorid',
			title : '所属专业编号',
			width : 50
		},{
			field : 'scores',
			title : '高考成绩',
			width : 50
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
});



</script>
</head>
<body>

	<table id="dg"></table>
</body>
</html>