<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page	import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<%@page	import="com.cssweb.subscribe.service.TcsswebFwcpcxService"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyCmsService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdyCms"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwtcdySfclService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwtcdyService"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
</head>
<%
String packageId="8";
String packageName="基础服务资讯"; 
String levelsName="";//服务身体等级名字
List userlist=null;
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
TcsswebFwcpcxService tcsswebFwcpcxService = (TcsswebFwcpcxService)ctx.getBean("tcsswebFwcpcxService");

TsystemWebuser tsystemWebuser=null;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	{
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	if(tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
	 {
	    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuser.getLevel());
	    levelsName = dict == null ? "" : dict.getKeyName();
	 }
	 if (tsystemWebuser.getUserType().endsWith("2")) {
	        levelsName = "体验";
	        userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getServiceName() );
	 }else{
	 userlist=tcsswebFwcpcxService.getTcsswebFwcpcxListByAccount(tsystemWebuser.getUserName());
	 }
		if(userlist!=null&&userlist.size()>0)
		{
		 TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)userlist.get(0);
		 packageId=String.valueOf(tcsswebFwcpcx.getProductId());
		 if(packageId.equals("8"))
		 packageName="基础服务资讯";
		 else if(packageId.equals("9"))
		 packageName="乐享套餐";
		 else if(packageId.equals("10"))
		 packageName="优享套餐";
		 else if(packageId.equals("11"))
		 packageName="尊享套餐";
		}
	}
TcsswebFwcpdyCmsService tcsswebFwcpdyCmsService = (TcsswebFwcpdyCmsService)ctx.getBean("tcsswebFwcpdyCmsService");
List fList=tcsswebFwcpdyCmsService.getTcsswebFwcpMlByListByFid(48);
List list=tcsswebFwcpcxService.getTcsswebFwcpcxListAllByPackageId(9l);//

