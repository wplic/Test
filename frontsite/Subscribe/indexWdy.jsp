<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwtcdy"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpcx"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page	import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page	import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.subscribe.service.TcsswebFwcpdyCmsService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebFwcpdyCms"%>
<%@page import="com.cssweb.subscribe.service.TcsswebTipsService"%>
<%@page import="com.cssweb.subscribe.pojo.TcsswebTips"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${ctx }/js/setTab.js"></script>
<script src="${ctx }/js/csswebutf.js"></script>
</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
 String branchCode="";
List list=null;
if(request.getAttribute("list")!=null)
 list=(List)request.getAttribute("list");
List userlist=(List)request.getAttribute("userlist");
String productId="";
String packageId="8";
String sjurl="/Subscribe/zzdy.jsp";
TcsswebFwcpcx tcsswebFwcpcxBt=null;
if(list!=null&&list.size()>0)
	  {
	    tcsswebFwcpcxBt=(TcsswebFwcpcx)list.get(0);
	    productId=String.valueOf(tcsswebFwcpcxBt.getProductId());
	    productId="234";
	    packageId=String.valueOf(tcsswebFwcpcxBt.getPackageId());
	    if(packageId.equals("8"))
	    sjurl="/Subscribe/zzdy2.jsp";
	    if(packageId.equals("9"))
	    sjurl="/Subscribe/zzdyLx.jsp";
	    else if(packageId.equals("10"))
	     sjurl="/Subscribe/zzdyYx.jsp";
	    else if(packageId.equals("11"))
	     sjurl="/Subscribe/zzdyZx.jsp";
	     
	     request.getSession().removeAttribute("packageId");
	     //在权限控制的地方用到
	     request.getSession().setAttribute("packageId",packageId);
	  }
String levelsName="";//服务身体等级名字
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
TcsswebFwcpdyCmsService tcsswebFwcpdyCmsService = (TcsswebFwcpdyCmsService)ctx.getBean("tcsswebFwcpdyCmsService");
TcsswebTipsService tcsswebTipsService = (TcsswebTipsService)ctx.getBean("tcsswebTipsService");

List fList=tcsswebFwcpdyCmsService.getTcsswebFwcpMlByListByFid(48);
TsystemWebuser tsystemWebuser=null;
Boolean tips=true;
	if(request.getSession().getAttribute("tsystemWebuser")!=null)
	{
	tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
	branchCode=tsystemWebuser.getBranchCode();
	System.out.println("      branchCode="+branchCode);
	if(tsystemWebuser.getUserType()!=null&&tsystemWebuser.getUserType().equals("2"))
	sjurl="/Subscribe/zzdy.jsp";
	if(tsystemWebuser.getLevel()!=null && !tsystemWebuser.getLevel().equals(""))
	 {
	    Dictionary dict = dictionaryService.getDictionaryByParentKeyCodeAndDesc("fwzl",tsystemWebuser.getLevel());
	    levelsName = dict == null ? "" : dict.getKeyName();
	 }
	 if (tsystemWebuser.getUserType().endsWith("2")) {
	        levelsName = "体验";
	 }
	     List listtp=null;
		 if(tsystemWebuser.getUserType()!=null&&tsystemWebuser.getUserType().equals("2")){
		   listtp=tcsswebTipsService.getAllTcsswebTipsByAccount(tsystemWebuser.getServiceName());
		 }else{
		      listtp=tcsswebTipsService.getAllTcsswebTipsByAccount(tsystemWebuser.getUserName());
		  }
		  if(listtp!=null&&listtp.size()>0)
				{
				tips=false;
				}	
	}
	
	Map npmap=new HashMap();
	List nlist=tcsswebFwcpdyCmsService.getNotByListByPackageid(Long.valueOf(packageId));
	
	if(nlist!=null&&nlist.size()>0 )
	{
	 for(int i=0;i<nlist.size();i++ ){
	  TcsswebFwcpdyCms cn=(TcsswebFwcpdyCms)nlist.get(i);
	  npmap.put(cn.getId(),cn.getName());
	 }
	}
	
	if(tips==true){
		if(sqlInjectValidate.boolenanbranchCode(branchCode)){
		 tips=true;
		}else{
		tips=false;
		}
	}
