<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.cssweb.common.util.PageUtil"/>
<jsp:directive.page import="com.cssweb.assetManager.pojo.AssetManager"/>
<jsp:directive.page import="java.util.*"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广发证券</title>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<link href="/css/assetManage/assetManage.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/commons/turnPage.jsp"%>
<%
	List list=null;
	if(request.getAttribute("list")!=null)
	list=(List)request.getAttribute("list");
 %>
<body>
<jsp:include page="/commons/mstop.jsp" />
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/default.html"> 首页 </a>-<a href="${contextPath }/assetManage/index.jsp">资产管理</a> - 投资团队</div>
</div>
<div class="wrap_3c">
  <!--左侧sied开始-->
  <div class="w210 fleft">
	 <jsp:include page="${contextPath }/assetManage/assetInfo_index_lmenu.jsp?nav=tztd&nav1=tzjljs" />
     <div class="blank5"></div>
  </div>
  <!--左侧sied结束-->
  
  <!--中侧sied开始-->
  <div class="w492 fleft mlr4">
	<form name="qForm" id="qForm" action="${ctx}/assetmanager.do?method=getAssetManagerList" method="post">
  	<div class="comtit1"><h4>投资团队</h4></div>

	<%if(list!=null&&list.size()>0) {
		for(int i=0;i<list.size();i++){
			AssetManager am=(AssetManager)list.get(i);
			String _sex=am.getSex();
			if("0".equals(_sex))
				_sex = "男";
			else
				_sex = "女";
	%>
		<div class="mxjlbox">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			  <td width="22%"><img src="${ctx}/share/showUploadImage.jsp?id=<%=am.getPic()%>" width="106" height="146"/></td>
			  <td width="78%" valign="top">
					<p class="font14 bold mb12 mt2 indent10 blue"><%=am.getJob()%></p>
					<div class="name"><%=am.getName()%>：<%=_sex%> / <%=am.getAge()%>岁 / <%=am.getEduction()%> / <%=am.getWorkyear()%> 年从业经验</div>
					<div class="lh22 mt16"><%=am.getIntro()%></div>
			  </td>
			</tr>
		  </table>
		 </div>
	<%}
	}%>
	
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="28" align="right"><p align="right"> <%=PageUtil.pagination("document.getElementById(\"qForm\")",totleCount, currentPage, pagesize)%></p></td>
      </tr>
    </table>
	</form> 
  </div>  
  <!--中侧sied结束-->
   
  <!--右侧sied开始-->
  <div class="w210 fright">
  <script type="text/javascript" src="${contextPath }/js/jsIfUtils.js"></script>
	<iframe target="_blank" id="leftlogin" name="leftlogin"  marginWidth="0" marginHeight="0" src="${contextPath }/commons/loginTemp.jsp"
						frameBorder="0" noresize width="100%" scrolling="no"></iframe>
	<jsp:include page="${contextPath}/assetManage/mmts.jsp" />
    <div class=" blank5"></div>
    <jsp:include page="lc3h.jsp" /> 
  </div>
  <!--右侧sied结束--> 
  <div class="clearfloat"></div><!--清除浮动--> 
</div>
<div class="blank5"></div>
<jsp:include page="/commons/msbottom.jsp" />
</body>
</html>