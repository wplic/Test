<%@ page contentType="text/html; charset=utf-8" language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.enterprisesell.service.EnterpriseSellService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cssweb.enterprisesell.pojo.EnterpriseSell"%><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/commons/taglibs.jsp"%>
<head>
<bean:parameter name="nav" id="nav" value="zxqycx"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/investmentBank/investmentBank.css" rel="stylesheet" type="text/css" />
</head>
<%
	ServletContext sc = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
	EnterpriseSellService service = (EnterpriseSellService)ctx.getBean("enterpriseSellService");
	Map map=new HashMap();
	map.put("type","2");
	map.put("sortName", "code");
	map.put("dir", "asc");
	List list = service.selectAll(map);

%>
<body>
<br /><br /><jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="/default.html">首页</a> - <a href="/investmentBank/index.html">投资银行</a> - <a href="/investmentBank/feat.html"> 辉煌业绩</a> - 创业板承销</div>
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
    <h4>创业板承销</h4></div>
    <div class="blank10"></div>
    <div class="qycxInfo">
    	<div class="txt">公司一直关注中创业板的发展，经过多年的积极探索与实践，逐渐积累了丰富的创业板承销和保荐经验。对中创业板的长期跟踪研究、适时战略引导业已成为公司投资银行业务的经典特色。 </div>
    </div>
    <div class="blank10"></div>
    <table width="98%" align="center" class="lh24 mt10">
      <tr>
        <td><span class="red font_st font12 ">·</span><span class="font14 bold font_43">广发证券保荐的创业板上市公司</span>&nbsp;  ..............................................................................................................................................</td>
      </tr>
    </table>
    
    <div class="bg_f5 p8">
    	<div class="bg_ff p8">
    	<table width="97%" align="center" border="0">
    		<tr>
    	    <%
    	    if(list!=null && list.size()>0){
	    	EnterpriseSell sell = null;
	    	for(int j=0;j<list.size();j++){
	    		sell = (EnterpriseSell)list.get(j);
    		%>
          	<td width="163" align="center"> <img src="${ctx}/share/showUploadImage.jsp?id=<%=sell.getPicId()%>" width="72" height="56"/>
          	<h4><%=sell.getName() %>(<%=sell.getCode() %>)</h4></td>
          	   
          	<%
          	  if((j+1)%4==0){
          		  %>
          		 </tr>
		          <tr>
		            <td colspan="4" height="25" class="list_bline02">&nbsp;</td>
		          </tr>
		          <tr>  
          		  <%
          	  }
	    	}
	    	for(int i=0;i<4-list.size()%4;i++){
	    		%>
	    		<td width="163" align="center">&nbsp;</td>
	    		 <%
	    	}
	    	} %>
	    	
	    	 </tr>
      </table>
    	<br />
      </div>
    </div>
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>