%>
<body class="body_bg" <%=tips==true?"onload=Effect.openwin('msgview');":"" %>>
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 &gt; <a href="${ctx }/tcsswebFwcpcxAction.do?method=getTcsswebFwcpcxListByAccount">我的管家资讯</a></div>
  <jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp">
		<jsp:param name="nav3" value="gdgjzx" />
	</jsp:include>
  <div class="blank5"></div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
    <table width="189" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
      <tr>
        <td align="center"><img src="${ctx }/pic/Subscribe/lban1.jpg" /></td>
      </tr>
      <tr>
        <td class="dyInfo">
        	尊敬的<%=tsystemWebuser!=null&&tsystemWebuser.getServiceName()!=null?tsystemWebuser.getServiceName():"" %>：<br />
			您好，您目前的级别为<span class="red"><%=levelsName %></span>
			客户，享受的套餐为<%=tcsswebFwcpcxBt!=null?tcsswebFwcpcxBt.getPackageName():"" %>。
			<p align="right" class="p50">
			<%if(sqlInjectValidate.boolenanbranchCode(branchCode)){ %>
			<%if(!packageId.equals("11")){ %>
			<a href="${ctx }/Subscribe/zzdy2.jsp"><img src="${ctx }/pic/Subscribe/btn_sj.jpg" /></a>
			<%}if(!packageId.equals("8")){ %>
			<a href="${ctx }/Subscribe/tdtc.jsp"><img src="/pic/xu0608/btn_td.gif" /></a>
			<%} }%>
			</p>
			<p><img src="${ctx }/pic/Subscribe/dot4.gif" align="absmiddle" />
			<span class="red"><a href="${ctx }/Subscribe/jgjInfo.jsp" target="_blank">金管家资讯套餐服务介绍</a></span></p>
        </td>
      </tr>
      <tr>
        <td class="wdlc_ltag1 white"><a href="#">您的专属管家资讯</a></td>
      </tr>
      <tr>
        <td>
        	<div class="blank5"></div>
        	<div class="dym1"><%=tcsswebFwcpcxBt!=null?tcsswebFwcpcxBt.getPackageName():"" %></div>
        	
        	<%
        	 if(fList!=null&&fList.size()>0)
        	 {
        	  for(int p=0;p<fList.size();p++ )
        	  {
        	    List tp=null;
        	    TcsswebFwcpdyCms c1=(TcsswebFwcpdyCms)fList.get(p);
        	    tp= tcsswebFwcpdyCmsService.getTcsswebFwcpMlByListByFid(c1.getId());
        	    %>
		            <% 
		            if(tp!=null&&tp.size()>0){
		            %>
		            <div class="dym2" id="fd<%=p+1 %>" onclick="wdycpss('fd', <%=p+1 %>, <%=tp.size() %>,'','');<%=npmap.get(c1.getId())!=null?"nopt();":"" %>"> 
		            <img src="${ctx }/pic/Subscribe/sidep2.jpg" align="absmiddle" id="imgfd<%=p+1 %>"/>
		             <a href="#"><%=c1!=null?c1.getName():"" %></a></div>
		                  <%
		                  for(int k=0;k<tp.size();k++ )
        	                  {
        	                     TcsswebFwcpdyCms c2=(TcsswebFwcpdyCms)tp.get(k);
        	                      %>
        	                        <div class="dym2" id="fdtp<%=p+1%><%=k+1 %>" style="display:none" onclick="wdycp('fdtp<%=p+1 %>', <%=k+1 %>, '','','');;<%=npmap.get(c2.getId())!=null?"nopt();":"" %>" > 
        	                        <p align="center">
        	                        <img src="${ctx }/pic/Subscribe/sidep2.jpg" align="absmiddle" id="imgfdtp<%=p+1%><%=k+1 %>"/>
		                            <a href="#"> <%=c2!=null?c2.getName():"" %> </a>
		                            </p>
		                            </div>
        	                      <%
        	                       if(list!=null&&list.size()>0)
							        	  {
							        	 %>
							            <ul class="dym3" id="fdtp<%=p+1%>ss<%=k+1 %>" style="display:none">
							            <%for(int i=0;i<list.size();i++ ) {
							             TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
							             if(tcsswebFwcpcx.getCpml()!=null&&c2.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c2.getId().intValue())
							             {
							            %>
							           
							            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:76px;">
				                         <img src="${ctx }/pic/msindex/list_01.gif"/>
							            <a href="#" onclick="openlistcms(<%=tcsswebFwcpcx.getProductId() %>);">
							            <%=tcsswebFwcpcx.getProductName() %></a>
							            </p>
							            <%} }%>
							            </ul>
			        	               <%}
        	                      }
        	                  
        	                 
				              if(list!=null&&list.size()>0)
				        	  {
					        	 %>
					            <ul class="dym3" id="fdss<%=p+1 %>" style="display:none">
					            <%for(int i=0;i<list.size();i++ ) {
					            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					            if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue())
							     {
					            %>
					            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:21px;">       
					            <img src="${ctx }/pic/msindex/list_01.gif" />
					            <a href="#" onclick="openlistcms(<%=tcsswebFwcpcx.getProductId() %>);"><%=tcsswebFwcpcx.getProductName() %></a>
					            </p>
					            <%} }%>
					            </ul>
	        	               <%}
		            }else{
		            %>
		            <div class="dym2" id="fd<%=p+1 %>" onclick="wdycp('fd<%=p+1 %>', <%=1 %>, '','','');<%=npmap.get(c1.getId())!=null?"nopt();":"" %>" > 
		            <img src="${ctx }/pic/Subscribe/sidep2.jpg" align="absmiddle" id="imgfd<%=p+1 %><%=1 %>"/>
		            <a href="#"><%=c1!=null?c1.getName():"" %></a></div>
		            <%
		            System.out.println("                   c1============"+c1.getId() );
		             if(list!=null&&list.size()>0)
				        	  {
				        	 %>
				             
				            <ul class="dym3" id="fd<%=p+1 %>ss1" style="display:none">
				            <%for(int i=0;i<list.size();i++ ) {
				            TcsswebFwcpcx tcsswebFwcpcx=(TcsswebFwcpcx)list.get(i);
					         if(tcsswebFwcpcx.getCpml()!=null&&c1.getId()!=null&&tcsswebFwcpcx.getCpml().intValue()==c1.getId().intValue()){
				              if(tcsswebFwcpcx.getProductId()==236||tcsswebFwcpcx.getProductId()==228||tcsswebFwcpcx.getProductId()==258||tcsswebFwcpcx.getProductId()==222){
				            %>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:21px;">
							<img src="${ctx }/pic/msindex/list_01.gif"/>            
				            <a href="#"><%=tcsswebFwcpcx.getProductName() %></a>
				            </p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'zqyj_yjbg_gsyj','公司类研究报告','');" >公司类研究报告</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'zqyj_yjbg_hgyj','宏观类研究报告','');" >宏观类研究报告</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'zqyj_yjbg_scyj','市场策略研究','');" >市场策略研究</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'zqyj_yjbg_hyyj','行业研究报告','');" >行业研究报告</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'zqyj_yjbg_gdsycy','债券研究报告','');" >债券研究报告</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'zqyj_yjbg_yspyj','衍生品市场报告','');" >衍生品市场报告</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'nbzx_xgcjzx','香港财经资讯','');" >香港财经资讯</a></p>
				            <%}else if(tcsswebFwcpcx.getProductId()==237||tcsswebFwcpcx.getProductId()==223||tcsswebFwcpcx.getProductId()==229||tcsswebFwcpcx.getProductId()==257){
				            %>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:21px;">
							<img src="${ctx }/pic/msindex/list_01.gif"/>            
				            <a href="#"><%=tcsswebFwcpcx.getProductName() %></a>
				            </p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVip(<%=tcsswebFwcpcx.getProductId() %>,'01','公司研究','');">
				            公司研究</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVip(<%=tcsswebFwcpcx.getProductId() %>,'02','行业研究','');">
				              行业研究</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVip(<%=tcsswebFwcpcx.getProductId() %>,'03','策略研究','');">
				              策略研究</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVip(<%=tcsswebFwcpcx.getProductId() %>,'04','股票市场','');">
				            股票市场</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				           <a href="#" onclick="resetCartNameVip(<%=tcsswebFwcpcx.getProductId() %>,'05','基金市场','');">
				            基金市场</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVip(<%=tcsswebFwcpcx.getProductId() %>,'06','债券市场','');">
				            债券市场</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				           <a href="#" onclick="resetCartNameVip(<%=tcsswebFwcpcx.getProductId() %>,'07','金融工程','');"> 
				            金融工程</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVip(<%=tcsswebFwcpcx.getProductId() %>,'08','宏观研究','');">
				            宏观研究</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVip(<%=tcsswebFwcpcx.getProductId() %>,'09','专题研究','');">
				            专题研究</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVipGgpj(<%=tcsswebFwcpcx.getProductId() %>,'','个股评级','');">
				            个股评级</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVipYlyc(<%=tcsswebFwcpcx.getProductId() %>,'','盈利预测','');">
				              盈利预测</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVipZxtzpj(<%=tcsswebFwcpcx.getProductId() %>,'','最新投资评级','');">
				            最新投资评级</a>
				            </p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVipJggpc(<%=tcsswebFwcpcx.getProductId() %>,'','机构股票池','');">
				            机构股票池</a></p>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;">
				            <a href="#" onclick="resetCartNameVipPjtggg(<%=tcsswebFwcpcx.getProductId() %>,'','评级调高个股','');">
				            评级调高个股</a></p>
			<p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'blcj_nbzx_zgsxcj','中国首席财经','');">中国首席财经</a></p>
            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'blcj_nbzx_sxzqcc','首席证券内参','');">首席证券内参</a></p>
            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'blcj_nbzx_gcjcck','高层决策参考','');">高层决策参考</a></p>
            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:36px;"><a href="#" onclick="resetCartName(<%=tcsswebFwcpcx.getProductId() %>,'blcj_nbzx_cyb','创业板','');">创业板</a></p>
				            
				            <%}else{ %>
				            <p style="height:22px; line-height:22px; margin-bottom:5px; text-indent:21px;">
							<img src="${ctx }/pic/msindex/list_01.gif"/>            
				            <a href="#" onclick="openlistcms(<%=tcsswebFwcpcx.getProductId() %>);"><%=tcsswebFwcpcx.getProductName() %></a>
				            </p>
				            <%}} }%>
				            </ul>
        	               <%}
		            
		            } %>
		            
        	    <%
        	    }
        	 }
        	 %>
        	
        	
        	
        	 <%
              if(list!=null&&list.size()>0)
        	  {}else{ %>
            <p align="center"><img src="${ctx }/pic/Subscribe/lban2.jpg" /></p>
            <%} %>
            <div class="blank10"></div>
        </td>
      </tr>
    </table>
    
    	
  </div>
  <div class="iptvside_bot"></div>
  <div class="blank10"></div>
  
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始--> 
  <div class="w706 fright">

   <iframe id="prodCmsList" name="prodCmsList" src="${ctx }/Subscribe/prodtocmslist.jsp?productId=<%=productId %>" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height="100%"></iframe>
  </div>
   <!--右侧sied结束--> 
    <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />

