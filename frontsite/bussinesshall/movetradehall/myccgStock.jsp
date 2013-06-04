<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.assetManager.service.StockZcglService"%>
<%@page import="com.cssweb.assetManager.pojo.StockZcgl"%>
<%@page import="java.util.List"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

</head>
<%
        String mygpdmIfr="";
		if(request.getSession().getAttribute("tsystemWebuser")!=null)
		{
		  	ServletContext st = this.getServletConfig().getServletContext();
	        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	        StockZcglService stockZcglService=(StockZcglService)ctx.getBean("stockZcglService");
			TsystemWebuser info=(TsystemWebuser) request.getSession().getAttribute("tsystemWebuser");
			List list=stockZcglService.getStockZcglGpdmList(info.getUserName());
			if(list!=null&&list.size()>0)
			{
			 for(int i=0;i<list.size();i++)
			 {
			  StockZcgl stockZcgl=(StockZcgl)list.get(i);
			  mygpdmIfr=mygpdmIfr+stockZcgl.getGpdm()+",";
			 }
			}
			if(!mygpdmIfr.equals(""))
			{
			  mygpdmIfr=mygpdmIfr.substring(0,mygpdmIfr.length()-1);
			}
			
			
			System.out.println("        mygpdmIfr==="+mygpdmIfr);
		} else { %>
		    <script type="text/javascript">
	             alert("您尚未登录或已过期，请重新登录！");
	             window.location.href = "/share/login.jsp";
	         </script>
		<% }
String message="";
if(request.getAttribute("message")!=null)
  message=(String)request.getAttribute("message");
 %>
<script language="javascript">
    function  checkStockLG(){
          var stockId = document.getElementById("gpdmMy").value;
          if(stockId=='')
          {
           alert("请输入股票代码！");
           return false;
          }
          if(stockId.lenght>7)
          {
           alert("请输入股票代码有误！");
           return false;
          }
 		  var myStockIfmUrl="${ctx}/myquote.do?method=getStockZcglList&gpdmMy="+stockId;
 		  var myStockCmsIfmUrl="${ctx }/bussinesshall/movetradehall/myStockCmsList.jsp?stock_id="+stockId;
 		  document.getElementById("myStockIfm").src=myStockIfmUrl;
 		  document.getElementById("myStockCmsIfm").src=myStockCmsIfmUrl;	
 	}
 	function  checkStockLGqb(){
 		  var myStockIfmUrl="${ctx}/myquote.do?method=getStockZcglList";
 		  var myStockCmsIfmUrl="${ctx }/bussinesshall/movetradehall/myStockCmsList.jsp";
 		  document.getElementById("myStockIfm").src=myStockIfmUrl;
 		  document.getElementById("myStockCmsIfm").src=myStockCmsIfmUrl;	
 	}
</script>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
      <div class="dqwz">当前位置：首页 > 网上营业厅 > 我的理财中心 > 我的持仓股</div>
       <jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp">
		<jsp:param name="nav3" value="wdccg" />
	</jsp:include>
  <div class="blank10"></div>
      <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="460" valign="top" height="200">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="121" height="21"><input type="text" name="gpdmMy" id="gpdmMy" class="input108" maxlength="8" onkeyup="value=value.replace(/[^0-9]/g,'')"/></td>
                  <td width="289"><a href="#" onclick="return checkStockLG();"><img src="${ctx}/pic/wsyyt/but_cx1.jpg" /></a>
                  </td><td width="50" align="center">
                   <a href="#" onclick="checkStockLGqb();">
                   <input type="button" name="buttonqb" id="buttonqb" value="全部" class="but_01" /></a>
                  </td>
                </tr>
              </table>
           <table width="100%" border="1" bordercolor="#cfcfcf" class="lh27 mt5" align="center">
                <tr>
                  <td class="wdzx_th" align="center">股票名称</td>
                  <td class="wdzx_th" align="center">股票代码</td>
                  <td class="wdzx_th" align="center">最新价</td>
                  <td class="wdzx_th" align="center">涨跌幅</td>
                </tr>
          </table>
               <iframe id="myStockIfm" name="" src="${ctx}/myquote.do?method=getStockZcglList" frameborder="0" marginheight="0" marginwidth="0" height="140" width="100%" scrolling="yes">
                   </iframe></td>
          <td width="12">&nbsp;</td>
          <td valign="top">
          
          </td>
        </tr>
      </table>
      <div style=" background:#ebecec; height:5px; margin:5px"></div>
<p style="height:40px; line-height:40px; width:95%; margin:0 auto; color:#434343; font-weight:bold">持仓股资讯 </p>
 <iframe id="myStockCmsIfm" name="" src="${ctx }/bussinesshall/movetradehall/myStockCmsList.jsp?stock_id=<%=mygpdmIfr %>" frameborder="0" marginheight="0" marginwidth="0" height="220" width="100%" scrolling="no">
                   </iframe>
<br /><br />
</div>

<jsp:include page="/share/bottom.jsp" /></body>
</html>