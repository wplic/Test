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
   <div class="activity">
   <div class="buttons">
	 <a href="training.jsp" class="regular">
	  培训发展
    </a>
	
	 <a href="culture.jsp" class="regular">
        
      企业文化
    </a>

    <a href="activity.jsp" class="positive">
      
      员工活动
    </a>  
	</div>
      <p>　　被业界称为"博士军团"的广发人，不仅在业务方面开拓进取，也享受着丰富的文体生活。<br />
 　　公司共成立了太极、羽毛球、冰雪、网球、爬山、瑜伽、亲子、摄影、游泳、乒乓球、读书、足球、篮球等十余个员工俱乐部，并定期举办形式多样的文体活动和年度旅游，员工业余生活充实而又富有活力，其乐融融。</p>
 <div class="activity_flash">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,19,0" width="645" height="370" name="icon_flash" id="icon_flash">
          <param name="allowScriptAccess" value="sameDomain" />
          <param name="movie" value="swf/culture.swf">
          <param name="quality" value="high">
          <param name="wmode" value="transparent">
          <!--此处根据页面需要决定是否添加-->
          <embed src="swf/culture.swf" quality="high" allowscriptaccess="sameDomain" wmode="transparent" pluginspage="" type="application/x-shockwave-flash" width="645" height="370" name="icon_flash" id="icon_flash"></embed>
        </object>
 
 </div>
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>