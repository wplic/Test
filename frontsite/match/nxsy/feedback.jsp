<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/global.css"rel="stylesheet" type="text/css">
<link href="${ctx }/match/nxsy/mncg/skin/default/css/font.css"rel="stylesheet" type="text/css">
<script src="${ctx }/match/nxsy/mncg/js/jquery-1.3.2.js"	type="text/javascript"></script>
<script type="text/javascript"	src="${ctx }/match/nxsy/mncg/js/commons.js"></script>
<script language="javascript">
	var JQ = jQuery.noConflict();
</script>
</head>
<body>
	<script>
	  	var errorMsg="${errorMsg}";
	  	if(errorMsg!=""){
	  		alert(errorMsg);
	  	}	  	
	</script>

	<div align="center">
		<div class="wrap comment">
		    <h3 class="title">如有任何疑问，请在这里留言，我们将尽快回复</h3>
			<form name="postForm" id="postForm"	action="/nxsyCommentAction.do?method=postComment" method="post">
				<textarea name="postContent" id="postContent" cols="80"></textarea>	<br />
				<input type="submit" class="button4 postBtn" value="提交问题">
			</form>	
			
			<form name="searchForm" id="searchForm"	action="/nxsyCommentAction.do?method=listComment" method="post">
			<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
		<div class="subMod subMod-qus">
		<c:choose>
				<c:when test="${not empty list}">
					<c:forEach var="item" items="${list}" >										 
										 <div class="qus"><strong class="rep-content">问题:</strong>
					                         	${item.content}											
											 </div>	 										
										 <div class="rep">												 				
												<p class="textIndent2"><strong class="rep-content">回复 ：</strong> ${item.replycontent}</p>
											</div>
										<div class="blank10"></div>	
								</c:forEach>			
				</c:when>
				<c:otherwise>
				<ul>
					<li>暂无数据</li>
				</ul>
				</c:otherwise>
			</c:choose>		 
								</div>		 
			
						
					
		</form>
			 <c:out value="${linkStr}" escapeXml="false" />
		</div>
	</div>

</body>
</html>