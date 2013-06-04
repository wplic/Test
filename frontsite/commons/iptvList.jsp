<%request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.video.pojo.TvideoProgram"%>
<%@page	import="com.cssweb.video.service.TvideoProgramService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page	import="java.text.SimpleDateFormat"%>
<link href="${contextPath }/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%
  ServletContext st = this.getServletConfig().getServletContext();
  ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
  TvideoProgramService tvideoProgramService =(TvideoProgramService) ctx.getBean("tvideoProgramService");
	SimpleDateFormat sdfzb=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	Map map =new HashMap();
	map.put("sortName", "UPLOAD_DATE");
	map.put("dir", "desc");//��ʲô�� ����
	map.put("recommend","1");//�Ƿ��Ƽ� 0:���Ƽ� 1:�Ƽ�
	map.put("state","1");
	map.put("begin", 0);
	map.put("end", 10);//ȡ4�����
	List listJx=tvideoProgramService.getBytvideoProgramMap(map); 
%>
<div class="ritagt1">
       	  <div class="newtit11"><a href="${contextPath }/bussinesshall/iptv/iptv.html"> <span style="float:right;color:#2c5ea3;cursor:hand;">更多</span></a>推荐视频
       	  </div>
        </div>
        <div class="ritagm1">
 <table width="92%" align="center" border="0" cellspacing="0" cellpadding="0" class=" mt10 lh23">
	     <%
         int j=0;
         if(listJx!=null&&listJx.size()>0)
         {
           for(int i=0;i<listJx.size()&&i<10;i++)
           {
             //System.out.println("            ---------------="+i);
             TvideoProgram t= (TvideoProgram)listJx.get(i);
             if(t.getPicId()>0){
             %>
             
	          <tr>
	          <td align="center">
	          <a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=t.getId()%>" target="_blank">
	             <img src="${ctx}/share/showUploadImage.jsp?id=<%=t.getPicId()%>" width="104" height="94"/>
	          </a>
	           </td>
	           
	          </tr>
	            <tr>
	            <td align="center">
	           <a href="${ctx}/bussinesshall/iptv/tvPlayObject.jsp?id=<%=t.getId()%>" target="_blank">
	           <p>
	           <%=t.getTitle().length()>32?t.getTitle().substring(0,32)+"...":t.getTitle() %> </p>
	           </a>
	           <p><%=sdfzb.format(t.getUploadDate()) %></p></td>
	            </tr>
             <%
             j++;
             if(j==1)
             break;
             }
           }
         } 
        %>
  </table>
 </div>