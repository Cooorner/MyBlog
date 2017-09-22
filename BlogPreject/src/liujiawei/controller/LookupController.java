package liujiawei.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jmk.system.comment.Article;
import liujiawei.service.BlogAttrs;
import liujiawei.service.ContentMgr;

@Controller
public class LookupController {
	@RequestMapping("chooseArticle.do")
	public String OnChooseArticleType(HttpServletRequest request, String articleType){
		HttpSession session=request.getSession();
		if(articleType==null){
			session.setAttribute(BlogAttrs.ATTR_ARTICLETYPE,null);
			return "index";
		}	
		List<Article> list_Articles=ContentMgr.getInstance().getArticleByType(articleType);
		session.setAttribute(BlogAttrs.ATTR_ARTICLETYPE,list_Articles);
		return "index";
	}
}
