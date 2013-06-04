<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.util.*"%>
<%@page import="com.cssweb.soft.pojo.SoftBasicInfo" %>
<%@page import="com.cssweb.complaints.util.Validator" %>
<%@page import="com.cssweb.soft.service.SoftBasicInfoService"%>
<%@page import="com.cssweb.soft.service.SoftUrlInfoService"%>
<%@page import="com.cssweb.soft.service.SoftCategoryService"%>
<%@page import="com.cssweb.soft.pojo.SoftUrlInfo"%>
<%@page import="com.cssweb.soft.pojo.SoftCategory"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广发证券</title>
<link href="${contextPath }/css/global.css" rel="stylesheet" type="text/css" />
<link href="${contextPath }/css/wsyyt/wsyyt.css" rel="stylesheet" type="text/css" />
<script src="${contextPath }/js/setTab.js"></script>
</head>
<%
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletConfig().getServletContext());
	SoftBasicInfoService softbasicinfoservice=(SoftBasicInfoService)ctx.getBean("softbasicinfoservice");
	SoftUrlInfoService softurlinfoservice=(SoftUrlInfoService)ctx.getBean("softurlinfoservice");
	SoftCategoryService softCategoryService=(SoftCategoryService)ctx.getBean("softcategoryservice");
	String category_id = (String)request.getAttribute("category_id");
	SoftCategory s = null;
	if(category_id != null && !"".equals(category_id)){
		s = softCategoryService.getSoftByCode(category_id);
	}
	String tabtagsId = Validator.isNotNull(request.getParameter("tabtagsId")) ? request.getParameter("tabtagsId") : "";
%>

<body >
<jsp:include page="${contextPath }/share/top.jsp" />
<div class="body_bg">
<div class="wjdc_box">
  <p class="wjdc"><a href="/investorEdu/investorSurvey.html"><img src="/pic/index/wzdc.jpg"/></a></p>
