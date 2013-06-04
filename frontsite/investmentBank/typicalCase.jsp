<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.specialcase.service.SpecialCaseService"%>
<%@page import="java.util.List"%>
<%@page import="com.cssweb.specialcase.pojo.SpecialCase"%><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
</head>
<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	SpecialCaseService service = (SpecialCaseService)ctx.getBean("specialCaseService");
	List list = service.selectAll();

%>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investmentBank/index.html">投资银行</a> - 典型案例</div>
  <div class="comtit1"><h4>典型案例</h4></div>
  <div class="blank5"></div>
  <div class="bg_f5 p8">
  		<div class="tlbg2">
        	
        	<%
  				if(list!=null && list.size()>0){
  					SpecialCase specialCase = null;
  					for(int i=0;i<list.size();i++){
  						specialCase = (SpecialCase)list.get(i);
  			%>
	  			<div style="width:876px;margin-left:auto; margin-right:auto" >
	        	  <table width="100%" border="1" cellspacing="0" cellpadding="0">
	        	  <tr><td colspan="3"><p class="dxaltit"><%=specialCase.getType() %></p></td></tr>
	        	    <tr>
	        	  <td width="168" valign="middle">
                  <p align="center"><img src="${ctx}/share/showUploadImage.jsp?id=<%=specialCase.getCasePicId()%>" width="90" height="55"/></p>
                  </td>
        	      <td width="140"  valign="middle" align="center"><%=specialCase.getCaseName() %><br />
       	            （<%=specialCase.getCaseCode() %>）</td>
        	      <td class="p20 lh20" valign="middle"><%=specialCase.getCaseDesc() %></td>
	      	      </tr>
	      	    </table>
	        	</div>
				<div class="blank10"></div>
  			<%			
  					}
  				}
			%>
        	
        	
            
        </div>
  </div>
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>