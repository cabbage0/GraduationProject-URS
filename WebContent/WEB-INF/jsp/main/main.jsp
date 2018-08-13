<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/statics/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自助报到主界面</title>
	<link rel="stylesheet" href="<%=basePath %>statics/css/bootstrap.min.css" type="text/css">  
	<script type="text/javascript" src="<%=basePath %>statics/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>statics/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		<%-- body{
			background:url('<%=basePath %>statics/image/bg.jpg');
			/* background-size:100%; */
			opacity:0.8;
		} --%>

		.mao{
			/*color:red;*/
			text-decoration:none;
		}

		 li{list-style-type:none;}
		h5{
			position: absolute;
			z-index: 3;
			width: 100%;
			height: 55px;
			text-align: center;
			left: 0px;
			top: -55px;
			color: #ffffff;
			font: normal 22px/55px "microsoft yahei";
		} 
	</style>
	
</head>
<body>
	<div style="height:650px;background-image: url('<%=basePath %>statics/image/bg.jpg');background-size:100%;">
		<div id="container" class="body_main">
			<div id="143072436750652785" class="topframe">
				<div id="head" style="position:relative;left:100px" >
					<ul>
						<li><a target="_blank" href="#"><img src="<%=basePath %>statics/image/校徽2.png" height="15%" width="40%" /></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div>
		<a href="<%=basePath%>studentRegister/toIndex" style="vertical-align: middle;position: absolute;top: 500px;left: 1000px;">	
			<img  height="115px" width="105px" src="<%=basePath %>statics/image/自助报到.png" alt="自助报到"/>
			<h5 ">自助报到</h5>
		</a>
		</div>
		<div>
		<a href="<%=basePath %>loginController/loginOut" style="vertical-align: middle;position: absolute;top: 500px;left: 1200px;">	
			<img  height="115px" height="115px" width="105px" src="<%=basePath %>statics/image/安全退出.png" alt="null"/>
			<h5 >安全退出</h5>
		</a>
		</div>
	</div>	

<div class="row clearfix" style="background:#484848;color:	white">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-4 column">
					<ul>
						<li style="margin-top:30px;">
							<font size=5>友情合作伙伴</font>
						</li>
						<hr style="border:3 solid #303030" width="100%" size=3>
						<li>
							<p>华中师范大学</p>
						</li>
						<li>
							<p>太原理工大学</p>
						</li>
						<li>
							<p>山西大学</p>
						</li>
						<li>
							<p>华中农业大学</p>
						</li>
					</ul>
				</div>
				<div class="col-md-4 column">
					<ul>
						<li style="margin-top:30px;">
							<font size=5>报到流程</font>
						</li>
						<hr style="border:3 solid #ff0033" width="100%" size=3>
						<li>
							<p>阅读报到指南</p>
						</li>
						<li>
							<p>登录自助报到系统</p>
						</li>
						<li>
							<p>完善个人信息</p>
						</li>
						<li>
							<p>确认到校时间</p>
						</li>
						<!-- <li>
							<p>确认注册</p>
						</li> -->
					</ul>
				</div>
				<div class="col-md-4 column">
					<ul>
						<li style="margin-top:30px;">
							<font size=5>联系方式</font>
						</li>
						<hr style="border:3 solid #ff0033" width="100%" size=3>
						<li>
							<p>微博：weibo.com/sunny</p>
						</li>
						<li>
							<p>邮件：cabbagepine@foxmail.com</p>
						</li>
						<li>
							<p>地址：山西省太原市中北大学</p>
						</li>
						
					</ul>
				</div>
			</div>
		</div>
		<hr style="border:3 solid #ff0033" width="100%" size=3>
		<div class="col-md-12 column">
			<center>
				<p>Copyright © 2005-2018 版权所有：中北大学  </p>
			</center>

		</div>
	</div>
	
</div>

	
	
</body>
</html>