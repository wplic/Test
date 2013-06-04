<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@page	import="com.cssweb.video.pojo.*"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.service.StreamService"%>
<%@page	import="com.cssweb.video.pojo.Stream"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	long picId=0l;
    if(request.getAttribute("picId")!=null&&!request.getAttribute("picId").equals(""))
    picId=Long.parseLong(request.getAttribute("picId").toString().trim());
    String title="";
    if(request.getAttribute("title")!=null&&!request.getAttribute("title").equals(""))
    {
      title=request.getAttribute("title").toString();
      title=!title.equals("")&&title.length()>9?title.substring(0,9)+"...":title;
    }
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 %>
<body bgcolor="#f1f1f1" style="height: 250px"> 
 <form name="iptvForm" action="${ctx}/tvideo.do?method=getStreamByIdCategoryId&id=${id}&newDateTime=${newDateTime }" method="post">  
   <table width="76%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td>时间：</td>
            <td>
            <input type="text" id="StartDate" name="StartDate" onfocus="this.blur()" value="${StartDate}" style="width:86px; border:1px solid #c3c3c3;"  ><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.iptvForm.StartDate,document.iptvForm.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
          </td>
         <td>至</td>
          <td>
            <input type="text" name="EndDate" id="EndDate" onfocus="this.blur()" value="${EndDate}" style="width:86px; border:1px solid #c3c3c3;" ><a href="javascript:void(0)" onClick="gfPop.fEndPop(document.iptvForm.StartDate,document.iptvForm.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
          </td>
            <td>&nbsp;</td>
            <td align="right"><a href="#" onclick="return ggcxListStream();"><img src="${ctx}/pic/wsyyt/but_cx.jpg" /></a></td>
         <td width="25">&nbsp;</td>
          </tr>
      </table> 
            <%if(list!=null&&list.size()>0) {
              for(int i=0;i<list.size();i++)
              {
               Stream stream=(Stream)list.get(i);
               String spp="sppic_box fleft ml10";
               if(i%3==0){
               spp="sppic_box fleft";
               %>
               <div class="clearfloat"></div>
               <%} %>
               <div class="<%=spp %>"> 
                	 <a href="${ctx}/bussinesshall/iptv/tvIptvDplayStreamObject.jsp?id=${id }&fileName=<%=stream.getFileName() %>" target="_blank">
                	<%
                	if(picId>0){ %>
                	 <img src="${ctx}/share/showUploadImage.jsp?id=<%=picId%>" width="115" height="80"/>
                	<%}else{ %>
                	<img src="${ctx}/pic/wsyyt/iptv/sppic1.jpg" width="115" height="80"/>
                	<%} %>
                	</a>
                    <p class="font_31u">
                    <%
                    
                    %>
                    <a href="${ctx}/bussinesshall/iptv/tvIptvDplayStreamObject.jsp?id=${id }&fileName=<%=stream.getFileName()%>" target="_blank" title="<%="标题:"+stream.getFileName()%>">
                    <%=title+"<br/>"+sdf.format(stream.getStopTime()) %></a>
                </p></div>
                <%
              }
             }%>
             <div class="clearfloat"></div>
             <p align="center"> <%=PageUtil.pagination("window.iptvForm",totleCount, currentPage, pagesize)%></p>
    </form> 
    <script type="text/javascript">
 		function  ggcxListStream(){
 		  var StartDate = document.getElementById("StartDate").value;
 		  var EndDate = document.getElementById("EndDate").value;
 		  var url="${ctx}/tvideo.do?method=getStreamByIdCategoryId&id=${id}";
 		  url=url+"&is_delete=0";
 		  if(StartDate!="")
 		  {
 		    url=url+"&StartDate="+StartDate;
 		  }else{
 		  alert("请填写时间");
 		  return false;
 		  }
 		  if(EndDate!="")
 		  {
 		    url=url+"&EndDate="+EndDate;
 		  }else{
 		  alert("请填写时间");
 		   return false;
 		  }
 		  if(StartDate!=""&&EndDate!=""){
 		    //alert(""+url);
 		    document.location.href=url;
 		  }
 	}
 </script>
</body>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 

</html>      