<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.questionnaire.pojo.Questionnaire"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.questionnaire.pojo.QuestionnaireSubtitle"%>
<%@page import="com.cssweb.questionnaire.pojo.QuestionnaireOptions"%>
<%@page import="org.apache.commons.lang.StringUtils"%><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
</head>
<%
	String questionId = request.getParameter("questionId");

	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	QuestionnaireService questionnaireService = (QuestionnaireService)ctx.getBean("questionnaireservice");
	Questionnaire question = questionnaireService.getInfoById(Long.parseLong(questionId));
	List questionSubList = questionnaireService.getSubtitleByBasicId(Long.parseLong(questionId));
	
%>
<body>
 <% 
 	if(questionSubList!=null && questionSubList.size()>0){
        QuestionnaireSubtitle quesSubTitle = null;
        List optionList = null;
        for(int i=0;i< questionSubList.size();i++){
        	quesSubTitle = (QuestionnaireSubtitle)questionSubList.get(i);
        	String quesType = quesSubTitle.getSubtitletype();
        	String otherShow = quesSubTitle.getOthershow();
        	long quesId = quesSubTitle.getId();
 %>    	

<div class=" blank10"></div>
<table width="70%" border="1" align="center" bordercolor="#cccccc" class="lh30">
  <tr>
    <td class="wj_th1 pl10 bold"><%=i+1 %>.<%=quesSubTitle.getSubtitle() %>？</td>
  </tr>
  <tr>
    <td class="p10"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
    	<%
	         if("2".equals(quesType)){
	             out.println("<tr><td colspan='3'> 文本内容,不做统计</td></tr>");
	         }else{
	             optionList = questionnaireService.getOptionsByBasicId(quesSubTitle.getId());
		         if(optionList!=null && optionList.size()>0){
			         QuestionnaireOptions quesOpt = null;
			         String property = "";
			       
			         for(int j=0;j<optionList.size();j++){
			            quesOpt = (QuestionnaireOptions)optionList.get(j);
			            property = questionnaireService.getProperty(quesId,quesOpt.getId());
			 %>
				      <tr>
				        <td width="8%"><%=quesOpt.getOptioncontent() %></td>
				        <td width="75%"><div class="jdtbg<%=j%3+1 %>" style=" width:<%=property%>%"></div></td>
				        <td width="17%" style="padding-left: 5px"><%=property%>%</td>
				      </tr>
		<%   		}
			         
			         if("0".equals(quesType) && StringUtils.isNotEmpty(otherShow)){
			        	  String other = questionnaireService.getProperty1(quesId);
			   %>      
			     	<tr>
				        <td width="8%"><%=otherShow %></td>
				        <td width="75%"><div class="jdtbg1" style=" width:<%=other%>%"></div></td>
				        <td width="17%" style="padding-left: 5px"><%=other%>%</td>
				      </tr>
			     
			     
			     <%    
			         }
				} 
		     }
		%>
    </table></td>
  </tr>
</table>
<%
        }
 	}	
%>
</body>
</html>