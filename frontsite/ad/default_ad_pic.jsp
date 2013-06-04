<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%
//取得显示图片数量
String counts = request.getParameter("counts");
//if(counts == null || counts.length()==0){
	counts = "4";
//}

//取得广告位编码
String subAdCode = request.getParameter("subAdCode");
if(subAdCode == null || subAdCode.length() == 0){
	subAdCode = "ad_pic";
}

//取得广告位编码
String widths = request.getParameter("widths");
if(widths == null || widths.length() == 0){
	widths = "492";
}

//取得广告位编码
String heights = request.getParameter("heights");
if(heights == null || heights.length() == 0){
	heights = "315";
}


//取得service
//ServletContext st = this.getServletConfig().getServletContext();
//ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
//AdMangerService adMangerService = (AdMangerService) ctx.getBean("adMangerService");

//取得广告列表
//List list=adMangerService.getAdListBySubAdCode(subAdCode); 

//AdManger adManger=null;

//if(list.size() < Integer.parseInt(counts)){
//	counts = Integer.toString(list.size());
//}
%>
<table width="<%=widths%>" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="30"> 
      <!-- 图片广告切换 Start -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>
<SCRIPT>
var widths=<%=widths%>;
var heights=<%=heights%>;
var counts=<%=counts%>;
var img=[];
var url=[];
/*var tagImg=function(len,name,url){
alert("11");
	for(i=1;i<len;i++){
		name[i]=new Image();
		name[i].src=url+i+'.gif';
	}
}
tagImg(5,img,'/pic/share/ad_pic');
tagImg(5,url,'#');*/
</SCRIPT>
<% 
	//if(list!=null && list.size()>0){
	%>
		<SCRIPT>
	<%
		//对取得的广告位进行处理
		//for(int i=0;i<Integer.parseInt(counts);i++){
		//	adManger=(AdManger)list.get(i);
		//	long picId = adManger.getPicId();
		//	String url = adManger.getUrl();
	%>
			img[1]=new Image();
			img[1].src='/pic/msindex/banner4.jpg';
			url[1]=new Image();
			url[1].src='http://www.gf.com.cn/commons/infoList.jsp?docId=189438';
			img[2]=new Image();
			img[2].src='/pic/msindex/banner1.jpg';
			url[2]=new Image();
			url[2].src='#';
			img[3]=new Image();
			img[3].src='/pic/msindex/banner2.jpg';
			url[3]=new Image();
			url[3].src='#';
			img[4]=new Image();
			img[4].src='/pic/msindex/banner3.jpg';
			url[4]=new Image();
			url[4].src='#';
	<%
		//}
	%>
		</SCRIPT>
	<%

	//}

%>
 <SCRIPT src="/js/focus.js"></SCRIPT> </td>
        </tr>
      </table>
      <!-- 图片广告切换 End -->
    </td>
  </tr>
</table>
