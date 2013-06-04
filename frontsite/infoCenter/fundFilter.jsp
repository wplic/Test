<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.gazxfund.pojo.FundGsInfo"%>
<%@page import="com.cssweb.gazxfund.pojo.FundFilter"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
		List list = (List)request.getAttribute("list");
		Integer curPage = (Integer)request.getAttribute("curPage");
		List  jjlxList =	(List)request.getAttribute("jjlxList");
		List tzdxList =	(List)request.getAttribute("tzdxList");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List jjgsList = (List)request.getAttribute("jjgsList");
		
		List tzlxList = (List)request.getAttribute("tzlxList");
		List tzfgList = (List)request.getAttribute("tzfgList");
		String totalScale = (String)request.getAttribute("totalScale");
		String NAV = (String)request.getAttribute("NAV");
		
		
		
		
				
		String jjdm =	(String)request.getAttribute("jjdm");
		String jjlx =	(String)request.getAttribute("jjlx");
		String gsmc = (String)request.getAttribute("gsmc");
		String tzlx = (String)request.getAttribute("tzlx");
		String tzdx = (String)request.getAttribute("tzdx");
		String tzfg = (String)request.getAttribute("tzfg");
		Double totalScale1 = (Double)request.getAttribute("totalScale1");
		Double totalScale2 = (Double)request.getAttribute("totalScale2");
		Double NAV1 = (Double)request.getAttribute("NAV1");
		Double NAV2 = (Double)request.getAttribute("NAV2");
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
</head>

<body class="body_bg">
<jsp:include page="${contextPath}/share/top.jsp" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 基金 > 基金超市</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	 
	  <jsp:include page="${contextPath}/infoCenter/fund_lmenu.jsp" /></td>
  </tr>