<div class="winfix" id="msgview" style="display:none">
<iframe src="" style="width:345px;height:0;top:0px;left:0px;position:absolute;visibility:inherit;z-index:-1;" frameborder=0></iframe>
	<div class="popTit" onmousedown="Effect.Mdrag('msgview',event)" ><em><a href="#" onclick="Effect.openwin('msgview')"><img src="${ctx }/pic/Subscribe/dot4.jpg" /></a></em>公告</div>
    <div class="popCon">
    尊敬的金管家客户：<br />
    　　为了向您提供更全面、更精细的理财服务，广发证券于2011年8月隆重推出金管家资讯服务套餐（乐享套餐、优享套餐及尊享套餐）。您可以根据您的需求选择合适的资讯服务套餐。敬请关注。<br />
　　金管家资讯服务套餐的推出，使客户您有机会获得金管家更高级别、更有价值的投资理财服务。具体套餐介绍、定制规则及方法请见金
<a href="${ctx }/Subscribe/jgjInfo.jsp" target="_blank"><font color='red'> 管家资讯套餐介绍</font></a>。为答谢您对金管家一直以来的支持与厚爱，广发证券已在广发网“网上营业厅——>我的管家资讯”栏目及网上交易软件资讯栏目根据您的级别为您自动匹配了对应的资讯套餐，若要获取更高级别的资讯套餐服务，您可以根据套餐定制规则选择升级定制套餐，并通过广发网“网上营业厅——>套餐定制查询”栏目查看套餐定制进度情况。详情请垂询开户营业部或拨打金管家专线95575。<br />
　　感谢您的支持，让金管家与您共创美好未来。<br />
						
						<table width="97%" align="center">
          <tr>
   
            <td width="50%">&nbsp;</td>
            <td align="center">
            广发证券<br />
						2011年8月
            </td>
            </tr>
            
          </table>

    </div>
    <div class="popBot">
    	<input name="" onclick="Effect.openwin('msgview');checktipsTo();" type="button" value="我知道了" class="popBtn1" />
    	<input id="checktips" name="checktips" type="checkbox" value="1"/>下次不再提示
    	<iframe id="checktipsifra" name="checktipsifra" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="0" height="0"></iframe> 
    </div>
