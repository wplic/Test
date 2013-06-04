<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/job/job.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>

<!--IE6下PNG透明代码开始-->
<script type="text/javascript" src="js/jquery.js"></script>
<!--[if IE 6]>
<script src="js/DD_belatedPNG_0.0.8a.js" mce_src="js/DD_belatedPNG_0.0.8a.js"></script>
<script type="text/javascript">DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--IE6下PNG透明代码结束-->

</head>
    <% 
    	String category1="rczq_tfzgf";  
    	 String content= "";
    %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页</a> -<a href="${contextPath }/job/index.html">人才招聘</a> - 腾飞在广发</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/job/job_lmenu.jsp" />
        <div class="blank5"></div>
        <iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/job/job_login.jsp"
						frameBorder="0" noresize width="100%" scrolling="no" height="198"></iframe>
    <div class="blank5"></div>
<jsp:include page="faq.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
 <div class="fly">
      <div class="fly_video">
     
        <div class="fly_video_con1" style="display:block;">
		<!--用于插入广发司歌Start-->
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="300" height="235" id="FLVPlayer">
          <param name="movie" value="FLVPlayer_Progressive.swf" />
          <param name="salign" value="lt" />
          <param name="quality" value="high" />
          <param name="scale" value="noscale" />
          <param name="FlashVars" value="&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=swf/MV&autoPlay=true&autoRewind=true" />
          <embed src="FLVPlayer_Progressive.swf" flashvars="&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=swf/MV&autoPlay=true&autoRewind=true" quality="high" scale="noscale" width="300" height="235" name="FLVPlayer" salign="LT" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />        
</object>
		<!---插入司歌End-->
		</div>
      
      </div>
      <p> 　　我们欢迎具有健全人格和专业智慧的优秀人员加入广发证券；在这里，员工始终处于公司的中心，并根据个人的特长调整到相应的岗位，我们强调所有员工首先要具备良好的团队合作精神和进取态度，这样才能让我们保持长久的服务优势和竞争优势，并能快速针对客户的需求找到最具创新精神的解决方案。在广发证券，我们认识到，保持并增强公司的竞争力需要一支多元化和精诚合作的工作团队，他们具备宽广的视野和进取的精神。 <br />
        <br />
         　　我们能够提供给您的机会将超过您一般的预期。在这里，您可以获得具有挑战性的工作机会和经历。您得到的将不仅仅是一段职业经历，更是一个了解社会、体验成长的大舞台。您会融入一个既激动人心，又有亲和力的工作环境之中。您将与许多成功和富有远见的人共事，并在这一个宽松祥和的环境中互相协助，共同发展！ </p>
      <div class="icon_flash">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,19,0" width="455" height="100" name="icon_flash" id="icon_flash">
          <param name="allowScriptAccess" value="sameDomain" />
          <param name="movie" value="swf/icon_flash.swf">
          <param name="quality" value="high">
          <param name="wmode" value="transparent">
          <!--此处根据页面需要决定是否添加-->
          <embed src="swf/icon_flash.swf" quality="high" allowscriptaccess="sameDomain" wmode="transparent" pluginspage="" type="application/x-shockwave-flash" width="455" height="100" name="icon_flash" id="icon_flash"></embed>
        </object>
      </div>
    </div>
    <script type="text/javascript">
$(document).ready(
	//层切换
	$("#fly_video_tit1").click(
		function (){
			$(this).addClass("hover1");
			$(".fly_video_con1").show();
			$("#fly_video_tit2").removeClass("hover2");
			$(".fly_video_con2").hide();
		}
	),
	$("#fly_video_tit2").click(
		function (){
			$(this).addClass("hover2");
			$(".fly_video_con2").show();
			$("#fly_video_tit1").removeClass("hover1");		
			$(".fly_video_con1").hide();
		}
	)
	
);
</script> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>