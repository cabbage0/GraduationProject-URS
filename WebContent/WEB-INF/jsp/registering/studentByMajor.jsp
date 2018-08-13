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
var flag = 1401;
$(function(){
	$('#dg').datagrid({    
	    //支持多条件查询
	    url:'${bathPath}AssignClass/showStudentByMajor', 
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
			text:'请选择一个专业：<select id="majorid1" name="majorid1" class="easyui-combobox" panelHeight="auto" style="width:100px"><c:forEach items="${major}" var="m"><option>${m.majorname}</option></c:forEach></select>', 
				handler: function(){
					$('#majorid1').combobox({
						 url:'${bathPath}AssignStudentId/getMajorId',   
				         editable:false, //不可编辑状态  
				         cache: false,  
				         panelHeight: 'auto',  
				         valueField:'majorid',     
				         textField:'majorname',
					});	
					$('#majorid1').combobox({
						onSelect: function(){
							var majorid=$('#majorid1').combobox('getValue');
							flag = majorid;
							$('#dg').datagrid('load',{
								keyWord:''+majorid+''
							});
						 }
					});
				} 				
		},'-',{
	    	iconCls: 'icon-remove',
			text:'为这个专业的学生分配班级',
			handler: function(){
				/* var array = $('#dg').datagrid("getSelections");
				if(array.length>0){
					//定义数组，通过下边的用来存储选中记录的Id
					var classidArray = new Array();
					for (var i = 0; i < array.length; i++) {
						classidArray[i] = array[i].classid;
					} */
					//如果需要锁整个页面，前面加parent.
					 parent.$.messager.confirm('分配班级对话框', '确认要为这些学生分配班级吗？', function(r) {
						if (r) {
							$.ajax({
							  url: "${bathPath}AssignClass/assignClass",
							  type:"POST",
							  //设置为传统方式传送参数
							  traditional:true,
							  data:{majorid:flag},
							  dataType:'text', 
							  success: function(html){
								  if(html){
								  	alert("恭喜您 ，分班成功");
								  }else{
								  	alert("对不起 ，分班失败");
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
				/*}else{
					alert("请选择需要删除的记录！");
				} */
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
	
	//通过关键字查询
	/* $('#majorid').searchbox({ 
		searcher:function(value,name){ 
			$('#dg').datagrid('load',{
				keyWord:''+value+''					
			});					
		}, 
		prompt:'请输入查询信息' 
	});  */

});



</script>
</head>
<body>

	<table id="dg"></table>
</body>
</html>