</div>
<div id="winmask" style="display:none"></div> <!-- 遮罩层 --> 
<script type="text/javascript">
function resetCartName(productId,whichCat,titleName ,dv)
 	{
 		var url="${ctx }/Subscribe/yjprodtocmslist.jsp";
 		url=url+"?productId="+productId;
 		url=url+"&whichCat=" + whichCat+ "&titleName="+ encodeURI(titleName);
 		document.getElementById("prodCmsList").src = url;
 	}
function resetCartNameVip(productId,whichCat,titleName ,dv){
        var url="${ctx }/vip.do?method=getJrsjGazxList2";
 		url=url+"&productId="+productId;
 		url=url+"&whichCat=" + whichCat+ "&titleName="+ encodeURI(titleName);
 		document.getElementById("prodCmsList").src = url;
}

function resetCartNameVipGgpj(productId,whichCat,titleName ,dv){
      var url="${ctx }/vip.do?method=getJrsjGazxGgpjList2";
 		url=url+"&productId="+productId;
 		document.getElementById("prodCmsList").src = url;
}
function resetCartNameVipYlyc(productId,whichCat,titleName ,dv){
        var url="${ctx }/vip.do?method=getJrsjBgylycbList2";
 		url=url+"&productId="+productId;
 		document.getElementById("prodCmsList").src = url;
}

