
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/><%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page	import="com.cssweb.video.pojo.*"%>
<%@page import="java.util.List"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@ include file="/commons/taglibs.jsp"%>
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
 <form name="iptvForm" action="${ctx}/tvideo.do?method=getTpByCategoryId&category=${category}&title=${title }&videoBoard=${videoBoard }" method="post">  
            <%if(list!=null&&list.size()>0) {
              for(int i=0;i<list.size();i++)
              {
               TvideoProgram tvideoProgram=(TvideoProgram)list.get(i);
               String spp="sppic_box fleft ml10";
               if(i%4==0){
               spp="sppic_box fleft";
               %>
               <div class="clearfloat"></div>
               <%} %>
               <div class="<%=spp %>"> 
                	 <a href="${ctx}/investorEdu/investorPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank">
                	<%if(tvideoProgram.getPicId()>0){ %>
                	 <img src="${ctx}/share/showUploadImage.jsp?id=<%=tvideoProgram.getPicId()%>" width="115" height="85"/>
                	<%}else{ %>
                	<img src="${ctx}/pic/wsyyt/iptv/sppic1.jpg" />
                	<%} %>
                	</a>
                    <p class="font_31u">
                    <a href="${ctx}/investorEdu/investorPlayObject.jsp?id=<%=tvideoProgram.getId()%>" target="_blank">
                    <%=tvideoProgram.getTitle().length()>9?tvideoProgram.getTitle().substring(0,9)+"...":tvideoProgram.getTitle() %></a></p></div>
                
               <%
             
               
              }
             }%>
             <div class="clearfloat"></div>
             <p align="center"> <%=PageUtil.pagination("window.iptvForm",totleCount, currentPage, pagesize)%></p>
    </form> 
</body>
</html>      