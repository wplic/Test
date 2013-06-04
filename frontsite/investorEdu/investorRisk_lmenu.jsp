<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireCategoryService"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.questionnaire.pojo.QuestionnaireCategory"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cssweb.questionnaire.pojo.Questionnaire"%>
<%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	QuestionnaireService questionnaireService = (QuestionnaireService)ctx.getBean("questionnaireservice");
	 
	List<Questionnaire> preList = questionnaireService.getPreList();
	
	pageContext.setAttribute("preList",preList);
	
%>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.menactive{  margin-top:8px; padding-bottom:8px; background:url(/pic/infoCenter/menu4_hico.gif) no-repeat; height:28px; line-height:14px; text-indent:17px; display:block}
.menlink{ margin-top:8px;  padding-bottom:8px; background:url(/pic/infoCenter/menu4_lico.gif) no-repeat; height:28px; line-height:14px;text-indent:17px; display:block}
</style>
<table width="195" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
    <td class="lmenu_hov blue3 bold" id="hor1" onclick="selectlMenu('hor1','board1')"><a href="#">风险揭示书</a></td>
  </tr>
  <% 
  String nav3="fxjss";
  if(request.getParameter("nav3")!=null&&!request.getParameter("nav3").equals(""))
  nav3=request.getParameter("nav3").trim();
   %>
  <tr>
    <td id="board1" style=" display:block">
    
	<ul class="menu4l" style="margin:3px 0px 8px 0px;">
        	<li class="<%=nav3.equals("fxjss")?"active red":"link"  %>"><a href="${contextPath }/investorEdu/investorRisk.html">风险揭示书</a></li>
            <li class="<%=nav3.equals("kfxz")?"active red":"link"  %>"><a href="${contextPath }/investorEdu/mknowRisk.jsp?nav3=kfxz">客户须知</a></li>
            <li class="<%=nav3.equals("tzzcrs")?"active red":"link"  %>"><a href="${contextPath }/investorEdu/promiseRisk.jsp?nav3=tzzcrs">投资者承诺函</a></li>
            <li class="<%=nav3.equals("tzzxwzy")?"active red":"link"  %>"><a href="${contextPath }/investorEdu/actionRisk.jsp?nav3=tzzxwzy">投资者行为指引</a></li>
            <li class="<%=nav3.equals("kfsjjfxjs")?"active red":"link"  %>"><a href="${contextPath }/investorEdu/openfundRisk.jsp?nav3=kfsjjfxjs">开放式基金风险揭示</a></li>
           
            <li class="<%=nav3.equals("jkxone")?"active red":"link" %>" style="white-space: nowrap;display:block;"><a title="金快线债券质押式报价回购协议" href="${contextPath }/investorEdu/jkxone.jsp?nav3=jkxone">"金快线"债券质押式报价回购协议</a></li>
            
            <li class="<%=nav3.equals("qzfxjss")?"active red":"link"  %>"><a href="${contextPath }/investorEdu/warrantsRisk.jsp?nav3=qzfxjss">权证风险揭示书</a></li>
            <li class="<%=nav3.equals("sjzqwyfxjss")?"active red":"link"  %>"><a href="${contextPath }/investorEdu/mobileRisk.jsp?nav3=sjzqwyfxjss">手机证券业务风险揭示书</a></li>  
            <li class="<%=nav3.equals("ssjyfxjss")?"active red":"link"  %>" ><a href="${contextPath }/investorEdu/webtradeRisk.jsp?nav3=ssjyfxjss">网上交易风险揭示书</a></li>
            <li class="<%=nav3.equals("sqrk")?"active red":"link"  %>"><a href="${contextPath }/investorEdu/stockquitRisk.jsp?nav3=sqrk">退市整理股票交易风险揭</a></li>
            <li  class="<%=nav3.equals("fxjkts")?"active red":"link"  %>"><a  href="${contextPath }/investorEdu/stockwarnRisk.jsp?nav3=fxjkts">风险警示股票交易风险揭</a></li>  
            <li  class="<%=nav3.equals("tzrxz")?"active red":"link"  %>"><a  href="${contextPath }/investorEdu/webtradeTzrxz.jsp?nav3=tzrxz">基金投资人权益须知</a></li>  
        </ul>
    </td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="zqjyfxts"><a href="${contextPath }/investorEdu/investorZqjyfxts.html">证券交易风险揭示</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="qzfxts"><a href="${contextPath }/investorEdu/investorQzfxts.html">权证风险揭示</a></td>
  </tr>
  <tr>
    <td class="lmenu_a blue3" id="fxffzs"><a href="${contextPath }/investorEdu/investorFxffzs.html">风险防范知识</a></td>
  </tr>
   
</table>
    <div class="blank10"></div>
    <table width="100%" border="1" bordercolor="#cfcfcf" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
      <tr>
        <td class="info_th01"><span class="font_43">调查问卷</span></td>
      </tr>
      <tr>
        <td class="lh28 p10">
        <ul>
        <%
   	   		if (preList != null )
   	   		{
   	   				for (int i = 0; i < preList.size(); i++)
   	   				{
   	   					if (i < 10)
   	   					{
   	   						Questionnaire questionnaire	= (Questionnaire)preList.get(i);
	   	   					%>
	   	   						<li class="li_list1"><a href="${contextPath }/investorEdu/investorSurveyList.jsp?questionId=<%= questionnaire.getId() %>"><%= questionnaire.getTitle() %></a></li>
	   	   					<%
   	   					}
   	   					
   	   				}
   	   		}
   	    %>
        </ul>
        </td>
      </tr>
    </table>
<script src="${contextPath }/js/stock_lmenu.js"></script>
<%
		String nav2 = 	request.getParameter("nav2");
		if (nav2 != null && !"".equals(nav2))
		{
		%>
				<script type="text/javascript">
					document.getElementById('hor1').className = "lmenu_a blue3";
					document.getElementById('board1').style.display = "none";
					document.getElementById('<%=nav2%>').className = "lmenu_hov blue3 bold";
				</script>
		<%
			
		}
		
%>
