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
		<center>
			<br>
			<h1 style="font-weight: bold;margin-bottom:20px;height:30px;"> 中北大学2018级新生入学报到单 </h1>
			<hr>
			<br>
		</center>
		<table border="1" cellspacing=0 width="700px" height="300px" style="font-size:25px;">
			<tr>
				<td  style="font-size:25px;"><label>学生姓名</label></td> 
					<td style="font-size:25px;"><input type="text" id="studentname" name="studentname" value="${sessionScope.student.studentname}" class="inputCls" readonly="readonly"/></td>
				<%-- <td  style="font-size:25px;"><label>考生号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="candidatenumber" name="candidatenumber" value="${sessionScope.student.candidatenumber}" class="inputCls" readonly="readonly" /></td> --%>
				<td  style="font-size:25px;"><label>性别</label></td> 
					<td style="font-size:25px;">
					<c:if test="${sessionScope.student.gender==1}">
						<input type="text" id="gender" name="gender" value="男" class="inputCls" readonly="readonly"/> 
					</c:if>
					<c:if test="${sessionScope.student.gender==0}">
						<input type="text" id="gender" name="gender" value="女" class="inputCls" readonly="readonly"/> 
					</c:if>
					</td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>高考成绩</label></td> 
					<td  style="font-size:25px;"><input type="text" id="scores" name="scores" value="${sessionScope.student.scores}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>身份证号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="idcard" name="idcard" value="${sessionScope.student.idcard}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>班级编号</label></td> 
					<td style="font-size:25px;"><input type="text" id="classid" name="classid" value="${sessionScope.student.classid}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>学号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="studentid" name="studentid" value="${sessionScope.student.studentid}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<%-- <tr>
				<td  style="font-size:25px;"><label>所属学院编号</label></td> 
					<td style="font-size:25px;"> <input type="text" id="instituteid" name="instituteid" value="${sessionScope.student.instituteid}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>所属专业编号</label></td> 
					<td style="font-size:25px;"><input type="text" id="majorid" name="majorid" value="${sessionScope.student.majorid}" class="inputCls" readonly="readonly"/></td>
			</tr> --%>
			<tr>
				<td  style="font-size:25px;"><label>出生年月</label></td> 
					<td style="font-size:25px;"> <input type="text" id="birthday" name="birthday" value="${sessionScope.student.birthday}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>民族</label></td> 
					<td style="font-size:25px;"><input type="text" id="national" name="national" value="${sessionScope.student.national}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>政治面貌</label></td> 
					<td style="font-size:25px;"> <input type="text" id="political" name="political" value="${sessionScope.student.political}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>学生类型</label></td> 
					<td style="font-size:25px;"><input type="text" id="studenttype" name="studenttype" value="${sessionScope.student.studenttype}" class="inputCls" readonly="readonly"/></td>
			</tr>
		</table>
		<br>	
		<table border="1" cellspacing=0 width="700px" height="300px" style="font-size:25px;">			
			<tr>
				<!-- <td colspan="3"><span id="paritySpan" style="font-size:15px"></span></td> -->
				<!-- <td colspan="4"><input id="submit" type="submit" value="继续完善信息" style="border:thick;font-size:20px;float:right;margin-right:20px;"/></td> -->
				<td  style="font-size:25px;"><label>来校日期</label></td> 
					<td style="font-size:25px;"><input type="text" id="arrivaldate" name="arrivaldate" value="${arrival.arrivaldate}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>来校时间</label></td> 
					<td style="font-size:25px;"><input type="text" id="arrivaltime" name="arrivaltime" value="${arrival.arrivaltime}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>到达站点</label></td> 
					<td style="font-size:25px;"><input type="text" id="station" name="station" value="${arrival.station}" class="inputCls" readonly="readonly"/></td>
				<td  style="font-size:25px;"><label>随行人数</label></td> 
					<td style="font-size:25px;"><input type="text" id="peernumber" name="peernumber" value="${arrival.peernumber}" class="inputCls" readonly="readonly"/></td>
			</tr>
			<tr>
				<td  style="font-size:25px;"><label>报到状态</label></td> 
					<td colspan="3" style="font-size:25px;"><input type="text" value="等待线下确认" class="inputCls" readonly="readonly"/></td>
			</tr>
		</table>
	<!-- </form> -->
	</center>
	<script type="text/javascript">
	<%-- $("#submit").click(function(){
		  $.ajax({
		  type:"post",
	   	  async:false,  //控制异步			    	   
	      url:"<%=basePath%>studentRegister/completeInfo",
		  dateType:"text",
	   	   success:function(data)
	   	   {
	   		   if(data == 0){
	   		  	 alert("你已完善过信息，无需再次填写");
	   		   }else{
	   			window.location.href = "<%=basePath%>studentRegister/completeInfo";
	   		   }
	   	   }
		});
	}); --%>
	</script>
</body>
</html>