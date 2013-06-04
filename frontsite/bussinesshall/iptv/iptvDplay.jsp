<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.*"%>
<%@page	import="com.cssweb.video.pojo.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoBoardService tvideoBoardService = (TvideoBoardService)ctx.getBean("tvideoBoardService");//视频版块管理
	 TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
	 TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");//视频
	 //取视频版块管理全部数据
	 List listtb=tvideoBoardService.getTvideoBoardAllBySp();
	 //为了防止反复的取数据 所以全部取出来放进map里面
	 List listtc=tvideoCategoryService.getTvideoCategoryAll();
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>

 <script type="text/javascript">
 		function  iptvIfmListByTitle(){
 		  var title = document.getElementById("title").value;
 		  var url="${ctx }/tvideo.do?method=getTpByCategoryId";
 		  if(title!="")
 		  {
 		    url=url+"&title="+encodeURI(title);
 		  }
 		  document.getElementById("iptvIfm").src=url;
 	}
 	function iptvIfmListByCategory(category){
 		  var url="${ctx }/tvideo.do?method=getTpByCategoryId";
 		  url=url+"&category="+category;
 		  document.getElementById("iptvIfm").src=url;
 	}
 	function iptvIfmListByCategorySysdate(category){
 		  var url="${ctx }/tvideo.do?method=getTpByCategoryId";
 		  url=url+"&category="+category+"&newDateTime=1";
 		  document.getElementById("iptvIfm").src=url;
 	}
 	function iptvIfmListByCategoryStream(id){
 		  var url="${ctx }/tvideo.do?method=getStreamByIdCategoryId";
 		  url=url+"&id="+id;
 		  document.getElementById("iptvIfm").src=url;
 	}
 	function iptvIfmListByCategoryStreamSysdate(id){
 		  var url="${ctx }/tvideo.do?method=getStreamByIdCategoryId";
 		  url=url+"&id="+id+"&newDateTime=1";
 		  document.getElementById("iptvIfm").src=url;
 	}
 </script>
<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a> &gt; <a href="${ctx }/bussinesshall/iptv/iptv.jsp?nav=wsyyt&nav1=iptvsp">GFTV</a> &gt;  视频点播</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
    <div class="iptvside_mid">
        <jsp:include page="iptv_lmenu.jsp" />
    </div>
    <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">
  		<div class="left_tit2">
  		  <table width="98%" border="0" cellspacing="0" cellpadding="0" style=" text-indent:0px">
  		    <tr>
  		      <td width="5%">&nbsp;</td>
  		      <td width="17%" class="red bold">视频点播</td>
  		      <td width="26%">&nbsp;</td>
  		      <td width="17%" class="font_43 font_normal">
  		       
  		      </td>
  		      <td width="26%" class="font_43 font_normal">
  		         视频检索 关键字<input type="text" name="title" id="title" class="input108" style="width:70px" />
  		      </td>
  		      <td width="9%" class="red bold" align="center"><a href="#" onclick="iptvIfmListByTitle();"><img src="/pic/wsyyt/but_cx1.jpg" /></a></td>
	        </tr>
	      </table>
		</div>
