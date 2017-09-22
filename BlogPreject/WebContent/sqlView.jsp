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
	<div class="bc">
		<div class="content" style="padding-top: 20px;">
			<div class="container-fluid">
				<div class="hero-unit">
					<br />
					<div class="panel panel-default"
						style="filter: alpha(opacity = 100); -moz-opacity: 1; opacity: 1;">
						<div class="panel-body">
							<div class="col-xs-9 col-md-9">
								<!-- sql语句的获取和执行 -->
								<form class="form-group" action="onsql.do" method="post">
									<div class="form-group">
										<label for="">输入sql语句</label>
										<textarea class="form-control" rows="15" width="15px"
											name="sqlcontent">SELECT * FROM myblog.article;</textarea>
									</div>
									<div class="text-right">
										<button class="btn btn-primary" type="submit">执行</button>
										<!--  button class="btn btn-primary" type="submit">发私信</button>-->
									</div>
								</form>
								<div class="form-group">
										<label for="">执行日志</label>
										<textarea class="form-control" rows="15" width="15px"
											name="content"><%=request.getAttribute("sqlresult") %>></textarea>
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