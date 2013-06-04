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
<title>广发证券</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="${contextPath}/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />

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

<%
	String docIdStr = request.getParameter("docId") ;
	if(docIdStr==null){
		docIdStr=request.getParameter("id") ;
	}
	long docId = -2 ;
	try{
		docId = Long.parseLong (docIdStr) ;
	}catch(Exception e){
		docId = -2 ;
	}
		
	Document doc = null ;
	boolean display = false ;
	if(docId>0){
		DocumentManager dm=DocumentManager.getDocumentManager();		
		doc=dm.getDocument(docId);
	}
	String baseBrief ="";
	// 这是判断文章是否存在?
	if(doc!=null){
		Long state = (Long)doc.getAttrValue ("state") ;
		Long is_delete = (Long)doc.getAttrValue ("is_delete") ;
		
		
		if(doc.getAttribute("base_brief")!=null&&!doc.getAttribute("base_brief").equals("null")&&!doc.getAttribute("base_brief").equals(""))
		    baseBrief =  String.valueOf(doc.getAttribute("base_brief"));
		
		if(state!=null && state.longValue()==1 && is_delete!=null && is_delete.longValue()==0)
			display = true ;
	}
	
	if(!display){
%>
	<script type="text/javascript">
		alert ("对不起，您请求的文章不存在！") ;
		window.opener=null;
		window.open('','_self');
		window.close() ;
	</script>
<%
		return ;
	}
%>


<body class="body_bg">
<jsp:include page="/share/top.jsp" />
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
   <div class="left_tit2">文章信息</div>
   <p class="textTitle1" align="center"><%=DocumentHelper.getTitle(doc ,150) %></p>
   <p class="textTitle2" align="center">信息来源：<%= DocumentHelper.getAttrValue(doc ,"source" , "广发证券") %> 日期：<%= DocumentHelper.getUploadDate(doc ,"yyyy-MM-dd")%> 作者：<%= DocumentHelper.getAttrValue(doc ,"author" , "广发证券") %> </p>
    <%if(!baseBrief.equals("")) {%>
   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <strong >【摘要】</strong><br/>
   <div>
  <%=baseBrief%>
  </div>
    <p class="newstextAreabottom"></p></div>
  <%} %>
   <div class="newstextArea">
   <p class="newstextAreatop"></p>
   <div style="word-wrap:break-word;">
                           <%  
                               int wzCount=3000;
                               if(doc.getContent().length>200000)
                               {
                                 int ij=1;
                                 if(request.getParameter("ij")!=null&&!request.getParameter("ij").equals(""))
                                 {
                                   try{
                                   ij=Integer.parseInt(request.getParameter("ij").trim());
                                   }catch(Exception e)
                                   {
                                    ij=1;
                                   }
                                 }
                                 //System.out.println("    ----- jin if"+doc.getContent().length);
                                 int j=doc.getContent().length/wzCount;
                                 int count=j;
                                 if(doc.getContent().length%wzCount!=0)
                                 count=j+1;
                                 
                                 //System.out.println("          j="+j+"           count="+count);
                                 if(ij<1)
                                   ij=1;
                                 if(ij>count)
                                   ij=count;
		                            String content="";
		                            if(ij==count)
		                            {
		                            content=DocumentHelper.getContent(doc,(ij-1)*wzCount ,doc.getContent().length-((ij-1)*wzCount));
		                            //content=new String(doc.getContent() , (ij-1)*wzCount ,doc.getContent().length-((ij-1)*wzCount) ,"GBK");
		                            }else{
		                            content=DocumentHelper.getContent(doc,(ij-1)*wzCount ,wzCount);
		                            //content=new String(doc.getContent() , (ij-1)*wzCount ,wzCount ,"GBK");
		                            }
									content=content.replaceAll("    "," ");
									content=content.replaceAll("   "," ");
									content=content.replaceAll("  "," ");
									content=content.replaceAll("　","");
									content=content.replaceAll("	","");
									content=content.replaceAll("&nbsp;","");
									content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
									content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
									content=content.replaceAll("\r\n\r\n\r\n","\r\n");
									content=content.replaceAll("\r\n\r\n","\r\n");
									content=content.replace("\r\n","<br/><br/>");
									content="&nbsp;&nbsp;&nbsp;&nbsp;"+content;
									out.println(content);
							
									%>
									<br/>
									<table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
                                            <td height="48" align="center" style="padding:10px 15px; ">
											<font color='#0066FF'>页次:<%= ij%> /</font>
											
											<a href="newsContent.jsp?ij=1&docId=<%=docId %>"> 
											<font color='#0066FF'>
											首页 </font></a>
											
											<%if(ij==1){
											%>
											上一页
											<%
											}else{
											%>
											<a href="newsContent.jsp?ij=<%=ij-1 %>&docId=<%=docId %>">
											<font color='#0066FF'>
											上一页 </font></a>
											<%
											} 
											if(ij==count)
											{
											 %>
											下一页
											<%
											}else{
											%>
											<a href="newsContent.jsp?ij=<%=ij+1 %>&docId=<%=docId %>">
											<font color='#0066FF'>
											下一页</font></a>
											<%
											}
											%>
											<a href="newsContent.jsp?ij=<%=count %>&docId=<%=docId %>">
											<font color='#0066FF'>
											末页</font></a>
											<font color='#0066FF'> /共:<%= count%>页</font>
									         </td>
                                         </tr>
									</table>
									<%
                                }else{
								String content=DocumentHelper.getContent(doc);
								content=content.replaceAll("    "," ");
								content=content.replaceAll("   "," ");
								content=content.replaceAll("  "," ");
								content=content.replaceAll("　","");
								content=content.replaceAll("	","");
								content=content.replaceAll("&nbsp;","");
								content=content.replaceAll("\r\n\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n\r\n","\r\n");
								content=content.replaceAll("\r\n\r\n","\r\n");
								content=content.replace("\r\n","<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
								content="&nbsp;&nbsp;&nbsp;&nbsp;"+content;
								
								out.println(content);
								}
						   %> 
                           <br />
                           <table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
	                <%
                		ServletContext st = this.getServletConfig().getServletContext();
						ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
						CsswebServiceUtil serviceUtil=(CsswebServiceUtil)ctx.getBean("csswebServiceUtil");
						List attach = serviceUtil.executeQuery("select a.doc_id,b.title,b.upload_date from cms_doc_body a,cms_doc_single_attr b where a.parent_id = "+ docId +" and a.doc_id=b.doc_id order by a.doc_id desc");
						if(attach!=null && attach.size()>0) {
					%>
						<tr align="left"> 
				          <td class="font_14px gray5">【附件】 </td>
				        </tr>
					<%			
							for(int i=0;i<attach.size();i++) {
					%>        
					        <tr align="left"> 
					          <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${contextPath }/cms/showDocumentFile.jsp?id=<%=((Map)attach.get(i)).get("doc_id") %>"><%=((Map)attach.get(i)).get("title") %></a></td>
					        </tr>
					<%
							}
						}
					%>
					 <tr>
                      <td height="48" align="center" style="padding:10px 15px; "><input type="submit" name="Submit2" value="关闭窗口" class="button4" onClick="javascript:window.opener=null;window.close();"/></td>
                     </tr>
		          </table>

                           </div>

			 
<p class="newstextAreabottom"></p>

</div>

</div>

<jsp:include page="/share/bottom.jsp" />
</body>
</html>
