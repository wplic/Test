<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.handset.service.TfinanceCommendHandsetService"/>
<jsp:directive.page import="com.cssweb.handset.pojo.TfinanceCommendHandset"/>
<jsp:directive.page import="java.util.List"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	TfinanceCommendHandsetService tfinanceCommendHandsetService = (TfinanceCommendHandsetService)ctx.getBean("tfinanceCommendHandsetService");
	List list1 = tfinanceCommendHandsetService.getHandsetByYys(1,1000);
	List list2 = tfinanceCommendHandsetService.getHandsetByYys(2,1000);
	List list3 = tfinanceCommendHandsetService.getHandsetByYys(3,1000);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/mobile.css" rel="stylesheet" type="text/css" />
<script src="/js/setTab.js" type="text/javascript"></script>
</head>

<body>
<jsp:include page="/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${ctx }/index.jsp?nav=index">首页</a> &gt; <a href="${ctx }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; <a href="${ctx }/mobile/index.jsp?nav=wsyyt&nav1=gfydjyt">金管家手机证券</a> 
   <jsp:include page="/mobile/pmdList.jsp">
				            <jsp:param name="catName" value="最新动态" />
				            <jsp:param name="whichCat" value="wsyyt_sjzq_hdxw"/>
				            <jsp:param name="state" value="1"/>
				            <jsp:param name="showSize" value="2"/>
				    	</jsp:include></div>
  <div class="blank5"></div>
</div>
<div class="mobox">
  
  <div class="moleft">
  		<jsp:include page="leftMenu.jsp?leftnav=management1&leftnav2=management1_3"/>
  </div>
  
  
<div class="moright">
  		<p><jsp:include page="/ad/ad_index.jsp">
		    	      <jsp:param name="width" value="696"/>
					  <jsp:param name="height" value="174"/>
					  <jsp:param name="subAdCode" value="ad_default_phone"/>
		     </jsp:include></p>
        <div class="blank10"></div>
		<div class="rtit2"><span class="more">我们还有更多支持机型，点击<span class="red"><a href="#">详细</a></span>查看支持机型</span>推荐机型</div>
        <div class="yxsm">
   	  		<p><img src="../pic/mobile/dot5.gif" align="absmiddle" /><span class="blue3">优选原则</span></p>
   			<table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" class="yxrztab">
                 <tr>
                   <td width="51%">·操作系统支持安装“广发金管家手机证券”                </td>
                   <td width="49%">·大显示屏，能清晰、全面展示行情数据</td>
                 </tr>
                 <tr>
                   <td>·能支持EDGE或3G，满足网络频率要求</td>
                   <td>·内存足够大，系统处理速度快，程序运行足够快</td>
                 </tr>
                 <tr>
                   <td>·最好支持手写输入，操作方便</td>
                   <td>&nbsp;</td>
                 </tr>
             </table>

      </div>
        
        <ul class="motags">
       	  <li class="active" id="taglist1" onmouseover="SwitchNews('list', 1, 3,'active','')"><a href="http://www.chinamobile.com/" style="cursor:pointer" target="_blank"><p class="dot6">中国移动</p></a></li>
       	  <li id="taglist2" onmouseover="SwitchNews('list', 2, 3,'active','')"><a href="http://www.chinaunicom.com.cn/" style="cursor:pointer" target="_blank"><p class="dot7">中国联通</p></a></li>
          <li id="taglist3" onmouseover="SwitchNews('list', 3, 3,'active','')"><a href="http://www.chinatelecom.com.cn/" style="cursor:pointer" target="_blank"><p class="dot8">中国电信</p></a></li>
         </ul> 
            <div id="list1">
            <%if(null!=list1){ 
            	int size1 = list1.size();
            	int row1 = size1/5;
            	if(size1%5>0)
            		row1 = (size1/5)+1;
            	for(int i=0;i<row1;i++){%>
                    <ul class="tjjx2">
                    	<%for(int j=0;j<5;j++){ 
                    		if((i*5+j)<size1){
	            				TfinanceCommendHandset handset = (TfinanceCommendHandset)list1.get(i*5+j);%>
		                        <li>
		                        <%if(handset.getNewsType()!=null&&handset.getNewsType().equals("1")){ %>
								    
								    <p style="width:78px;float: left;"><img src="${ctx }/pic/mobile/new.JPG"/></p>
								    <% }else{%>
								    <p>&nbsp;</p>
								    <%} %>
		                        		<img width="78" height="139" src="${ctx }/share/showUploadImage.jsp?id=<%=handset.getPhotoId() %>"/>
		                        		<p><%=handset.getCardsName() %> - <%=handset.getModel() %></p>
		                        	
		                        </li>
                        <%} }%>
                    </ul>
                    <div class="blank0"></div>
                    <div class="tjjxline"></div>
            <%}} %>
            </div>
            
            <div id="list2" style="display:none">
            <%if(null!=list2){ 
            	int size2 = list2.size();
            	int row2 = size2/5;
            	if(size2%5>0)
            		row2 = (size2/5)+1;
            	for(int i=0;i<row2;i++){%>
                    <ul class="tjjx2">
                    	<%for(int j=0;j<5;j++){ 
                    		if((i*5+j)<size2){
	            				TfinanceCommendHandset handset = (TfinanceCommendHandset)list2.get(i*5+j);%>
		                        <li>
		                        	 <%if(handset.getNewsType()!=null&&handset.getNewsType().equals("1")){ %>
								    
								    <p style="width:78px;float: left;"><img src="${ctx }/pic/mobile/new.JPG"/></p>
								    <% }else{%>
								    <p>&nbsp;</p>
								    <%} %>
		                        		<img width="78" height="139" src="${ctx }/share/showUploadImage.jsp?id=<%=handset.getPhotoId() %>"/>
		                        		<p><%=handset.getCardsName() %>-<%=handset.getModel() %></p>
		                        	
		                        </li>
                        <%} }%>
                    </ul>
                    <div class="blank0"></div>
                    <div class="tjjxline"></div>
            <%}} %>
            </div>
            
            
            <div id="list3" style="display:none">
            <%if(null!=list3){ 
            	int size3 = list3.size();
            	int row3 = size3/5;
            	if(size3%5>0)
            		row3 = (size3/5)+1;
            	for(int i=0;i<row3;i++){%>
                    <ul class="tjjx2">
                    	<%for(int j=0;j<5;j++){ 
                    		if((i*5+j)<size3){
	            				TfinanceCommendHandset handset = (TfinanceCommendHandset)list3.get(i*5+j);%>
		                        <li>
		                        	 <%if(handset.getNewsType()!=null&&handset.getNewsType().equals("1")){ %>
		                        	 
								    <p style="width:78px;float: left;"><img src="${ctx }/pic/mobile/new.JPG"/></p>
								    <% }else{%>
								    <p>&nbsp;</p>
								    <%} %>
		                        		<img width="78" height="139" src="${ctx }/share/showUploadImage.jsp?id=<%=handset.getPhotoId() %>"/>
		                        		<p><%=handset.getCardsName() %>-<%=handset.getModel() %></p>
		                        	
		                        </li>
                        <%} }%>
                    </ul>
                    <div class="blank0"></div>
                    <div class="tjjxline"></div>
            <%}} %>
            </div>
            
            
            <div class="blank10"></div>
            
    
        
</div>
  <div class="blank0"></div>

</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>