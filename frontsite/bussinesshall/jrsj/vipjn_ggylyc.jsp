<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
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
%>
</head>

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

<form action="${contextPath }/vip.do?method=getBbyjyc" name="ggylycForm" method="post">
   <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs12">
              
           <tr class="wisdom_tab_title">
           <td width="10%" class="tab_th1 bold">股票代码</td>
           <td width="20%" class="tab_th1 bold">指标名称</td>
           <td width="15%" class="tab_th1 bold">指标时间</td>
           <td width="15%" class="tab_th1 bold">指标值</td>
           <td width="25%" class="tab_th1 bold">研究机构</td>
           <td width="15%" class="tab_th1 bold">报告时间</td>

          </tr>
           <%
             		List bbYjlist =	(List)request.getAttribute("bbYjycList");
             			SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
             			String zbsj = "";
             			String bgzxrq = "";
             			String zbmc = "";
             			String zbz = "";
             		for (int i = 0 ; i < bbYjlist.size() ; i++)
             		{	
             				Vipgazx vipgazx = (Vipgazx)bbYjlist.get(i);
             				if (vipgazx.getZbsj() != null)
             				{
             					zbsj = sdf.format(vipgazx.getZbsj());
             				}
             				if (vipgazx.getBgzxrq() != null)
             				{
             					bgzxrq = sdf.format(vipgazx.getBgzxrq());
             				}
             				if (vipgazx.getZbmc() != null)
             				{
             					zbmc = vipgazx.getZbmc();
             				}
             				if (vipgazx.getZbz() != null)
             				{
             					zbz = vipgazx.getZbz().toString();
             				}
             	%>   
             				<tr>
					                <td width="60" height="30" bgcolor="#FFFFFF"><div align="center"><a href="#" onclick="opentggylycInfo('<%=vipgazx.getGpdm() %>');return false;"> <%=vipgazx.getGpdm() %></a></div></td>
					                <td width="60" bgcolor="#FFFFFF"><div align="center"><%=zbmc %></div></td>
					                <td width="100" bgcolor="#FFFFFF"><div align="center"><%= zbsj %></div></td>
					              
					                <td width="100" bgcolor="#FFFFFF"><div align="center"><%=zbz %></div></td>
					                <%
					                String yjjg = "";
							                if (vipgazx.getYjjgmc() != null)
							                {
													 yjjg = (String)vipgazx.getYjjgmc();
											}
											if (!StringUtils.isEmpty(yjjg)) {
										if (yjjg.endsWith("股份有限公司"))
											yjjg = yjjg.substring(0, yjjg.length() - 6);
										else if (yjjg.endsWith("有限公司"))
											yjjg = yjjg.substring(0, yjjg.length() - 4);
										else if (yjjg.endsWith("有限责任公司"))
											yjjg = yjjg.substring(0, yjjg.length() - 6);
											}
										
									%>
					                <td width="78" bgcolor="#FFFFFF"><div align="center"><%=yjjg%></div></td>
					                <td width="95" bgcolor="#FFFFFF"><div align="center"><%= bgzxrq %> </div></td>
					              </tr>
					         <%
             		}
             	 %>
            </table>
             <table width="55%" border="0" cellspacing="0" cellpadding="0" align="center">
	              <tr>
	                <td height="35" class="tdr"><%=PageUtil.pagination("ggylycForm",totleCount, currentPage, pagesize)%></td>
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


