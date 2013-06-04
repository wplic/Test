<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.theme.service.ThemeCategoryService"/>
<jsp:directive.page import="com.cssweb.theme.pojo.ThemeCategory"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>

<jsp:directive.page import="com.cssweb.admanger.service.AdMangerService"/>
<jsp:directive.page import="com.cssweb.admanger.pojo.AdManger"/>

<%@page import="com.cssweb.video.service.TvideoBoardService"%>
<%@page import="com.cssweb.video.service.TvideoCategoryService"%>
<%@page import="com.cssweb.video.service.TvideoProgramService"%>
<%@page import="com.cssweb.video.pojo.TvideoProgram"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
ThemeCategoryService themeCategoryService = (ThemeCategoryService) ctx.getBean("themeCategoryService");
//公益基金广告
AdMangerService adMangerService = (AdMangerService) ctx.getBean("adMangerService");
String subAdCode = "gyjj";
List adList = adMangerService.getAdListBySubAdCode(subAdCode);
//List list=themeCategoryService.getAllByGyjjshow();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证劵_社会公益基金</title>
<link href="${contextPath }/gyjj/css/community.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/gyjj/js/swfobject_source.js" type=text/javascript></script>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/csswebutf1.js"></script>
<style >
	#advlist{float:left;width:690px;overflow:hidden;}
	#advlist ul{width:2000px;}
	#advlist li{width:145px;float:left;padding:5px 16px 0 18px;}
	
	
	#productInfo {text-align: center;padding-left: 50px;}
	
	.leftrun{float:left;padding-top:30px;margin-left: 5px; margin-right: 5px;}
	.rightrun{float:left;padding-top:30px; margin-left: 5px;margin-right: 5px;}
</style>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
	
	
	//String code = request.getParameter("code");
	String code = "gy_001";

	TvideoBoardService tvideoBoardService = (TvideoBoardService)ctx.getBean("tvideoBoardService");//视频版块管理
	TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
	TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");//视频
	List proList =  tvideoProgramService.getTvideoProgramByCategoryCode(code,1);
    List butProList = tvideoProgramService.getTvideoProgramByCateCode(code);
    
    
	String[] str =new String[2];
	str[0]="tv_spjy";
	str[1]="tv_jgsrx";
	List cats = tvideoCategoryService.getTvideoCategoryByBoardCodes(str);
	pageContext.setAttribute("cats",cats);
%>		
<body>
<jsp:include page="/gyjj/index_top.jsp" />
<!-- header end -->

<div id="banner">
<div class="projector">
<table align="center"><tr>
<td align="center" id="player1">
	<%if(butProList!=null && butProList.size()>0){
    		TvideoProgram pro = null;
    		 String urlLink="";//视频链接
    		for(int i=0;i<butProList.size();i++){
    			pro = (TvideoProgram)butProList.get(i);
    			if(pro.getUrlLink()!=null)
    				urlLink=pro.getUrlLink();
    	%>
    	 <script type="text/javascript">
		var s1 = new SWFObject("http://20.gf.com.cn/gf20/js/flvplayer/flvplayer.swf","single","387","238","0");
		s1.addParam("allowfullscreen","true");
		s1.addVariable("file","<%=urlLink %>");
		s1.addVariable("image","preview.jpg");
		s1.addVariable("width","387");
		s1.addVariable("height","238");
	    s1.addVariable("shuffle","true");
	    s1.addVariable("autostart","true");
		s1.write("player1");
	</script>
	<script type="text/javascript" src="http://20.gf.com.cn/gf20/js/flvplayer/swfobject.js"></script>
	 
          <%		
    		}
    	}
    	%>
</td></tr></table>
  </div>
  <div class="hotTips">
  <jsp:include page="/gyjj/gyjjTop.jsp">
		<jsp:param name="whichCat" value="gyjj_jjhdsj"/>
         <jsp:param name="state" value="1"/>
     </jsp:include>
  </div>   
  <div class="clear"></div>
</div>
<div class="mainConter">
  <div class="grid_c2_left">
    <ul class="fastInto">
      <li><a href="${contextPath }/gyjj/project.jsp"><img src="${contextPath }/gyjj/images/fastInto_ad1.jpg" /></a></li>
      <li><a href="${contextPath }/gyjj/apply.jsp"><img src="${contextPath }/gyjj/images/fastInto_ad2.jpg" /></a></li>
      <li><a href="${contextPath }/gyjj/system.jsp"><img src="${contextPath }/gyjj/images/fastInto_ad3.jpg" /></a></li>
      <li><a href="${contextPath }/question.do?method=getGyjjQuestionList"><img src="${contextPath }/gyjj/images/fastInto_ad4.jpg" /></a></li>
      <li><a href="${contextPath }/financeMsgAction.do?method=getFinanceMessageList&ext3=4"><img src="${contextPath }/gyjj/images/fastInto_ad5.jpg" /></a></li>
    </ul>
  </div>
  <div class="grid_c2_right">
    <div class="columnOut">
      <div class="columnTitle"><h3>基金会动态</h3><span><strong><a href="${contextPath }/gyjj/news.jsp">更多</a></strong></span></div>
      <jsp:include page="/gyjj/gyjjList.jsp">
				<jsp:param name="whichCat" value="gyjj_jjhdt"/>
	           <jsp:param name="state" value="1"/>
            </jsp:include>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
    <div class="columnOut owedBox">
      <div class="columnTitle"><h3>感恩回顾</h3><span><strong><a href="${contextPath }/gyjj/topicsIndex.jsp">更多</a></strong></span></div>
      <div class="columnMain" >
      	<div class="leftrun"><a id="leftwing2" href="###"><img  src="/pic/assetManage/leftico1.gif" /></a></div>
      	<div id="advlist">
      		<ul>
      			<%if(null!=adList){
		    	for(int i=0;i<adList.size();i++){
		    		AdManger adManger = (AdManger)adList.get(i);%>
		      <li>
			      <a href="<%=adManger.getUrl()%>">
			      	<img src="${ctx}/share/showUploadImage.jsp?id=<%=adManger.getPicId()%>" width="162" height="105" />
			      </a>
			      <p style="text-align: center;">
				      <a href="<%=adManger.getUrl()%>">
				     	<%=adManger.getAdName() %>
				     </a>
			      </p>
		      
		     </li>
		      <%}
		      } %>
      		</ul>
      	</div>
      	<div class="rightrun"><a id="rightwnimg2" href="###"><img  src="/pic/assetManage/rightico1.gif" /></a></div>
    <script type="text/javascript">
		Effect.HtmlMove("advlist","ul/li","scrollLeft",5,"leftwing2","rightwnimg2",5000,1);
	</script>
      </div>
      <div class="columnButtom"><img src="${contextPath }/gyjj/images/columnButtom.jpg" /></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
<!-- foot begin -->
<jsp:include page="/gyjj/index_bottom.jsp" />
<!-- foot end -->
</body>
</html>
