<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/statics/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--<link rel="icon" href="../../favicon.ico">-->

		<title>自助报到系统</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=basePath %>statics/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>statics/css/bootstrap-treeview.min.css" />
		<!-- Custom styles for this template -->
		<link href="<%=basePath %>statics/css/dashboard.css" rel="stylesheet">
		<style type="text/css">
			.navbar-inverse {
				background-color: #337AB7;
			}
			
			.navbar-inverse .navbar-brand {
				color: white;
			}
			
			.navbar-inverse .navbar-nav>li>a {
				color: white;
			}
			
			.navbar-inverse .navbar-nav>li>a:hover {
				color: gold;
			}
		</style>
	</head>

	<body>

		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			            <span class="sr-only">Toggle navigation</span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
		          </button>
					<a class="navbar-brand" href="#">新生自助报到系统</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<!--<li>
							<a href="#">Dashboard</a>
						</li>
						<li>
							<a href="#">Settings</a>
						</li>-->
						<!-- <li>
							<a href="#">修改密码</a>
						</li> -->
						<li>
							<a href="<%=basePath %>loginController/loginOut">退出系统</a>
						</li>
					</ul>
					<!--<form class="navbar-form navbar-right">
						<input type="text" class="form-control" placeholder="Search...">
					</form>-->
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<div id="tree" class="nav nav-sidebar"></div>
				</div>

				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<iframe src="<%=basePath%>studentRegister/toHome" name='main' id="iframepage" frameborder="0" width="100%" height="160%" scrolling="no" marginheight="0" marginwidth="0" onLoad="iFrameHeight()"></iframe>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="<%=basePath %>statics/js/jquery-1.12.4.min.js"></script>

		<script>
			window.jQuery || document.write('<script src="<%=basePath %>statics/js/jquery-1.12.4.min.js"><\/script>')
		</script>
		<script src="<%=basePath %>statics/js/bootstrap.min.js"></script>
		<script src="<%=basePath %>statics/js/bootstrap-treeview.min.js" type="text/javascript" charset="utf-8"></script>

		<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
		<script src="<%=basePath %>statics/js/holder.min.js.js"></script>
		<script type="text/javascript">
			$(function() {
				function getTree() {
					// Some logic to retrieve, or generate tree structure
					var tree = [{
							text: "完善信息",
							id:"<%=basePath%>studentRegister/complete"
							<%-- href:"<%=basePath%>studentRegister/complete" --%>
						},
						{
							text: "申请修改基本信息",
							id:"<%=basePath%>studentRegister/toUpdateInfo"
						},
						{
							text: "来校确认",
							id:"<%=basePath%>studentRegister/toEnsureDate"
						},
						{
							text: "报到单打印",
							id:"<%=basePath%>studentRegister/toRegisterCard"
						}];
					return tree;
				}
				$('#tree').treeview({
					data: getTree(), //defaultData,  
					// data:alternateData,  
					enableLinks: true,
					showTags: true,
					// collapseIcon:"glyphicon glyphicon-chevron-up",  
					// expandIcon:"glyphicon glyphicon-chevron-down",  
				});
				$('#tree').on('nodeSelected', function(event, data) {
					// clickNode(event, data)    
//					alert(JSON.stringify(data));
//					alert(data.text);
//					alert(data.id);
//					document.getElementById("iframepage").src = "./" + data.id+".jsp";
					document.getElementById("iframepage").src = data.id;
					// document.getElementById("iframepage").src="http://www.baidu.com";  

					var arr = $('#tree').treeview('getSelected');
//					alert(JSON.stringify(arr));

				});
			})
		</script>
	</body>

</html>