<table class="mt10">
  <tr>
    <td class="bor_d2" valign="top" bgcolor="#f4f4f4">
    <table width="159" class="spdp_menu">
     	<%if(listtb!=null&&listtb.size()>0)
            	{
            	 String newDateTime=sdf.format(new Date());
            	 for(int i=0;i<listtb.size();i++)
            	 {
            	   TvideoBoard tvideoBoard=(TvideoBoard)listtb.get(i);
            	  %>
            	  <tr>
                    <td <%=i==0?"class='tdhov bold'":"class='td bold'" %>class="td bold" id="tagtabs<%=i+1 %>" onclick="SwitchNews('tabs', <%=i+1 %>, <%=listtb.size()%>,'tdhov bold','td bold')"><a href="#"><%=tvideoBoard.getName() %></a></td>
                  </tr>
            	  <%
            	  if(listtc!=null&&listtc.size()>0)
            	  {
            	     %>
            	  <tr id="tabs<%=i+1 %>" style=" display:none">
                    <td bgcolor="#ffffff">
                    <ul>
            	  <%
            	    for(int j=0;j<listtc.size();j++)
	            	 {
	            	    if(!tvideoBoard.getCode().equals("0001"))
	            	    {
	            	     TvideoCategory tvideoCategory=(TvideoCategory)listtc.get(j);
	            	     if(tvideoCategory.getBoardId()==tvideoBoard.getId()){
	            	      if(tvideoCategory.getIsfix()!=null&&!tvideoCategory.getIsfix().equals("")&&!tvideoCategory.getIsfix().equals("null")&&tvideoCategory.getIsfix().equals("1")){
	            	         long pid=0;
	            	         Map map=new HashMap();
							 map.put("category", tvideoCategory.getId());
							 //map.put("newDateTime", "1");
							 List lists = tvideoProgramService.getTvideoProgramByCategoryId(map, 1, 3);
							 if(lists!=null&&lists.size()>0)
							 {
							  TvideoProgram tvideoProgram=(TvideoProgram)lists.get(0);
							  pid=tvideoProgram.getId();
							 }
	            	      %>
	            	      <li><a href="#" onclick="iptvIfmListByCategoryStream(<%=pid %>);"><%=tvideoCategory.getName() %></a></li>
	            	      <%
	            	      }else{
	            	      %>
		            	  <li><a href="#" onclick="iptvIfmListByCategory(<%=tvideoCategory.getId() %>);"><%=tvideoCategory.getName() %></a></li>
		            	  <%
		            	   }
		                 }
		                }else{
		                TvideoCategory tvideoCategory=(TvideoCategory)listtc.get(j);
	            	     if(tvideoCategory.getBoardId()==tvideoBoard.getId()){
	            	      if(tvideoCategory.getIsfix()!=null&&!tvideoCategory.getIsfix().equals("")&&!tvideoCategory.getIsfix().equals("null")&&tvideoCategory.getIsfix().equals("1")){
	            	         long pid=0;
	            	         Map map=new HashMap();
							 map.put("category", tvideoCategory.getId());
							 List lists = tvideoProgramService.getTvideoProgramByCategoryId(map, 1, 3);
							 if(lists!=null&&lists.size()>0)
							 {
							  TvideoProgram tvideoProgram=(TvideoProgram)lists.get(0);
							  pid=tvideoProgram.getId();
							 }
	            	      %>
	            	      <li><a href="#" onclick="iptvIfmListByCategoryStreamSysdate(<%=pid %>);"><%=tvideoCategory.getName() %></a></li>
	            	      <%
	            	      }else{
	            	      %>
		            	  <li><a href="#" onclick="iptvIfmListByCategorySysdate(<%=tvideoCategory.getId() %>);"><%=tvideoCategory.getName() %></a></li>
		            	  <%
		            	   }
		                 }
		               }
	            	 }
	            	   %>
	            	   </ul>
            	   </td>
                  </tr>
            	  <%}
            	 }
            	 %>
            	 <tr>
                    <td class='td bold'><a href="http://edu.sse.com.cn/sseportal/newedu/c05/c02/p1442/c200502_p1442.shtml" target="_blank">基股三人行</a></td>
                  </tr>
            	 <tr>
                    <td class='td bold'><a href="http://edu.sse.com.cn/sseportal/webapp/newedu/bseduinfo?TYPE=4&GOTOPAGE=1" target="_blank">证券大讲堂</a></td>
                  </tr>
            	 <%
            	} %>
    </table></td>
    <td width="8">&nbsp;</td>
    <td valign="top" bgcolor="#f1f1f1" width="100%" class="p20" height="500">
       <iframe id="iptvIfm" name="iptvIfm" src="${ctx }/tvideo.do?method=getTpByCategoryId" frameborder="0" marginheight="0" marginwidth="0"  noresize height="100%" width="100%" scrolling="no">
                   </iframe>
    </td>
  </tr>
</table>

  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

</body>
</html>