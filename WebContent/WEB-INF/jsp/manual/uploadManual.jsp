<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>  
<%@ include file="/statics/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>发布报到指南</title> 
	<%-- <link rel="stylesheet" href="<%=basePath %>statics/css/bootstrap.min.css" type="text/css"> --%>
	<link rel="stylesheet" href="<%=basePath %>statics/css/fileinput.min.css" type="text/css">  
	<script type="text/javascript" src="<%=basePath %>statics/js/jquery-3.2.1.min.js"></script>
	<%-- <script type="text/javascript" src="<%=basePath %>statics/js/bootstrap.min.js"></script> --%>
	<script type="text/javascript" src="<%=basePath %>statics/js/fileinput.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>statics/js/zh.min.js"></script> 
</head>  
<body>
  	<hr>
    <form action="<%=basePath%>manualController/publishManual" method="post" enctype="multipart/form-data">  
        <input type="file" name="file" width="120px"> <input type="submit" value="发布">  
    </form>  
    <hr>  
    <!-- <form action="http://localhost:8080/uploadDemo/rest/file/down" method="get">  
        <input type="submit" value="下载">  
    </form>   -->
    <%-- <form action="<%=basePath%>manualController/publishManual" method="post" enctype="multipart/form-data">
	  	<label class="control-label">选择文件</label>>
	    <input type="file" class="file">
    </form>  --%>
</body>  
</html>  