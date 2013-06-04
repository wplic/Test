<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"    %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.systemset.service.ServiceLevelService"%>
<%@page import="com.cssweb.common.dictionary.service.DictionaryService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<%@ include file="/commons/taglibs.jsp"%>
<%@ page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@ page import="com.cssweb.assetManager.pojo.AssetUser"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	TsystemWebuser tsystemWebuser = null;
	String loginTime="";
	String url="";
	 String type = "";
	 String levelsName="财经汇";//服务身体等级名字
	 ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
	if(request.getParameter("url")!=null)
	{
	 url=request.getParameter("url");
	}
	if(request.getAttribute("url")!=null&&!request.getAttribute("url").equals(""))
	{
	  url=(String)request.getAttribute("url");
	}
	String name = "";
	HttpSession session1 = request.getSession(false);
	if (session != null) {
		AssetUser assetUser = (AssetUser)session1.getAttribute("assetUser");
	    tsystemWebuser = (TsystemWebuser)session1.getAttribute("tsystemWebuser");

		if (assetUser != null) {
	    	name = assetUser.getClientName();
		} else if (tsystemWebuser != null) {
	    	name = tsystemWebuser.getServiceName();
		}
	}
	if(tsystemWebuser.getLastLoginDate()!=null)
	 {
	   loginTime=sdf.format(tsystemWebuser.getLastLoginDate());
	 }
	type = tsystemWebuser.getUserType();
		 if(tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
		 {
		    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuser.getLevel());
		    levelsName = dict == null ? "" : dict.getKeyName();
		 }
		 if (type.endsWith("2")) {
		        levelsName = "体验";
		 }

%>
<script type="text/javascript">
function cwin(){
	url="${ctx}/bussinesshall/editNameAndPass.jsp"
    window.open(url,'信息修改','width=460,height=210,resizable=no,scrollbars=no,menubar=no,location=no,status=no');
}
function longOutAfter(){
    closeWindow();
    url="${ctx}/webUser.do?method=frontLogout&url=<%=url%>"
    window.location.href=url;
}
function gotolczx()
{
	window.parent.location.href = '${contextPath }/bussinesshall/financingCzh.jsp';
}      
</script>
<body class="body_bg" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0" topmargin="0">
<div class="letagt1">用户登录</div>
        <div class="letagm1">
        <table width="98%"　align="center" class="lh28 font12 fcenter">
          
            <tr>
            	<td width="35%" rowspan="3" ><img src="${ctx}/pic/index/logpic1.jpg" /></td>
             	<td  width="65%" class="blue" >尊敬的<%=levelsName %>客户</td>
             </tr>
            <tr>
             	<td  class="blue">尊敬的<%=name%>，
              </td>
            </tr>
            <tr>
              <td class="blue">广发证券欢迎您！</td>
            </tr>
			
            <tr>
            	<td colspan="2">
            	 &nbsp;&nbsp;&nbsp;&nbsp;您是第<%=tsystemWebuser!=null&&tsystemWebuser.getLonginCount()!=null&&tsystemWebuser.getLonginCount()>0?tsystemWebuser.getLonginCount()+1:"1" %>次登录  上一次登录
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
            	&nbsp;&nbsp;&nbsp;&nbsp;时间：<%=loginTime %>
            	</td>
            </tr>
            <tr>
              <td colspan="2" height="30">
              <table width="95%" bgcolor="#e7e7e7">
                  <tr>
                    <td height="1"></td>
                  </tr>
                </table>
                </td>
            </tr>
			
          <tr>
            <td colspan="2" align="center">
            	<table width="100%" cellpadding="1" cellspacing="1" >
            			<tr>
            					<td width="30%"><a href="#" onclick="gotolczx();"><img  src="${contextPath}/pic/index/jrwdlczx.jpg" border="0"/></a></td>
            					<td width="30%"><input type="button" name="button" id="button" value="退出登录" class="but02" onclick="longOutAfter();"/></td>
            			</tr>
            			
            	</table>
            </td>
          </tr>
        </table>

          
        </div>
        <div class="letagb1"></div>
<jsp:include page="/share/logout.jsp" />
</body>        
    <!-- 以下为iframe高度自适应代码 -->
  <SCRIPT LANGUAGE="JavaScript">
function frameFitSelfHeight1(frameId,countNum){
	myFrameId=frameId;
	myCountNum=countNum;
	
	if(myCountNum==null || myCountNum==undefined || myCountNum<0){
		myCountNum=0;
	}
	
	myCountNum++;
	if(myCountNum<=20){
		window.parent.window.document.getElementById(myFrameId).height = window.parent.window.document.getElementById(myFrameId).contentWindow.document.body.scrollHeight;
		setTimeout('frameFitSelfHeight1(myFrameId,myCountNum)',100);
	}
}
frameFitSelfHeight1('leftlogin',null);


</SCRIPT>