</div>
<div class="main">
  <div class="dqwz">当前位置：<a href="${contextPath }/index.jsp?nav=index">首页</a> &gt; <a href="${contextPath }/bussinesshall/index.jsp?nav=wsyyt">网上营业厅</a>  &gt; 软件下载</div>
  <div class="w262 fleft bg_ec ptb13">
  		<div class="side_top"></div>
    <jsp:include page="${contextPath}/bussinesshall/newsSoftList.jsp">
            <jsp:param name="catName" value="软件下载公告" />
            <jsp:param name="whichCat" value="wsyyt_xzgg"/>
            <jsp:param name="state" value="1"/>
            <jsp:param name="showSize" value="5"/>
    </jsp:include>
    <div class="side_bot"></div>
    <div style="height:40px; overflow:hidden"></div>
        <p align="center"><a href="${contextPath }/investorEdu/webtradeRisk.html"><img src="${contextPath }/pic/wsyyt/softDownload/ban_fxjs.jpg"/></a></p>
    <p align="center" class="mt10"><a href="${contextPath }/bussinesshall/softDownloadQuest.jsp"><img src="../pic/wsyyt/softDownload/ban_rjxz.jpg"/></a></p>
  </div>
  <div class="w650 fright">	
        <div class="left_tit1">
          <table width="98%" border="0" cellspacing="0" cellpadding="0" style=" text-indent:0px">
            <tr>
              <td width="10%">&nbsp;</td>
              <%
              	List<SoftCategory> sl = softCategoryService.selectAll();
              	if(sl != null && sl.size() > 0){
              		for(int i=0;i<sl.size();i++){
              			SoftCategory b = (SoftCategory)sl.get(i);
              			if(null==s)
              				s = b;
              		if(i == 0){
              		%>
              		<td class="bold font12 font_73 alink" id="tagtabs<%=i+1%>" onclick=""><a id="<%=i+1%>" href="${contextPath }/front/softInfo.do?method=getSoftListByCategoryId&tabtagsId=<%=i+1%>&category_id=<%=b.getCategory_code()%>"><%=b.getCategory_name()%></a></td>
              		<%
              		}else{
              		%>
              		<td class="bold font12 font_73 alink" id="tagtabs<%=i+1%>" onclick=""><a  id="<%=i+1%>" href="${contextPath }/front/softInfo.do?method=getSoftListByCategoryId&tabtagsId=<%=i+1%>&category_id=<%=b.getCategory_code()%>"><%=b.getCategory_name()%></a></td>
              		<%
              		}
              		}
              	}
              %>
              
              <td width="20%">&nbsp;</td>
            </tr>
          </table>
        </div>
        <div class="rjxz_box mt5">
          <table width="100%" class="lh21">
            <tr class="bold font_43">
              <td width="171" align="center">软件名称</td>
              <td align="center">软件说明</td>
              <td align="center" width="70">大小</td>
              <td align="center" width="70">下载地址</td>
            </tr>
          </table>
          <div id="tabs1">
          <%
          	List<SoftBasicInfo> list = (List)request.getAttribute("softList");
          	if(null==list){
          		Map map = new HashMap();
				map.put("begin", 0);
				map.put("end", 20);
				map.put("sortName", "order_num");
				map.put("dir", "asc");
				map.put("category_id", s.getCategory_code());
          		list = softbasicinfoservice.getSoftListByCategoryId(map);
          	}
          	if(list != null && list.size() > 0){
          		for(SoftBasicInfo sbi : list){
          			%>
          			
          			 <table width="100%" class="lh21 mt5" border="1" bordercolor="#fe8d3d">
             <tr>
               <td width="171" class="mc_bg1"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                 <tr>
                   <td colspan="4">
                   <% if(sbi.getImage_id()!=null&&sbi.getImage_id()>0){ %>
                   <img src="${contextPath }/share/showUploadImage.jsp?id=<%=sbi.getImage_id() %>" width="133" height="46"/>
                   <%}else{ %>
                   <img src="${contextPath }/pic/wsyyt/softDownload/soft_zqb.jpg" width="133" height="46"/>
                   <%} %>
                   <br/><h1 align="center"><%=sbi.getSoft_name()%></h1></td>
                 </tr>
                 <tr>
                   <td width="12%" height="8"></td>
                 </tr>
                 <tr>
                  <% 
                   	List<SoftUrlInfo> urlbean1  = softurlinfoservice.selectAll_2("select * from SOFT_URL_INFO where url_name='使用手册'");
                   	if(urlbean1 != null && urlbean1.size() > 0){
                   		//for(SoftUrlInfo sui: urlbean1){
                   			%>
                   			<td><img src="${contextPath }/pic/wsyyt/softDownload/list_01.gif" /></td>
                   			<td width="36%" class="red"><a href="<%=urlbean1.get(0).getUrl()%>"><%=urlbean1.get(0).getUrl_name()%></a></td>
                   			<%
                   		//}
                   	}
                   		List<SoftUrlInfo> urlbean2 = softurlinfoservice.selectAll_2("select * from SOFT_URL_INFO where url_name='使用演示'");
                   	if(urlbean1 != null && urlbean1.size() > 0){
                   		//for(SoftUrlInfo sui: urlbean1){
                   			%>
                   			<td><img src="${contextPath }/pic/wsyyt/softDownload/list_01.gif" /></td>
                   			<td width="36%" class="red"><a href="<%=urlbean2.get(0).getUrl()%>"><%=urlbean2.get(0).getUrl_name()%></a></td>
                   			<%
                   		//}
                   	}
                   %>
                 </tr>
                 <tr>
                   <td colspan="4" class="red">更新日期：
                   		<%=sbi.getGxsj()==null?"":sbi.getGxsj()%>
                   </td>
                 </tr>
               </table></td>
               <td><table width="100%" class="mtb10">
                 <tr>
                   <td class="plr13">
                   <p class="font_43">
                   		<%=sbi.getSoft_desc()%>
                     </td>
                   <td class="cz_linebg" width="10">&nbsp;</td>
                   <td align="center" width="60" class="font_43">
						<%=sbi.getSoft_size()>0 ? sbi.getSoft_size() :0%>M
					</td>
                   <td class="cz_linebg" width="10">&nbsp;</td>
                   <td align="center" width="70">
                   <% 
                   	List<SoftUrlInfo> urlbean  = softurlinfoservice.selectAll(String.valueOf(sbi.getId()));
                   	if(urlbean != null && urlbean.size() > 0){
                   		for(SoftUrlInfo sui: urlbean){
                   			%>
                   			<span>
                   			<a href="<%=sui.getUrl() %>"><%=sui.getUrl_name() %></a>
                   			</span><br/>
                   			<%
                   		}
                   	}
                   %>
                   	
                  </td>
                 </tr>
               </table></td>
             </tr>
           </table>
          			
          			<%
          		}
          	}
          %>
         
          
            
          </div>
         
          
        
       <p class="lh21 xtsm_txt">系统要求说明：<br /><%if(s != null && !"".equals(s)){%><%=s.getCategory_description() %><%}%></p>
        </div>
  </div>
  
  <div class="clearfloat"></div>
</div>
<jsp:include page="${contextPath }/share/bottom.jsp" />

</div>
</body>
</html>
<script language="javascript">
	<%
		if(Validator.isNotNull(tabtagsId)){
	%>
		document.getElementById("tagtabs<%=tabtagsId%>").className="red bold font12 alink";
	<%
		}else{
		%>
		if(document.getElementById("tagtabs1")!=null){
			document.getElementById("tagtabs1").className="red bold font12 alink";
		}
		<%
		}
	%>
</script>
<script type="text/javascript"> 
var _aq = _aq || [];
_aq.push(['_setSiteId', 10001]);_aq.push(['_setCatalogId', 26]); _aq.push(['_trackPageview']); (function() {
var ga = document.createElement( 'script'); ga.type = 'text/javascript'; ga.async = true; ga.src='http://121.8.153.59:8080/stat/stat.js'; var s = document.getElementsByTagName( 'script')[0]; s.parentNode.insertBefore(ga, s); })();
</script>