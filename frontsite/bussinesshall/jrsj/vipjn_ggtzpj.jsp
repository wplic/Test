<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.gazx.jrsj.service.VipgazxService"%>
<jsp:directive.page import="java.util.*"/>
<jsp:directive.page import="com.cssweb.gazx.jrsj.pojo.Vipgazx "/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jsIfUtils.js"></script>
<%
String tdidName="";
String tdid="1";
if(request.getAttribute("tdid")!=null&&!request.getAttribute("tdid").equals(""))
 tdid=(String)request.getAttribute("tdid");
 
if(tdid.equals("1")) {
 tdidName="个股投资评级";
}else if(tdid.equals("2")){
 tdidName="个股盈利预测";
}else if(tdid.equals("3")){
 tdidName="机构持股";
}else if(tdid.equals("4")){
 tdidName="行业综合排名";
}else if(tdid.equals("5")){
 tdidName="新股发行统计";
}else if(tdid.equals("6")){
 tdidName="AB股股价对照";
}

 ServletContext st = this.getServletConfig().getServletContext();
 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
 VipgazxService vipgazxService =(VipgazxService)ctx.getBean("vipgazxService");	
%>
</head>
<script type="text/javascript">
			function opentzpjInfo(gpdm){
				var url="${contextPath}";
 				url=url+"/bussinesshall/jrsj/openggtzpjInfo.jsp?gpdm="+gpdm;
				window.open(url,'newwindow', 'height=600, width=821, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no,top=80,left=300');
			}
			function openContext(guid,zt){
				var url="${contextPath}";
 				url=url+"/bussinesshall/jrsj/GGtzContent.jsp?guid="+guid+"&zt="+ encodeURIComponent(zt) ;
				window.open(url,'newwindow', 'height=600, width=821, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no,top=80,left=300');	
			}
		

</script>
<body class="body_bg">
<jsp:include page="/share/top.jsp" />

<div class="main">
  <div class="dqwz">当前位置：

  <a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; 网上营业厅  &gt;<a href="${contextPath }/bussinesshall/financingCzh.jsp"> 我的理财中心 </a>
   &gt; <%=tdidName %> </div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"> </div>
  <div class="iptvside_mid">
	  <jsp:include page="/bussinesshall/jrsj/vip_lmenu.jsp">
           <jsp:param name="nav2" value="<%=tdid %>"/>
    	</jsp:include>
	  
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
    <div class="left_tit2"><%=tdidName %></div>
    <div class="blank10"></div>

<form action="${contextPath }/vip.do?method=getGgtgpj" name="ggtzpjForm" method="post">
   <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs12">
              
           <tr class="wisdom_tab_title">
           <td width="12%" class="tab_th1 bold">股票代码</td>
           <td width="12%" class="tab_th1 bold">股票简称</td>
           <td width="8%" class="tab_th1 bold">评级</td>
           <td width="35%" class="tab_th1 bold">报告名称</td>
           <td width="18%" class="tab_th1 bold">研究机构</td>
           <td width="15%" class="tab_th1 bold">日期</td>
          </tr>
           <%
             		List gglist =	(List)request.getAttribute("ggPjList");
             		for (int i = 0 ; i<gglist.size() ; i++)
             		{	
             				Vipgazx vipgazx = (Vipgazx)gglist.get(i);
             				Vipgazx bgnrb = vipgazxService.getXwzxDetail(vipgazx.getGuid());
    
             				%>   
             					<tr>
					                <td><a href="#" onclick="opentzpjInfo('<%=vipgazx.getGpdm() %>');return false;"> <%=vipgazx.getGpdm() %></a></td>
					                <td><%=vipgazx.getGpjc() %></td>
					                <td><%=vipgazx.getBzpjmc()%></td>
					                <%
					                		String bgmc = vipgazx.getBgmc();
					                		String zt = "";
					                		if (bgmc != null&& !"".equals(bgmc))
					                		{
					                			zt = bgmc;
					                		}
					                		if (bgmc.length() > 13)
					                		{
					                				bgmc = bgmc.substring(0,13) + "...";
					                		}
					                		
					                 %>
					                <td>
					                 <%
					                 		if (bgnrb != null)
				             				{
				             		 %>
				             			<a href="#" onclick="openContext('<%=bgnrb.getGuid() %>','<%=zt %>');return false;"><%=bgmc%></a>
				             		<%
				             				}
				             				else
				             				{
				             		%>
				             		<%=bgmc%>
				             		<%
				             			}
					                  %>
					                </td>
					                <%
											String yjjg = (String)vipgazx.getYjjg();
											if (!StringUtils.isEmpty(yjjg)) {
										if (yjjg.endsWith("股份有限公司"))
											yjjg = yjjg.substring(0, yjjg.length() - 6);
										else if (yjjg.endsWith("有限公司"))
											yjjg = yjjg.substring(0, yjjg.length() - 4);
										else if (yjjg.endsWith("有限责任公司"))
											yjjg = yjjg.substring(0, yjjg.length() - 6);
											}
											SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
											String bgzxrq = "";
											if (vipgazx.getBgzxrq() != null)
											{
												bgzxrq = sdf.format(vipgazx.getBgzxrq());
											}
									%>
					                <td><%=yjjg%></td>
					                <td><%= bgzxrq %> </td>
					              </tr>
					         <%
             		}
             	 %>
            </table>
             <table width="55%" border="0" cellspacing="0" cellpadding="0" align="center">
	              <tr>
	                <td height="35" class="tdr"><%=PageUtil.pagination("ggtzpjForm",totleCount, currentPage, pagesize)%></td>
	              </tr>
	         </table>
</form>
</div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>


