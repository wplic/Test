<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%request.setCharacterEncoding ("UTF-8") ;%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<jsp:directive.page import="com.cssweb.client.pojo.TsystemWebuser"/>
<jsp:directive.page import="com.cssweb.common.dictionary.service.DictionaryService"/>
<jsp:directive.page import="com.cssweb.common.dictionary.pojo.Dictionary"/>
<%@page import="java.util.List"%>
<%

     String flag="0";
	 ServletContext st = this.getServletConfig().getServletContext();
	 ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(st);
	 DictionaryService dictionaryService = (DictionaryService) ctx.getBean("dictionaryService");
	 List usertypelist = dictionaryService.getByParentId(dictionaryService.getDictionaryByKeyCode("yhfl").getId());
	
        Long tsystemwebuserlevel = 0L;
		String tsystemwebuserlevelstr = "";
		
		if(request.getSession().getAttribute("tsystemWebuser")!=null){
			TsystemWebuser tsystemWebuser=(TsystemWebuser)request.getSession().getAttribute("tsystemWebuser");
			if(tsystemWebuser!=null) {
			//暂时控制 体验用户不能查看金融库研究报告
			if(tsystemWebuser.getUserType()!=null&&tsystemWebuser.getUserType().equals("2"))
			{
			flag="1";
				%>
				<script type="text/javascript">
					alert ("对不起，体验用户不能使用改功能！") ;
					//window.opener=null;
					//window.open('','_self');
					//window.close() ;
				</script>
				<%
			}//完成
				tsystemwebuserlevel = Long.parseLong(tsystemWebuser.getLevel() == null ? "0" : tsystemWebuser.getLevel());
				Long dicLevel = 0L;
				if(null!=usertypelist){
					for(int i=0;i<usertypelist.size();i++){
						Dictionary dic = (Dictionary) usertypelist.get(i);
						dicLevel = Long.parseLong(dic.getKeyShortDesc());
						if(tsystemwebuserlevel.longValue()==dicLevel.longValue()){
							tsystemwebuserlevelstr = dic.getKeyName();
						}
					}
				}
				if(tsystemwebuserlevel.longValue()==1){
				flag="1";
				%>
				<script type="text/javascript">
					alert ("对不起，您为<%=tsystemwebuserlevelstr%>，没有权限使用该功能，请尽快升级！") ;
					//window.opener=null;
					//window.open('','_self');
					//window.close() ;
				</script>
				<%
				}
			}
		}

%>	
<center>
<div style="height:25px; overflow:hidden"></div>
 <table align="center"  style="width:650px;background:url(${ctx}/pic/wsyyt/left_tit1.gif) no-repeat; height:29px; line-height:29px; text-indent:60px;"> 
              <tr>
                <td class="bold font12 red font_73 alink" id="tagdp1" onmouseover="SwitchNews('dp', 1, 3,'bold font12 red font_73 alink','bold font12 font_73 alink')"><a href="javascript:void(0)">个股搜索</a></td>
                <td class="bold font12 font_73 alink" id="tagdp2" onmouseover="SwitchNews('dp', 2, 3,'bold font12 red font_73 alink','bold font12 font_73 alink')"><a href="javascript:void(0)">行业搜索</a></td>
                <td width="50%" class="bold font12 font_73 alink" id="tagdp3" onmouseover="SwitchNews('dp', 3, 3,'bold font12 red font_73 alink','bold font12 font_73 alink')"><a href="javascript:void(0)">09年新财富评选分析师搜索</a></td>
              </tr>
          </table>
          <div style=" height:50px; overflow:hidden"></div>
        <table align="center">
              <tr>
                <td class="lh21 ml25">
                 <input type="text" name="keywords" id="keywords" class="input108" />
                </td>
                <td width="30"></td>
                <td>
                
		                <table align="center" id="dp1" style="display:block">
					              <tr>
					                <td class="lh21 ml25">
					                <a href="#" onclick="gusuocommit('stock')">  <img src="/pic/wsyyt/but_cx1.jpg" /></a>
					                </td>
					              </tr>
					      </table>
					       <table align="center" id="dp2" style="display:none">
					              <tr>
					                <td class="lh21 ml25">
					                 <a href="#" onclick="gusuocommit('industry')">  <img src="/pic/wsyyt/but_cx1.jpg" /></a>
					                </td>
					              </tr>
					      </table>
					       <table align="center" id="dp3" style="display:none">
					              <tr>
					                <td class="lh21 ml25">
					                  <a href="#" onclick="gusuocommit('stars')"> <img src="/pic/wsyyt/but_cx1.jpg" /></a>
					                </td>
					              </tr>
					      </table>
		      
		                </td>
              </tr>
      </table>  
      <div style=" height:10px; overflow:hidden"></div>
       
      
    
 <table align="center" class="ym_bg mt5 center">
    <tr>
      <td class="lh21 ml25">
         股  搜 
  </td>
 </tr>
</table>

</center>
<br>
</body>
<script type="text/javascript">
		function gusuocommit(s)
		{
		if('1'=='<%=flag%>'){
		 alert("您没有权限使用该功能，请尽快升级！");
		return false;
		}else{
				var keywords = document.getElementById("keywords").value;
				if(null!=keywords && keywords !="")
				{
				    var path="http://192.168.202.60/StockInfo/guso/stock.php?s=" + s + "&keywords="+ keywords;
					window.open(path);
				}else{
					 aliert("您的输入有错误");
					}
			}
		}
		
		function SwitchNews(obj,num,sum,class1,class2)
			{
			 	ClearNews(obj,sum,class1,class2);
				document.getElementById("tag" + obj + num).className=class1;
				document.getElementById(obj+num).style.display = "";								
			}
			
			function ClearNews(name, num,class1,class2)
			{					
				for(i=1;i<= num;i++)
				{										
					var tag=document.getElementById("tag"+ name + i).className;
					if(tag==class1){
						document.getElementById("tag"+ name + i).className=class2; 
						document.getElementById(name + i).style.display="none";
					}
				}
			}
</script>
</html>