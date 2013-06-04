<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.questionnaire.service.QuestionnaireService"%>
<%@page import="com.cssweb.questionnaire.pojo.Questionnaire"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.questionnaire.pojo.QuestionnaireSubtitle"%>
<%@page import="com.cssweb.questionnaire.pojo.QuestionnaireOptions"%>
<%@page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@page import="com.cssweb.common.dictionary.service.DictionaryService"%>
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%>
<%@page import="com.cssweb.assetManager.pojo.AssetUser"%><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investorEdu/investorEdu.css" rel="stylesheet" type="text/css" />
<script  language=javascript>   
  function  commit(thisForm)   
  {   
	document.frm.submit();
  }   
</script>  
</head>

<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="wrap_r262">
<form name="frm" method="post" action="${ctx }/questionnaire.do?method=addLcQuestionData" >

<%
ServletContext st = this.getServletConfig().getServletContext();
ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
QuestionnaireService questionnaireService = (QuestionnaireService)ctx.getBean("questionnaireservice");
Questionnaire question = questionnaireService.getLcQuestion();
DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
AssetUser asset = (AssetUser)request.getSession().getAttribute("assetUser");
	if(asset!=null&&(asset.getFundAccount().length()>=15||asset.getFundAccount().substring(0, 2).equals("98")||asset.getFundAccount().substring(0, 2).equals("87"))){
	
	if(question==null){
%>
	<div class="wrap_r262" align="center">
			无此问卷调查
	</div>
<%		
	}
	else{
		
		
			List personList =  questionnaireService.getPersonByQustIdWebuserId(Long.valueOf(question.getId()),Long.valueOf(asset.getFundAccount()));
			if(personList.size()>0){
				%>
				<script>
						alert("您已参加过该活动！");
						history.go(-1);
				</script>
			<%}
			if(request.getAttribute("message")!=null){
				%>
				<script>
						alert("您还未填写全部选项,请完成后再提交!");
						history.go(-1);
				</script>
			<%}
			if(request.getAttribute("flag")!=null){
				%>
				<script>
						alert("您已参加过该活动！");
						history.go(-1);
				</script>
			<%}
		
		//根据问卷调查的用户级别，查询字段对象 ，以获得级别名称
		//有效答卷数量
		long answerCount = questionnaireService.getPersonInfoTotal(Long.valueOf(question.getId()));
		List questionSubList = questionnaireService.getSubtitleByBasicId(Long.valueOf(question.getId()));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
   <input type="hidden" name="userId" value="<%=asset==null?"":asset.getFundAccount()%>"/>
  <div class="w650 fleft">
	<div class="dqwz">热烈庆祝广发证券成立20周年，回馈资产理财客户，多重好礼送不停</div>
        <div class="left_tit1 red bold">问卷调查<%=question.getTitle()==null?"":"("+question.getTitle()+")" %></div>
    <div class=" blank10"></div>
        <table width="92%" align="center" class="mt10">
          <tr>
            <td colspan="2" class="lh20 ptb13">说明：<%=question.getContent()==null?"":question.getContent() %></td>
          </tr>
        </table>
    <div class=" blank5"></div>
        <table width="92%" border="1" align="center" bordercolor="#cccccc" class="lh30">
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
          <tr>
            <td class="wj_th1 pl10"><%=i+1 %>.<%=quesSubTitle.getSubtitle() %>？</td>
          </tr>
       	  <tr>
            <td class="p10">
	            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
	                <tr >	
	                	<%
	                	if("2".equals(quesType)){
	                		out.println("<td><textarea rows=5 style=\"width:90%\" name=\"item" + quesId + "\"></textarea></td>");
	                	}else{
	                		optionList = questionnaireService.getOptionsByBasicId(quesSubTitle.getId());
		                	if(optionList!=null && optionList.size()>0){
		                		QuestionnaireOptions quesOpt = null;
		                		for(int j=0;j<optionList.size();j++){
		                			quesOpt = (QuestionnaireOptions)optionList.get(j);
		                	%>
		                	
		                		<td>
		                		<%
		                		if(j!=0&&j%2==0){
		                			out.println("</td></tr><tr><td>");
		                		}
		                		if("0".equals(quesType)){
		                			out.println("<input name='item"+quesId+"' type='radio'  value='"+quesOpt.getId()+"'>");
		                		} else if("1".equals(quesType)){
		     
		                			out.println("<input name='item"+quesId+"' type='checkbox'  value='"+quesOpt.getId()+"'>");
		                		} else{}
		                		
		                		%>
		                		
		                		<%=quesOpt.getOptioncontent()%>
		                		
		                		<%	
		                		
		                		}
		                		if("0".equals(quesType) && StringUtils.isNotEmpty(otherShow)){
		                			out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
		                			otherShow+"：<input name='item"+quesId+"' type='text'  value=''>");
		                		}
		                		
		                		%>
		                		</td>
		                		<%
		                	}
		                	
		                }
		              %>
	                	
	                	
	                </tr>
              	</table>
            </td>
          </tr>
       <%  	
        	    }
          
          	}
          %>
        </table>
         <br/>
          <input type="hidden" name="questionId" value="<%=question.getId()%>">
          <center><img src="/pic/investorEdu/but_wjtj.jpg" onclick="commit(this.form)" style="cursor: hand"/></center>
         
        <div class=" blank10"></div>
<p align="center">&nbsp;</p>
  </div>
  <div class="w262 fright bg_ec ptb13">
  		<div class="side_top"></div>
    <div class="side_mid">
   	  <p align="center"><img src="/pic/investorEdu/wj_rpic.jpg" /></p>
   	  <table width="82%" align="center" class="lh22 mt5">
   	    <tr>
   	      <td>发布日期：</td>
   	      <td><%=sdf.format(question.getPublishdate())%></td>
        </tr>
   	    <tr>
   	      <td>截止日期：</td>
   	      <td><%=sdf.format(question.getEnddate())%></td>
        </tr> 
   	    <tr>
   	      <td>问卷级别：</td>
   	      <td>理财用户</td>
        </tr>
      </table>
   	  <p class="side_line"></p>
      <div style="height:5px; overflow:hidden"></div>
      </div>
    <div class="side_bot"></div>
  </div>
  <div class="clearfloat"></div>
  <%}}else{ %>
  	<script>
			alert("对不起，您尚未登录，或您不是集合理财客户！");
			url = "${ctx}/commons/loginms.jsp";
			window.location.href=url;
		</script>
  <% }%>
  </form>
</div>
<jsp:include page="/commons/msbottom.jsp" />

</body>
</html>