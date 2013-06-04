<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.cssweb.client.pojo.TsystemWebuser"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.cssweb.quote.service.MyquoteService"%>
<%@page import="com.cssweb.quote.pojo.Myquote"%>
<%@page import="java.util.List"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="/css/global.css" rel="stylesheet" type="text/css" />
<link href="/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

</head>
<jsp:directive.page import="com.cssweb.common.web.filter.SqlInjectValidate"/>
<%
 SqlInjectValidate sqlInjectValidate = SqlInjectValidate.getSqlInjectValidate();
 if(request.getParameter("method")!=null&&!request.getParameter("method").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("method"),12)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
 if(request.getParameter("gpmc")!=null&&!request.getParameter("gpmc").equals("")){
				if(sqlInjectValidate.vakidateSqlStringForLength(request.getParameter("gpmc"),12)){
					response.sendRedirect(request.getContextPath() +"/commons/error2.jsp");
					return;
				 }
			}
        String mygpdmIfr="";
		if(request.getSession().getAttribute("tsystemWebuser")!=null)
		{
		  	ServletContext st = this.getServletConfig().getServletContext();
	        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	        MyquoteService myquoteService=(MyquoteService)ctx.getBean("myquoteService");
			TsystemWebuser info=(TsystemWebuser) request.getSession().getAttribute("tsystemWebuser");
			List list=myquoteService.getMyquoteAll(info.getId(), "");
			if(list!=null&&list.size()>0)
			{
			 for(int i=0;i<list.size();i++)
			 {
			  Myquote myquote=(Myquote)list.get(i);
			  mygpdmIfr=mygpdmIfr+myquote.getGpdm()+",";
			 }
			}
			if(!mygpdmIfr.equals(""))
			{
			  mygpdmIfr=mygpdmIfr.substring(0,mygpdmIfr.length()-1);
			}
		}
String message="";
if(request.getAttribute("message")!=null)
  message=(String)request.getAttribute("message");
 %>
