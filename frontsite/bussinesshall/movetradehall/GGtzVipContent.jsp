<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:directive.page import="com.cssweb.gazx.jrsj.service.VipgazxService" />
<jsp:directive.page import="com.cssweb.gazx.jrsj.pojo.Vipgazx"/>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<jsp:directive.page import="com.cssweb.common.dictionary.service.DictionaryService"/>
<jsp:directive.page import="com.cssweb.common.dictionary.pojo.Dictionary"/>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>广发证券</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

<%
     String packageIdStr="";
     long packageId=0l;
     if(request.getSession().getAttribute("packageId")!=null)
     packageIdStr=(String)request.getSession().getAttribute("packageId");
     if(packageIdStr!=null&&!packageIdStr.equals(""))
     packageId=Long.parseLong(packageIdStr);
     
     
     SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 VipgazxService vipgazxService = (VipgazxService)ctx.getBean("vipgazxService");
	 DictionaryService dictionaryService = (DictionaryService) ctx.getBean("dictionaryService");
	List usertypelist = dictionaryService.getByParentId(dictionaryService.getDictionaryByKeyCode("yhfl").getId());
	
	Long tsystemwebuserlevel = 0L;
		String tsystemwebuserlevelstr = "";
		
		if(request.getSession().getAttribute("tsystemWebuser")!=null){
			TsystemWebuser tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
			if(tsystemWebuser!=null) {
			//暂时控制 体验用户不能查看金融库研究报告
			if(tsystemWebuser.getUserType()!=null&&tsystemWebuser.getUserType().equals("2"))
			{
				%>
				<script type="text/javascript">
					alert ("对不起，您不能查看该研究报告！") ;
					window.opener=null;
					window.open('','_self');
					window.close() ;
				</script>
				<%
			}//完成
				
				if(packageId<=9){
				%>
				<script type="text/javascript">
					alert ("对不起，您没有权限浏览该报告，请尽快订阅！") ;
				</script>
				<%
				}
			}
		}
   //取多少条记录
    String tbgibxxbId ="";
    if(request.getParameter("tbgibxxbId")!=null&&!request.getParameter("tbgibxxbId").equals(""))
      tbgibxxbId =request.getParameter("tbgibxxbId").trim();
    if(tbgibxxbId.equals(""))
    {
    %>
	<script type="text/javascript">
		alert ("对不起，您请求的文章不存在！") ;
		window.opener=null;
		window.open('','_self');
		window.close() ;
	</script>
	<%
    }
    
	Vipgazx vipgazx=null;
	List yymz=null;
	List nrgazx=null;
	if(!tbgibxxbId.equals(""))
	{
	   vipgazx=vipgazxService.getJrsjGazxBgjbxxbObject(Integer.parseInt(tbgibxxbId));
	   yymz=vipgazxService.getYjyxmName(Integer.parseInt(tbgibxxbId));
	   nrgazx=vipgazxService.getJrsjGazxObject(Integer.parseInt(tbgibxxbId),"");
	}
	
	
%>       

<script language="JavaScript" type="text/JavaScript">
var size=14;            //字体大小
function fontZoom(fontsize){    //设置字体
    size=fontsize;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='red';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='';
}
function fontMax(){    //字体放大
    
    size=16
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='red';
    document.getElementById('xiao').className='';
}
function fontMin(){    //字体缩小
    size=12;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='red';
}
</SCRIPT>
</head>

<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
   <div class="left_tit2">文章信息</div>
   <p class="textTitle1" align="center">
   <%=vipgazx.getBgmc() %>
   </p>
   <p class="textTitle2" align="center">信息来源：港澳资讯  作者：
   <%if(yymz!=null&&yymz.size()>0){
      String name="";
      for(int i=0;i<yymz.size();i++){
        Vipgazx vipzz=(Vipgazx)yymz.get(i);
        name=name+vipzz.getYjyxm()+",";
      }
       out.println(!name.equals("")?name.substring(0,name.length()-1):"" );
   }%>
   研究机构：<%=vipgazx.getYjjgmc()!=null?vipgazx.getYjjgmc():"" %></p>
   <%
     if(packageId>=10) {
   if(vipgazx.getBgzy()!=null ) {%>
		<div class="newstextArea">
			<p class="newstextAreatop"></p>
			<strong >【摘要】</strong><br/>
			<div>
				<%  
				              if(nrgazx!=null&&nrgazx.size()>0)
				              {
				              for(int s=0;s<nrgazx.size();s++){
				                Vipgazx nrg=(Vipgazx)nrgazx.get(s);
								String content=new String(nrg.getNr(), "GBK");
								content=content.replaceAll("\\</?(?!(input)|(img)).*?\\>","");
								content=content.replaceAll("    "," ");
								content=content.replaceAll("   "," ");
								content=content.replaceAll("  "," ");
								content=content.replaceAll("　","");
								content=content.replaceAll("	","");
								content=content.replaceAll("&nbsp;","");
								content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n","\r\n");
								content=content.replace("\r\n","<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
								content="&nbsp;&nbsp;&nbsp;&nbsp;"+content;
								
								out.println(content+" <br/><br/>");
							 }
						    }
						   %> 
			</div>
			<p class="newstextAreabottom"></p>
		</div>
	<%}}%>
   <div class="newstextArea">
   <%  if(packageId>=11) {%>
   <p class="newstextAreatop"></p>
   <div style="word-wrap:break-word;">
   <table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
					 <%if(vipgazx.getBgfj()!=null ) {%>
						<tr align="left"> 
						  <td class="font_14px gray5">【附件】 </td>
						</tr>        
							<tr align="left"> 
							  <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${contextPath }/bussinesshall/movetradehall/showNoSaveGazxFile.jsp?id=<%=tbgibxxbId %>"><%=vipgazx.getFjwjmc() %></a></td>
							</tr>
					<%
							
						}
					%>
						 <tr>
						  <td height="48" align="center" style="padding:10px 15px; "><input type="submit" name="Submit2" value="关闭窗口" class="button4" onClick="javascript:window.opener=null;window.close();"/></td>
						 </tr>
					</table>
					<%} %>
                           </div>

			 
<p class="newstextAreabottom"></p>

</div>

</div>

<jsp:include page="/share/bottom.jsp" />
</body>
</html>
