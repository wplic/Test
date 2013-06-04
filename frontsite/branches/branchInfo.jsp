<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.common.toDbLob.service.LobService"%>
<%@page import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
<%@page import="com.cssweb.systemset.pojo.TgfFundInfo"%>
<%@page import="com.cssweb.collect.pojo.MgrInfo"%>
<%@page import="com.cssweb.collect.service.MgrInfoService"%>
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
<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List provinceList =	(List)request.getAttribute("provinceList");
		List listxw = (List)request.getAttribute("listxw");
		List listgg = (List)request.getAttribute("listgg");
		List branchList = 	(List)request.getAttribute("branchList");
		List tgfFundList = null;
		if (request.getAttribute("tgfFundList") != null)
		{
				tgfFundList = (List)request.getAttribute("tgfFundList");
		}
		List mgrList = null;
		if (request.getAttribute("mgrList") != null)
		{
			 mgrList = (List)request.getAttribute("mgrList");
		}
		
		String branchId = "";
		if (request.getAttribute("branchId") != null)
		{
				branchId = (String)request.getAttribute("branchId");
		}
		Branch	branchInfo = null;
		if (request.getAttribute("branchInfo") != null)
		{
			branchInfo =(Branch)request.getAttribute("branchInfo");
		}
		
		
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx =  WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		LobService lobService = (LobService)ctx.getBean("lobService");
		MgrInfoService mgrInfoService = (MgrInfoService)ctx.getBean("mgrInfoService");
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script >
		function searchBranch()
		{
				var areaNameId = 	document.getElementById("areaName").options[document.getElementById("areaName").options.selectedIndex].value;
				window.location.href = "${contextPath }/branchManagerAction.do?method=getBranchInfoById&id=" + areaNameId;
		}
		function searchJjrInfo()
		{
				//修改使用branch_no来查找
				//var branch = document.getElementById("areaName").options[document.getElementById("areaName").options.selectedIndex].text;
				//var branch_no=document.getElementById("areaName").value;
				//var branch_no=document.getElementById("branch_no").value;
				//document.getElementById("branch_no").value = branch_no;
				document.getElementById("branchForm").action = "${contextPath}/tgfFundInfoAction.do?method=getTgfFundInfoAll";
				document.getElementById("branchForm").submit();
		}
		function searchYyInfo()
		{
				document.getElementById("branchForm").action = "${contextPath}/mgrInfoAction.do?method=getMgrInfoBySearchPages";
				document.getElementById("branchForm").submit();
		}
</script>
</head>

<body class="body_bg">

