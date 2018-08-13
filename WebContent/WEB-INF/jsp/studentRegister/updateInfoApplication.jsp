<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/statics/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<%-- <form id="ff" method="post" action="<%=basePath%>studentRegister/completeInfo"> --%>
		<table border="1" cellspacing=0 width="700px" height="300px" style="font-size:25px;">
			<caption style="font-weight: bold;margin-bottom:20px;height:30px;"> 请填写你要修改的信息: </caption>
			<tr>
				<td  style="font-size:25px;"><label>考生号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="candidatenumber" name="candidatenumber" value="${sessionScope.student.candidatenumber}" class="inputCls" disabled="true" /></td>
				<td  style="font-size:25px;"><label>性别</label></td> 
					<td style="font-size:25px;">
					<select id="gender" name="gender" readonly="readonly">
						<option value="1">男</option>
						<option value="0">女</option>
					</select>
					<%-- <c:if test="${sessionScope.student.gender==1}">
						<input type="text" id="gender" name="gender" value="男" class="inputCls"/> 
					</c:if>
					<c:if test="${sessionScope.student.gender==0}">
						<input type="text" id="gender" name="gender" value="女" class="inputCls"/> 
					</c:if> --%>
					</td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>学生姓名</label></td> 
					<td style="font-size:25px;"><input type="text" id="studentname" name="studentname" value="${sessionScope.student.studentname}" class="inputCls"/></td>
				<td  style="font-size:25px;"><label>身份证号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="idcard" name="idcard" value="${sessionScope.student.idcard}" class="inputCls"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>班级编号</label></td> 
					<td style="font-size:25px;"><input type="text" id="classid" name="classid" value="${sessionScope.student.classid}" class="inputCls" disabled="true"/></td>
				<td  style="font-size:25px;"><label>学号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="studentid" name="studentid" value="${sessionScope.student.studentid}" class="inputCls" disabled="true"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>出生年月</label></td> 
					<td style="font-size:25px;"> <input type="text" id="birthday" name="birthday" value="${sessionScope.student.birthday}" class="inputCls" disabled="true"/></td>
				<td  style="font-size:25px;"><label>民族</label></td> 
					<td style="font-size:25px;"><input type="text" id="national" name="national" value="${sessionScope.student.national}" class="inputCls"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>政治面貌</label></td> 
					<td style="font-size:25px;"> <input type="text" id="political" name="political" value="${sessionScope.student.political}" class="inputCls"/></td>
				<td  style="font-size:25px;"><label>学生类型</label></td> 
					<td style="font-size:25px;"><input type="text" id="studenttype" name="studenttype" value="${sessionScope.student.studenttype}" class="inputCls" disabled="true"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>高考成绩</label></td> 
					<td colspan="1" style="font-size:25px;"><input type="text" id="scores" name="scores" value="${sessionScope.student.scores}" class="inputCls" disabled="true"/></td>
				<!-- <td colspan="3"><span id="paritySpan" style="font-size:15px"></span></td> -->
				<td colspan="4"><input id="submit" type="submit" value="提交申请" style="border:thick;font-size:20px;float:right;margin-right:20px;"/></td>
			</tr>
		</table>
	<!-- </form> -->
	</center>
	<script type="text/javascript">
	$("#submit").click(function(){
		  $.ajax({
		  type:"post",
	   	  async:false,  //控制异步			    	   
	      url:"<%=basePath%>studentRegister/submitApplication?candidatenumber="+$("#candidatenumber").val()+"&gender="+$("#gender").val()+"&studentname="+$("#studentname").val()
			+"&idcard="+$("#idcard").val()+"&classid="+$("#classid").val()+"&studentid="+$("#studentid").val()+"&birthday="+$('#birthday').val()
  			+"&national="+$("#national").val()+"&political="+$("#political").val()+"&studenttype="+$("#studenttype").val()+"&scores="+$("#scores").val(),
		  dateType:"text",
	   	   success:function(data)
	   	   {
	   		   if(data == 0){
	   		  		alert("提交申请成功");
	   		   }else{
	   			   alert("提交申请失败，请联系学校人员");
	   				window.location.href = "<%=basePath%>studentRegister/toUpdateInfo";
	   		   }
	   	   }
		});
	});
	</script>
</body>
</html>