package liujiawei.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cx.system.blogger.Blogger;
import jmk.system.comment.Article;
import liujiawei.service.BlogAttrs;
import liujiawei.service.ContentMgr;
import liujiawei.test.BlogTest;

@Controller
public class WriteContentController {
	
	@RequestMapping("writeBlog.do")
	public String onWriteBlog(){
		return "bloggerWriteBlog";
	}
	
	@RequestMapping("releaseBlog.do")
	public String onReleaseBlog(HttpServletRequest request, String title, String content,String classify){		
		System.out.println("发布博文"+"title:"+title);	
		Blogger blogger=(Blogger)request.getSession().getAttribute("currentBlogger");
		ContentMgr.getInstance().addArticle(title, classify, blogger, content);
		return "bloggerOwnView";
	}
	
	@RequestMapping("releaseComment.do")
	@ResponseBody
	public String onReleaseComment(HttpServletRequest request,String content,int articleNumber,String aimBloggerName){
		HttpSession session=request.getSession();
		Blogger blogger=(Blogger)session.getAttribute(BlogAttrs.ATTR_CURRENTBLOGGER);
		ContentMgr.getInstance().addComment(content, blogger.getName(), aimBloggerName, aimBloggerName, articleNumber);
		return "yes";
	}
	
	@RequestMapping("reTellComment.do")
	@ResponseBody
	public String onreTell(String content,int articleNumber,String articlebloggerName,String meBloggerName,String aimBloggerName){
		ContentMgr.getInstance().addComment(content, meBloggerName, aimBloggerName, articlebloggerName, articleNumber);
		return "yes";
	}
	
	@RequestMapping("setlikenumber.do")
	@ResponseBody
	public String onSetLikeNumber(int articlenumber,int likenumber){
		ContentMgr.getInstance().setArticleLikeNumber(articlenumber, likenumber);
		return "yes";
	}
	
	@RequestMapping("reship.do")
	@ResponseBody
	public String onReship(HttpServletRequest request,int articlenumber){
		HttpSession session=request.getSession();
		Article article=ContentMgr.getInstance().getArticleByNumber(articlenumber);
		Blogger blogger=(Blogger)session.getAttribute(BlogAttrs.ATTR_CURRENTBLOGGER);
		ContentMgr.getInstance().addArticle(article.getTitle(), article.getType(), blogger, article.getContent());
		return "yes";
	}
	
}