</table>
  </div>
  <div class="iptvside_bot"></div>
  <div class="blank5"></div>
  <p align="center"><a href="${contextPath }/fundFilterAction.do?method=getFilterList"><img src="${contextPath}/pic/infoCenter/ban_jjsx.jpg" /></a></p>
  <div class="blank5"></div>
  <p align="center"><a href="#"><img src="${contextPath}/pic/infoCenter/ban_jjwj.jpg" /></a></p>
  </div>
  <!--左侧sied结束-->
   <form action="${contextPath }/fundFilterAction.do?method=getFilterList" name="fundFilterForm" method="post">
  <!--右侧sied开始-->
  <div class="w706 fright">
  <div class="left_tit2">基金公司列表</div>
    <div class="query_box">
    	<div class="content">
    	  <table width="90%" border="0" align="center" cellpadding="2" cellspacing="4">
    	    <tr>
    	      <td>基金代码：</td>
    	      <td><label>
    	        <input type="text" style="width:148px" value="${jjdm }" name="jjdm" id="jjdm"  />
  	        </label></td>
    	      <td>基金类型：</td>
    	      <td><label>
    	        <select name="jjlx" style="width:100px" id="jjlx">
    	          <option value="">--请选择--</option>
    	          <%
                		if (jjlxList != null && jjlxList.size() > 0)
                		{
                				for (int i = 0 ; i < jjlxList.size();i++)
                				{
                						FundGsInfo fundGsInfo =(FundGsInfo)jjlxList.get(i);
                						if (fundGsInfo.getJjlx().equals(jjlx))
                						{
                							%>
	                						 <option selected="selected" value="<%= fundGsInfo.getJjlx() %>"><%= fundGsInfo.getJjlx() %></option>
	                						<%
                						}
                						else
                						{
	                						%>
	                						 <option value="<%= fundGsInfo.getJjlx() %>"><%= fundGsInfo.getJjlx() %></option>
	                						<%
                						}
                				}
                		}
                 %>
  	          </select>
  	        </label></td>
    	      <td>投资对象：</td>
    	      <td><select name="tzdx" style="width:100px" id="tzdx">
    	        <option value="">--请选择--</option>
    	         <%
              		if (tzdxList != null && tzdxList.size() > 0)
              		{
              				for (int i =0;i< tzdxList.size() ; i++)
              				{
              					FundGsInfo fundGsInfo = (FundGsInfo)tzdxList.get(i);
              					if (fundGsInfo.getTzdx().equals(tzdx))
              					{
              						%>
              						<option  selected="selected" value="<%= fundGsInfo.getTzdx() %>"><%= fundGsInfo.getTzdx() %></option>
              						<%
              					}
              					else
              					{
              					%>
              						<option value="<%= fundGsInfo.getTzdx() %>"><%= fundGsInfo.getTzdx() %></option>
              					<%
              					}
              				}
              				
              				
              		}
               %>
  	        </select></td>
    	    
  	      </tr>
  	      <tr>
    	       <td>基金公司：</td>
          <td><select name="jjgs" style="width:150px" id="jjgs">
            <option value="">--请选择--</option>
            <%
            		if (jjgsList != null && jjgsList.size()>0)
            		{
            				for (int i = 0 ; i < jjgsList.size() ; i ++)
            				{
            					FundGsInfo fundGsInfo = (FundGsInfo)jjgsList.get(i);
            					if (fundGsInfo.getGsmc().equals(gsmc))
            					{
            						%>
            							<option selected="selected" value="<%= fundGsInfo.getGsmc() %>"  title="<%= fundGsInfo.getGsmc() %>"><%= fundGsInfo.getGsmc() %></option>
            						<%
            					}
            					else
            					{
	            					%>
	            						<option value="<%= fundGsInfo.getGsmc() %>" title="<%= fundGsInfo.getGsmc() %>"><%= fundGsInfo.getGsmc() %></option>
	            					<%
            					}
            				}
            		}
             %>
          </select></td>
    	     <td>投资类型：</td>
          <td><select name="tzlx" style="width:100px" id="tzlx">
            <option value="">--请选择--</option>
            <%
            		if (tzlxList != null && tzlxList.size()>0)
            		{
            				for (int i = 0 ; i < tzlxList.size() ; i ++)
            				{
            					FundGsInfo fundGsInfo = (FundGsInfo)tzlxList.get(i);
            					if (tzlx != null && fundGsInfo.getTzlx().equals(tzlx))
            					{
            						%>
	            						<option selected="selected" value="<%= fundGsInfo.getTzlx() %>" title="<%= fundGsInfo.getTzlx() %>"><%= fundGsInfo.getTzlx() %></option>
	            					<%
            					}
            					else
            					{
	            					%>
	            						<option value="<%= fundGsInfo.getTzlx() %>" title="<%= fundGsInfo.getTzlx() %>"><%= fundGsInfo.getTzlx() %></option>
	            					<%
            					}
            				}
            		}
             %>
          </select></td>
    	      <td>投资风格：</td>
    	      <td><select name="tzfg" style="width:100px" id="tzfg">
    	        <option value="">--请选择--</option>
    	        <%
            		if (tzfgList != null && tzfgList.size()>0)
            		{
            				for (int i = 0 ; i < tzfgList.size() ; i ++)
            				{
            					FundGsInfo fundGsInfo = (FundGsInfo)tzfgList.get(i);
            					if (tzfg != null && fundGsInfo.getTzfg().equals(tzfg))
            					{
            						%>
	            						<option selected="selected" value="<%= fundGsInfo.getTzfg() %>" title="<%= fundGsInfo.getTzfg() %>"><%= fundGsInfo.getTzlx() %></option>
	            					<%
            					}
            					else
            					{
	            					%>
	            						<option value="<%= fundGsInfo.getTzfg() %>" title="<%= fundGsInfo.getTzfg() %>"><%= fundGsInfo.getTzfg() %></option>
	            					<%
            					}
            				}
            		}
             %>
  	        </select></td>
    	      
  	      </tr>
  	      <tr>
    	      <td>基金规模：</td>
    	      <td><select name="totalScale" style="width:150px" id="jjgm">
    	       <option value="">--请选择--</option>
    	       <%
    	       			if (totalScale != null && totalScale.equals(";800000000"))
    	       			{
    	       					%>
    	       							<option selected="selected" value=";800000000">--小于等于8亿--</option>
    	       					<%
    	       			}
    	       			else
    	       			{
    	       					%>
    	       						    <option  value=";800000000">--小于等于8亿--</option>
    	       					<%
    	       			}
    	       			
    	       			if (totalScale != null && "800000000;2500000000".equals(totalScale))
    	       			{
    	       					%>
    	       							<option selected="selected" value="800000000;2500000000"> -- 8&nbsp;~ 25亿 --</option>
    	       					<%
    	       			}
    	       			else
    	       			{
    	       					%>
    	       							<option  value="800000000;2500000000"> -- 8&nbsp;~ 25亿 --</option>
    	       					<%
    	       			}
    	       			
    	       			if (totalScale != null && "2500000000;5500000000".equals(totalScale))
    	       			{
    	       					%>
    	       							<option selected="selected" value="2500000000;5500000000">-- 25 ~ 55亿 --</option>
    	       					<%
    	       			}
    	       			else
    	       			{
    	       					%>
    	       							<option value="2500000000;5500000000">-- 25 ~ 55亿 --</option>
    	       					<%
    	       			}
    	       			if (totalScale != null && "5500000000;9000000000".equals(totalScale))
    	       			{
    	       					%>
    	       							<option selected="selected" value="5500000000;9000000000" > -- 55 ~ 90亿 --</option>
    	       					<%
    	       			}
    	       			else
    	       			{
    	       					%>
    	       							<option value="5500000000;9000000000">-- 55 ~ 90亿 --</option>
    	       					<%
    	       			}
    	       			if (totalScale != null && "9000000000;".equals(totalScale) )
    	       			{
    	       					%>
    	       							  <option selected="selected" value="9000000000;">  -- 90亿 以上  --</option>
    	       					<%
    	       			}
    	       			else
    	       			{
    	       					%>
    	       							<option  value="9000000000;">  -- 90亿 以上  --</option>
    	       					<%
    	       			}
    	       			
    	        %>
    	       
             
    	        </select></td>
    	      <td>基金净值：</td>
    	      <td>
    	        <select name="NAV" style="width:100px" id="NAV">
    	          <option value="">--请选择--</option>
    	          <%
    	          		if (NAV != null &&  ";1".equals(NAV))
    	          		{
    	          				%>
    	          					<option selected="selected" value=";1">--小于等于1.0--</option>
    	          				<%
    	          		}
    	          		else
    	          		{
    	          				%>
    	          					<option  value=";1">--小于等于1.0--</option>
    	          				<%
    	          		}
    	          		if (NAV != null &&  "1;1.5".equals(NAV) )
    	          		{
    	          				%>
    	          					<option selected="selected" value="1;1.5">-- 1.0-1.5 --</option>	
    	          				<%
    	          		}
    	          		else
    	          		{
    	          				%>
    	          					<option value="1.5;2">-- 1.5-2.0 --</option>	
    	          				<%
    	          		}
    	          		
    	          		if (NAV != null &&  "2;3".equals(NAV) )
    	          		{
    	          				%>
    	          					 <option selected="selected" value="2;3">-- 2.0-3.0 --</option>
    	          				<%
    	          		}
    	          		else
    	          		{
    	          				%>
    	          					 <option value="2;3">-- 2.0-3.0 --</option>
    	          				<%
    	          		}
    	          		
    	          		if (NAV != null &&  "3;".equals(NAV) )
    	          		{
    	          				%>
    	          					 <option value="3;" selected="selected">-- 大于3.0 --</option>
    	          				<%
    	          		}
    	          		else
    	          		{
    	          				%>
    	          					 <option value="3;">-- 大于3.0 --</option>
    	          				<%
    	          		}
    	          		
    	           %>
    	          
	               
  	          </select>
  	        </td>
    	     
    	      <td><label>
    	        <input type="submit" name="button" id="button" value="查询" class="but_01" />
  	        </label></td>
  	      </tr>
  	    </table>
    	</div>
    </div>
    <div class="blank5"></div>
    <table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
      <tr>
        <td width="10%" class="tab_th1 bold">基金简称</td>
        <td width="12%" class="tab_th1 bold">基金代码 </td>
        <td width="13%" class="tab_th1 bold">基金管理公司</td>
        <td width="12%" class="tab_th1 bold">成立日期</td>
        <td width="12%" class="tab_th1 bold">总份额(亿)</td>
       
        <td width="13%" class="tab_th1 bold">基金类型</td>
       
        <td width="11%" class="tab_th1 bold">单位净值</td>
        <td width="11%" class="tab_th1 bold">累积净值</td>
     
      </tr>
      <%
      		if (list != null && list.size() > 0)
      		{
      				for (int i = 0 ; i < list.size(); i ++)
      				{
      						FundFilter fundFilter = (FundFilter)list.get(i);
      						if (i %2 ==0)
      						{
      								%>
      									   <tr>
									        <td width="10%"><%= fundFilter.getFundShortName() %></td>
									        <td width="12%"><%= fundFilter.getFundCode() %></td>
									        <td width="13%"><%= fundFilter.getCompanyName() %></td>
									        <td width="12%"><%= fundFilter.getFoundationDate() %></td>
									        <td width="12%"><%= fundFilter.getTotalScale() %></td>
									        <td width="13%"><%= fundFilter.getFundType() %></td>
									        <td width="11%"><%= fundFilter.getNAV() %></td>
									       	<td width="11%"><%= fundFilter.getTotalNetValue() %></td>
									      </tr>
      								<%
      						}
      						else
      						{
      								%>
      								
      										 <tr class="bg_ec">
												   <td width="10%"><%= fundFilter.getFundShortName() %></td>
											        <td width="12%"><%= fundFilter.getFundCode() %></td>
											        <td width="13%"><%= fundFilter.getCompanyName() %></td>
											        <td width="12%"><%= fundFilter.getFoundationDate() %></td>
											        <td width="12%"><%= fundFilter.getTotalScale() %></td>
											        <td width="13%"><%= fundFilter.getFundType() %></td>
											        <td width="11%"><%= fundFilter.getNAV() %></td>
											       	<td width="11%"><%= fundFilter.getTotalNetValue() %></td>
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
        
        <td  align="right"><%=PageUtil.pagination("window.fundFilterForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
  </form>
<jsp:include page="/share/bottom.jsp" />
</body>
</html>