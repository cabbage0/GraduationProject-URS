<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/statics/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<%=basePath %>statics/css/bootstrap.min.css" rel="stylesheet">
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
		<caption style="font-weight: bold;margin-bottom:20px;height:30px;"> 详细信息完善 </caption>
		<tr>
			
			<td  style="font-size:25px;"><label>联系电话</label></td> 
				<td style="font-size:25px;"> <input type="text" id="phonenumber" name="phonenumber" class="inputCls"  /></td>
			<td  style="font-size:25px;"><label>是否残疾</label></td> 
				<td style="font-size:25px;">
				<select id="isdisability" name="isdisability">
					<option value="1">是</option>
					<option value="0">否</option>
				</select> 
				</td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>是否单亲</label></td> 
				<td style="font-size:25px;">
				<select id="issingleparent" name="issingleparent">
					<option value="1">是</option>
					<option value="0">否</option>
				</select>
				</td>
			<td  style="font-size:25px;"><label>是否烈士或优抚对象子女</label></td> 
				<td style="font-size:25px;">
				<select id="ismartyrchild" name="ismartyrchild">
					<option value="1">是</option>
					<option value="0">否</option>
				</select>
				</td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>健康状况</label></td> 
				<td colspan="2" style="font-size:25px;"><input type="text" id="health" name="health" class="inputCls" /></td>
			<!-- <td colspan="3"><span id="paritySpan" style="font-size:15px"></span></td> -->
			<td colspan="4"><!-- <input id="submit" type="submit" value="确认录入" style="border:thick;font-size:20px;float:right;margin-right:20px;"/> --></td>
		</tr>
	</table>
<!-- 	</form> -->
	<table border="1" cellspacing=0 width="700px" height="300px" style="font-size:25px;">
		<caption style="font-weight: bold;margin-bottom:20px;height:30px;"> 家庭信息完善 </caption>
		<tr>
			<td  style="font-size:25px;"><label>家庭住址</label></td> 
				<td style="font-size:25px;"> <input type="text" id="address" name="address" class="inputCls"  /></td>
			<td  style="font-size:25px;"><label>家庭联系电话</label></td> 
				<td style="font-size:25px;"><input type="text" id="familyPhone" name="familyPhone" class="inputCls" /></td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>家庭邮编</label></td> 
				<td style="font-size:25px;"><input type="text" id="zip" name="zip" class="inputCls" /></td>
			<td  style="font-size:25px;"><label>家庭人口数</label></td> 
				<td style="font-size:25px;"> <input type="text" id="population" name="population" class="inputCls" /></td>
		</tr>
		</table>
		
		<table border="1" cellspacing=0 width="700px" height="300px" style="font-size:25px;">
		<caption style="font-weight: bold;margin-bottom:20px;height:30px;"> 紧急联系人信息 </caption>
		<tr>
			<td  style="font-size:25px;"><label>联系人姓名</label></td> 
				<td style="font-size:25px;"> <input type="text" id="membername" name="membername" class="inputCls"  /></td>
			<td  style="font-size:25px;"><label>联系人年龄</label></td> 
				<td style="font-size:25px;"><input type="text" id="memberage" name="memberage" class="inputCls" /></td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>与学生关系</label></td> 
				<td style="font-size:25px;"><input type="text" id="relationship" name="relationship" class="inputCls" /></td>
			<td  style="font-size:25px;"><label>政治面貌</label></td> 
				<td style="font-size:25px;"> <input type="text" id="political" name="political" class="inputCls" /></td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>工作单位</label></td> 
				<td style="font-size:25px;"><input type="text" id="company" name="company" class="inputCls" /></td>
			<td  style="font-size:25px;"><label>职务</label></td> 
				<td style="font-size:25px;"> <input type="text" id="duty" name="duty" class="inputCls" /></td>
		</tr>
		<tr>
			<td  style="font-size:25px;"><label>紧急联电话</label></td> 
				<td colspan="1" style="font-size:25px;"><input type="text" id="memberphone" name="memberphone"  class="inputCls" /></td>
			<!-- <td colspan="3"><span id="paritySpan" style="font-size:15px"></span></td> -->
			<td colspan="4"><!-- <input id="submit" type="submit" value="继续完善信息" style="border:thick;font-size:20px;float:right;margin-right:20px;"/> --></td>
		</tr>
		</table>
		<br/>
		<input id="completeInfo" type="submit" value="确认并提交" class="btn btn-default">
</center>
<script type="text/javascript">

$('#birthday').datebox({
	required:true
});

$('#tvedate').datebox({
	required:true
});

$("#completeInfo").click(function(){
	
	if($("#phonenumber").val() == ""){
		alert("请填写联系电话");
		return false;
	}
	if($("#isdisability").val() == ""){
		alert("请选择是否残疾");
		return false;
	}
	if($("#health").val() == ""){
		alert("请填写健康状况");
		return false;
	}
	if($("#address").val() == ""){
		alert("请填写家庭住址");
		return false;
	}
	if($("#familyPhone").val() == ""){
		alert("请填写家庭联系电话");
		return false;
	}
	
	 if($('#zip').val()== ""){
		alert("请填写家庭邮编");
		return false;
	}
	if($('#population').val() == ""){
		alert("请填写家庭人口数");
		return false;
	} 
	if($("#membername").val() == ""){
		alert("请填写紧急联系人姓名");
		return false;
	}
	if($("#memberage").val() == ""){
		alert("请填写紧急联系人年龄");
		return false;
	}
	if($("#relationship").val() == ""){
		alert("请填写紧急联系人与学生关系");
		return false;
	}
	if($("#political").val() == ""){
		alert("请填写紧急联系人政治面貌");
		return false;
	}
	if($("#company").val() == ""){
		alert("请填写紧急联系人工作单位");
		return false;
	}
	if($("#duty").val() == ""){
		alert("请填写紧急联系人职务");
		return false;
	}
	if($("#memberphone").val() == ""){
		alert("请填写紧急联系人电话");
		return false;
	}

	  $.ajax({
	  type:"post",
   	  async:true,  //控制异步			    	   
      url:"<%=basePath%>studentRegister/completeInformation?phonenumber="+$("#phonenumber").val()+"&isdisability="+$("#isdisability").val()+"&issingleparent="+$("#issingleparent").val()
      			+"&ismartyrchild="+$("#ismartyrchild").val()+"&health="+$("#health").val()+"&address="+$("#address").val()+"&familyPhone="+$('#familyPhone').val()
      			+"&zip="+$("#zip").val()+"&population="+$("#population").val()+"&membername="+$("#membername").val()+"&memberage="+$("#memberage").val()+"&relationship="+$("#relationship").val()
      			+"&political="+$("#political").val()+"&company="+$("#company").val()+"&duty="+$("#duty").val()+"&memberphone="+$("#memberphone").val(),
	  dateType:"text",
   	   success:function(data)
   	   {	   
   		   if(data == 1){
   		  	 alert("完善信息成功");
   		  $('#box').load('completeInfo.jsp');
   
   		   }else if(data==2){
   			   alert("完善信息失败");
   			$('#box').load('completeInfo.jsp');
   			
   		   }
   	   }
	});
});
</script>

</body>
</html>