<jsp:include page="/share/top.jsp?nav=grgf&nav1=yywd" />
<form action="${contextPath }/branchManagerAction.do?method=getBranchInfoById&id=<%=branchInfo.getId() %>" id="branchForm" name="branchForm" method="post">
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
      <div class="dqwz">当前位置：<a href="${contextPath }/index.html">首页</a> > <a href="${contextPath }/branches/index.html">分支机构</a>  > 营业网点</div>
  
    <table width="95%" align="center" border="1" bordercolor="#cfcfcf" cellspacing="0" cellpadding="0" class="lh27 indent10">
      <tr>
        <td class="wdzx_th">营业部</td>
        <td>
        		<select style="width:300px" name="areaName" id="areaName">
        				<option>---请选择---</option>
        				<%
        						if (branchList != null && branchList.size()>0)
        						{
        								for (int i =0 ; i < branchList.size() ; i ++ )
        								{
        									Branch branch1 =	(Branch)branchList.get(i);
        									String  branchName = "";
        									if ( branch1.getBranchName()!= null)
        									{
        										branchName = branch1.getBranchName() ;
        									}
        									
        									if (branchId != null && branchId.equals(String.valueOf(branch1.getId())))
        									{
	        									%>
		                						    <option selected="selected"   value="<%= branch1.getId() %>" title="<%= branchName %>"><%= branchName %></option>
		                						<%	
	                						}
	                						else
	                						{
	                							%>
		                						    <option    value="<%= branch1.getId() %>" title="<%= branchName %>"><%= branchName %></option>
		                						<%
	                						} 
        								}
        						}
        				 %>
        		</select>
        		<input type="button" onclick="searchBranch();" value="查询"/>
		</td>
         <td class="wdzx_th">营业部编码</td>
        <td> <%=  (branchInfo.getBranchCode() == null?"":branchInfo.getBranchCode()) %></td>
      </tr>
      <tr>
        <td class="wdzx_th">营业部地址</td>
        <td><%= (branchInfo.getAddress()==null?"":branchInfo.getAddress()) %></td>
         <td class="wdzx_th">营业部联系人</td>
        <td><%= (branchInfo.getContector()== null ? "":branchInfo.getContector()) %></td>
      </tr>
      <tr>
        <td class="wdzx_th">联系人手机</td>
        <td><%= (branchInfo.getMobile()==null ?"":branchInfo.getMobile()) %></td>
         <td class="wdzx_th">营业部传真</td>
        <td><%= (branchInfo.getFax() == null ? "":branchInfo.getFax()) %></td>
      </tr>
      <tr>
        <td class="wdzx_th">Email</td>
        <td><%= (branchInfo.getEmail() == null ?"":branchInfo.getEmail()) %></td>
        <td class="wdzx_th">邮编</td>
        <td><%= (branchInfo.getPost() == null ?"":branchInfo.getPost()) %> </td>
      </tr>
      
      
       <tr>
        <td class="wdzx_th">营业部委托电话</td>
        <td><%= (branchInfo.getWphone() == null ?"":branchInfo.getWphone()) %></td>
        <td class="wdzx_th">营业部咨询电话</td>
        <td><%= (branchInfo.getZphone() == null ?"":branchInfo.getZphone()) %> </td>
      </tr>
    </table>
    <br /><br />
    <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" style=" text-indent:0px">
    		<tr>
    				<td>
    					  <div class="left_tit2">
							<table width="95%" align="center" border="0" cellspacing="0" cellpadding="0" style=" text-indent:0px">
							<tr>
							  <td width="2%">&nbsp;</td>
							  <td width="87%">
							        <span class="red2 mr10"  id="tagdp1" onmouseover="SwitchNews('dp', 1, 3,'red2 mr10','font_43 mr10')"><a href="#">营业部简介</a></span>
							        
							         <span class="font_43 mr10"  id="tagdp2" onmouseover="SwitchNews('dp', 2, 4,'red2 mr10','font_43 mr10')"><a href="#">产品特色</a></span>
							       
							        <span class="font_43 mr10" id="tagdp3" onmouseover="SwitchNews('dp', 3, 4,'red2 mr10','font_43 mr10')"><a href="#">基金销售人员资格情况公示</a></span>
							        
							        <span class="font_43 mr10" id="tagdp4" onmouseover="SwitchNews('dp', 4, 4,'red2 mr10','font_43 mr10')"><a href="#">业务人员执业信息</a></span>
							        </td>
							
							</tr>
							</table>
						
						</div>
    				</td>
    		</tr>
    </table>
 
	   <div id="dp1" >
        	 <table  cellpadding="0" bordercolor="#cfcfcf" class="lh27" cellspacing="0" border="1" width="95%" align="center" >
				<tr valign="top">
						<td height="150">
									<%
											String context = "";
											if (branchInfo != null && branchInfo.getIntroduceId() != null )
											{
													TextBlob tblob = lobService.getTextBlobById(branchInfo.getIntroduceId());
													if (tblob != null && tblob.getSource() != null)
													{
														 context =	new String(tblob.getSource(), "UTF-8");
													}
											}
											context="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+context;
											%><%=context%><%
									 %>
						</td>
				</tr>
			</table>
          </div>
          
          <div id="dp2" style="display:none">
        	 <table  cellpadding="0" bordercolor="#cfcfcf" class="lh27" cellspacing="0" border="1" width="95%" align="center" >
				<tr valign="top">
						<td height="150">
									<%
											String feature = "";
											if (branchInfo != null && branchInfo.getFeature() != null)
											{
													TextBlob tblob = lobService.getTextBlobById(branchInfo.getFeature());
													if (tblob != null && tblob.getSource() != null)
													{
														 feature =	new String(tblob.getSource(), "UTF-8");
													}
											}
											context="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+context;
											%><%=feature%><%
									 %>
						</td>
				</tr>
			</table>
          </div>
          
          <div id="dp3" style="display:none">
	           <table  cellpadding="0"  bordercolor="#cfcfcf" class="lh27"  cellspacing="0" border="1" width="95%" align="center" >
					<tr>
							<td height="150"  valign="top">
									 <table cellspacing="0" cellpadding="0" width="100%" class="lh25" border="1" bordercolor="#cccccc">
									      <tr  class="rrtab_tt bold">
									        <td align="center" nowrap="nowrap">基金销售网点</td>
									        <td align="center">地址</td>
									        <td align="center" nowrap="nowrap">客服电话</td>
									        <td align="center" nowrap="nowrap">基金销售人员</td>
									        <td align="center" nowrap="nowrap">资质类型</td>
									         <td align="center" nowrap="nowrap">证书号码</td>
									         <td align="center" nowrap="nowrap">证书名称</td>
									      </tr>
									       <%
									      		if (tgfFundList != null && tgfFundList.size()>0)
									      		{
									      				for (int i = 0 ; i < tgfFundList.size() ; i ++)
									      				{
									      						TgfFundInfo	tgfFundInfo =	(TgfFundInfo)tgfFundList.get(i);
									      						%>
									      								<tr bgcolor="#ffffff">
																        <td nowrap="nowrap" class="pl5"><%= (tgfFundInfo.getBranch() == null ?"":tgfFundInfo.getBranch()) %></td>
																        <td class="pl5"><%= (tgfFundInfo.getAddress() == null ?"":tgfFundInfo.getAddress()) %></td>
																        <td align="center"><%= (tgfFundInfo.getTelno() == null ?"":tgfFundInfo.getTelno()) %></td>
																        <td align="center"><%= (tgfFundInfo.getName() == null ?"":tgfFundInfo.getName()) %></td>
																        <td align="center" ><%= (tgfFundInfo.getCertifytype() == null ?"":tgfFundInfo.getCertifytype()) %></td>
																        <td align="center" ><%= (tgfFundInfo.getCertifyno() == null ?"":tgfFundInfo.getCertifyno()) %></td>
																        <td align="center" ><%= (tgfFundInfo.getCertifyname() == null ?"":tgfFundInfo.getCertifyname()) %></td>
																      </tr>
									      						<%
									      				}
									      		}
									      		
									       %>
									       <tr>
									       		<td colspan="7" align="right"><a href="#" onclick="searchJjrInfo();">more...</a><!-- 下面的input用于保存查询条件发送到action --><input type="hidden" name="branch_no" id="branch_no" value="${branchInfo.branchCode}"/> </td>
									       </tr>
									   </table>
							</td>
					</tr>
				</table>
          </div>
          <div id="dp4" style="display:none">
            <table  cellpadding="0"  bordercolor="#cfcfcf" class="lh27"   cellspacing="0" border="1" width="95%" align="center">
			<tr>
					<td height="150" valign="top">
							 <table cellspacing="0" cellpadding="0" width="100%" class="lh25" border="1" bordercolor="#cccccc">
				 			 		<tr  class="rrtab_tt bold">
										       <td align="center" nowrap="nowrap">姓名</td>
											   <td align="center" nowrap="nowrap">性别</td>
											   <td align="center" nowrap="nowrap">员工编号</td>
											   <td align="center" nowrap="nowrap">所在营业部名称</td>
											   <td align="center" nowrap="nowrap">执业资格</td>
											   <td align="center" nowrap="nowrap">执业资格证书编号</td>
											   <td align="center" nowrap="nowrap">证书有效截止日期</td>
											   <td align="center" nowrap="nowrap">从业资格</td>
							<%
									if (mgrList != null && mgrList.size()>0)
									{
										 for (int i = 0 ; i < mgrList.size() ; i ++ )
										 {
										 		if (i < 5)
										 		{
											 		MgrInfo mgrInfo =(MgrInfo)mgrList.get(i);
											 		 List zsList= mgrInfoService.getMgrInfoZsByYgbh(mgrInfo.getYgbh());
							      					 List kmList= mgrInfoService.getMgrInfoKmByYgbh(mgrInfo.getYgbh());
											 		  if(zsList==null&&kmList==null)
												       {
												       %>
														  <tr>
														    <td  height="80" colspan="6" align="center">
														      <a href="${contextPath }/branches/mgrInfoSearch.jsp?nav=grgf&nav1=mgrInfo"> 
														          没有找到您要查询的资料，请点击返回
														      </a>
														    </td>
														  </tr>
													   <%
												       }else{
												       %>
												   <tr>
												  	<td align="center"><a href="#" onclick="javascript:window.open('${contextPath }/branches/mgrInfo.jsp?ygbh=<%=mgrInfo.getYgbh() %>','','width=492,height=215,resizable=no,scrollbars=no,menubar=no,location=no,status=yes');"> <%=mgrInfo.getYgxm()!=null&&!mgrInfo.getYgxm().equals("")?mgrInfo.getYgxm():"" %></a></td>
												  	<td align="center">
												  	<%
												  	if(mgrInfo.getYgxb()!=null&&mgrInfo.getYgxb().equals("0")){
												  	out.print("");}else if(mgrInfo.getYgxb()!=null&&mgrInfo.getYgxb().equals("1")){
												  	out.print("男");}else if(mgrInfo.getYgxb()!=null&&mgrInfo.getYgxb().equals("2")){
												  	out.print("女");}
												  	%>
												  	</td>
												  	<td align="center">
												  	<%=mgrInfo.getYgbh()>0?mgrInfo.getYgbh():"" %>
												  	</td>
												  	<td align="center">
												  	<%=mgrInfo.getDwmc()!=null&&!mgrInfo.getDwmc().equals("")?mgrInfo.getDwmc():"" %>
												  	</td>
												  	
												  	<td align="center">
												  	<%
												  	 if(zsList!=null&&zsList.size()>0)
												  	 {
												  	   for(int zs=0;zs<zsList.size();zs++)
												  	   {
												  	    MgrInfo zsMgrInfo =(MgrInfo)zsList.get(zs);
												  	    out.print(zsMgrInfo.getZyzglbmc()+" <br/>");
												  	   }
												  	 }else{
												  	   out.print(kmList!=null&&kmList.size()>0?"正在申请中":"无");
												  	 }
												  	 %></td>
												  	<td align="center">
												  	<%
												  	 if(zsList!=null&&zsList.size()>0)
												  	 {
												  	   for(int zs=0;zs<zsList.size();zs++)
												  	   {
												  	    MgrInfo zsMgrInfo =(MgrInfo)zsList.get(zs);
												  	    out.print(zsMgrInfo.getZsbh() +" <br/>");
												  	   }
												  	 }else{
												  	  out.print("无");
												  	 }
												  	 %>
												  	</td>
												  <td align="center"> 
												    <%
												  	 if(zsList!=null&&zsList.size()>0)
												  	 {
												  	   for(int zs=0;zs<zsList.size();zs++)
												  	   {
												  	    MgrInfo zsMgrInfo =(MgrInfo)zsList.get(zs);
												  	    out.print(zsMgrInfo.getZsyxqjssj() +" <br/>");
												  	   }
												  	 }else{
												  	  out.print("");
												  	 }
												  	 %>
												     </td>
												  	<td align="center">
												  		<%
												  	 if(kmList!=null&&kmList.size()>0)
												  	 {
												  	  // for(int km=0;km<kmList.size();km++)
												  	  // {
												  	    //MgrInfo kmMgrInfo =(MgrInfo)kmList.get(km);
												  	    //out.print(kmMgrInfo.getKskmmc()+" <br/>");
												  	  // }
												  	  
												  	    out.println("有");
												  	 }else{
												  	  out.print("无");
												  	 }
												  	 %>
												  	</td>
												  </tr>
												       <%
												     }
											     }
										 }
											
									}
							 %>
							  <tr>
									       		<td colspan="8" align="right"><a href="#" onclick="searchYyInfo();">more...</a><input type="hidden" name="dwbh" id="dwbh" value="<%=(branchInfo.getBranchCode()==null?"":branchInfo.getBranchCode()) %>"/> </td>
									       </tr>
							 
							
						</table>	 
					</td>
			</tr>
			</table>
          </div>
		<br />
    <table width="95%" align="center" border="1" bordercolor="#cfcfcf" cellspacing="0" cellpadding="0" class="lh27">
      <tr>
        <td class="wdzx_th indent10 bold" width="50%">
        		<table width="100%" cellpadding="0" cellspacing="0" border="0">
        				<tr>
        						<td align="left">营业部新闻</td>
        						<td align="right" >
        							<%
        									if (branchInfo != null )
        									{
        											%>
        												<font color="red"><a href="${contextPath }/branchManagerAction.do?method=getBranchNoticeByBranchId&id=<%=branchInfo.getId() %>&type=2">more...</a></font>
        											<%
        									}
        							 %>
        							
        						</td>
        				</tr>
        		</table>
      </td>
        <td class="wdzx_th indent10 bold" width="50%">
        		<table width="100%" cellpadding="0" cellspacing="0" border="0">
        				<tr>
        						<td align="left">营业部公告</td>
        						<td align="right" ><%
        									if (branchInfo != null)
        									{
        											%>
        												<font color="red"><a href="${contextPath }/branchManagerAction.do?method=getBranchNoticeByBranchId&id=<%=branchInfo.getId() %>&type=1">more...</a></font>
        											<%
        									}
        							 %></td>
        				</tr>
        		</table>
        </td>
      </tr>
      <tr>
        <td valign="top"><table width="90%" align="center" class="lh28 mtb16 font_st list_bline1">
       	<%
       			if (listxw != null && listxw.size() > 0)
       			{
       					for (int i = 0 ; i < listxw.size() ; i ++ )
       					{
       							BranchNotice branchNotice=(BranchNotice)listxw.get(i);
       							 %>
						          <tr>
						            <td width="259"><a href="${ctx}/bussinesshall/branchNotice.jsp?id=<%=branchNotice.getId() %>" target=\"_blank\">·<%=branchNotice.getTitle()!=null&&branchNotice.getTitle().length()>18?branchNotice.getTitle().substring(0,18)+"...":branchNotice.getTitle() %> </a></td>
						            <td width="121"><%=sdf.format(branchNotice.getCreateDate()) %></td>
						          </tr>
						          <%
       					}
       			}
       	 %>
         
        
        </table></td>
        <td valign="top"><table width="90%" align="center" class="lh28 mtb16 font_st list_bline1">
          <%if(listgg!=null&&listgg.size()>0 ){
          for(int i=0;i<listgg.size();i++)
          {
          BranchNotice branchNotice=(BranchNotice)listgg.get(i);
          %>
          <tr>
            <td width="259"><a href="${ctx}/bussinesshall/branchNotice.jsp?id=<%=branchNotice.getId() %>" target=\"_blank\">·<%=branchNotice.getTitle()!=null&&branchNotice.getTitle().length()>18?branchNotice.getTitle().substring(0,18)+"...":branchNotice.getTitle() %> </a></td>
            <td width="121"><%=sdf.format(branchNotice.getCreateDate()) %></td>
          </tr>
          <%
        %>
        
        <%} }%>
         
        </table></td>
      </tr>
    </table>

</div>
</form>
<script src="${contextPath }/js/setTab.js"></script>
<jsp:include page="/share/bottom.jsp" /></body>
</html>