<script language="javascript">
	var XMLHttpReqMy;
    var completeDivMy;
    var inputFieldMy;
    var completeTableMy;
    var completeBodyMy;
 	//创建XMLHttpRequest对象       
    function createXMLHttpRequestMy() {
		if(window.XMLHttpRequest) { 
			XMLHttpReqMy = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) { 
			try {
				XMLHttpReqMy = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReqMy = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
	}
	//发送匹配请求函数
    function getSearchListMy() {
        inputFieldMy = document.getElementById("myGpdm");            
        completeTableMy = document.getElementById("complete_tableMy");
        completeDivMy = document.getElementById("popupMy");
        completeBodyMy = document.getElementById("complete_bodyMy");
        if (inputFieldMy.value.length > 0) {
            createXMLHttpRequestMy();            
            var url = "${ctx}/myquote.do?method=searchQuoteByGpdms&gpdm=" + encodeURIComponent(inputFieldMy.value);                        
            XMLHttpReqMy.open("GET", url, true);
            XMLHttpReqMy.onreadystatechange = processMatchResponseMy;//指定响应函数
            XMLHttpReqMy.send(null); // 发送请求
        } else {
            clearNamesMy();
        }
    }
	// 处理返回匹配信息函数
    function processMatchResponseMy() {
    	if (XMLHttpReqMy.readyState == 4) { // 判断对象状态
        	if (XMLHttpReqMy.status == 200) { // 信息已经成功返回，开始处理信息
                    setNamesMy(XMLHttpReqMy.responseXML.getElementsByTagName("gpdm"));
            }else { //页面不正常
                window.alert("您所请求的页面有异常。" );
            }
        }
    }
	//生成与输入内容匹配行
    function setNamesMy(names) {        
       clearNamesMy();
       var size = names.length;
       setOffsetsMy();
       var row, cell, txtNode;
       row = document.createElement("tr");
       row.bgColor="#eceff4";
       cell = document.createElement("td");
       cell.style.borderRight="1px solid #C1DAD7";
       cell.style.borderBottom="1px solid #C1DAD7";
       cell.innerHTML = "股票代码,股票名称";
       row.appendChild(cell);
       completeBodyMy.appendChild(row);
       for (var i = 0; i < size&&i<10; i++) {
           var nextNode = names[i].firstChild.data;
           row = document.createElement("tr");row.id="row" + i;
           cell = document.createElement("td");cell.id="cell"+i;
           cell.onmouseout = function() {this.style.backgroundColor ='#FFFAFA';};
           cell.onmouseover = function() {this.style.backgroundColor ='#f4a460';};
           cell.style.borderRight="1px solid #C1DAD7";
           cell.style.borderBottom="1px solid #C1DAD7";
           cell.onmousedown = function() { completeFieldMy(this); } ;                             
           txtNode = document.createTextNode(nextNode);
           cell.appendChild(txtNode);
           row.appendChild(cell);
           completeBodyMy.appendChild(row);
       }
   }
	//设置显示位置                
   function setOffsetsMy() {
       completeTableMy.style.width = "150px";
       var left = calculateOffsetMy(inputFieldMy, "offsetLeft")-20;
       var top = calculateOffsetMy(inputFieldMy, "offsetTop") + inputFieldMy.offsetHeight;
       completeDivMy.style.border = "black 1px solid";
       completeDivMy.style.left = left + "px";
       completeDivMy.style.top = top + "px";
   }
 	//计算显示位置       
    function calculateOffsetMy(field, attr) {
      var offset = 0;
      while(field) {
        offset += field[attr]; 
        field = field.offsetParent;
      }
      return offset;
    }
	//填写输入框
    function completeFieldMy(cell) {
    	inputFieldMy.value = cell.firstChild.nodeValue.split(" ")[0];
    	var gpdmValues=inputFieldMy.value;
    	var gpdmValue=gpdmValues.split(",");
		if(gpdmValue!=null&&gpdmValue!="")
		{
		 document.getElementById("myGpdm").value=gpdmValue[0];
		 document.getElementById("gpmc").value=gpdmValue[1];
		}
		setTimeout("clearNamesMy()",100); 
        clearNamesMy();
    }
	//清除自动完成行
    function clearNamesMy() {
        var ind = completeBodyMy.childNodes.length;
        for (var i = ind - 1; i >= 0 ; i--) {
             completeBodyMy.removeChild(completeBodyMy.childNodes[i]);
        }
        completeDivMy.style.border = "none";
    }
    function clearDivMy(obj){
    	if(obj.value==''){
    		obj.value='股票代码';
    	}else{
    		clearNamesMy();
    	}
    }
   function checkMyGpdmAdd()
   {
	   if(document.getElementById("myGpdm").value==''){
	   alert("股票代码不能为空！");
	   return false;}
   }
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
 		  var myStockIfmUrl="${ctx}/myquote.do?method=getMyquoteList&gpdmMy="+stockId;
 		  var myStockCmsIfmUrl="${ctx }/bussinesshall/movetradehall/myStockCmsList.jsp?stock_id="+stockId;
 		  document.getElementById("myStockIfm").src=myStockIfmUrl;
 		  document.getElementById("myStockCmsIfm").src=myStockCmsIfmUrl;	
 	}
 	function  checkStockLGqb(){
 		  var myStockIfmUrl="${ctx}/myquote.do?method=getMyquoteList";
 		  var myStockCmsIfmUrl="${ctx }/bussinesshall/movetradehall/myStockCmsList.jsp";
 		  document.getElementById("myStockIfm").src=myStockIfmUrl;
 		  document.getElementById("myStockCmsIfm").src=myStockCmsIfmUrl;	
 	}
</script>
<body class="body_bg">
<jsp:include page="/share/top.jsp?nav=wsyyt&nav1=wdlczx" />
<jsp:include page="/share/pdLogin.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
      <div class="dqwz">当前位置：<a href="/index.html">首页</a> > <a href="/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  > <a href="/bussinesshall/financingCzh.jsp">我的理财中心</a> > 我的自选股</div>
       <jsp:include page="/bussinesshall/movetradehall/financing_submenu.jsp">
		<jsp:param name="nav3" value="wdzxg" />
	</jsp:include>
  <div class="blank10"></div>
      <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="460" valign="top" height="200">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="121" height="21">
                
                  <input type="text" name="gpdmMy" id="gpdmMy" class="input108" maxlength="8" onkeyup="value=value.replace(/[^0-9]/g,'')"
                  onkeydown="if(event.keyCode==13){return checkStockLG();}"
                  />
                
                  </td>
                  <td width="289"><a href="#" onclick="return checkStockLG();"><img src="${ctx}/pic/wsyyt/but_cx1.jpg" /></a>
                  </td><td width="50" align="center">
                   <a href="#" onclick="checkStockLGqb();">
                   <input type="button" name="buttonqb" id="buttonqb" value="全部" class="but_01" /></a>
                  </td>
                </tr>
              </table>
           <table width="100%" border="1" bordercolor="#cfcfcf" class="lh27 mt5" align="center">
                <tr>
                  <td class="wdzx_th" align="center">操作</td>
                  <td class="wdzx_th" align="center">股票名称</td>
                  <td class="wdzx_th" align="center">股票代码</td>
                  <td class="wdzx_th" align="center">最新价</td>
                  <td class="wdzx_th" align="center">涨跌幅</td>
                </tr>
          </table>
               <iframe id="myStockIfm" name="" src="${ctx}/myquote.do?method=getMyquoteList" frameborder="0" marginheight="0" marginwidth="0" height="140" width="100%" scrolling="yes">
                   </iframe></td>
          <td width="12">&nbsp;</td>
          <td valign="top">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="127"  height="21">&nbsp;</td>
              <td width="281"><font color="red"><%=message %></font>
              </td>
            </tr>
          </table>
            <table width="100%" border="1" bordercolor="#cfcfcf" class="lh27 mt5" align="center">
            <tr>
              <td width="94%" class="wdzx_th indent10 bold">我的自选股设置 </td>
            </tr>
          </table>
          <form name="gpdmFrom" action="${ctx}/myquote.do?method=addMyquote" method="post" onSubmit="return checkMyGpdmAdd();">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="lh28" bgcolor="#eceff4">
              <tr>
                <td colspan="3" height="28"></td>
              </tr>
              <tr>
                <td width="20%">&nbsp;</td>
                <td width="20%">股票代码：</td>
                <td width="60%">
					<input name="myGpdm" id="myGpdm" type="text" class="input108" style="width:130px" maxlength="7" onkeyup="value=value.replace(/[^0-9]/g,'')"
					autocomplete=off value="" onClick="if(this.value=='股票代码')this.value='';" onBlur="javascript:clearDivMy(this);" onpropertychange="javascript:getSearchListMy();" />
						<div style="position:absolute;width:100px" id="popupMy">
					        <table id="complete_tableMy" bgcolor="#FFFAFA" border="0" cellspacing="0" cellpadding="0">            
					            <tbody id="complete_bodyMy"></tbody>
					        </table>
					   </div>
               </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td bgcolor="#eceff4">股票名称：</td>
                <td bgcolor="#eceff4">
                <input class="input108" style="width:130px"  name="gpmc" id="gpmc" readonly/>
                </td>
              </tr>
              <tr>
                <td height="36">&nbsp;</td>
                <td bgcolor="#eceff4">&nbsp;</td>
                <td bgcolor="#eceff4"><a href="#">
                  <input type="submit" name="button2" id="button2" value="保存" class="but_01" />
                <input type="reset" name="button4" id="button4" value="取消" class="but_01" />
                </a></td>
              </tr>
              <tr>
              <td colspan="3" height="20"></td></tr>
          </table>
          </form>
          </td>
        </tr>
      </table>
      <div style=" background:#ebecec; height:5px; margin:5px"></div>
<p style="height:40px; line-height:40px; width:95%; margin:0 auto; color:#434343; font-weight:bold">自选股资讯 </p>
 <iframe id="myStockCmsIfm" name="" src="${ctx }/bussinesshall/movetradehall/myStockCmsList.jsp?stock_id=<%=mygpdmIfr %>" frameborder="0" marginheight="0" marginwidth="0" height="220" width="100%" scrolling="no">
                   </iframe>
<br /><br />
</div>

<jsp:include page="/share/bottom.jsp" /></body>
</html>