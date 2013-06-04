<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.F10.gazx.fund.service.NetValueChangeService"/>
<jsp:directive.page import="com.cssweb.F10.gazx.fund.service.FundInfoService"/>
<%@include file="/commons/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/infoCenter/infoCenter.css" rel="stylesheet" type="text/css" />

</head>
   <script>
    	function doSubmit(){
    		var startValue = document.getElementById("beginDate").value;
    		var endValue = document.getElementById("endDate").value;
    		var ifr = document.getElementById("fundIframe");
    		if(ifr){
    			ifr.src='${contextPath }/fund.do?method=getNetValueChange&startDate='+startValue+'&endDate='+endValue;
    		}
    		
    	}
    </script>
    <%
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
    NetValueChangeService service = (NetValueChangeService)ctx.getBean("netValueChangeService");
    FundInfoService fundInfoService = (FundInfoService)ctx.getBean("fundInfoService");
    String gpdm = request.getParameter("gpdm"); 
    gpdm = fundInfoService.getFundCode(gpdm, request);
	List dateList = new ArrayList();
	dateList = service.getDateListByCode(gpdm);
	pageContext.setAttribute("dateList",dateList);
 %>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=zxzx" />
<div class="main">
  <div class="dqwz">当前位置：首页 > 资讯中心 > 基金个股</div>
</div>
<div class="wrap_2left">
  <!--左侧sied开始-->
  <div class="w210 fleft ptb9">  
  <div class="iptvside_top"></div>
  <div class="iptvside_mid">
	  <jsp:include page="/f10/fund/fundF10_lmenu.jsp">
			<jsp:param name="menu" value="7" />
	  </jsp:include>
  </div>
  <div class="iptvside_bot"></div>
  </div>
  <!--左侧sied结束-->
   
  <!--右侧sied开始-->
<div class="w706 fright"> 
   <!--右侧个股价格开始-->
  <div class="ggxx"><!--右侧个股价格结束-->
 <div class="left_tit2">
    <jsp:include flush="true" page="/f10/fund/FundCodeSearch.jsp"></jsp:include>
 </div> 
<div class="blank5"></div>
<div class=" textcenter">
	<span class="red font14 bold ml32">${fundShortName }</span>
    <span class="font14 ml10">(${fundCode })</span>
    <span class="ml20">
    <html:form action="/fund.do" method="post" styleId="fundForm">
    开始时间：
     <html:select property="beginDate" styleId="beginDate" >
           		<html:option value="">=请选择=</html:option>
              	<html:options collection="dateList" property="startDateString"
								labelProperty="startDateString" />
          </html:select>
     截止时间：     
    <html:select property="endDate" styleId="endDate" >
           		<html:option value="">=请选择=</html:option>
              	<html:options collection="dateList" property="startDateString"
								labelProperty="startDateString" />
          </html:select>  
    <img src="/pic/news/query.gif" onmouseover="this.src='/pic/news/query_s.gif'" onmouseout="this.src='/pic/news/query.gif'" style="cursor: hand" onclick="doSubmit();"/>          
    </html:form>
    
    </span>
</div>
<div class="blank5"></div>

<table border="1" class="lh24 center" bordercolor="#cccccc" width="100%" id="tabs11">
<tr>
 <td width="280" valign="top" >       
 <table width="100%" class="lh24 center" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td style="height: 25px" class="tab_th1 bold">基金净值变动</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent1e">一、期初基金净值</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent3e">调整后期初基金净值</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent1e">二、本期经营活动：</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent3e">本期利润</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent3e">未实现利得</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent3e">经营活动生产的基金净值变数</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent3e">以前年度损益调整</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent1e">三、本期基金单位交易：</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent3e">基金申购款</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent3e">其中：红利再投资</td>
            </tr>
            <tr>
             <td style="height: 25px" class="textleft indent3e">基金赎回款</td>
            </tr>
            <tr>
             <td style="height: 25px" class="textleft indent3e">基金单位交易生产的基金净值变动数</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent1e">四、本期向持有人分配收益</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent3e">向基金持有人分配收益生产的基金净值变动数</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent1e">五、以前年度损益调整：</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent3e">因损益调整生产的净值变动数</td>
            </tr>
            <tr>
              <td style="height: 25px" class="textleft indent1e">六、期末基金净值</td>
            </tr>
          </table></td>
          <td valign="top" ><iframe src="${contextPath }/fund.do?method=getNetValueChange" id="fundIframe" marginheight="0" marginwidth="0" frameborder="0" scrolling="auto" width="100%" style="height: 487px" ></iframe></td>
        </tr>
  </table>
  
<div class="lh30 textcenter">

        </div>
  </div> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<jsp:include page="/share/bottom.jsp" />
<script src="/js/setTab.js"></script>
</body>
</html>