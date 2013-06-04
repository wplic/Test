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

<form action="${contextPath }/vip.do?method=getHyzhpm" name="hyzhpmForm" method="post">
   <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs12">
              
           <tr class="wisdom_tab_title">
           <td width="25%" class="tab_th1 bold">行业名称</td>
           <td width="20%" class="tab_th1 bold">涨跌幅</td>
           <td width="15%" class="tab_th1 bold">市盈率</td>
           <td width="15%" class="tab_th1 bold">流通市值</td>
           <td width="15%" class="tab_th1 bold">总流通市值</td>
           <td width="10%" class="tab_th1 bold">发生日期</td>
          </tr>
            <%
             	

             		List hyzhList =	(List)request.getAttribute("hyzhpmList");
             		String fsrq = "";
             			SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
             		for (int i = 0 ; i < hyzhList.size() ; i++)
             		{	
             				Vipgazx vipgazx = (Vipgazx)hyzhList.get(i);
             				if (vipgazx.getFsrq() != null)
             				{
             					fsrq = sdf.format(vipgazx.getFsrq());
             				}
             				%>   <tr>
					                <td><%= vipgazx.getJjhymc() %></td>
					                <td><%=vipgazx.getZdf() %></td>
					                <td><%=vipgazx.getSyl() %></td>
					              
					                <td><%=vipgazx.getLtsz() %></td>
					              
					                <td><%=vipgazx.getZb() %></td>
					                <td><%= fsrq %></td>
					              </tr>
					         <%
             		}
             	 %>
            </table>
             <table width="55%" border="0" cellspacing="0" cellpadding="0" align="center">
	              <tr>
	                <td height="35" class="tdr"><%=PageUtil.pagination("hyzhpmForm",totleCount, currentPage, pagesize)%></td>
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


