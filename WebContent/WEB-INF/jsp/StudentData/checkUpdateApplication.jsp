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
			<caption style="font-weight: bold;margin-bottom:20px;height:30px;">学生原本信息 </caption>
			<tr>
				<td  style="font-size:25px;"><label>考生号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="candidatenumber" name="candidatenumber" value="${oldStudentInfo.candidatenumber}" class="inputCls" readonly="readonly" /></td>
				<td  style="font-size:25px;"><label>性别</label></td> 
					<td style="font-size:25px;">
					<!-- <select id="gender" name="gender" readonly="readonly">
						<option value="1">男</option>
						<option value="0">女</option>
					</select> -->
					<c:if test="${oldStudentInfo.gender==1}">
						<input type="text" id="gender" name="gender" value="男" class="inputCls" readonly="readonly"/> 
					</c:if>
					<c:if test="${oldStudentInfo.gender==0}">
						<input type="text" id="gender" name="gender" value="女" class="inputCls" readonly="readonly"/> 
					</c:if>
					</td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>学生姓名</label></td> 
					<td style="font-size:25px;"><input type="text" id="studentname" name="studentname" value="${oldStudentInfo.studentname}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>身份证号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="idcard" name="idcard" value="${oldStudentInfo.idcard}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>班级编号</label></td> 
					<td style="font-size:25px;"><input type="text" id="classid" name="classid" value="${oldStudentInfo.classid}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>学号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="studentid" name="studentid" value="${oldStudentInfo.studentid}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<%-- <tr>
				<td  style="font-size:25px;"><label>所属学院编号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="instituteid" name="instituteid" value="${sessionScope.student.instituteid}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>所属专业编号</label></td> 
					<td style="font-size:25px;"><input type="text" id="majorid" name="majorid" value="${sessionScope.student.majorid}" class="inputCls" readonly="readonly"/></td>
			</tr> --%>
			<tr>
				<td  style="font-size:25px;"><label>出生年月</label></td> 
					<td style="font-size:25px;"> <input type="text" id="birthday" name="birthday" value="${oldStudentInfo.birthday}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>民族</label></td> 
					<td style="font-size:25px;"><input type="text" id="national" name="national" value="${oldStudentInfo.national}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>政治面貌</label></td> 
					<td style="font-size:25px;"> <input type="text" id="political" name="political" value="${oldStudentInfo.political}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>学生类型</label></td> 
					<td style="font-size:25px;"><input type="text" id="studenttype" name="studenttype" value="${oldStudentInfo.studenttype}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>高考成绩</label></td> 
					<td colspan="1" style="font-size:25px;"><input type="text" id="scores" name="scores" value="${oldStudentInfo.scores}" class="inputCls" readonly="readonly"/></td>
				<!-- <td colspan="3"><span id="paritySpan" style="font-size:15px"></span></td> -->
				<td colspan="4"><!-- <input id="submit" type="submit" value="继续完善信息" style="border:thick;font-size:20px;float:right;margin-right:20px;"/> --></td>
			</tr>
		</table>
		
		
		<table border="1" cellspacing=0 width="700px" height="300px" style="font-size:25px;">
			<caption style="font-weight: bold;margin-bottom:20px;height:30px;">修改后信息 </caption>
			<tr>
				<td  style="font-size:25px;"><label>考生号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="candidatenumber" name="candidatenumber" value="${sessionScope.newStudentInfo.candidatenumber}" class="inputCls" readonly="readonly" /></td>
				<td  style="font-size:25px;"><label>性别</label></td> 
					<td style="font-size:25px;">
					<!-- <select id="gender" name="gender" readonly="readonly">
						<option value="1">男</option>
						<option value="0">女</option>
					</select> -->
					<c:if test="${sessionScope.newStudentInfo.gender==1}">
						<input type="text" id="gender" name="gender" value="男" class="inputCls" readonly="readonly"/> 
					</c:if>
					<c:if test="${sessionScope.newStudentInfo.gender==0}">
						<input type="text" id="gender" name="gender" value="女" class="inputCls" readonly="readonly"/> 
					</c:if>
					</td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>学生姓名</label></td> 
					<td style="font-size:25px;"><input type="text" id="studentname" name="studentname" value="${sessionScope.newStudentInfo.studentname}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>身份证号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="idcard" name="idcard" value="${sessionScope.newStudentInfo.idcard}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>班级编号</label></td> 
					<td style="font-size:25px;"><input type="text" id="classid" name="classid" value="${sessionScope.newStudentInfo.classid}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>学号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="studentid" name="studentid" value="${sessionScope.newStudentInfo.studentid}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<%-- <tr>
				<td  style="font-size:25px;"><label>所属学院编号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="instituteid" name="instituteid" value="${sessionScope.student.instituteid}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>所属专业编号</label></td> 
					<td style="font-size:25px;"><input type="text" id="majorid" name="majorid" value="${sessionScope.student.majorid}" class="inputCls" readonly="readonly"/></td>
			</tr> --%>
			<tr>
				<td  style="font-size:25px;"><label>出生年月</label></td> 
					<td style="font-size:25px;"> <input type="text" id="birthday" name="birthday" value="${sessionScope.newStudentInfo.birthday}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>民族</label></td> 
					<td style="font-size:25px;"><input type="text" id="national" name="national" value="${sessionScope.newStudentInfo.national}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>政治面貌</label></td> 
					<td style="font-size:25px;"> <input type="text" id="political" name="political" value="${sessionScope.newStudentInfo.political}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>学生类型</label></td> 
					<td style="font-size:25px;"><input type="text" id="studenttype" name="studenttype" value="${sessionScope.newStudentInfo.studenttype}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>高考成绩</label></td> 
					<td colspan="1" style="font-size:25px;"><input type="text" id="scores" name="scores" value="${sessionScope.newStudentInfo.scores}" class="inputCls" readonly="readonly"/></td>
				<!-- <td colspan="3"><span id="paritySpan" style="font-size:15px"></span></td> -->
				<td colspan="4"><!-- <input id="submit" type="submit" value="继续完善信息" style="border:thick;font-size:20px;float:right;margin-right:20px;"/> --></td>
			</tr>
		</table>
		<br>
		<input id="ensureUpdate" type="submit" value="同意请求并修改" class="btn btn-default">
		
	<!-- </form> -->
	</center>
	<script type="text/javascript">
	$("#ensureUpdate").click(function(){
		  $.ajax({
		  type:"post",
	   	  async:false,  //控制异步			    	   
	      url:"<%=basePath%>studentRegister/ensureUpdate",
		  dateType:"text",
	   	   success:function(data)
	   	   {
	   		   if(data == 1){
	   		  	 alert("学生信息已修改成功");
	   		   }else{
	   			   alert("暂时没有相关请求");
	   			window.location.href = "<%=basePath%>studentRegister/toCheckUpdate";
	   		   }
	   	   }
		});
	});
	</script>
</body>
</html>