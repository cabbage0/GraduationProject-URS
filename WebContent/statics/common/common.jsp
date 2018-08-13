<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Calendar" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link type="text/css" rel="stylesheet" href="<%=basePath %>statics/css/dtree.css" />
<script type="text/javascript" src="<%=basePath %>statics/js/dtree.js"></script>

<link rel="stylesheet" type="text/css" href="<%=basePath %>statics/easyui/1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>statics/css/my.css">
 <link rel="stylesheet" type="text/css" href="<%=basePath %>statics/css/icon.css">
<script type="text/javascript" src="<%=basePath %>statics/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>statics/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>statics/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>

