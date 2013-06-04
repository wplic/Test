<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.Document"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<%@page import="com.cssweb.client.service.TclientYdbgService"%>
<%@page import="com.cssweb.client.pojo.TclientYdbg"%>
<%@page import="com.cssweb.common.toDbLob.service.LobService"%>
<%@page import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
<%@page import="com.cssweb.utils.StringUtil"%>
<%@page import="com.cssweb.common.security.user.service.UserService"%>
<%@page import="com.cssweb.common.security.user.pojo.UserBasicInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.common.toDbLob.pojo.FileBlob"%>
<%
		request.setCharacterEncoding("UTF-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String ydbgId =	request.getParameter("ydbgId");
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		TclientYdbgService tclientYdbgService = (TclientYdbgService)ctx.getBean("tclientYdbgService");
		LobService lobService = (LobService)ctx.getBean("lobService");
		UserService userService = (UserService)ctx.getBean("userService");
		TclientYdbg tclientYdbg = null;
		if (ydbgId != null && !"".equals(ydbgId))
		{
			tclientYdbg = tclientYdbgService.getTclientYdbgById(Long.parseLong(ydbgId));
		}
		TextBlob txtblb = null;
		UserBasicInfo userBasicInfo = null;
		String strContext = null ;
		FileBlob fileBlob = null;
		if (tclientYdbg != null)
		{
			if ( tclientYdbg.getConnectId( ) != null)
			{
				txtblb = lobService.getTextBlobById(tclientYdbg.getConnectId());
				strContext = new String(txtblb.getSource(),"UTF-8");
			}
			if (tclientYdbg.getFileId() != null)
			{
				fileBlob = lobService.getFileBlobById(tclientYdbg.getFileId());
			}
			if (tclientYdbg.getRecUserId() != null)
			{
				userBasicInfo = userService.getUserBasicInfoByUserId(tclientYdbg.getRecUserId());
			}
			
		}
		
		
%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

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
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz"></div>
  <div class="blank5"></div>
  <div class="bg_f5 p8">
	<div class="tlbg3">
        	<p class="textTitle1" align="center">
        	<%
        			if (tclientYdbg != null && tclientYdbg.getTitle() != null)
        			{
        					%>
        							<%= StringUtil.subString(tclientYdbg.getTitle(),80,"...")  %>
        					<%
        			}
        	 %>
        	</p>
  <p class="textTitle2" align="center"> 日期：<%= ( (tclientYdbg != null &&tclientYdbg.getYdbgDate() == null) ?"":sdf.format(tclientYdbg.getYdbgDate())) %> 作者：客服中心
  						
  					</p>
    <%if(tclientYdbg != null && tclientYdbg.getDigest() != null) {%>
   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <strong >【摘要】</strong><br/>
   <div>
  <%=tclientYdbg.getDigest()%>
  </div>
    <p class="newstextAreabottom"></p></div>
  <%} %>
   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <div>
 <%  
								String content=strContext;
								content="&nbsp;&nbsp;&nbsp;"+content;
								out.print(content);
						   %> 
                           <br />
                           <table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
	               			<%
	               					if (fileBlob != null && fileBlob.getId() != null)
	               					{
	               						%>
	               							<tr align="left"> 
									          <td class="font_14px gray5">【附件】 </td>
									        </tr>
									         <tr align="left"> 
									          <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${contextPath }/commons/showDocumentFile.jsp?id=<%=fileBlob.getId() %>"><%=(fileBlob.getFileName()==null?"":fileBlob.getFileName()) %></a></td>
									        </tr>
	               						<%
	               					}
	               			 %>
						
					      
					       
					
					 <tr>
                      <td height="48" align="center" style="padding:10px 15px; "><input type="submit" name="Submit2" value="关闭窗口" class="button4" onClick="javascript:window.opener=null;window.close();"/></td>
                     </tr>
		          </table>
			</div>
</div>
</div></div></div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>