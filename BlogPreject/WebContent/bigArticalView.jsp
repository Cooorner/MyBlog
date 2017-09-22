<%@page import="jmk.system.comment.Comment"%>
<%@page import="liujiawei.service.BlogAttrs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@page import="liujiawei.service.ContentMgr"%>
<%@page import="jmk.system.comment.Article"%>
<%@page import="java.util.List"%>
<%@page import="liujiawei.service.BloggerMgr"%>
<%@page import="cx.system.blogger.Blogger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" uri="/easy-layout.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>write_blog</title>
<link href="${ctx}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/bootstrap/css/visitor_css.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<% int number=(Integer)request.getAttribute(BlogAttrs.ARRT_READARTICLE); 
	Article article=ContentMgr.getInstance().getArticleByNumber(number);
%>
	<div class="bc">
		<div class="content" style="padding-top: 20px;">
			<div class="container-fluid">
				<div class="hero-unit">
					<br />
					<div class="panel panel-default"
						style="filter: alpha(opacity = 100); -moz-opacity: 1; opacity: 1;">
						<div class="panel-body">
						<!-- 单篇文章浏览 -->
						<div class="col-xs-9 col-md-9">
							<div class="blog box_css">
								<p>
									<span><%=article.getTitle()%></span>
								</p>
								 <span class="time"><%=article.getTime()%></span>
								<div><%=article.getContent()%></div>							
								<br/>
								<br/>
								<!-- 在这里添加评论框 -->
								<div class="commend">
								</div>
								<!-- 评论区 -->
								
								<label>评论列表</label>
								<div id="allcomment">
								<!-- 从数据库中读取评论信息并展示 -->
								<%
									List<Comment> list_comment=ContentMgr.getInstance().getAllCommentsByBlogid(article.getNumber());
								  for(Comment comm : list_comment){%>
									 <p>
									 <a href="toOtherBlogger.do?aimblogger=<%=comm.getSendBloggerName()%>"><%=comm.getSendBloggerName()%></a> 
									  回复   
									 <a href="toOtherBlogger.do?aimblogger=<%=comm.getAimBloggerName()%>"> <%=comm.getAimBloggerName()%></a> 
									 ：
									 <%=comm.getContent()%>
									 <%} %>
									 </p>
								</div>									
							</div>
						</div>
													
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${ctx}/bootstrap/js/jquery-2.0.0.js"></script>
	<script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>