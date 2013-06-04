<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@page import="com.cssweb.rzrq.service.PledgeAndKeepService"%>
<%@page import="com.cssweb.rzrq.pojo.PledgeAndKeep"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.rzrq.service.PledgeQuoteService"%>
<%@page import="com.cssweb.rzrq.pojo.PledgeQuote"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/turnPage.jsp"%>
<%@page import="com.cssweb.common.util.PageUtil"%>
<%@page import="java.util.Date"%>

<%
		PledgeAndKeep pledgeAndKeep  =	null;
		if (request.getAttribute("pledgeAndKeep") != null)
		{
			pledgeAndKeep =	(PledgeAndKeep)request.getAttribute("pledgeAndKeep");
		}
		
	   
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		DecimalFormat mdf = new DecimalFormat("#0");
		List<PledgeQuote> quoteList = null;
		if (request.getAttribute("quoteList") != null)
		{
				quoteList = (List)request.getAttribute("quoteList");
		}
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/financing/My97DatePicker/WdatePicker.js" type="text/javascript"></script>

</head>
<body>
<jsp:include page="/commons/mstop.jsp" />
<form action="${contextPath }/pledgeAndKeepAction.do?method=getPledgeAndKeepFrontList&nav3=rzbzjbl" id="pledgeAndKeepForm" name="pledgeAndKeepForm" method="post">

<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/financing/index.html"> 融资融券</a> - <a href="/financing/rateNoticeLl.html">公告信息</a> - 保证金与维持担保</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="/financing/notice_lmenu.jsp?menu=margin&nav3=rzbzjbl" />
         <div class="blank5"></div>
 </div>
  <!--左侧sied结束-->
   
  <!--中侧sied开始-->
  <div class="w706 fright">
  		<div class="comtit1"><h4>融资保证金比例表</h4></div>
    <div class="blank10"></div>
    <table width="96%" align="center">
  <jsp:include page="/financing/indexTitles.jsp">
           <jsp:param name="whichCat" value="ggxxrzbzjbl"/>
    	</jsp:include>

  <tr>
    <td>
    <table width="100%" border="1" bordercolor="#CCCCCC" class="lh25 mtb10 textcenter fcenter">
      <tr>
        <td colspan="4">
        <table>
          <tr>
             <td width="8%">日期：</td>
              <td width="22%">
               <c:choose><c:when test="${startDate!=null }">
                                       <input class="Wdate" name="startDate" id="startDate" type="text" value="${startDate }" onClick="WdatePicker()"> 
  								</c:when>
  								<c:otherwise>
               <input class="Wdate" name="startDate" id="startDate" type="text" value="" onClick="WdatePicker()"> 
							</c:otherwise>
  								</c:choose>

            </td>
        
            <td width="15%">证券代码：</td>
            <td width="15%">
            <c:choose><c:when test="${gpdm!=null }">
             <input type="text" name="gpdm" id="gpdm" value="${gpdm }" class="input108" maxlength="8" onkeyup="value=value.replace(/[^0-9]/g,'')"
                  onkeydown="if(event.keyCode==13){return checkStock();}"
             />
  								</c:when>
  								<c:otherwise>
               <input type="text" name="gpdm" id="gpdm" class="input108" maxlength="8" onkeyup="value=value.replace(/[^0-9]/g,'')"
                  onkeydown="if(event.keyCode==13){return checkStock();}"
             />
							</c:otherwise>
  								</c:choose>
            </td>
            <td width="2%"></td>
            <td width="10%">
            <a href="#" onclick="return checkStock();">
            <input type="button" name="button1" id="button1" value="查询" class="but_01" />
            </a>
            </td>
            <td width="2%"></td>
            <td width="10%">
              <a href="#" onclick="return checkStockQb();">
              <input type="button" name="buttonqb" id="buttonqb" value="全部" class="but_01" />
              </a>
            </td>
          </tr>
        </table>
        
        </td>
     </tr>
      
      <tr class="rrtab_tt bold">
        <td>标的券代码</td>
        <td>标的券名称</td>
        <td>融资保证金比例</td>
         <td>时   间</td>
        </tr>
        <%
        		if (quoteList != null)
        		{
        				for (int i = 0; i < quoteList.size() ; i ++)
        				{
        						PledgeQuote pledgeQuote = (PledgeQuote)quoteList.get(i);
        						%>
        								<tr class="zqpzzslb">
									        <td><%= pledgeQuote.getCode() %></td>
									        <td><%= pledgeQuote.getName() %></td>
									        <td><%
									        if(pledgeQuote.getRzRate()!=null&&pledgeQuote.getRzRate()>0)
									        {
			        							   out.print(mdf.format(pledgeQuote.getRzRate()*100)+"%");
			        						}
									        
									        %></td>
									        <td><%=  pledgeQuote.getPublishDate() %></td>
								        </tr>
        						<%
        				}
        		}
         %>
         <tr>
         		<td colspan="5" align="right" ><%=PageUtil.pagination("window.pledgeAndKeepForm",totleCount, currentPage, pagesize)%></td>
         </tr>
     
    </table></td>
  </tr>
  <tr>
    <td class="lh25">特此公告。</td>
  </tr>

  <tr>
    <td align="right" class="lh25">广发证券股份有限公司<br />
<jsp:include page="/financing/indexTitleUpdateTime.jsp">
		<jsp:param name="whichCat" value="ggxxrzbzjbl"/>
	</jsp:include>
	</td>
  </tr>
  <tr>
    <td class="cuxuxian lh25">&nbsp;</td>
  </tr>
</table>

    <div class="clearfloat h15"></div>
  </div>
  <!--中侧sied结束--> 
   
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
    <div class="blank5"></div>
</form>    
<jsp:include page="/commons/msbottom.jsp" />
</body>
<SCRIPT LANGUAGE="JavaScript">
     function  checkStock(){
          var stockId = document.getElementById("gpdm").value;
          var startDate = document.getElementById("startDate").value;
 		  document.location.href="${contextPath }/pledgeAndKeepAction.do?method=getPledgeAndKeepFrontList&nav3=rzbzjbl&gpdm="+stockId+"&startDate="+startDate;
 	}
 	 function  checkStockQb(){
 		  document.location.href="${contextPath }/pledgeAndKeepAction.do?method=getPledgeAndKeepFrontList&nav3=rzbzjbl";
 	}
</SCRIPT> 
</html>