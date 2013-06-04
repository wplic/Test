<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.css.cms.document.Document"/>
<jsp:directive.page import="com.css.cms.document.DocumentManager"/>
<jsp:directive.page import="com.css.cms.document.util.DocumentHelper"/>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.common.util.CsswebServiceUtil"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Map"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript">
var size=14;            //字体大小
function fontZoom(fontsize){    //设置字体
    size=fontsize;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='red';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='';
}
function fontMax(){    //字体放大

    size=16
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='red';
    document.getElementById('xiao').className='';
}
function fontMin(){    //字体缩小
    size=12;
    document.getElementById('ShowContent').style.fontSize=size+'px';
    document.getElementById('zhong').className='';
    document.getElementById('da').className='';
    document.getElementById('xiao').className='red';
}
</SCRIPT>



</head>
<body>
<!-- 头部 -->
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz"></div>
  <div class="blank5"></div>
  <div class="bg_f5 p8">
	<div class="tlbg3">
        	<p style="font-size: 25px;" class="textTitle1" align="center">广发证券终端说明书</p>
  <p class="textTitle2" align="center">信息来源：广发证券  日期：2012-11-13 作者：广发证券</p>

   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <div class="mainContent" style="word-wrap:break-word;">

                           <br />
                           <table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
					        <tr >
					          <td>请点击<a style="color: #0000CC" href="${contextPath }/financing/termin_show_file.jsp?url=${contextPath }/financing/terminal_introduce.chm">广发证券终端说明书.chm</a>下载</td>
					        </tr>

					 <tr>
                      <td height="48" align="center" style="padding:10px 15px; "><input type="submit" name="Submit2" value="关闭窗口" class="button4" onClick="javascript:window.opener=null;window.close();"/></td>
                     </tr>
		          </table>
			</div>
</div><p class="newstextAreabottom"></p>
</div></div></div>
<div class="blank5"></div>
<!-- 末尾 -->
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>