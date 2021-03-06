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
<link rel="stylesheet" type="text/css" href="css/qq.css"/>
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
							<div class="row">		
								<div class="qqBox">
			<div class="BoxHead">
				<div class="headImg">
					<img src="img/6.jpg"/>
				</div>
				<div class="internetName">90后大叔</div>
			</div>
			<div class="context">
				<div class="conLeft">
					<ul>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_04.jpg"/></div>
							<div class="liRight">
								<span class="intername">前端交流群</span>
								<span class="infor">厉害了</span>
							</div>
						</li>
						<li class="bg">
							<div class="liLeft"><img src="img/TIM图片20170926103645_19.jpg"/></div>
							<div class="liRight">
								<span  class="intername">赵鹏</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_27.jpg"/></div>
							<div class="liRight">
								<span  class="intername">web交流群</span>
								<span class="infor">666</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_21.jpg"/></div>
							<div class="liRight">
								<span  class="intername">jquery插件库</span>
								<span class="infor">这个群老开车</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_23.jpg"/></div>
							<div class="liRight">
								<span  class="intername">我的phone</span>
								<span class="infor">[文件]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_25.jpg"/></div>
							<div class="liRight">
								<span  class="intername">...</span>
								<span class="infor">[么么哒]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_27.jpg"/></div>
							<div class="liRight">
								<span  class="intername">前端交流群</span>
								<span class="infor">前端小黑：怎么才能</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_29.jpg"/></div>
							<div class="liRight">
								<span  class="intername">前端交流群</span>
								<span class="infor">大西瓜：差评，这个下面又</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_54.jpg"/></div>
							<div class="liRight">
								<span  class="intername">前端交流群</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_04.jpg"/></div>
							<div class="liRight">
								<span  class="intername">前端交流群</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_19.jpg"/></div>
							<div class="liRight">
								<span  class="intername">赵鹏</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_27.jpg"/></div>
							<div class="liRight">
								<span  class="intername">web交流群</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_21.jpg"/></div>
							<div class="liRight">
								<span  class="intername">jquery插件库</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_23.jpg"/></div>
							<div class="liRight">
								<span  class="intername">我的phone</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_25.jpg"/></div>
							<div class="liRight">
								<span  class="intername">...</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_27.jpg"/></div>
							<div class="liRight">
								<span  class="intername">前端交流群</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_29.jpg"/></div>
							<div class="liRight">
								<span  class="intername">前端交流群</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
						<li>
							<div class="liLeft"><img src="img/TIM图片20170926103645_54.jpg"/></div>
							<div class="liRight">
								<span  class="intername">前端交流群</span>
								<span class="infor">[流泪]</span>
							</div>
						</li>
					</ul>
				</div>
				<div class="conRight">
					<div class="Righthead">
						<div class="headName">赵鹏</div>
						<div class="headConfig">
							<ul>
								<li><img src="img/TIM图片20170926103645_06.jpg"/></li>
								<li><img src="img/TIM图片20170926103645_08.jpg"/></li>
								<li><img src="img/TIM图片20170926103645_10.jpg"/></li>
								<li><img src="img/TIM图片20170926103645_12.jpg"/></li>
							</ul>
						</div>
					</div>
					<div class="RightCont">
						<div class="ChatRecord">查看更多消息</div>
						<ul class="newsList">
								
						</ul>
					</div>
					<div class="RightFoot">
						<div class="emjon">
							<ul>
								<li><img src="img/1.gif"/></li>
								<li><img src="img/2.gif"/></li>
								<li><img src="img/3.gif"/></li>
								<li><img src="img/4.gif"/></li>
								<li><img src="img/5.gif"/></li>
								<li><img src="img/6.gif"/></li>
								<li><img src="img/7.gif"/></li>
								<li><img src="img/8.gif"/></li>
								<li><img src="img/9.gif"/></li>
								<li><img src="img/10.gif"/></li>
								<li><img src="img/11.gif"/></li>
								<li><img src="img/12.gif"/></li>
								<li><img src="img/13.gif"/></li>
								<li><img src="img/14.gif"/></li>
								<li><img src="img/15.gif"/></li>
								<li><img src="img/16.gif"/></li>
								<li><img src="img/17.gif"/></li>
								<li><img src="img/18.gif"/></li>
								<li><img src="img/19.gif"/></li>
								<li><img src="img/20.gif"/></li>
								<li><img src="img/21.gif"/></li>
								<li><img src="img/22.gif"/></li>
								<li><img src="img/23.gif"/></li>
								<li><img src="img/24.gif"/></li>
								<li><img src="img/25.gif"/></li>
								<li><img src="img/26.gif"/></li>
								<li><img src="img/27.gif"/></li>
								<li><img src="img/28.gif"/></li>
								<li><img src="img/29.gif"/></li>
								<li><img src="img/30.gif"/></li>
								<li><img src="img/31.gif"/></li>
								<li><img src="img/32.gif"/></li>
								<li><img src="img/33.gif"/></li>
								<li><img src="img/34.gif"/></li>
								<li><img src="img/35.gif"/></li>
								<li><img src="img/36.gif"/></li>
								<li><img src="img/37.gif"/></li>
								<li><img src="img/38.gif"/></li>
								<li><img src="img/39.gif"/></li>
								<li><img src="img/40.gif"/></li>
								<li><img src="img/41.gif"/></li>
								<li><img src="img/42.gif"/></li>
								<li><img src="img/43.gif"/></li>
								<li><img src="img/44.gif"/></li>
								<li><img src="img/45.gif"/></li>
								<li><img src="img/46.gif"/></li>
								<li><img src="img/47.gif"/></li>
								<li><img src="img/48.gif"/></li>
								<li><img src="img/49.gif"/></li>
								<li><img src="img/50.gif"/></li>
								<li><img src="img/51.gif"/></li>
								<li><img src="img/52.gif"/></li>
								<li><img src="img/53.gif"/></li>
								<li><img src="img/54.gif"/></li>
								<li><img src="img/55.gif"/></li>
								<li><img src="img/56.gif"/></li>
								<li><img src="img/57.gif"/></li>
								<li><img src="img/58.gif"/></li>
								<li><img src="img/59.gif"/></li>
								<li><img src="img/60.gif"/></li>
								<li><img src="img/50.gif"/></li>
								<li><img src="img/51.gif"/></li>
								<li><img src="img/52.gif"/></li>
								<li><img src="img/53.gif"/></li>
								<li><img src="img/54.gif"/></li>
								<li><img src="img/55.gif"/></li>
								<li><img src="img/56.gif"/></li>
								<li><img src="img/57.gif"/></li>
								<li><img src="img/58.gif"/></li>
								<li><img src="img/59.gif"/></li>
								<li><img src="img/60.gif"/></li>
								<li><img src="img/61.gif"/></li>
								<li><img src="img/62.gif"/></li>
								<li><img src="img/63.gif"/></li>
								<li><img src="img/64.gif"/></li>
								<li><img src="img/65.gif"/></li>
								<li><img src="img/66.gif"/></li>
								<li><img src="img/67.gif"/></li>
								<li><img src="img/68.gif"/></li>
								<li><img src="img/69.gif"/></li>
								<li><img src="img/70.gif"/></li>
								<li><img src="img/71.gif"/></li>
								<li><img src="img/72.gif"/></li>
								<li><img src="img/73.gif"/></li>
								<li><img src="img/74.gif"/></li>
								<li><img src="img/75.gif"/></li>
								<li><img src="img/76.gif"/></li>
								<li><img src="img/77.gif"/></li>
								<li><img src="img/78.gif"/></li>
								<li><img src="img/79.gif"/></li>
								<li><img src="img/80.gif"/></li>
								<li><img src="img/81.gif"/></li>
								<li><img src="img/82.gif"/></li>
								<li><img src="img/83.gif"/></li>
								<li><img src="img/84.gif"/></li>
								<li><img src="img/85.gif"/></li>
								<li><img src="img/86.gif"/></li>
								<li><img src="img/87.gif"/></li>
								<li><img src="img/88.gif"/></li>
								<li><img src="img/89.gif"/></li>
								<li><img src="img/90.gif"/></li>
								<li><img src="img/91.gif"/></li>
							</ul>
						</div>
						<div class="footTop">
							<ul>
								<li><img src="img/TIM图片20170926103645_31.jpg"/></li>
								<li class="ExP"><img src="img/TIM图片20170926103645_33.jpg"/></li>
								<li><img src="img/TIM图片20170926103645_35.jpg"/></li>
								<li><img src="img/TIM图片20170926103645_37.jpg"/></li>
								<li><img src="img/TIM图片20170926103645_39.jpg"/></li>
								<li><img src="img/TIM图片20170926103645_41.jpg" alt="" /></li>
								<li><img src="img/TIM图片20170926103645_43.jpg"/></li>
								<li><img src="img/TIM图片20170926103645_45.jpg"/></li>
							</ul>
						</div>
						<div class="inputBox">
							<textarea id="dope" style="width: 99%;height: 75px; border: none;outline: none;" name="" rows="" cols=""></textarea>
							<button class="sendBtn">发送(s)</button>
						</div>
					</div>
				</div>
			</div>
		</div>					
							</div>						
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="js/chat.js"></script>
				
	</layout:component>
</layout:render>