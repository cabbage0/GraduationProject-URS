<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/statics/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新生数据</title>
<style type="text/css">

	.inputCls{
		border:none;
		outline:none;
		height:40px;
		width:200px;
		margin: -20px -20px -20px 0px;
		font-size: 20px;
		text-align:center;
	}
	label{
		font-size:20px;
	}
	textarea{
		border:hidden;
		outline:none;
		font-size:15px;
	}
</style>
</head>
<body>

<center>
<!-- action="${bathPath}insert" -->
<!-- 	<form id="ff" method="post" > -->
	<table border="1" cellspacing=0 width="700px" height="300px" style="font-size:25px;">
		<caption style="font-weight: bold;margin-bottom:20px;height:30px;"> 新生数据录入 </caption>
		<tr>
			
			<td  style="font-size:25px;"><label>考生号</label></td> 
				<td style="font-size:25px;"> <input type="text" id="candidatenumber" name="candidatenumber" value="${sessionScope.tvmanager.tvagid}" class="inputCls"  /></td>
			<td  style="font-size:25px;"><label>性别</label></td> 
				<td style="font-size:25px;">
				<select id="gender" name="gender">
					<option value="1">男</option>
					<option value="0">女</option>
				</select>
				<!-- <input type="text" id="isabroad" name="isabroad" class="inputCls" /> -->
				</td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>学生姓名</label></td> 
				<td style="font-size:25px;"><input type="text" id="studentname" name="studentname" class="inputCls" /></td>
			<td  style="font-size:25px;"><label>身份证号</label></td> 
				<td style="font-size:25px;"> <input type="text" id="idcard" name="idcard" class="inputCls" /></td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>所属学院编号</label></td> 
				<td style="font-size:25px;"> <input type="text" id="instituteid" name="instituteid" class="inputCls" /></td>
			<td  style="font-size:25px;"><label>所属专业编号</label></td> 
				<td style="font-size:25px;"><input type="text" id="majorid" name="majorid" class="inputCls" /></td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>出生年月</label></td> 
				<td style="font-size:25px;"> <input type="text" id="birthday" name="birthday" class="inputCls" /></td>
			<td  style="font-size:25px;"><label>民族</label></td> 
				<td style="font-size:25px;"><input type="text" id="national" name="national" class="inputCls" /></td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>政治面貌</label></td> 
				<td style="font-size:25px;"> <input type="text" id="political" name="political" class="inputCls" /></td>
			<td  style="font-size:25px;"><label>学生类型</label></td> 
				<td style="font-size:25px;"><input type="text" id="studenttype" name="studenttype" class="inputCls" /></td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>高考成绩</label></td> 
				<td colspan="2" style="font-size:25px;"><input type="text" id="scores" name="scores" class="inputCls" /></td>
			<!-- <td colspan="3"><span id="paritySpan" style="font-size:15px"></span></td> -->
			<td colspan="4"><input id="submit" type="submit" value="确认录入" style="border:thick;font-size:20px;float:right;margin-right:20px;"/></td>
		</tr>
	</table>
<!-- 	</form> -->
</center>
<script type="text/javascript">

$('#birthday').datebox({
	required:true
});



$("#submit").click(function(){
	
	if($("#candidatenumber").val() == ""){
		alert("请填写考生号");
		return false;
	}
	if($("#studentname").val() == ""){
		alert("请填写学生姓名");
		return false;
	}
	if($("#idcard").val() == ""){
		alert("请填写身份证号");
		return false;
	}
	if($("#instituteid").val() == ""){
		alert("请填写所属学院编号");
		return false;
	}
	if($("#majorid").val() == ""){
		alert("请填写所属专业编号");
		return false;
	}
	if($("#national").val() == ""){
		alert("请填写民族");
		return false;
	}
	
	 if($('#birthday').datebox('getValue')== ""){
		alert("请完善信息");
		return false;
	}
	if($("#political").val() == ""){
		alert("请填写政治面貌");
		return false;
	}
	if($("#studenttype").val() == ""){
		alert("请填写学生类型");
		return false;
	}
	if($("#scores").val() == ""){
		alert("请填写高考成绩");
		return false;
	}

	  $.ajax({
	  type:"post",
   	  async:true,  //控制异步			    	   
      url:"<%=basePath%>StudentController/insertStudent?candidatenumber="+$("#candidatenumber").val()+"&gender="+$("#gender").val()+"&studentname="+$("#studentname").val()
      			+"&idcard="+$("#idcard").val()+"&instituteid="+$("#instituteid").val()+"&majorid="+$("#majorid").val()+"&birthday="+$('#birthday').datebox('getValue')
      			+"&national="+$("#national").val()+"&political="+$("#political").val()+"&studenttype="+$("#studenttype").val()+"&scores="+$("#scores").val(),
	  dateType:"text",
   	   success:function(data)
   	   {	   
   		   if(data == 1){
   		  	 alert("录入新生数据成功");
   		  $('#box').load('queryStudent.jsp');
   
   		   }else if(data==2){
   			   alert("录入新生数据失败");
   			$('#box').load('queryStudent.jsp');
   			
   		   }
   	   }
	});
});
</script>

</body>
</html>