<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/statics/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在校生报到系统后台管理页面</title>
<script type="text/javascript">
	$(function() {
		$("a[title]").click(function() {
			var text = this.href;
			//判断是否存在
			if($('#tt').tabs("exists",this.title)){
			//存在则选中
				$('#tt').tabs("select",this.title);			
			}else{
				$('#tt').tabs('add', {
					title:this.title,
					//面板有关闭按键
				    closable:true, 
				    //href对远程页面js的支持不好 
					//href: text			
					//可以加载内容填充到选项卡，页面有Js时，也可加载
					content:"<iframe src='"+text+"' title='"+this.title+"' height='100%' width='100%' frameborder='0px' ></iframe>"
				
				});
				
			}
			return false;
			
		});
	});
</script>
	
</head>

<body class="easyui-layout">
	<!-- 头部 -->
	<div class="wu-header" data-options="region:'north',border:false,split:true" style="height:60px;background:#66CCFF">
    	<div class="wu-header-left">
        	<h1>学生服务系统在校生报到子系统后台管理界面</h1>
        </div>
        <div class="wu-header-right">
        	<p><strong class="easyui-tooltip" title="n条未读消息">${sessionScope.admin.username}</strong>，欢迎您！</p>
            <p><a href="#">网站首页</a>|<a href="<%=basePath %>loginController/loginOut">安全退出</a></p>
        </div>
    </div>
	<!-- 左边导航 -->
	<div data-options="region:'west',title:'导航菜单',split:true"
		style="width:150px;">
		<div id="aa" class="easyui-accordion"
			style="width:150px;height:450px;">
			<div title="学生数据">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					
					<li style="padding: 6px;"><a href="<%=basePath %>StudentController/queryStudent" title="录入新生数据"
						style="text-decoration: none;display: block;font-weight:bold;">录入新生数据</a>
					</li>
					<li style="padding: 6px;"><a href="<%=basePath %>studentRegister/toCheckUpdate" title="审核学生修改信息请求"
						style="text-decoration: none;display: block;font-weight:bold;">审核学生修改信息请求</a>
					</li>
				</ul>
			</div>
			<div title="报到相关">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					
					<li style="padding: 6px;"><a href="<%=basePath%>classesController/queryClasses" title="管理已有班级信息"
						style="text-decoration: none;display: block;font-weight:bold;">管理已有班级信息</a>
					</li>
					<li style="padding: 6px;"><a href="<%=basePath%>AssignClass/queryStudent" title="按专业分配班级"
						style="text-decoration: none;display: block;font-weight:bold;">分配班级</a>
					</li>
					<li style="padding: 6px;"><a href="<%=basePath%>AssignStudentId/queryStudent" title="编制学号"
						style="text-decoration: none;display: block;font-weight:bold;">编制学号</a>
					</li>
				</ul>
			</div>
			<div title="其他">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="<%=basePath %>manualController/uploadManual" title="发布报到指南"
						style="text-decoration: none;display: block;font-weight:bold;">发布报到指南</a>
					</li>
				</ul>
			</div>
			
		</div>
	</div>

	<!-- 主体内容 -->
	<div data-options="region:'center',title:'主要信息'"
		style="padding:5px;background:#eee;">
		
			
		<div id="tt" class="easyui-tabs" data-options="fit:true"
			style="width:500px;height:250px;">
			<div title="系统介绍" style="padding:20px;background-image: url('<%=basePath%>statics/image/campus1.jpg');background-size:100% 100%;">学生服务系统在校生报到子系统：<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;本系统是为了迎新工作信息化、自主化而设计的，服务于新生和负责迎新工作的校方。<br/><br/>
			功能和大致流程如下：</br>
			<ul>
				<li>校方录取学生后负责把新生数据录入该系统；</li></br>
				<li>校方根据录取时该生的专业和学院信息为学生分配班级并编制学号；</li></br>
				<li>校方制定报到流程操作指南并发布，方便学生在网上报到时了解系统；</li></br>
				<li>学生在收到录取通知后再规定时间内登录系统进行网上报到；</li></br>
				<li>学生在登录系统前可以查看校方发布的操作指南和流程；</li></br>
				<li>登录后学生首先需要查看自己的基本信息，确认无误后进一步完善其他信息，若基本信息有误可以向校方提出修改申请；</li></br>
				<li>学生完善信息后，选择自己的来校时间，如有不便可以提前请假，但请假时间不得超过两周；</li></br>
				<li>网上报道流程完成后，学生可自行打印报到单，到校当天持报到单领取确认信息并领取物品；</li></br>
			</ul>
			</div>
		</div>
		
	</div>
	<div id="win" > 
	
	</div>
	 <!-- end of main --> 
    <!-- begin of footer -->
	<div class="wu-footer" data-options="region:'south',border:true,split:true">
		
    	&copy; 中北大学    软件学院   白劲松
    </div>

</body>

</html>