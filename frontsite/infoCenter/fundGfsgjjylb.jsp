<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.systemset.pojo.Jjylb"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>

<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
	if(request.getParameter("nav1")!=null&&!request.getParameter("nav1").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav1"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav")!=null&&!request.getParameter("nav").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav"),10)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
				 }
			}
	if(request.getParameter("nav2")!=null&&!request.getParameter("nav2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("nav2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu")!=null&&!request.getParameter("menu").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu2")!=null&&!request.getParameter("menu2").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu2"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
	if(request.getParameter("menu3")!=null&&!request.getParameter("menu3").equals("")){
		if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("menu3"),10)){
			response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
		 }
	}
		List list = (List)request.getAttribute("list");
		Integer curPage = (Integer)request.getAttribute("curPage");	
		DecimalFormat mdf = new DecimalFormat("#0.0000");
		List  jjlxList =	(List)request.getAttribute("jjlxList");
		List  jjlxlxList =	(List)request.getAttribute("jjlxlxList");
		List  jjlxzdList =	(List)request.getAttribute("jjlxzdList");
		
		String fundName22 = (String)request.getAttribute("fundName");
		String fundType22 = (String)request.getAttribute("fundType");
		String status22 = (String)request.getAttribute("status");
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT LANGUAGE="JavaScript">
     function checkLogin22(){
	   var fundCode=document.getElementById("fundCode").value;
	   var gsmc=document.getElementById("gsmc").value;
	   var fundName=document.getElementById("fundName").value;  
       var fundType=document.getElementById("fundType").value;
	   var urls="${ctx}/jjylbAction.do?method=getJjsgylbInfoAll&nav=zxzx";
	   if(fundCode!="")
	   {
	    urls=urls+"&fundCode="+fundCode;
	   }
	   if(gsmc!="")
	   {
	    urls=urls+"&gsmc="+gsmc;
	   }
	   if(fundName!="")
	   {
	    urls=urls+"&fundName="+fundName;
	   }
	   if(fundType!="")
	   {
	    urls=urls+"&fundType="+fundType;
	   }
	   document.location.href =urls;
    }
</SCRIPT> 
<body class="">
<jsp:include page="${contextPath}/share/top.jsp?nav=zxzx&nav1=jj&nav2=hor1" />
<div class="body_bg">
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index"> 首页 </a>  &gt; 广发申购基金一览</div>
</div>
<form action="${contextPath }/jjylbAction.do?method=getJjsgylbInfoAll&nav=zxzx" id="rForm" name="rForm" method="post">
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="${contextPath}/infoCenter/fund_lmenu.jsp?menu1=hor1&menu2=board1&menu3=gfsgjjylb" />
  </div>
 <div class="iptvside_bot"></div>
  <div class="blank5"></div>
  <div class="blank5"></div>
   
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">基金公司列表</div>
    <div class="blank5"></div>
      <div class=" bg_ec mt5" style=" height:40px;">
    <div style=" height:10px; overflow:hidden"></div>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td width="20%">基金代码：
              <input type="text" name="fundCode" id="fundCode" value="${fundCode }" size="6"/>
            </td>
            <td width="20%">基金名称：
              <input type="text" name="gsmc" id="gsmc" value="${gsmc }" size="6"/>
           </td>
            <td width="28%">基金公司：
              <select name="fundName" id="fundName" style="width: 100px;">
                <option value="">--请选择--</option>
                <%
                		if (jjlxList != null && jjlxList.size() > 0)
                		{
                				for (int i = 0 ; i < jjlxList.size();i++)
                				{
                						Jjylb jjylb =(Jjylb)jjlxList.get(i);
                						if (fundName22 != null && fundName22.equals(jjylb.getFundName() ))
                						{
                							%>
	                						 <option selected="selected" value="<%= jjylb.getFundName() %>"><%= jjylb.getFundName() %></option>
	                						<%	
                						}
                						else
                						{
	                						%>
	                						 <option value="<%= jjylb.getFundName() %>"><%= jjylb.getFundName() %></option>
	                						<%
                						}
                				}
                		}
                 %>
                
               </select>
        
            </td>
            <td width="28%">基金类型：
              <select name="fundType" id="fundType" style="width: 100px;">
                <option value="">--请选择--</option>
                <%
                		if (jjlxlxList != null && jjlxlxList.size() > 0)
                		{
                				for (int i = 0 ; i < jjlxlxList.size();i++)
                				{
                						Jjylb jjylb =(Jjylb)jjlxlxList.get(i);
                						if (fundType22 != null && fundType22.equals(jjylb.getFundType() ))
                						{
                							%>
	                						 <option selected="selected" value="<%=jjylb.getFundType() %>"><%= jjylb.getFundType() %></option>
	                						<%	
                						}
                						else
                						{
	                						%>
	                						 <option value="<%= jjylb.getFundType() %>"><%= jjylb.getFundType() %></option>
	                						<%
                						}
                				}
                		}
                 %>
               </select>
            </td>
            
            <td>
            <label>
              <input type="button" name="button2" id="button2" value="查询" class="but_01"  onclick="checkLogin22();"/>
            </label></td>
          </tr>
        </table>
	</div>
	
    <div class="blank5"></div>
    <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
      <tr>
        <td width="18%" class="tab_th1 bold">基金名称 </td>
        <td width="10%" class="tab_th1 bold">申购代码</td>
        <td width="10%" class="tab_th1 bold">基金类型 </td>
        <td width="5%" class="tab_th1 bold">风险</td>
        <td width="7%" class="tab_th1 bold">净值 </td>
        <td width="30%" class="tab_th1 bold">发行公司</td>
        <td width="20%" class="tab_th1 bold">基金经理</td>
      </tr>
      <%
      		if (list  != null && list.size() > 0)
      		{
      				for (int i = 0; i < list.size(); i ++)
      				{
      					Jjylb jjylb  =	(Jjylb)list.get(i);
      					if ( (i % 2) != 0)
      					{
      						
      					%>
      						<tr>
						        <td align="left"><%=jjylb.getFundName() %></td>
						        <td><%=jjylb.getFundCode() %></td>
						        <td><%=jjylb.getFundType() %></td>
						        <td><%=jjylb.getRisklevel() %></td>
						        <td><%=jjylb.getDwjz()!=null&&jjylb.getDwjz()>0?mdf.format(jjylb.getDwjz()):"" %></td>
						        <td align="left"><%=jjylb.getGsjc() %></td>
						        <td align="left"><%=jjylb.getXm() %></td>
						      </tr>
      					<%
      					
      					}
      					else
      					{
      							%>
      						<tr class="bg_ec">
						        <td align="left"><%=jjylb.getFundName() %></td>
						        <td><%=jjylb.getFundCode() %></td>
						        <td><%=jjylb.getFundType() %></td>
						        <td><%=jjylb.getRisklevel() %></td>
						        <td><%=jjylb.getDwjz()!=null&&jjylb.getDwjz()>0?mdf.format(jjylb.getDwjz()):"" %></td>
						        <td align="left"><%=jjylb.getGsjc() %></td>
						        <td align="left"><%=jjylb.getXm() %></td>
						      </tr>
      							<%
      					}
      				}
      		}
       %>
 
    </table>
    <div class="blank5"></div>
	<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        
        <td  align="right"><%=PageUtil.pagination("window.rForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table>
  </div>

  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
 </form>
<jsp:include page="${contextPath}/share/bottom.jsp" />
</div>
</body>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 31]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>
</html>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${contextPath}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"> 
