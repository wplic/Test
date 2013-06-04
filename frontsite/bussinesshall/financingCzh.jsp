<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<jsp:include page="${contextPath }/commons/SingleSignOnCheck.jsp"/>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.systemset.service.BranchManagerService"%>
<%@page	import="com.cssweb.systemset.pojo.Branch"%>
<%@page	import="com.cssweb.systemset.service.ServiceLevelService"%>
<%@page	import="com.cssweb.systemset.pojo.ServiceLevel"%>
<%@page	import="com.cssweb.systemset.service.BranchNoticeService"%>
<%@page	import="com.cssweb.systemset.pojo.BranchNotice"%>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page	import="java.text.SimpleDateFormat"%>
<%@page	import="sun.misc.BASE64Encoder"%>
<%@page	import="com.cssweb.util.Base64 "%>

  <%
    String webcallLevel="";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String branchName="";//营业部名字
    String levelsName="财经汇";//服务身体等级名字
    String loginTime="";
    String type = "";
    String custIds="";
  	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	//取营业部的信息  如财富汇
	BranchManagerService branchManagerService=(BranchManagerService)ctx.getBean("branchManagerService");
	//取用户的对应身份等级
	ServiceLevelService serviceLevelService=(ServiceLevelService)ctx.getBean("serviceLevelService");
	//
	BranchNoticeService branchNoticeService=(BranchNoticeService)ctx.getBean("branchNoticeService");
	
	DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
	
	Map map=new HashMap();
	map.put("isAudit", "1");
	List listgg=null;
	List listxw=null;

	
	String branchCodeName="";
	TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null){
		
		tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
		//out.println("<script type='text/javascript'> alert('you')  </script>");
	}
	if(tsystemWebuser!=null) {
	 if(tsystemWebuser.getUserName()!=null&&!tsystemWebuser.getUserName().equals(""))
	 custIds=tsystemWebuser.getUserName().trim();
	     if(tsystemWebuser.getBranchCode()!=null && !tsystemWebuser.getBranchCode().equals(""))
	     {
	         String branchCode="";
	         if((tsystemWebuser.getBranchCode().substring(0,1)).equals("0") )
	         branchCode=tsystemWebuser.getBranchCode().substring(1,tsystemWebuser.getBranchCode().length());
	         else if ((tsystemWebuser.getBranchCode().substring(0,2)).equals("00") )
	         branchCode=tsystemWebuser.getBranchCode().substring(2,tsystemWebuser.getBranchCode().length());
	         else
	         branchCode=tsystemWebuser.getBranchCode();
			 Branch branch=branchManagerService.getByBranchCode(branchCode);
			 if(branch!=null){
			 //System.out.println("2222="+tsystemWebuser.getBranchCode());
			 branchCodeName=tsystemWebuser.getBranchCode();
			 branchName=branch.getBranchName();
			 }
			//根据营业部的信息来取1:公告 2:新闻 
			map.put("branchCode", branchCode); 
			map.put("type", "1");//TYPE类型 1:公告 2:新闻
			listgg=branchNoticeService.getBranchNoticeByTypeList(map ,1 ,10);
			map.put("type", "2");//TYPE类型 1:公告 2:新闻
			listxw=branchNoticeService.getBranchNoticeByTypeList(map ,1 ,10);
		 }
		 type = tsystemWebuser.getUserType();
		 if(tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
		 {
		   // System.out.println("111="+tsystemWebuser.getLevel());
		    webcallLevel=tsystemWebuser.getLevel();
		    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuser.getLevel());
		    levelsName = dict == null ? "" : dict.getKeyName();
		 }else if(type.endsWith("2")) {
		        levelsName = "体验";
		 }
		 if(tsystemWebuser.getLastLoginDate()!=null)
		 {
		   loginTime=sdf.format(tsystemWebuser.getLastLoginDate());
		 }
	} else { %>
	     <script type="text/javascript">
	         alert("您尚未登录或已过期，请重新登录！");
	         window.location.href = "/share/login.jsp";
	     </script>
	<%} %>
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">
	 function editPass(type){
	   if (type=="1") {
	       url="${ctx}/bussinesshall/editPass.jsp";
           window.open(url,'','width=460,height=230,resizable=no,scrollbars=no,menubar=no,location=no,status=no');	   
	   } else if (type=="2") {
	       url="${ctx}/bussinesshall/editTyPass.jsp";
           window.open(url,'','width=460,height=230,resizable=no,scrollbars=no,menubar=no,location=no,status=no');
	   } else {
	       window.location = "${ctx}/share/login.jsp";
	   }
     }
	 function bindClient(){
         window.open("${ctx}/bussinesshall/bindClient.jsp",'','width=460,height=230,resizable=no,scrollbars=no,menubar=no,location=no,status=no');
	 }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/base64.js"></script>
