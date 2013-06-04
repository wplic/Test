<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page	import="com.cssweb.video.pojo.*"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.TvideoCategoryService"%>
<%@page	import="com.cssweb.video.pojo.TvideoCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 TvideoCategoryService tvideoCategoryService = (TvideoCategoryService)ctx.getBean("tvideoCategoryService");//视频分类管理
%>
<%@ include file="/commons/turnPage.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<!-- 以下为iframe高度自适应代码 -->
<SCRIPT LANGUAGE="JavaScript">
function f_frameStyleResize(targObj){
 var targWin = targObj.parent.document.all[targObj.name];
 if(targWin != null) {
  var HeightValue = targObj.document.body.scrollHeight
 if(HeightValue < 500){HeightValue = 500} 
  targWin.style.pixelHeight = HeightValue;
 }
}
function f_iframeResize(){
 bLoadComplete = true; f_frameStyleResize(self);
}
var bLoadComplete = false;
window.onload = f_iframeResize;
</SCRIPT>
<%
	List list=null;
	if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");
 %>
<body bgcolor="#f1f1f1" style="height: 250px"> 
 <form name="iptvForm" action="${ctx}/tvideo.do?method=getTpByCategoryId&category=${category}&title=${title }&videoBoard=${videoBoard }&newDateTime=${newDateTime }" method="post">  
            <%if(list!=null&&list.size()>0) {
              for(int i=0;i<list.size();i++)
              {
               TvideoProgram tvideoProgram=(TvideoProgram)list.get(i);
               String spp="sppic_box fleft ml10";
               if(i%3==0){
               spp="sppic_box fleft";
               %>
               <div class="clearfloat"></div>
               <%} %>
               <div class="<%=spp %>"> 
                	<%if(tvideoProgram.getPicId()>0){ %>
                	 <img src="${ctx}/share/showUploadImage.jsp?id=<%=tvideoProgram.getPicId()%>" width="115" height="85"/>
                	<%}else{ %>
                	<img src="${ctx}/pic/wsyyt/iptv/sppic1.jpg" />
                	<%} %>
                    <p class="font_31u">
                    <%
                      TvideoCategory tvideoCategory = tvideoCategoryService.getTvideoCategoryById(tvideoProgram.getCategory());
                     
                        String idfix="0";//默认不固定
                        if(tvideoCategory.getIsfix()!=null&&!tvideoCategory.getIsfix().equals("")&&!tvideoCategory.getIsfix().equals("null"))
                        idfix=tvideoCategory.getIsfix().trim();
                       if(idfix.equals("1"))
                        {
                        %>
                         <a href="${ctx}/tvideo.do?method=getStreamByIdCategoryId&id=<%=tvideoProgram.getId()%>" title="<%="标题:"+tvideoProgram.getTitle()%>&#13;<%=(tvideoProgram.getDocent()!=null?"主讲:"+tvideoProgram.getDocent():"")%>&#13;<%=(tvideoProgram.getContent()!=null?"内容:"+tvideoProgram.getContent():"")%>">
                         <%=tvideoProgram.getTitle().length()>9?tvideoProgram.getTitle().substring(0,9)+"...":tvideoProgram.getTitle() %></a>
                        <%
                        }else{
                    %>
                    <a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank" title="<%="标题:"+tvideoProgram.getTitle()%>&#13;<%=(tvideoProgram.getDocent()!=null?"主讲:"+tvideoProgram.getDocent():"")%>&#13;<%=(tvideoProgram.getContent()!=null?"内容:"+tvideoProgram.getContent():"")%>">
                    <%=tvideoProgram.getTitle().length()>9?tvideoProgram.getTitle().substring(0,9)+"...":tvideoProgram.getTitle() %></a>
               <%
                }
                %>
                </p></div>
                <%
              }
             }%>
             <div class="clearfloat"></div>
             <p align="center"> <%=PageUtil.pagination("window.iptvForm",totleCount, currentPage, pagesize)%></p>
    </form> 
</body>
</html>      