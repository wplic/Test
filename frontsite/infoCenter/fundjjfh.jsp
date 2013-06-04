
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.gazxfund.pojo.NewFundInfo"%>
<%@page import="com.cssweb.gazxfund.pojo.FundCutInfo"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@ include file="/commons/turnPage.jsp"%>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<%
		Integer curPage = (Integer)request.getAttribute("curPage");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List list =	(List)request.getAttribute("list");
%>
<script type="text/javascript">
		function mySwitchNews(ids)
			{
				if (ids == 'tagtabs11')
				{
						document.getElementById('tagtabs11').className = 'active red bold';
						document.getElementById('tagtabs12').className = ' white bold';
						
						//document.getElementById('fundSort').src= '${contextPath}/fundValueAction.do?method=getOpenFundValueList&nav=zxzx&nav1=jj';
				}
				if (ids == 'tagtabs12')
				{
						document.getElementById('tagtabs11').className = ' white bold';
						document.getElementById('tagtabs12').className = 'active red bold';
						
				}
				
			}
</script> 
<form action="${contextPath}/fundCutInfoAction.do?method=getOpenFundCutInfoList" id="fundValueForm" name="fundValueForm" method="post">
    <div class="blank5"></div>
    <ul class="gsyw_box2">
        	<li class="active red bold" id="tagtabs11" onmouseover="mySwitchNews('tagtabs11')"><a href="${contextPath}/fundCutInfoAction.do?method=getOpenFundCutInfoList&flagJjlx=newopen" target="fundSort">开放式基金</a></li>
            <li class=" white bold" id="tagtabs12" onmouseover="mySwitchNews('tagtabs12')"><a href="${contextPath}/fundCutInfoAction.do?method=getOpenFundCutInfoList&flagJjlx=newclose" target="fundSort">封闭式基金</a></li>
    </ul>
 <div class="blank5"></div>
    <div class="query_bg1">
	<table width="450" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="66" align="center"><strong>选择日期：<input type="hidden" id="flagJjlx" name="flagJjlx" value="${flagJjlx }"/>	</strong></td>
          <td width="85" align="left"><input type="text" id="startDate" name="startDate" readonly="readonly" size="10" value="${startDate }" />
		            	<input type="hidden" id="EndDate" name="EndDate" value=""/></td>
          <td width="28"><a href="javascript:void(0)" onclick="gfPop.fStartPop(document.fundValueForm.startDate,document.fundValueForm.EndDate);return false;" HIDEFOCUS><img src="${ctx}/pic/share/selectTime.gif" name="popcal" width="19" height="18" border="0" align="absmiddle"></a></td>
          <td width="220"  align="left"><input type="submit" name="button2" id="button2" value="查询" class="but_01" /></td>
        </tr>
      </table>
      <div style="height:12px; overflow:hidden"></div> 
    </div>
    <div class="blank5"></div>
	<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
      <tr>
        <td class="tab_th1 bold">序号 </td>
        <td class="tab_th1 bold">基金代码 </td>
        <td class="tab_th1 bold">基金简称 </td>
        <td class="tab_th1 bold">权益登记日 </td>
        <td class="tab_th1 bold" >除息日 </td>
       	<td class="tab_th1 bold">分红发放日</td>
       		<td class="tab_th1 bold">分红比例</td>
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
      							//NewFundInfo newFundInfo	= (NewFundInfo)list.get(i);
      							FundCutInfo fundCutInfo = (FundCutInfo)list.get(i);
      							if ( (i % 2) != 0)
      							{
	      							%>
	      								<tr>
									        <td><%= tmp %></td>
									        <td><%= fundCutInfo.getJjdm() %></td>
									        <td><%= fundCutInfo.getJjjc() %></td>
									        <td><%=fundCutInfo.getQydjr() ==null?"": sdf.format(fundCutInfo.getQydjr()) %> </td>
									        <td><%=fundCutInfo.getCxr() ==null?"":sdf.format(fundCutInfo.getCxr())  %> </td>
									        <td><%= fundCutInfo.getGlffr()==null?"":sdf.format(fundCutInfo.getGlffr()) %></td>
									        <td><%= fundCutInfo.getMsgjjdwffHs()==null?"":fundCutInfo.getMsgjjdwffHs() %></td>
									    </tr>	
	      							<%
      							}
      							else
      							{
      								%>
      									<tr class="bg_ec">
									        <td><%= tmp %></td>
									        <td><%= fundCutInfo.getJjdm() %></td>
									        <td><%= fundCutInfo.getJjjc() %></td>
									        <td><%=fundCutInfo.getQydjr() ==null?"": sdf.format(fundCutInfo.getQydjr()) %> </td>
									        <td><%=fundCutInfo.getCxr() ==null?"":sdf.format(fundCutInfo.getCxr())  %> </td>
									        <td><%= fundCutInfo.getGlffr()==null?"":sdf.format(fundCutInfo.getGlffr()) %></td>
									         <td><%= fundCutInfo.getMsgjjdwffHs()==null?"":fundCutInfo.getMsgjjdwffHs() %></td>
									    </tr>	
      								<%
      							}
      							tmp++;
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

<table width="100%" border="0" cellpadding="5" cellspacing="5">
  <%
	  if (list != null && list.size() > 0)
	  {
	  		if (list.size() < 8)
	  		{
	  				for (int i = 0 ; i < 8; i++)
      				{
      									%>
      									<tr>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									    </tr>	
      									
      									<%
      							}
	  		}
	  }else
      			{
      					for (int i = 0 ; i <8; i++)
      							{
      									%>
      									<tr>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									        <td>&nbsp;</td>
									    </tr>	
      									
      									<%
      							}
      			}

 %>
</table>
    <%
		String flagJjlx = (String)request.getAttribute("flagJjlx");
		if (flagJjlx != null && !"".equals(flagJjlx)){
			if ("newopen".equals(flagJjlx)){
				%>
						<script type="text/javascript">
								document.getElementById("tagtabs11").className = "active red bold";
								document.getElementById("tagtabs12").className = " white bold";
						</script>
				<%
			}
			else{
				%>
						<script type="text/javascript">
								document.getElementById("tagtabs11").className = " white bold";
								document.getElementById("tagtabs12").className = "active red bold";
						</script>
				<%
			}
		}

 %> 
    <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
			src="${contextPath}/js/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; left:-500px; top:0px;"/> 
    