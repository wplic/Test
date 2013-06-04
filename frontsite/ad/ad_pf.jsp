<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.admanger.service.AdMangerService"/>
<jsp:directive.page import="com.cssweb.admanger.pojo.AdManger"/>
<body>
<%
	String adOpenUrl = null;
	AdManger adManger = null;
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AdMangerService adMangerService = (AdMangerService) ctx.getBean("adMangerService");
	String subAdCode = request.getParameter("subAdCode");
	if(subAdCode == null || subAdCode.length() == 0){
		subAdCode = "ad_pf";
	}
	//取得广告位编码
	String widths = request.getParameter("widths");
	if(widths == null || widths.length() == 0){
		widths = "200";
	}
	
	//取得广告位编码
	String heights = request.getParameter("heights");
	if(heights == null || heights.length() == 0){
		heights = "120";
	}
	List adList = adMangerService.getAdListBySubAdCode(subAdCode);
	if(adList==null||adList.size()==0){
		return;
	}
	int row = adList.size();
	if(row>0){
		adManger = (AdManger)adList.get(0);
		Date date = new Date();
		if(adManger!=null&&date.after(adManger.getKssj())&&date.before(adManger.getJssj())){
				if (adManger != null && adManger.getPicId() != null)
				{
					if (adManger.getUrl() != null && !"".equals(adManger.getUrl()) )
					{
						%>
							<div id="img" style="position: absolute; left: 311; top: 815;visibility :hidden;z-index:9999;" onmouseover="clearInterval(interval)" onmouseout="interval = setInterval('changePos()', delay)" align="right"> 
								<a href="<%=adManger.getUrl() %>" target="_blank"><img border="0" src="${contextPath}/share/showUploadImage.jsp?&id=<%=adManger.getPicId() %>" width="<%=widths %>" height="<%=heights %>" /></a><br><span style="CURSOR:hand;color:red;font-weight:bold" onclick="clearInterval(interval);document.getElementById('img').style.visibility = 'hidden'">X</span> 
							</div> 
						<%
					}
					else
					{
						%>
							<div id="img" style="position: absolute; left: 311; top: 815;visibility :hidden;z-index:9999;" onmouseover="clearInterval(interval)" onmouseout="interval = setInterval('changePos()', delay)" align="right"> 
								<img border="0" src="${contextPath}/share/showUploadImage.jsp?&id=<%=adManger.getPicId() %>" width="<%=widths %>" height="<%=heights %>" /><br><span style="CURSOR:hand;color:red;font-weight:bold" onclick="clearInterval(interval);document.getElementById('img').style.visibility = 'hidden'">X</span> 
							</div>  	
							
						<%
					}
				 	
				}else{
					%><div id="img" style="position:absolute;z-index:9999;"></div> <%
				}
	
		}
	}
 %>


<script language=javascript> 
var xPos = 20; 
var yPos = document.documentElement.clientHeight; 
var step = 1; 
var delay = 10;                      
var height = 0;                      
var Hoffset = 0;                    
var Woffset = 0;                      
var yon = 0;                    
var xon = 0;                      
var pause = true;                    
var interval;                    
document.getElementById('img').style.top = yPos+'px';                    
function changePos() {                    
width = document.documentElement.clientWidth;                    
height = document.documentElement.clientHeight;                    
Hoffset = document.getElementById('img').offsetHeight;                    
Woffset = document.getElementById('img').offsetWidth;                    
document.getElementById('img').style.left = xPos + document.documentElement.scrollLeft+'px';                    
document.getElementById('img').style.top = yPos + document.documentElement.scrollTop+'px';                    
if (yon) {                  
yPos = yPos + step;                    
}                
else {              
yPos = yPos - step;                    
}            
if (yPos < 0) {                  
yon = 1;                    
yPos = 0;                    
}                  
if (yPos >= (height - Hoffset)) {                    
yon = 0;                    
yPos = (height - Hoffset);                      
}                  
if (xon) {                    
xPos = xPos + step;                    
}                  
else {                  
xPos = xPos - step;                    
}                  
if (xPos < 0) {                    
xon = 1;                    
xPos = 0;                    
}          
if (xPos >= (width - Woffset)) {                    
xon = 0;            
xPos = (width - Woffset);                    
}                    
} 
function start() {                    
document.getElementById('img').style.visibility = "visible";                  
interval = setInterval('changePos()', delay);                    
}              
start();  
</script>
</body>
