package liujiawei.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.xml.sax.Attributes;

import com.sun.crypto.provider.BlowfishCipher;

import cx.system.blogger.Blogger;
import liujiawei.service.BlogAttrs;
import liujiawei.service.BloggerMgr;
import liujiawei.test.BlogTest;
/*http://localhost:8080/BlogPreject/blog/login.do?username=1&password=1
*/
@Controller
public class LoginController {
	@RequestMapping("login.do")
    public String login(HttpServletRequest request, String username,String password){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(username.equals("admin")&&password.equals("admin")){
			return "adminview";
		}
		HttpSession session = request.getSession();
		Blogger blogger=BloggerMgr.getInstance().checkBlogger(username, password);
		if(blogger!=null){
			System.out.println(blogger.getName());
			session.setAttribute(BlogAttrs.ATTR_CURRENTBLOGGER, blogger);
		}
		return (String)session.getAttribute(BlogAttrs.ATTR_CURRENTVIEW);
    }
	
	@RequestMapping("toLogout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute(BlogAttrs.ATTR_CURRENTBLOGGER, null);
		return (String)session.getAttribute(BlogAttrs.ATTR_CURRENTVIEW);
	}
	
	@RequestMapping("regist.do")
	public String regist(HttpServletRequest request,String username,String password){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		System.out.println("name:"+username+"password"+password);
		Blogger blogger=BloggerMgr.getInstance().addBlogger(username, password);
		if(blogger!=null){
			session.setAttribute(BlogAttrs.ATTR_CURRENTBLOGGER, blogger);
		}else {
			session.setAttribute(BlogAttrs.ATTR_CURRENTBLOGGER, null);
		}
		return (String)session.getAttribute(BlogAttrs.ATTR_CURRENTVIEW);
	}
	
	@RequestMapping("changeheadmsg.do")
	public String onChangeHeadMsg(HttpServletRequest request,MultipartFile headPictureFile) {
		HttpSession session=request.getSession();
		String filePath="pictures/head1.jpg";
		String savePath=null;
		if(!headPictureFile.isEmpty()){
			savePath="upload/"+headPictureFile.getOriginalFilename();
			filePath=session.getServletContext().getRealPath("/")+savePath;
			try {
				headPictureFile.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			savePath=filePath;
		}
		Blogger bloggerOld=(Blogger)session.getAttribute(BlogAttrs.ATTR_CURRENTBLOGGER);
		bloggerOld.setHeadpicture(savePath);
		BloggerMgr.getInstance().UpdateBlogger(bloggerOld, bloggerOld.getName());		
		return "AboutMeView";
	}
	
	@RequestMapping("changenamemsg.do")
	public String onChangenameMsg(HttpServletRequest request, String newUsername,String newPassword) {
		HttpSession session=request.getSession();
		Blogger bloggerOld=(Blogger)session.getAttribute(BlogAttrs.ATTR_CURRENTBLOGGER);
		String oldName=bloggerOld.getName();
		bloggerOld.setName(newUsername);
		bloggerOld.setPassword(newPassword);
		BloggerMgr.getInstance().UpdateBlogger(bloggerOld, oldName);
		return "AboutMeView";
	}
	
}
