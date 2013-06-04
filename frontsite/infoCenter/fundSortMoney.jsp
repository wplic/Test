<%@page import="java.util.List"%>
<%@page import="com.cssweb.gazxfund.pojo.FundValue"%>
<%@page import="com.cssweb.gazxfund.pojo.FundCutInfo"%>
<%@page import="com.cssweb.gazxfund.pojo.FundMoneyValue"%>
<%@page import="com.cssweb.gazxfund.pojo.FundGsInfo"%>
<%@page import="com.cssweb.gazxfund.pojo.FundMoneyValue"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<%
		Integer curPage = (Integer)request.getAttribute("curPage");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List list =	(List)request.getAttribute("list");
		List jjgsList = (List)request.getAttribute("jjgsList");
		List tzlxList = (List)request.getAttribute("tzlxList");
		String gsmc = (String)request.getAttribute("jjgsmc");
		String tzlxs = (String)request.getAttribute("tzlx");
 %>
 <link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<form action="${contextPath }/fundMoneyValueAction.do?method=getFundMoneyValueList&nav=zxzx&nav1=jj" name="fundValueForm" method="post">
<div class="blank5"></div>
    <div class="query_bg1">
  <table width="93%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>基金公司：</td>
          <td><select name="jjgsmc" style="width:150px" id="jjgsmc">
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
          <td>代码：</td>
          <td><input name="jjdm" type="text" id="jjdm" size="10" value="${jjdm }" /></td>
          <td>投资类型：</td>
          <td><select name="tzlx" style="width:80px" id="tzlx">
            <option value="">--请选择--</option>
            <%
            		if (tzlxList != null && tzlxList.size()>0)
            		{
            				for (int i = 0 ; i < tzlxList.size() ; i ++)
            				{
            					FundGsInfo fundGsInfo = (FundGsInfo)tzlxList.get(i);
            					if (tzlxs != null && fundGsInfo.getTzlx().equals(tzlxs))
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
          <td>日期：</td>
          <td><input type="text" id="startDate" name="startDate" readonly="readonly" size="10" value="${startDate }" /><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.fundValueForm.startDate,document.fundValueForm.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a>
		            	<input type="hidden" id="EndDate" name="EndDate" value=""/></td>
          <td align="center"><input type="submit" name="button2" id="button2" value="查询" class="but_01" /></td>
        </tr>
        
      </table>
      <div style="height:12px; overflow:hidden"></div> 
    </div>
    
    <div class="blank5"></div>
 
<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" >
      <tr>
        <td class="tab_th1 bold">序号</td>
        <td class="tab_th1 bold">基金代码 </td>
        <td class="tab_th1 bold">基金名称 </td>
       	<td class="tab_th1 bold">万元单位收益（元） </td>
        <td class="tab_th1 bold">最近7日年华收益率（%）</td>
      </tr>
      <%
      		int tmp = 1;
      		if (curPage > 1)
      		{
      		 tmp = curPage * 20;
      		}
      		if (list != null && list.size() > 0)
      		{
      				for (int i = 0 ; i < list.size() ; i ++)
      				{
      						FundMoneyValue fundMoneyValue = (FundMoneyValue)list.get(i);	
      						if ( (i % 2) != 0)
      						{
      							%>
      								<tr>
								        <td><%= tmp %></td>
								        <td><%= fundMoneyValue.getJjdm() %></td>
								        <td><%= fundMoneyValue.getJjjc() %></td>
								        <td><%= fundMoneyValue.getWfdwsy() == null?"":fundMoneyValue.getWfdwsy() %></td>
								        <td><%= fundMoneyValue.getNsyl() == null?"":fundMoneyValue.getNsyl() %></td>
								        
								      </tr>
      							<%
      						}
      						else
      						{
      							%>
      								<tr class="bg_ec">
								        <td><%= tmp %></td>
								        <td><%= fundMoneyValue.getJjdm() %></td>
								        <td><%= fundMoneyValue.getJjjc() %></td>
								        <td><%= fundMoneyValue.getWfdwsy() == null?"":fundMoneyValue.getWfdwsy() %></td>
								        <td><%= fundMoneyValue.getNsyl() == null?"":fundMoneyValue.getNsyl() %></td>
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
        <td  align="right"><%=PageUtil.pagination("window.fundValueForm",totleCount, currentPage, pagesize)%></td>
      </tr>
    </table>
         </form>
     <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${ctx}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"/> 
    