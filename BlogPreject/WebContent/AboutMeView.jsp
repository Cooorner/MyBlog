<%@page import="liujiawei.service.BlogAttrs"%>
<%@page import="cx.system.blogger.Blogger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" uri="/easy-layout.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<layout:render name="/basemodel.jsp">
<layout:component name="links">
<script src="${ctx}/bootstrap/js/jquery-2.0.0.js" type="text/javascript" charset="utf-8"></script>
</layout:component>
	<layout:component name="content">
	<%Blogger blogger=(Blogger)request.getSession().getAttribute(BlogAttrs.ATTR_CURRENTBLOGGER); %>
		<div class="bc">
			<div class="content" style="width: 90%;">
				<!-- 这里引用其他jsp组件    博主导航条 -->
				<jsp:include page="bloggerTorba.jsp" flush="true" />
				<div class="container-fluid">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row"></div>
							<div class="person_info">
									<img  src="<%=blogger.getHeadpicture()%>" class="img-responsive" id="previewImg"
									alt="Responsive image">
							</div>
							<form class="form-group" action="changeheadmsg.do" method="post" enctype="multipart/form-data">								
								<!-- 头像上传测试 -->
								<input id="myfile" name="headPictureFile" type="file"  onchange="showPreview(this)"/>
								<div class="text-right">
									<button class="btn btn-primary" type="submit">上传头像</button>
								</div>
								</form>
								<form class="form-group" action="changenamemsg.do" method="post">
								<!--button class="btn btn-primary" type="submit">更换头像</button-->
								<div class="form-group">
									<label for="">用户名</label> <input name="newUsername"
										class="form-control" type="text" placeholder="<%=blogger.getName()%>">
								</div>
								<div class="form-group">
									<label for="">密码</label> <input name="newPassword"
										class="form-control" type="password" placeholder="<%=blogger.getPassword()%>">
								</div>
								<div class="text-right">
									<button class="btn btn-primary" type="submit">修改资料</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>		
			<script type="text/javascript">
			function showPreview(obj){
				var str=obj.value;				
				$("#previewImg").attr("src","file:///"+str);
			}
			</script>
	</layout:component>
</layout:render>