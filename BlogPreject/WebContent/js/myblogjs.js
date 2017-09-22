/**
 * 存放博客相关js
 */
//点击评论按钮
		function onBtnComment(blogid,bloggername,mebloggername){
		//	alert(str);
			var commentdiv=$('#'+blogid).find('.commend');
		    if(commentdiv.children('textarea').length==0){
		    	var inputArea="<textarea style=\"width:100%\" rows=\"4\" cols=\"100px\">写评论</textarea> <br/> <button type=\"button\" class=\"btn btn-info\">发表评论</button>";
		    	commentdiv.append(inputArea);
				var btn_submit=commentdiv.children('button');
				//点击提交
				btn_submit.click( function () { 
					var commentText=commentdiv.children('textarea').val();
					$.post(
					"releaseComment.do",
					{content:commentText,articleNumber:blogid,aimBloggerName:bloggername},
					function(data){
						commentdiv.empty();
						//在这里刷新评论列表
						var allcommentdiv=$('#'+blogid).find('#allcomment');
						var retellHTML="<p>"+
						 "<a href=\"toOtherBlogger.do?aimblogger="+mebloggername+"\">"+ mebloggername+"</a>"+
						 "回复"+
						 "<a href=\"toOtherBlogger.do?aimblogger="+bloggername+"\">"+ bloggername+"</a>"+ 
						 "："+
						 commentText+
						 "<a href=\"javascript:void(0);\" onclick=\"onBtnReTell("+
						 "'"+blogid+"',"+
						 "'"+bloggername+"',"+
						 "'"+mebloggername+"',"+
						 "'"+bloggername+"',"+
						 "this)\">回复</a>"+
						 "</p>";
					//	var com="<p>"+mebloggername+"  回复   "+bloggername+" : "+commentText+retellHTML+"</p>";
						allcommentdiv.append(retellHTML);
						commentdiv.empty();
					})
				});
		    }else{
		    	commentdiv.empty();
		    }
			return false;//在ie6下，如果不写return false可能有问题。
		}
		//点击回复按钮
		function onBtnReTell(blogid,bloggername,mebloggername,aimbloggername,btn){
			var p=$(btn).parent('p');
			if(p.children('#retellarea').length==0){
				var inputArea="<div id=\"retellarea\"><textarea style=\"width:100%\" rows=\"4\" cols=\"100px\">写评论</textarea> <br/> <button type=\"button\" class=\"btn btn-info\">发表评论</button></div>";
				p.append(inputArea);
				var btn_submit=p.find('#retellarea').children('button');
				//点击提交
				btn_submit.click( function () { 
					var commentText=p.find('#retellarea').children('textarea').val();
					$.post(
					"reTellComment.do",
					{
						content:commentText,
						articleNumber:blogid,
						articlebloggerName:bloggername,
						meBloggerName:mebloggername,
						aimBloggerName:aimbloggername
					 },
					function(data){
						 p.find('#retellarea').detach();
						//在这里刷新评论列表
						var allcommentdiv=$('#'+blogid).find('#allcomment');
						var retellHTML=
						 "<p>"+
						 "<a href=\"toOtherBlogger.do?aimblogger="+mebloggername+"\">"+ mebloggername+"</a>"+
						 "回复"+
						 "<a href=\"toOtherBlogger.do?aimblogger="+aimbloggername+"\">"+ aimbloggername+"</a>"+ 
						 "："+
						 commentText+
						 "<a href=\"javascript:void(0);\" onclick=\"onBtnReTell("+
						 "'"+blogid+"',"+
						 "'"+bloggername+"',"+
						 "'"+mebloggername+"',"+
						 "'"+aimbloggername+"',"+
						 "this)\">回复</a>"+
						 "</p>";
						allcommentdiv.append(retellHTML);
					})
				});
			}else{
				p.find('#retellarea').detach();
			}
		}
		//点击点赞按钮
		function onBtnAddLikeNumber(articleNumber,likeNumber,btn){
			likeNumber++;
			$.post(
					"setlikenumber.do",
					{articlenumber:articleNumber,likenumber:likeNumber},
					function(data){
						alert("点赞成功");
					})
		}
		//点击转载按钮
		function onBtnReship(articleNumber){
			$.post(
					"reship.do",
					{articlenumber:articleNumber},
					function(data){
						alert("转载成功");
					})
		}
		
		//点击删除按钮
		function onBtnDeleteArticle(articlenumber,btn){			
			$.post(
					"onDeleteArticle.do",
					{articleNumber:articlenumber},
					function(data){
						alert("删除成功");
						$('#'+articlenumber).detach();
					})
		}
		