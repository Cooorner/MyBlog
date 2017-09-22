package liujiawei.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import liujiawei.service.BlogAttrs;

@Controller
public class ReadArticleController {
	@RequestMapping("readarticle.do")
	public String readArticle(HttpServletRequest request, int articleNumber){
		request.setAttribute(BlogAttrs.ARRT_READARTICLE, articleNumber);
		return "bigArticalView";
	}
}
