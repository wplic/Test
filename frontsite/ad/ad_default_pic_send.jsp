<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:directive.page import="org.springframework.context.ApplicationContext"/>
<jsp:directive.page import="org.springframework.web.context.support.WebApplicationContextUtils"/>
<jsp:directive.page import="com.cssweb.admanger.service.AdMangerService"/>
<jsp:directive.page import="com.cssweb.admanger.pojo.AdManger"/>
<%@page import="java.util.List"%>
<html>
  <head>
<%
    String path = ((HttpServletRequest)pageContext.getRequest()).getContextPath()+"/";
	ServletContext st = this.getServletConfig().getServletContext();
	ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	AdMangerService adMangerService = (AdMangerService) ctx.getBean("adMangerService");
	//PicMangerService picMangerService =(PicMangerService) ctx.getBean("picMangerService");
	//取得广告位编码
	String subAdCode = request.getParameter("subAdCode");
	if(subAdCode == null || subAdCode.length() == 0){
		subAdCode="ad_default_t";
	}
	List adList = adMangerService.getAdListBySubAdCode(subAdCode);
	//取得显示图片数量
	 int counts = 0;
	 //图片宽度
	 String widths = "0";
	 String  heights ="0";
	 if(adList!=null&&adList.size()>0)
	   counts=adList.size();
	if(counts!=0)
	{
	//取得广告位编码
	  widths = request.getParameter("widths");
	if(widths == null || widths.length() == 0){
		widths = "520";
	}
	
	//取得广告位编码
	 heights = request.getParameter("heights");
	if(heights == null || heights.length() == 0){
		heights = "188";
	}
%>
  </head>
  
  <% 
	if(adList!=null && adList.size()>0){
	AdManger adManger=null;
	%>
	<script type="text/javascript">
			//用于存放数据库中查到imgid信息
			var imglp=new Array();
			//用于存放数据库中查到url连接信息
			var urlp=new Array(); 
	</script>
	<%//对取得的广告位进行处理
		for(int i=0;i<counts;i++){
			adManger=(AdManger)adList.get(i);
			long picId = adManger.getPicId();
			String url = adManger.getUrl();
			System.out.print(picId+"url:"+url);
			%>
			<script type="text/javascript">
			urlp[<%=i+1%>]='<%=url%>';
			imglp[<%=i+1%>]='<%=picId%>';
			</script>
			<%
		}
	}
 }
	%>
  <body style="margin-top:0px; margin-left:0px;">
	<script type="text/javascript">
			var widthsp=<%=widths%>;
			var heightsp=<%=heights%>;
			var countsp=<%=counts%>;
			var tt;
			var $bp=function(id){return document.getElementById(id);}
			var nnp=1;
			function change_imgp(){
			$bp("ad_d_gpic").src='/share/showUploadImage.jsp?id='+imglp[nnp];
			$bp("ad_d_gurl").href=urlp[nnp];
			for (var i=1;i<=countsp;i++){
			$bp("ad_d_gxxjdjj"+i).className='axx';
			}
			$bp("ad_d_gxxjdjj"+nnp).className='bxx';
			nnp++;
			if(nnp>countsp){
			nnp=1;
			}
			tt=setTimeout('change_imgp()',4000);
			}
			function changeimgp(n){
			nnp=n;
			window.clearInterval(tt);
			change_imgp();
			}
			document.write('<style>');
			document.write('.axx{padding:3px 7px;border-left:#cccccc 1px solid;}');
			document.write('a.axx:link,a.axx:visited{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#000;}');
			document.write('a.axx:active,a.axx:hover{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#000;}');
			document.write('.bxx{padding:3px 7px;border-left:#cccccc 1px solid;}');
			document.write('a.bxx:link,a.bxx:visited{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#FF0004;}');
			document.write('a.bxx:active,a.bxx:hover{text-decoration:none;color:#fff;line-height:18px;font:11px sans-serif;background-color:#CC0000;}');
			document.write('</style>');
			document.write('<div style="width:'+widthsp+'px;height:'+heightsp+'px;overflow:hidden;text-overflow:clip;">');
			document.write('<div><a id="ad_d_gurl" target="_blank"><img id="ad_d_gpic" style="border:0px;filter:progid:dximagetransform.microsoft.wipe(gradientsize=1.0,wipestyle=4, motion=forward)" width='+widthsp+' height='+heightsp+' /></a></div>');
			document.write('<div style="filter:alpha(style=1,opacity=10,finishOpacity=100);background: #333;width:100%-2px;text-align:right;top:-16px;position:relative;margin:1px;height:18px;padding:0px;margin:0px;border:0px;">');
			for(var i=1;i<countsp+1;i++){
			document.write('<a href="javascript:changeimgp('+i+');" id="ad_d_gxxjdjj'+i+'" class="axx" target="_self">'+i+'</a>');
			}
			document.write('</div></div>');
			change_imgp();
	</script>
<body></body>
</html>
