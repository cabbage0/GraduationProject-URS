<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/statics/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<%=basePath %>statics/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=basePath %>statics/css/bootstrap-select.min.css" rel="stylesheet">
	<script type="text/javascript" src="<%=basePath %>statics/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>statics/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>statics/js/bootstrap-select.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<br>
	<h1>到校登记</h1>
	<br>
	<h3>到校信息</h3>
	<br>
	<div>
		<div>
			<span>* 到达站点： </span>
			<select id="station" name="station" class="selectpicker">
				<option value="太原站">太原站</option>
			    <option value="太原南站">太原南站</option>
			    <option value="武宿机场">武宿机场</option>
			    <option value="建南汽车站">建南汽车站</option>
			    <option value="其它">其它</option> 
			</select>
		</div>
		<br>
		<div>
			<span>* 到达日期： </span>
			<select id="arrivaldate" name="arrivaldate" class="selectpicker">
				<option value="2018-08-26">2018-08-26</option>
			    <option value="2018-08-27">2018-08-27</option>
			</select>
		</div>
		<br>
		<div>
			<span>* 到达时间： </span>
			<select id="arrivaltime" name="arrivaltime" class="selectpicker">
				<option value="8:00-10:00">8:00-10:00</option>
			    <option value="10:00-12:00">10:00-12:00</option>
			    <option value="12:00-14:00">12:00-14:00</option>
			    <option value="14:00-18:00">14:00-18:00</option>
			    <option value="18:00之后">18:00之后</option> 
			</select>
		</div>
		<br>
		<div>
			<span>* 随行人数： </span>
			<select id="peernumber" name="peernumber" class="selectpicker">
				<option value="0-3">0-3</option>
			    <option value="3-5">3-5</option>
			    <option value="5人以上">5人以上</option>
			</select>
		</div>
	</div>
	<br>
	<div>
		<button type="submit" id="submit" class="btn btn-default" style="position:relative;left:80px;">提交</button>
	</div>
	<br>
	<h3>站点信息</h3>
	<h4>&nbsp;&nbsp;&nbsp;&nbsp;太原站</h4>
	&nbsp;&nbsp;&nbsp;&nbsp;建议路线：乘坐火车从太原站下车后沿着车站内的公交车示意图乘坐10路公交车到胜利桥东站下车，然后再胜利桥东站内乘坐835路或者835支路到<br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;终点站中北大学下车。全程需三元人民币，可在胜利桥东站内办理太原市公共交通IC卡。
	<br>
	<h4>&nbsp;&nbsp;&nbsp;&nbsp;太原南站</h4>
	&nbsp;&nbsp;&nbsp;&nbsp;建议路线：乘坐火车从太原南站下车后沿着车站内的公交车示意图乘坐849路公交车到胜利桥东站下车，然后再胜利桥东站内乘坐835路或者835支<br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;路到终点站中北大学下车。全程需三元人民币，可在胜利桥东站内办理太原市公共交通IC卡。
	<br>
	<h4>&nbsp;&nbsp;&nbsp;&nbsp;武宿机场</h4>
	&nbsp;&nbsp;&nbsp;&nbsp;建议路线：下飞机后乘坐机场巴士一号线到太原火车站下车，然后乘坐10路或615路公交车到胜利桥东站下车，然后再胜利桥东站内乘坐835路或者<br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;835支路到终点站中北大学下车。全程需19元人民币，可在胜利桥东站内办理太原市公共交通IC卡。
	<br>
	<h4>&nbsp;&nbsp;&nbsp;&nbsp;建南汽车站</h4>
	&nbsp;&nbsp;&nbsp;&nbsp;建议路线：下车后乘坐乘坐805路公交车到胜利桥东站下车，然后再胜利桥东站内乘坐835路或者835支路到终点站中北大学下车。全程需三元人民<br>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;币，可在胜利桥东站内办理太原市公共交通IC卡。
	
	
	<script type="text/javascript">
	$("#submit").click(function(){
		$.ajax({
		  type:"post",
	   	  async:true,  //控制异步			    	   
	      url:"<%=basePath%>studentRegister/arrivalInfo?station="+$("#station").val()+"&arrivaldate="+$("#arrivaldate").val()+"&arrivaltime="+$("#arrivaltime").val()
	      		+"&peernumber="+$("#peernumber").val(),
		  dateType:"text",
	   	  success:function(data)
	   	   {	   
	   		   if(data == 1){
	   		  	   alert("提交信息成功");
	   		   }else if(data==2){
	   			   alert("提交信息失败");
	   		   }else if(data==3){
	   			   alert("你已经提交过信息了");
	   		   }
	   	   }
		});
	});
	
	</script>
</body>
</html>