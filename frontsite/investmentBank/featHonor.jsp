<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.credit.service.CreditService"%>
<%@page import="java.util.List"%>

<%@page import="com.cssweb.credit.pojo.Credit"%><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<bean:parameter name="nav" id="nav" value="ryjl"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
</head>
<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	CreditService service = (CreditService)ctx.getBean("creditService");
	List list = service.selectAll();

%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investmentBank/index.html">投资银行</a> - <a href="/investmentBank/feat.html"> 辉煌业绩</a> - 荣誉与奖励</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft">
		<jsp:include page="feat_lmenu.jsp" />
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w706 fright">
  	<div class="comtit1">
    <h4>荣誉与奖励</h4>
  	</div>
    <div class="blank10"></div>
    <table width="98%" align="center">
      <tr>
      
		 <%
		 	if(list!=null&&list.size()>0){
		 		Credit credit = null;
		 		for(int i=0;i<list.size();i++){
		 			credit = (Credit)list.get(i);
		 %>
			 <td class="qyrrBox">
		        <table width="90%" class=" mt10">
		          <tr>
		            <td width="67%" style="word-break:break-all" valign="top" class="pl15"><img src="${ctx}/share/showUploadImage.jsp?id=<%=credit.getPicId()%>" width="140" height="125"/>
		              <p class="bold lh20" style="word-break:break-all;padding-right: 30px">
		              	<%=credit.getTitle() %>
		              </p></td>
		            <td width="33%" class="lh25" valign="top" style="word-break:break-all" ><%=credit.getContent() %></td>
		          </tr>
		        </table>
		    </td>
		 <%			
		 			if((i+1)%2==1){
		%> 
		 <td>&nbsp;</td>
		
		<%				
		 			}else{
		%> 
		 	</tr>
		 	<tr>
		 		<td colspan="3">&nbsp;</td>
		 	</tr>
		 	<tr>
		 				
		<%	
		 				
		 			}
		 		}
		 	}
		 %>     
		 </tr>
    </table>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>