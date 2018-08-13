<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/statics/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改班级信息</title>
</head>
<body>

	<form id="ff" method="post">
		<div>
			<label for="classid">班级编号:</label> <input type="text" name="classid" readonly="readonly"/>
		</div>
		<div>
			<label for="classtype">班级类型:</label> 
			<select id="classtype" name="classtype">
					<option value="1">普通班</option>
					<option value="0">实验班</option>
			</select>
		</div>
		<div>
			<label for="majorid">所属专业:</label> <input type="text" name="majorid" readonly="readonly"/>
		</div>
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>

	
</body>
<script type="text/javascript">
		$(function() {
		
			var win = parent.$("iframe[title='管理已有班级信息']").get(0).contentWindow;//返回ifram页面窗体对象（window)			
			var row = win.$('#dg').datagrid("getSelected");
		    //赋值
			$('#ff').form('load',{
				classid:row.classid,
				classtype:row.classtype,
				majorid:row.majorid,
			});
			
			//禁用验证
			$("#ff").form("disableValidation");

			$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : '${bathPath}classesController/ensureUpdate',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
								//可以定义为对应消息框
								if(count>0){
									alert("修改成功！");									
								}else{
									alert("修改失败！");
								}
								parent.$("#win").window("close");
								win.$("#dg").datagrid("reload");							
						}
					});
				}
			});
		});
	</script>
</html>