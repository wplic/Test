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
<%@page import="com.cssweb.common.dictionary.pojo.Dictionary"%><html xmlns="http://www.w3.org/1999/xhtml">
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

<body class="">
<jsp:include page="/share/top.jsp" />
<div class="body_bg">
<div class="wrap_r262">
<form name="frm" method="post" action="${ctx }/questionnaire.do?method=addQuestionData" >

<%
	String questionId = request.getParameter("questionId");
	if(StringUtils.isEmpty(questionId)){
%>
	<div class="wrap_r262" align="center">
			无此问卷调查
	</div>
<%		
	}
	else{
		ServletContext st = this.getServletConfig().getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
		QuestionnaireService questionnaireService = (QuestionnaireService)ctx.getBean("questionnaireservice");
		DictionaryService dictionaryService = (DictionaryService)ctx.getBean("dictionaryService");
		//当前问卷调查对象
		Questionnaire question = questionnaireService.getInfoById(Long.parseLong(questionId));
		
		//根据问卷调查的用户级别，查询字段对象 ，以获得级别名称
		//Dictionary dic = dictionaryService.getDictionaryByParentKeyCodeAndDesc("yhfl",question.getUserlevel().toString());
		Dictionary dic = dictionaryService.getDictionaryById(question.getUserlevel());
		//有效答卷数量
		long answerCount = questionnaireService.getPersonInfoTotal(Long.parseLong(questionId));
		List questionSubList = questionnaireService.getSubtitleByBasicId(Long.parseLong(questionId));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		TsystemWebuser admin = (TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
		if (admin == null){
			%><script type="text/javascript">
							
						alert("抱歉!您还没有登录不能参与该权限为<%=dic.getKeyName()%>的问卷调查");
						history.go(-1);	
							
							</script> <%
					}
		long userLevel=0;
		 String keyDesc="1";
		//if(admin!=null && admin.getUserLevel()!=null){
			//Dictionary temp = dictionaryService.getDictionaryById(admin.getUserLevel());
			//String desc = temp.getKeyShortDesc();
			//if(desc!=null && !"".equals(desc)){
				//try{
					//userLevel = Long.parseLong(desc);
				//}catch(Exception e){
					//userLevel =0;
				//}
			//}
		//}
		if(admin!=null && admin.getLevel()!=null){
		    userLevel = Long.parseLong(admin.getLevel());
		}
		long lookLevel=0;
		
		long questionLevel = 0;
		if(question!=null && question.getUserlevel()!=null){
			lookLevel=question.getUserlevel().longValue();
			Dictionary dic1 = dictionaryService.getDictionaryById(lookLevel);
			questionLevel = new Long(dic1.getKeyShortDesc()).longValue();
		
//========
			if(questionLevel<=3){
				keyDesc="1";
				if(!admin.getUserType().toString().trim().equals(keyDesc.trim())){
					%>
					<script>
						alert("抱歉!您的用户级别不能参与该权限为<%=dic.getKeyName()%>的问卷调查");
						history.go(-1);
					</script>
					
					<%
				}
				}if(questionLevel ==4){
					keyDesc="2";
				
			}
				//----------
		}
	
		if( !admin.getUserType().toString().trim().equals(keyDesc.trim())){
		
		
		if(userLevel < questionLevel){
		if(questionLevel !=4){
			%>
			<script>
				alert("抱歉!您的用户级别不能参与该权限为<%=dic.getKeyName()%>的问卷调查");
				history.go(-1);
			</script>
			
			<%
			}
		}
		}
%>
   <input type="hidden" name="userId" value="<%=admin==null?"":admin.getId() %>"/>
  <div class="w650 fleft">
	<div class="dqwz">当前位置：首页 > 投资者园地 > 问卷调查</div>
        <div class="left_tit1 red bold">问卷调查<%=question.getTitle()==null?"":"("+question.getTitle()+")" %></div>
    <div class=" blank10"></div>
        <table width="92%" align="center" class="mt10">
       
          <tr>
            <td class="font14 bold">您的意见和建议</td>
            <td align="right"><%=question.getPublishdate()==null?"未公布":sdf.format(question.getPublishdate()) %></td>
          </tr>
          <tr>
            <td colspan="2" class="lh20 ptb13">说明：<%=question.getContent() %></td>
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
	                <tr>	
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
		                		<%if("0".equals(quesType)){
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
        <div class=" blank10"></div>
<p align="center">&nbsp;</p>
  </div>
  <div class="w262 fright bg_ec ptb13">
  		<div class="side_top"></div>
    <div class="side_mid">
   	  <p align="center"><img src="/pic/investorEdu/wj_rpic.jpg" /></p>
   	  <table width="82%" align="center" class="lh22 mt5">
   	    <tr>
   	      <td width="39%">发布者：</td>
   	      <td width="61%"><%=question.getPublishman() %></td>
        </tr>
   	    <tr>
   	      <td>发布日期：</td>
   	      <td><%=sdf.format(question.getPublishdate())%></td>
        </tr>
   	    <tr>
   	      <td>截止日：</td>
   	      <td><%=sdf.format(question.getEnddate())%></td>
        </tr>
   	    <tr>
   	      <td>问卷标签：</td>
   	      <td><%=question.getCategorystr()%></td>
        </tr>
   	    <tr>
   	      <td>有效答卷：</td>
   	      <td><%=answerCount+"" %>份</td>
        </tr>
   	    <tr>
   	      <td>问卷级别：</td>
   	      <td><%=dic==null?"无级别":dic.getKeyName() %></td>
        </tr>
      </table>
   	  <p class="side_line"></p>
      <div style="height:5px; overflow:hidden"></div>
        <p class="side_tit1">您的意见和建议</p>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="lh22 mt5">
          <input type="hidden" name="questionId" value="<%=questionId %>">
          <tr>
            <td width="50%" align="right">您的姓名：</td>
            <td width="50%"><input type="text" name="name" id="name" class="input108" /></td>
          </tr>
          <tr>
            <td align="right">您的电话：</td>
            <td><input type="text" name="tel" id="tel" class="input108" /></td>
          </tr>
          <tr>
            <td align="right">您的邮箱： </td>
            <td><input type="text" name="email" id="email" class="input108" /></td>
          </tr>
          <tr>
            <td colspan="2" style="padding-left: 20px">您的意见和建议：</td>
          </tr>
          <tr>
            <td colspan="2" align="center"><textarea name="advice" id="advice" cols="25" rows="5"></textarea></td>
          </tr>
          <tr>
            <td colspan="2" align="center" height="35"><img src="/pic/investorEdu/but_wjtj.jpg" onclick="commit(this.form)" style="cursor: hand"/></td>
          </tr>
      </table>
      </div>
    <div class="side_bot"></div>
  </div>
  <div class="clearfloat"></div>
  <%} %>
  </form>
</div>
<jsp:include page="/share/bottom.jsp" />
</div>
</body>
</html>