<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/statics/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
请输入新班级信息：<hr>

	<%-- <form id="ff" method="post" action="<%=basePath%>classesController/insertClasses"> --%>
	<table>
		<!-- <tr>
			<td>新增班级的编号：</td>
			<td><input type="text" id="classid" name="classid" onblur="departIdParity(this)"><span id="departIdSpan"></span></td>
		</tr> -->
		<tr>
			<td>班级类型：</td>
			<td><select id="classtype" name="classtype" panelHeight="auto" style="width:100px">
					<option value="1">普通班</option>
					<option value="0">实验班</option>
				</select>
				<span id="departNameSpan"></span>
			</td>
		</tr>
		<tr>
			<td>所属专业编号：</td>
			<td>
				<select id="majorid" name="majorid"  panelHeight="auto" style="width:100px" onchange="getMarjor()">
					<c:forEach items="${major}" var="m"><option value="${m.majorid}">${m.majorname}</option></c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>该班级的序号：</td>
			<td>
				<select id="number" name="number"  panelHeight="auto" style="width:100px">
					<option value="1">第一班</option>
					<option value="2">第二班</option>
					<option value="3">第三班</option>
					<option value="4">第四班</option>
					<option value="5">第五班</option>
					<option value="6">第六班</option>
					<option value="7">第七班</option>
					<option value="8">第八班</option>
					<option value="9">第九班</option>
					<option value="10">第十班</option>
					<option value="11">第十一班</option>
					<option value="12">第十二班</option>
				</select>
			</td>
		</tr>
	</table>
	
	<input id="btn" type="submit" value="提交" >
	
	<!-- </form> -->
</body>
<script type="text/javascript">

$("#btn").click(function(){
	if($("#classid").val() == ""){
		alert("请填写班级编号");
		return false;
	}
	if($("#majorid").val() == ""){
		alert("请填写专业编号");
		return false;
	} 

	
	$.ajax({
	  type:"post",
   	  async:true,  //控制异步	
   	  url:"<%=basePath%>classesController/insertClasses?number="+$("#number").val()+"&majorid="+$("#majorid").val()+"&classtype="+$("#classtype").val(),
	  dateType:"text",
   	   success:function(data)
   	   {	   
   		   if(data == 1){
   		  	 alert("录入班级数据成功");
   		   }else if(data==2){
   			 alert("录入班级数据失败");
   		   }
   	   }
	});
});

	
</script>

</html>