function resetCartNameVipZxtzpj(productId,whichCat,titleName ,dv){
        var url="${ctx }/zxtzpj.do?method=getZxtzpjList2";
 		url=url+"&productId="+productId;
 		document.getElementById("prodCmsList").src = url;
}
function resetCartNameVipJggpc(productId,whichCat,titleName ,dv){
        var url="${ctx }/jggpc.do?method=getJggpcList2";
 		url=url+"&productId="+productId;
 		document.getElementById("prodCmsList").src = url;
}
function resetCartNameVipPjtggg(productId,whichCat,titleName ,dv){
        var url="${ctx }/pjtggg.do?method=getPjtgggList2";
 		url=url+"&productId="+productId;
 		document.getElementById("prodCmsList").src = url;
}

function openlistcms(productId)
	{
		var url="${ctx }/Subscribe/prodtocmslist.jsp";
		url=url+"?productId="+productId;
	    document.getElementById("prodCmsList").src = url;
	}
	function wdycpss(obj,num,sum,class1,class2)
	{
	  for(var i=1;i<=sum;i++)
	  {
	   if(document.getElementById(obj+"tp"+num+i)!=null){
		    if(document.getElementById(obj+"tp"+num+i).style.display =="block")
		    {
		     document.getElementById(obj+"tp"+num+i).style.display = "none";
		     var iname=obj+"tp"+num;
		     wdycpnone(iname, i, '',obj+num,'');
		     
		    }else{
			    document.getElementById(obj+"tp"+num+i).style.display = "block";
			   }
	    }
	  }
	  if(document.getElementById(obj+"ss"+num)!=null)
	  {
		    if(document.getElementById(obj+"ss"+num).style.display =="block")
		    {
		     document.getElementById("img"+obj+num).src="${ctx }/pic/Subscribe/sidep2.jpg";
		     document.getElementById(obj+"ss"+num).style.display = "none";
		    }else{
		     document.getElementById("img"+obj+num).src="${ctx }/pic/Subscribe/sidep1.jpg";
		    document.getElementById(obj+"ss"+num).style.display = "block";
		    }
	  }
	  
	}
	
	function wdycp(obj,num,sum,class1,class2)
	{
	  if(document.getElementById(obj+"ss"+num)!=null)
	  {
	   if(document.getElementById(obj+"ss"+num).style.display == "block")
	   {
	   document.getElementById("img"+obj+num).src="${ctx }/pic/Subscribe/sidep2.jpg";
	   document.getElementById(obj+"ss"+num).style.display = "none";
	   }else{
	   document.getElementById("img"+obj+num).src="${ctx }/pic/Subscribe/sidep1.jpg";
	   document.getElementById(obj+"ss"+num).style.display = "block";
	   }
	  }
	  
	}
	function wdycpnone(obj,num,sum,class1,class2)
	{
	  if(document.getElementById(obj+"ss"+num)!=null)
	  {
	   document.getElementById("img"+obj+num).src="${ctx }/pic/Subscribe/sidep2.jpg";
	   document.getElementById(obj+"ss"+num).style.display = "none";
	  }
	  
	}
	
	function checktipsTo()
	{
	 if(document.getElementById("checktips").checked){
	   var url = "${ctx }/Subscribe/tips.jsp";
	   document.getElementById("checktipsifra").src = url; 
	 }
	}
	
	function nopt()
	{
	 alert("您没有权限查看该栏目下面的产品，请尽快升级。如有疑问可以咨询您所在的营业部！");
	}
</script>
</body>
</html>