</head>
<body >
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx" />
<div class="body_bg">
<jsp:include page="/share/pdLogin.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
      <div class="dqwz">当前位置：<a href="/index.html">首页</a> > <a href="/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  > <a href="/bussinesshall/financingCzh.jsp">我的理财中心</a>  > 我的<%=levelsName %></div>
      
      <jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp">
		<jsp:param name="nav3" value="gdcjh" />
	</jsp:include>
  <table>
   <tr>
    <td width="25%"> <%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好：</td>
     <td width="40%"> </td>
    <td align="center">
    <%
        String webcallPath="http://webcall.gf.com.cn/flashwebcall/client/et_wz_index.jsp?";
	    if(tsystemWebuser!=null) {
	        String realNameStr=tsystemWebuser.getRealName()!=null&&!tsystemWebuser.getRealName().equals("")?tsystemWebuser.getRealName():tsystemWebuser.getServiceName();
	        webcallPath=webcallPath+"from=webcallwz&";
		    if(tsystemWebuser.getUserName()!=null&&!tsystemWebuser.getUserName().equals("")){
	        BASE64Encoder encode = new BASE64Encoder();
	        String custId = encode.encode(tsystemWebuser.getUserName().getBytes());
	        custId = custId.replaceAll("\r","").replaceAll("\n", "").replaceAll("\r\n", "");
	        webcallPath=webcallPath+"custId="+custId;
	        }else{
	        webcallPath=webcallPath+"custId=";
	        }
	    if(!tsystemWebuser.getLevel().equals("1")&&!type.equals("2")){
	    %>
	     
	    <iframe id="mainFrameWebcall" name="mainFrameWebcall" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="120" height="50"></iframe>  
	      <%} %>
    <%}%>
    </td>
   </tr>
   <%
      
       if(tsystemWebuser!=null) {
           //String znqPath="http://10.2.124.12:7020/ygkj/jsp/user/regGfkLogin.do?1=1";
            String znqPath="http://20.gf.com.cn/ygkj/jsp/user/regGfkLogin.do?1=1";
	        String serviceNameStr=tsystemWebuser.getServiceName()!=null&&!tsystemWebuser.getServiceName().equals("")?tsystemWebuser.getServiceName():"";
	        znqPath=znqPath+"&userType="+tsystemWebuser.getUserType();
		    if(serviceNameStr!=null&&!serviceNameStr.equals("")){
	        
	        String serviceName = Base64.encode(serviceNameStr);
	        serviceName = serviceName.replaceAll("\r","").replaceAll("\n", "").replaceAll("\r\n", "");
	        znqPath=znqPath+"&serviceName="+serviceName;
	        if(tsystemWebuser.getBranchCode()!=null && !tsystemWebuser.getBranchCode().equals(""))
	        {
	         znqPath=znqPath+"&branchCode="+tsystemWebuser.getBranchCode();
	        }else{
	        znqPath=znqPath+"&branchCode=";
	        }
	        if(tsystemWebuser.getRealName()!=null && !tsystemWebuser.getRealName().equals(""))
	        {
	         znqPath=znqPath+"&realName="+java.net.URLEncoder.encode(tsystemWebuser.getRealName(), "utf-8");
	        }else{
	        znqPath=znqPath+"&realName=";
	        }	        
	        if(tsystemWebuser.getSex()!=null && !tsystemWebuser.getSex().equals(""))
	        {
	         znqPath=znqPath+"&sex="+java.net.URLEncoder.encode(tsystemWebuser.getSex(), "utf-8");
	        }else{
	        znqPath=znqPath+"&sex=";
	        }
	        if(branchName!=null && !branchName.equals(""))
	        {
	         znqPath=znqPath+"&branchName="+java.net.URLEncoder.encode(branchName, "utf-8");
	        }else{
	        znqPath=znqPath+"&branchName=";
	        }
	        }else{
	        znqPath=znqPath+"&serviceName=";
	        }

       %>
   <tr>
    <td width="80%">
      
    <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
    <%} %>
  </table>
    <table width="95%" align="center" border="1" bordercolor="#cfcfcf" cellspacing="0" cellpadding="0" class="lh27 indent10">
      <tr>
        <td class="wdzx_th">身份信息</td>
        <td>身份等级：您是广发<span class="dqwz"><%=levelsName %></span>客户</td>
        <td> 开户营业部：<%=branchName %></td>
      </tr>
      <tr>
        <td class="wdzx_th">账户信息</td>
        <td>客户编号：<%=tsystemWebuser!=null&&tsystemWebuser.getUserName()!=null?tsystemWebuser.getUserName():"" %>                       </td>
        <td>股东代码：上海：<%=tsystemWebuser!=null&&tsystemWebuser.getAccountSh()!=null?tsystemWebuser.getAccountSh():"" %>   深圳：<%=tsystemWebuser!=null&&tsystemWebuser.getAccountSz()!=null?tsystemWebuser.getAccountSz():"" %></td>
      </tr>
      <tr>
        <td class="wdzx_th">登录信息</td>
        <td>登录次数：您是第<%=tsystemWebuser!=null&&tsystemWebuser.getLonginCount()!=null&&tsystemWebuser.getLonginCount()>0?tsystemWebuser.getLonginCount()+1:"1" %>次登录                 </td>
        <td>上一次登录时间：<%=loginTime %></td>
      </tr>
      <tr>
        <td class="wdzx_th">修改信息</td>
        <td>
	        <% if(tsystemWebuser.getUserName()==null || tsystemWebuser.getUserName().equals("")){%>
	        	<a href="#" style="color:red;font-weight:bold;text-decoration:underline;" onClick="bindClient();">绑定交易账号</a>&nbsp;&nbsp;&nbsp;&nbsp;
	        <%} %>
        	<a href="#" class="blue2" onClick="editPass('<%=type %>')">设置登陆密码</a>
       
        </td>
        <td>
		  <a href="${ctx }/share/editApplication.jsp" class="blue2" target="_blank">修改个人信息</a>
         &nbsp;</td>
      </tr>
    </table>
    <br /><br />
    <table width="95%" align="center" border="1" bordercolor="#cfcfcf" cellspacing="0" cellpadding="0" class="lh27">
      <tr>
        <td class="wdzx_th indent10 bold" width="50%">营业部新闻</td>
        <td class="wdzx_th indent10 bold">营业部公告</td>
      </tr>
      <tr>
        <td valign="top"><table width="90%" align="center" class="lh28 mtb16 font_st list_bline1">
        <%if(listxw!=null&&listxw.size()>0 ){
          for(int i=0;i<listxw.size();i++)
          {
          BranchNotice branchNotice=(BranchNotice)listxw.get(i);
          %>
          <tr>
            <td width="259" class="red"><a href="${ctx}/bussinesshall/branchNotice.jsp?id=<%=branchNotice.getId() %>" target=\"_blank\">·<%=branchNotice.getTitle()!=null&&branchNotice.getTitle().length()>18?branchNotice.getTitle().substring(0,18)+"...":branchNotice.getTitle() %> </a></td>
            <td width="121" class="red"><%=sdf.format(branchNotice.getCreateDate()) %></td>
          </tr>
          <%
        %>
        
        <%} }%>
        </table></td>
        <td valign="top"><table width="90%" align="center" class="lh28 mtb16 font_st list_bline1">
          <%if(listgg!=null&&listgg.size()>0 ){
          for(int i=0;i<listgg.size();i++)
          {
          BranchNotice branchNotice=(BranchNotice)listgg.get(i);
          %>
          <tr>
            <td width="259" class="red"><a href="${ctx}/bussinesshall/branchNotice.jsp?id=<%=branchNotice.getId() %>" target=\"_blank\">·<%=branchNotice.getTitle()!=null&&branchNotice.getTitle().length()>18?branchNotice.getTitle().substring(0,18)+"...":branchNotice.getTitle() %> </a></td>
            <td width="121" class="red"><%=sdf.format(branchNotice.getCreateDate()) %></td>
          </tr>
          <%
        %>
        
        <%} }%>
         
        </table></td>
      </tr>
    </table>

</div>
<script type="text/javascript">
var custId = "<%=custIds%>";
custId=base64encode(custId);
var webcallLevel="<%=webcallLevel%>";
var type="<%=type%>";
if(webcallLevel!='1'&&type!='2'){
var url = "http://webcall.gf.com.cn/flashwebcall/web/et_inner_khjl.jsp?from=webcallwz&custId="+encodeURIComponent(custId);
document.getElementById("mainFrameWebcall").src = url; 
}
function openMainWebcall(url,realNameStr)
	{
		url=url+"&realName="+encodeURIComponent(realNameStr);
		window.open(url,'_blank','height=549,width=681,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=no,status=no,top=100,left=200');
	}
 function openMainWebcall2(url)
	{
		window.open(url,'_blank','height=549,width=681,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=no,status=no,top=100,left=200');
	}
</script>
<jsp:include page="/share/bottom.jsp" />
</div>
</body>
</html>