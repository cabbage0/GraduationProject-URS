<%@ page pageEncoding="UTF-8" isErrorPage="true" %>
<%@ include file="common.jsp"%>

<title>出错啦！</title>

<h2>&nbsp;&nbsp;&nbsp;<%= request.getAttribute("javax.servlet.error.status_code") %>错出没！您访问的页面不存在......</h2>

<!-- p>
信息：<%=request.getAttribute("javax.servlet.error.message")%>
&nbsp;&nbsp;&nbsp;
异常：<%=request.getAttribute("javax.servlet.error.exception_type")%>
</p -->

