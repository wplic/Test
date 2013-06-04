<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.cssweb.common.toDbLob.pojo.TextBlob"%>
<%@page import="com.cssweb.common.toDbLob.pojo.FileBlob"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.cssweb.otc.pojo.OtcDocument"%>
<%@page import="com.cssweb.otc.service.OtcService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券柜台交易业务风险揭示书</title>
<link href="${ctx }/css/otc/common.css" rel="stylesheet" type="text/css" />
</head>
<%
OtcDocument otcDocument = (OtcDocument) request.getAttribute("otcDocument");
OtcService service = new OtcService(request);
String otcCode = request.getSession().getAttribute("otcCode").toString();
long hetongId = service.getDocumentId("1",otcCode);
long shuomingId = service.getDocumentId("2",otcCode);
long cpfengxieId = service.getDocumentId("3",otcCode);
request.getSession().setAttribute("hetongId",hetongId);
request.getSession().setAttribute("shuomingId",shuomingId);
request.getSession().setAttribute("cpfengxieId",cpfengxieId);
%>
<body>
<br /><jsp:include page="${ctx}/commons/mstop.jsp" />
<div class="main"><!--此处CLASS样式为原网站引用的--> 
  <!--请从此处复制代码开始--> 
  <div id="gtjy" class="gtjy">
  <div class="gtjy_l">
  <div class="gtjy_l_t"><span>当前位置：</span><a href="${ctx }/otc/action/OtcAction.go?function=FrontGetOtcList">广发OTC首页</a> > <a href="${ctx }/otc/otc_detail.jsp?id=${otcId }">${otcName }</a> ><%=(otcDocument!=null?otcDocument.getTitle():"该栏目下没有内容") %> </div>
  <div class="gtjy_l_c">
  <h2><%=(otcDocument!=null?otcDocument.getTitle():"该栏目下没有内容") %><span>市场风险莫测　　　　务请谨慎从事</span></h2>
  <div style="text-align:center; margin:10px 0;">
  <%if(otcDocument!=null && !"".equals(otcDocument.getUpddate())){ %>
  	发布时间：<%=otcDocument.getUpddate() %>
  <%} %>
  </div>
  <div style="text-align:center; margin:10px 0;">
  <%if(request.getAttribute("fileBlob")!=null){ %>
  	<a href="${ctx }/otc/fileout.jsp?id=${fileBlob.id }" target="_blank">
  		<img alt="下载文档" src="${ctx }/images/otc/ico_06.gif"/>
  	</a>
  <%} %>
  </div>
 		<!-- 文章内容部分，如果textBlob为空，则读取fileBlob -->
 		<%if(request.getAttribute("textBlob")!=null){ 
 			TextBlob textBlob = (TextBlob)request.getAttribute("textBlob");
 			String content = new String(textBlob.getSource(),"UTF-8");
 		%>
 				<%=content %>
 		<%} else {
 			FileBlob fileBlob = (FileBlob)request.getAttribute("fileBlob");
 			String content_="";
 			String fileContent="";
 			if(fileBlob!=null){
 	 			if(fileBlob.getFileType().indexOf("application")!=-1){
 	 				//非图片文件（word、excel等等）
 	 				//content_ = new String(fileBlob.getSource());
 	 				//fileContent = new String(fileBlob.getSource(),"gb2312");
 	 				
 	 			}
 	 			if(fileBlob.getFileType().indexOf("image")!=-1){
 	 				//图片文件
 	 				response.setContentType("image/*");
 	 				OutputStream out_ = response.getOutputStream();
 	 				out_.write(fileBlob.getSource());
 	 				out.flush();
 	 				out.close();
 	 			}
 			}
 		%>
 			<%=fileContent %>
 		<%} %>
  </div>
  </div>
  <div class="gtjy_r">
  <div class="ny_banner2"><img src="${ctx }/images/otc/img_03.jpg"/></div>
  <div class="ico_03">
  		<img src="${ctx }/images/otc/ico_03.gif" alt="" border="0" usemap="#Map"/>
        <map name="Map" id="Map">
          <area shape="rect" coords="8,9,239,90" href="${ctx }/front/otcDocumentAction.do?method=getDocInfo2&documentId=${sessionScope.docHetong  }"/>
          <area shape="rect" coords="10,100,240,185" href="${ctx }/front/otcDocumentAction.do?method=getDocInfo2&documentId=${sessionScope.docShuoming }"/>
          <area shape="rect" coords="9,194,239,283" href="${ctx }/front/otcDocumentAction.do?method=getDocInfo2&documentId=${sessionScope.docFengxian}"/>
        </map></div>
  </div>
    </div>
  <!--请从此处复制代码结束--> 
</div>
<div class="foot"><jsp:include page="${ctx }/commons/msbottom.jsp" /></div>
<div style="text-align:center;"> 
</div>
</body>
</html>