TcsswebFwtcdySfclService tcsswebFwtcdySfclService=(TcsswebFwtcdySfclService)ctx.getBean("tcsswebFwtcdySfclService");
String inputValue="9";
TcsswebFwtcdyService tcsswebFwtcdyService=(TcsswebFwtcdyService)ctx.getBean("tcsswebFwtcdyService");
TcsswebFwtcdy tcsswebFwtcdy=tcsswebFwtcdyService.getTcsswebFwtcdyById(Long.parseLong(inputValue));
DecimalFormat df = new DecimalFormat("0.0###");
java.lang.Double du=0.0;
if(tsystemWebuser!=null&&tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
	 {
	 long userLevel=Long.parseLong(tsystemWebuser.getLevel() == null ? "0" : tsystemWebuser.getLevel());
	 
	 if(tsystemWebuser!=null) {
	     if(tsystemWebuser.getBranchCode()!=null && !tsystemWebuser.getBranchCode().equals(""))
	     {
	         String branchCode="";
	         if((tsystemWebuser.getBranchCode().substring(0,1)).equals("0") )
	         branchCode=tsystemWebuser.getBranchCode().substring(1,tsystemWebuser.getBranchCode().length());
	         else if ((tsystemWebuser.getBranchCode().substring(0,2)).equals("00") )
	         branchCode=tsystemWebuser.getBranchCode().substring(2,tsystemWebuser.getBranchCode().length());
	         else
	         branchCode=tsystemWebuser.getBranchCode();
	         
	         du=tcsswebFwtcdySfclService.getSumSfclByPackageIdAndLevel(inputValue,userLevel-1,branchCode);
	     }
	 }
	 
	 if(du<=0)
	 du=tcsswebFwtcdySfclService.getSumSfclByPackageIdAndLevel(inputValue,userLevel-1,"1");
	}
	
%>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=jgj&nav1=zzfwdypr" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="main">
 <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div>
  <div class="blank10"></div>
</div>
<div class="wrap920">
  <!--左侧sied开始-->
  <div class="side281 fleft">
  
  		<div class="ltit1">
        	<h5>个人信息</h5>
      		<div class="content lh21">
            	<p>尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>，您好：</p>
                <p>您目前的级别属于<span class="red"><%=levelsName %></span>用户，您目前享用的套餐为 <span class="red"><%=packageName %></span>.
                </p>
          <img src="${ctx }/pic/Subscribe/jgj.jpg" class="fleft" />
          <ul style="margin-top:25px">
                <li>·<a href="${ctx }/Subscribe/jgjInfo.jsp" target="_blank">金管家服务介绍</a></li>
                <li>·<a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">进入我的管家咨询</a></li>
            </ul>
            <div class="clear"></div>
            </div>
        </div>
        
        <div class="blank10"></div>
   <div class="ltit1">
  <h5><span class="red">乐享</span>特色介绍</h5>
      		<div class="content lh21" style="min-height:200px; _height:200px">
            <p align="center"><img src="${ctx }/pic/Subscribe/banL1.jpg" /></p>
           广发证券金管家大众资讯套餐，为您提供实用快捷的资讯服务，涵盖大势解盘、热点板块、个股推荐、当日重要新闻点评、周边市场表现、最新重点研发报告推荐、研究机构最新评级等内容。盘中播报让您实时了解投资顾问第一手资讯，助您畅享投资乐趣。
        </div>
        </div>
        <div class="blank10"></div>
  </div>
  <!--左侧sied结束-->

  <!--右侧sied开始-->
  <div class="side626 fright">
 
    <p class="p10 lh21">尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>:<br />
    您原有的金管家服务套餐为金管家<span class="red"><%=packageName %></span>,现更改为<span class="red">
    <%=tcsswebFwtcdy!=null?tcsswebFwtcdy.getPackageName():"" %>
    </span>.
     
      根据您的客户等级和定制的产品，
      <%
      if(du>0){ %>
      您定制产品后佣金水平为：<%=df.format(du*100) %>%
      <%}else{ %>
      您可以免费升级享受<%=tcsswebFwtcdy!=null?tcsswebFwtcdy.getPackageName():"" %>
      <%} %>
      <br />
    </p>
    
  	<table border="0" cellspacing="0" cellpadding="0" width="100%" class="tcTab">  
           <tr class="bold">
            <td width="77" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">类别 </p></td>
            <td width="340" colspan="2" nowrap="nowrap" bgcolor="#f5e4d3"><p align="center">服务内容 </p></td>
          </tr>
               
        	<%
        	 if(fList!=null&&fList.size()>0)
        	 {
        	  for(int p=0;p<fList.size();p++ )
        	  {
        	    List tp=null;
        	    TcsswebFwcpdyCms c1=(TcsswebFwcpdyCms)fList.get(p);
        	    tp= tcsswebFwcpdyCmsService.getTcsswebFwcpMlByListByFid(c1.getId());
        	    String cpflName=c1!=null?c1.getName():"";
        	    %>
		            <% 
		            if(tp!=null&&tp.size()>0){
		            
		            
		            %>
		           
		            
		            <tr>
		            <td width="30%" class="bold">
		             <%=cpflName %></td>  <td ><table width="100%" border="0">
		                  <%
		                  for(int k=0;k<tp.size();k++ )
        	                  {
        	                     TcsswebFwcpdyCms c2=(TcsswebFwcpdyCms)tp.get(k);
        	                      %>
        	                        
 
		            <tr><td class="bold">
        	                      <%=c2!=null?c2.getName():"" %> </td>  
		                           

        	                      <%
        	                       if(list!=null&&list.size()>0)
							        	  {
							        	 %>
							              <td>
							            <%for(int i=0;i<list.size();i++ ) {
							             TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
							             if(tcsswebFwcpcx.getCpml()!=null&&c2.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c2.getId().intValue())
							             {
							            %>
							            <table width="100%" ><tr><td>
							        
							            <%=tcsswebFwcpcx.getProductName() %>
							         </td></tr></table>
							            <%} }%>
							          </td>
			        	               <%}
        	                      }
        	                  %><%
        	                 
				              if(list!=null&&list.size()>0)
				        	  {
					        	 %>
					            
					            <%for(int i=0;i<list.size();i++ ) {
					            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					            if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue())
							     {
					            %>
					         <tr>
		            <td colspan=2>
					           <%=tcsswebFwcpcx.getProductName() %>
					         </td>  </tr>
					            <%} }%>
					           </table></td>
	        	               <%}
		            }else{
		            %>
		            <tr>
		            <td width="30%" class="bold">
		          <%=cpflName %></td>  <td ><table width="100%" border="0">
		            <%
		             if(list!=null&&list.size()>0)
				        	  {
				        	 %>
				             
				            
				            <%for(int i=0;i<list.size();i++ ) {
				            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					         if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue()){
				            %>
				            
				          <tr>
		             <td colspan=2>  
				            <%=tcsswebFwcpcx.getProductName() %> 
				             </td>  </tr>
				            <%} }%>
				            
        	               <%}%>
		            </table></td>
		            <%} %>
		            
        	    <%
        	    }
        	 }
        	 %>
            </table>
<form name="loginForm" action="${ctx}/Subscribe/dylc1.jsp" method="post" id="loginForm">
</form>
<p align="center" class="p10">
<input type="button" name="button" id="button" value="我要定阅" class="dybtn1" onclick="checkLogin('9');"/>
<input type="button" name="button" id="button" value="返回" class="dybtn1" onclick="history.go(-1);"/>
  </p>
  </div>
  <!--右侧sied结束-->
  <div class="clearfloat"></div><!--清除浮动--> 
</div>

<jsp:include page="/share/bottom.jsp" />
<script type="text/javascript">
 function checkLogin(ipvalue){
	   var loginForm=document.getElementById("loginForm");
	    var parameter = document.createElement('input');
			parameter.type = "hidden";
			parameter.name = "inputValue";
			parameter.value =ipvalue;
			loginForm.appendChild(parameter);
	   loginForm.submit();
     }
</script>
</body>
</html>