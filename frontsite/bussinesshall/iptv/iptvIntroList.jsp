<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.*"%>
<%@page	import="com.cssweb.video.pojo.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoBoardService tvideoBoardService = (TvideoBoardService)ctx.getBean("tvideoBoardService");//视频版块管理
	 TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
	 //取视频版块 实时股评 信息做为初始化信息
	 TvideoBoard tvideoBoard=tvideoBoardService.getTvideoBoardByCode("tv_ssgp");
	 long board=0l;
	 if(tvideoBoard!=null)
	 board=tvideoBoard.getId();
	 if(request.getParameter("board")!=null&&!request.getParameter("board").equals(""))
	 {
	  board=Long.parseLong(request.getParameter("board").trim());
	 }
	 //为了防止反复的取数据 所以全部取出来放进map里面
	 List listtc=tvideoCategoryService.getTvideoCategoryByBoardId(board);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/setTab.js"></script>
</head>
<!-- 以下为iframe高度自适应代码 -->
<SCRIPT LANGUAGE="JavaScript">
function f_frameStyleResize(targObj){
 var targWin = targObj.parent.document.all[targObj.name];
 if(targWin != null) {
  var HeightValue = targObj.document.body.scrollHeight
 if(HeightValue < 300){HeightValue = 300} 
  targWin.style.pixelHeight = HeightValue;
 }
}
function f_iframeResize(){
 bLoadComplete = true; f_frameStyleResize(self);
}
var bLoadComplete = false;
window.onload = f_iframeResize;
</SCRIPT>
<body bgcolor="#f1f1f1"> 
        <div class="lmmc_box">
        	<div style="height:5px; overflow: hidden"></div>
            <p class="lmmc_txt">栏目名称</p>
            <table width="690" border="0" cellspacing="0" cellpadding="0" align="center">
             <tr>
            <%
            if(listtc!=null&&listtc.size()>0)
            	  {
            	    for(int j=0;j<listtc.size();j++)
	            	 {
	            	   TvideoCategory tvideoCategory=(TvideoCategory)listtc.get(j);
	            	    %>
		            	  <td <%=j==0?"class='mc_taghov2 red'":"class='mc_taga2'" %> id="tagtabs<%=j+1%>" onmouseover="SwitchNews('tabs', <%=j+1%>, <%=listtc.size()%>,'mc_taghov2 red','mc_taga2')"><a href="#"><%=tvideoCategory.getName() %></a></td>
		            	  
		            	 <%
	            	 }
	              }%>
	              <td class="mc_tag203"></td>
             </tr>
            </table>
            <div class="mc_content">
            	<div class="lmmc_bg2">
                <div style="height:30px"></div>
                  <%
                  if(listtc!=null&&listtc.size()>0)
            	  {
            	    for(int j=0;j<listtc.size();j++)
	            	 {
	            	   TvideoCategory tvideoCategory=(TvideoCategory)listtc.get(j);
	            	    %>
			            <div id="tabs<%=j+1%>" <%=j==0?"":"style='display:none'" %>>
		            	  <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
		            	    <tr>
		            	      <td width="53%" align="center">
		            	    &nbsp;
		            	      </td>
		            	      <td width="7%" align="center">
		            	      <img src="${ctx}/pic/wsyyt/iptv/list_09.gif" />
		            	      </td>
		            	      <td width="40%" class="lh28 font14 bold font_43"><%=tvideoCategory.getName() %></td>
		          	      </tr>
		          	    </table>
		            	  <div style="height:5px; overflow:hidden"></div>
		            	  <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
		            	    <tr>
		            	      <td width="55%" valign="top">
		            	      <%if(tvideoCategory.getPicId()>0){ %>
                               <img src="${ctx}/share/showUploadImage.jsp?id=<%=tvideoCategory.getPicId()%>" width="202" height="146" />
                              <%}else{ %>
		            	      <img src="/pic/wsyyt/iptv/lmjs_pic1.jpg" width="202" height="146" />
		            	      <%} %>
		            	      </td>
		            	      <td width="45%" class="lh28"  valign="top">
		            	        <table width="95%">
		            	         <tr>
		            	           <td height="5">&nbsp; </td>
		            	          </tr>
		            	          <tr>
		            	           <td>
		            	           <img src="${ctx}/pic/index/list_07.gif"/> <%=tvideoCategory.getIntro() %>
		            	           </td>
		            	          </tr>
		            	        </table>
		            	        
		                      </td>
		          	      </tr>
		          	     </table>
		                 </div>     	  
		            	<%
	            	 }
	              }%>
            	</div>
            </div>
            <div class="blank5"></div>               
        </div>
</body>
</html>      