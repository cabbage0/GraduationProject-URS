<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/statics/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath %>">
	<title>自助报到系统登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="<%=basePath %>statics/css/bootstrap.min.css" type="text/css">   
	<script type="text/javascript" src="<%=basePath %>statics/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>statics/js/bootstrap.min.js"></script>
	<style type="text/css">
		body{
			background:url('<%=basePath %>statics/image/1511510962290_Personal.jpg');
			/* background-size:100%; */
			opacity:0.8;
		}
		
	</style>
	<script type="text/javascript">
		<%-- var result = <%=request.getAttribute("result") %> ;
		alert(result);
		if(result == 1){
			alert("下载成功");
		}else{
			alert("暂时没有报到指南");
		} --%>
	/* $(function(){
		$('#download').click(function(){
			$.ajax({
				type:"POST",
				//设置为传统方式传送参数
				traditional:true,
				url:"${bathPath}AssignStudentId/getMajorId",
				dataType:"text",
				success:function(flag){
					alert(flag);
					//可以定义为对应消息框
					if(!flag){
						alert("暂时没有报到指南！");
					}
				}
			});
		});
	}) */
	
		
	</script>
</head>
<body>
	
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="page-header">
					<h1>
						<font color="white">登录界面  </font>
					</h1>
				</div>
				<div class="row clearfix">
					<div class="col-md-6 column">
						
					</div>
					<div class="col-md-4 column" style="border:1px solid black;padding:50px;margin-top:100px;background:white;">
						
						<div class="page-header" style="margin-bottom:30px;margin-top:30px;">
							<h1>
								<small>用户登录 </small>
							</h1>
						</div>
						<div>
							<form role="form" method="post" action="${bathPath}loginController/login">
								<div class="form-group">
									 <label for="exampleInputEmail1">用户名：</label><input type="text" class="form-control" id="exampleInputEmail1" name="userid" />
								</div>
								<div class="form-group">
									 <label for="exampleInputPassword1">密码：</label><input type="password" class="form-control" id="exampleInputPassword1" name="password"/>
								</div>
								<br/>
								<button type="submit" class="btn btn-default" style="position:relative;left:170px;">登录</button>
								<button type="reset" class="btn btn-default" style="position:relative;left:180px;">重置</button>
							</form>
						</div>
						<div>
							<form action="<%=basePath%>manualController/downloadManual" method="post">  
						        <input id="download" type="submit" value="下载并查看报到指南" class="btn btn-default" style="position:absolute;left:50px;bottom:65px;">  
						    </form>
					    </div>
					</div>
					<div class="col-md-2 column"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix" style="background:#484848;color:white;margin-top:50px;">
		<div class="col-md-12 column">
			<center><h3>Copyright &copy; 中北大学白劲松 版权所有</h3>
				
			</center>

		</div>
	</div>
</body>
</html>