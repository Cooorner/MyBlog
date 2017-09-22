<%@page import="jmk.system.comment.Comment"%>
<%@page import="liujiawei.service.BlogAttrs"%>
<%@page import="cx.system.blogger.Blogger"%>
<%@page import="liujiawei.service.ContentMgr"%>
<%@page import="liujiawei.service.BloggerMgr"%>
<%@page import="jmk.system.comment.Article"%>
<%@page import="java.util.List"%>
<%@page import="liujiawei.test.BlogTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" uri="/easy-layout.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:render name="/basemodel.jsp">
<%request.getSession().setAttribute("currentview", "index"); %>
<%Blogger blogger=(Blogger)request.getSession().getAttribute(BlogAttrs.ATTR_CURRENTBLOGGER); %>
<layout:component name="links">
<script type="text/javascript" charset="utf-8"
	src="uediter/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="uediter/ueditor.all.min.js">	
</script>
<script type="text/javascript" charset="utf-8"
	src="uediter/lang/zh-cn/zh-cn.js"></script>
</layout:component>
	<layout:component name="content">
	
		<div class="hero-unit" style="padding-top:20px;color:wheat;">
			<h1>欢迎来到Black Pearl</h1>
			<p>您的故事从这里开始分享</p>
		</div>
		
		<ul class="nav nav-list">
			<li class="divider"></li>
		</ul>
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="sub_title">
						<span>精品推荐</span>
					</div>
					<!-- 以此为模板，将博主博文信息展示出来 -->
					<% List<Article> list_aArticles =null;
					list_aArticles=(List<Article>)request.getSession().getAttribute(BlogAttrs.ATTR_ARTICLETYPE);
					if(list_aArticles==null){
						list_aArticles= ContentMgr.getInstance().getArticleByRecomand();
					}		
					   for(Article articleTemp : list_aArticles)
					   {%>
					<div class="row border_buttom"  id="<%=articleTemp.getNumber()%>">
						<div class="col-xs-3 col-md-3 ">
							<div class="person_info">
								<%Blogger blogger_article=BloggerMgr.getInstance().getBkiggerByName(articleTemp.getBloggerName()); %>
								<img src="<%=blogger_article.getHeadpicture()%>" class="img-responsive"
									alt="Responsive image">
								<a href="toOtherBlogger.do?aimblogger=<%=articleTemp.getBloggerName()%>"><%=articleTemp.getBloggerName()%></a>
							</div>
						</div>
						<div class="col-xs-9 col-md-9">
							<div class="blog box_css">
								<p>
									<span><%=articleTemp.getTitle()%></span>
								</p>
								<div class="reship">
									<b>
									<%if(blogger==null){ %>
										<a data-toggle="modal" data-target="#login" href="">转载请登录</a>
									<%}else{ %>
										<a href="javascript:void(0);" 
										   onclick="onBtnReship('<%=articleTemp.getNumber()%>')">转载</a>
									<%} %>	
									</b>
									<a><i class="glyphicon glyphicon-share-alt" aria-label="Right Align"></i></a>
								</div>
								 <span class="time"><%=articleTemp.getTime()%></span>
								<div><%=articleTemp.getContent()%></div>
								<div>
									<ul class="ul_dia">
										<%if(blogger==null){ %>
											<li><a data-toggle="modal" data-target="#login" href=""><i class="glyphicon glyphicon-comment"></i> 评论请先登录</a></li>
										<%} else{%>
											<li><a href="javascript:void(0);" 
											onclick="onBtnComment('<%=articleTemp.getNumber()%>','<%=articleTemp.getBloggerName()%>','<%=blogger.getName()%>')">
										<i class="glyphicon glyphicon-comment"></i>评论</a></li>
										<%} %>										
										<li><a href="javascript:void(0);" 
												onclick="onBtnAddLikeNumber(<%=articleTemp.getNumber()%>,<%=articleTemp.getReadCount() %>,this)">
												<i class="glyphicon glyphicon-thumbs-up"></i>点赞(<%=articleTemp.getReadCount()%>)</a></li>
									</ul>
									<p class="whole">
										<a>查看全文&nbsp;&nbsp;&nbsp;</a><a><b
											class="caret"></b></a>
									</p>
										<br/>			
									</div>
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
									List<Comment> list_comment=ContentMgr.getInstance().getAllCommentsByBlogid(articleTemp.getNumber());
								  for(Comment comm : list_comment){%>
									 <p>
									 <a href="toOtherBlogger.do?aimblogger=<%=comm.getSendBloggerName()%>"><%=comm.getSendBloggerName()%></a> 
									  回复   
									 <a href="toOtherBlogger.do?aimblogger=<%=comm.getAimBloggerName()%>"> <%=comm.getAimBloggerName()%></a> 
									 ：
									 <%=comm.getContent()%>
									 <%if(blogger!=null){ %>
									 <a href="javascript:void(0);" onclick="onBtnReTell(
									 '<%=articleTemp.getNumber()%>',
									 '<%=articleTemp.getBloggerName()%>',
									 '<%=blogger.getName()%>',
									 '<%=comm.getSendBloggerName()%>',
									 this)">回复</a>
									 <%}else{ %>
									 <a data-toggle="modal" data-target="#login" href="">回复请先登录</a>
									 <%} %>
									 </p>
									<%} %>
								</div>									
							</div>
						</div>
					</div>
					<% } %>
				</div>
			</div>
		<script src="${ctx}/bootstrap/js/jquery-2.0.0.js"></script>
		<script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>		
		<script	src="${ctx}/js/myblogjs.js"></script>		
	</layout:component>

</layout:render>