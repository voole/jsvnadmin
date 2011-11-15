<%@ page contentType="text/html;charset=UTF-8" errorPage="error.jsp"%>
<%@page import="org.svnadmin.entity.Usr"%>
<%@page import="org.svnadmin.util.I18N"%>
<%@page import="org.svnadmin.servlet.BaseServlet"%>
<%
response.setHeader("Cache-Control", "no-cache, post-check=0, pre-check=0");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "Thu, 01 Dec 1970 16:00:00 GMT");

String ctx = request.getContextPath();

Usr _usr = BaseServlet.getUsrFromSession(request);
%>

<title><%=I18N.getLbl(request,"sys.title","SVN ADMIN")%></title>
<head>

<%if(_usr == null){%>
<script>
	alert("<%=I18N.getLbl(request,"sys.timeout","超时或未登录")%>");	
	top.location="login.jsp";
</script>
<%
return;
}%>
<script src="<%=ctx%>/resources/jquery-1.7.min.js" type="text/javascript"></script>
<script src="<%=ctx%>/resources/sorttable.js"></script>
<script src="<%=ctx%>/resources/svn.js"></script>
<link rel="stylesheet" href="<%=ctx%>/resources/sorttable.css" />
</head>
<%-- 选择语言 --%>
<div style="float:right">
	<%@include file="chagelang.jsp"%>
</div>
<%-- 导航 --%>
<table width="100%" style="border-width:0px 0 0 0px;">
	<tr style="border-width:0px 0 0 0px;">
		<td align="center" style="font-size:20;font-weight:bold;border-width:0px 0 0 0px;">
			<%=I18N.getLbl(request,"sys.title","SVN ADMIN")%>
			<a style="text-decoration:none;" target="_blank" title="56099823@qq.com" href="http://code.google.com/p/jsvnadmin/"><sub style="font-size: 10px;font-weight:normal;">V ${project.version}</sub></a>
		</td>
	</tr>
	<tr style="border-width:0px 0 0 0px;">
		<td align="right" style="border-width:0px 0 0 0px;">
			 <a href="<%=ctx%>/usr"><%=I18N.getLbl(request,"main.link.user","用户")%></a> 
			 <a href="<%=ctx%>/pj"><%=I18N.getLbl(request,"main.link.pj","项目")%></a> 
			 <%if(BaseServlet.hasAdminRight(request)){ %>
			 <a href="<%=ctx%>/i18n"><%=I18N.getLbl(request,"main.link.i18n","语言")%></a> 
			 <%} %>
			 <%=_usr.getUsr()%>
			 <a href="<%=ctx%>/login?act=logout"><%=I18N.getLbl(request,"main.link.logout","退出")%></a>
		</td>
	</tr>
</table>
<hr size="1">
<%-- error message --%>
<%
String errorMsg = (String)request.getAttribute(org.svnadmin.Constants.ERROR);
if(errorMsg != null){
%>
	<div style="color:red;"><%=I18N.getLbl(request,"sys.error","错误") %> <%=errorMsg%></div>
<%}%>
