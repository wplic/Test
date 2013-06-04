<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="com.cssweb.video.service.TvideoBoardService"/>
<jsp:directive.page import="com.cssweb.video.service.TvideoCategoryService"/>
<jsp:directive.page import="com.cssweb.video.service.TvideoProgramService"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.cssweb.video.pojo.TvideoBoard"/>
<jsp:directive.page import="com.cssweb.video.pojo.TvideoCategory"/>
<%@ include file="/commons/taglibs.jsp"%>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx }/js/setTab.js"></script>
<script type="text/javascript">
<!--
		function iptvIfmListByCategory(category){
 		  var url="${ctx }/tvideo.do?method=getTpByCategoryId";
 		  url=url+"&category="+category;
 		  document.getElementById("iptvIfm").src=url;
 	}
 	
//-->
</script>

<%
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoBoardService tvideoBoardService = (TvideoBoardService)ctx.getBean("tvideoBoardService");//视频版块管理
	 TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
	 TvideoProgramService tvideoProgramService = (TvideoProgramService)ctx.getBean("tvideoProgramService");//视频
	 //取视频版块管理全部数据
	 List listtb=tvideoBoardService.getTvideoBoardAll();
	 //为了防止反复的取数据 所以全部取出来放进map里面
	 List listtc=tvideoCategoryService.getTvideoCategoryAll();
%>

<table class="mt10">

  <tr>
    <td class="bor_d2" valign="top" bgcolor="#f4f4f4">
    <table width="159" class="spdp_menu">
      
      <%if(listtb!=null&&listtb.size()>0)
            	{
            	 for(int i=0;i<listtb.size();i++)
            	 {
            	   TvideoBoard tvideoBoard=(TvideoBoard)listtb.get(i);
            	   if(tvideoBoard.getCode().equals("tv_jgsrx")){
            	  %>
            	  <tr>
                    <td class='tdhov bold' class="td bold" id="tagtabs<%=i+1 %>" ><a href="#"><%=tvideoBoard.getName() %></a></td>
                  </tr>
            	  <%
            	  if(listtc!=null&&listtc.size()>0)
            	  {
            	     %>
            	  <tr id="tabs<%=i+1 %>" >
                    <td bgcolor="#ffffff">
                    <ul>
            	  <%
            	    for(int j=0;j<listtc.size();j++)
	            	 {
	            	   TvideoCategory tvideoCategory=(TvideoCategory)listtc.get(j);
	            	     if(tvideoCategory.getBoardId()==tvideoBoard.getId()){
	            	    %>
		            	  <li><a href="#" onclick="iptvIfmListByCategory(<%=tvideoCategory.getId() %>);"><%=tvideoCategory.getName() %></a></li>
		            	  <%
		                  }
	            	 }
	            	   %>
	            	   </ul>
            	   </td>
                  </tr>
            	  <%}
            	  }
            	 }
            	} %>
      
      
    </table></td>
    <td width="8">&nbsp;</td>
    <td valign="top" bgcolor="#f1f1f1" class="p20">
    <div class="sppic_box fleft"> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
      <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
    </div>
      <div class="sppic_box fleft ml20"> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="sppic_box fleft ml20""> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="clearfloat"></div>
      <div class="sppic_box fleft"> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="sppic_box fleft ml20"> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="sppic_box fleft ml20""> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="clearfloat"></div>
      <div class="sppic_box fleft"> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="sppic_box fleft ml20"> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="sppic_box fleft ml20""> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="clearfloat"></div>
      <div class="sppic_box fleft"> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="sppic_box fleft ml20"> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="sppic_box fleft ml20""> <a href="#"><img src="/pic/wsyyt/iptv/sppic1.jpg" /></a>
        <p class="font_31u"><a href="#">花旗前两个月实现赢利</a></p>
      </div>
      <div class="clearfloat"></div>
      <p align="center">页次: 1 / 6 每页 15 行 共 83 行 <a href="#">首 页</a> <a href="#">下一页</a> <a href="#">末页</a></p></td>
  </tr>
</table>
