<%@ page contentType="text/html; charset=utf-8" language="java"  %>
 
 <%
 	StringBuffer hisUrl = request.getRequestURL();
 	
 	String hisString = hisUrl.toString();
 	
 	
 	int start=0;
 	if(hisString.indexOf("/fund")>=0){
 		start = hisString.indexOf("/fund");
 	}
 	if( hisString.indexOf("/f10/")>=0){
 		start = hisString.indexOf("/f10");
 	}
 	if(hisString.indexOf("/baseInfo")>=0){
 		start = hisString.indexOf("/baseInfo");
 	}
 
 	
 	hisString= hisString.substring(start,hisString.length());
 	String para = request.getQueryString();
 	String url = hisString+((para==null)?"":("?"+para));
 	if(hisString.indexOf("/f10.do")<0)
 		request.getSession().setAttribute("returnUrl",url);
  %>
<script type="text/javascript">
	var XMLHttpReq_invest;
    var completeDiv_invest;
    var inputField_invest;
    var completeTable_invest;
    var completeBody_invest;
 	//创建XMLHttpRequest对象       
    function createXMLHttpRequest_invest() {
		if(window.XMLHttpRequest) { //Mozilla 浏览器
			XMLHttpReq_invest = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) { // IE浏览器
			try {
				XMLHttpReq_invest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq_invest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
	}
	//发送匹配请求函数
    function getSearchList_invest() {
        inputField_invest = document.getElementById("searchgpdm_invest");            
        completeTable_invest = document.getElementById("complete_table_invest");
        completeDiv_invest = document.getElementById("popup_invest");
        completeBody_invest = document.getElementById("complete_body_invest");
        document.getElementById("gpdm_invest").value=inputField_invest.value;
        if (inputField_invest.value.length > 0) {
            createXMLHttpRequest_invest();   
            var url = "${contextPath}/f10.do?method=searchSecuritiesList&type=jj&gpdm=" + encodeURIComponent(inputField_invest.value);  
            XMLHttpReq_invest.open("GET", url, true);
            
            XMLHttpReq_invest.onreadystatechange = processMatchResponse_invest;//指定响应函数
            XMLHttpReq_invest.send(null); // 发送请求
        } else {
            clearNames_invest();
        }
    }
	// 处理返回匹配信息函数
    function processMatchResponse_invest() {
    	if (XMLHttpReq_invest.readyState == 4) { // 判断对象状态
        	if (XMLHttpReq_invest.status == 200) { // 信息已经成功返回，开始处理信息
                    setNames_invest(XMLHttpReq_invest.responseXML.getElementsByTagName("gpjj"));
            }else { //页面不正常
                window.alert("您所请求的页面有异常。");
            }
        }
    }
	//生成与输入内容匹配行
    function setNames_invest(names) {            
       clearNames_invest();
       var size = names.length;
       setOffsets_invest();
       var row, cell, txtNode;
       for (var i = 0; i < size; i++) {
           var nextNode = names[i].firstChild.data;
           row = document.createElement("tr");
           cell = document.createElement("td");
           cell.onmouseout = function() {this.style.backgroundColor ='#FFFAFA';};
           cell.onmouseover = function() {this.style.backgroundColor ='#f4a460';};
           cell.onmousedown = function() { completeField_invest(this); } ;                             
           txtNode = document.createTextNode(nextNode);
           cell.appendChild(txtNode);
           row.appendChild(cell);
           document.getElementById("complete_body_invest").appendChild(row);
       }
   }
	//设置显示位置                
   function setOffsets_invest() {
       completeTable_invest.style.width = "230px";
       var left = calculateOffset_invest(document.getElementById("searchgpdm_invest"), "offsetLeft")-20;
       var top = calculateOffset_invest(document.getElementById("searchgpdm_invest"), "offsetTop") + document.getElementById("searchgpdm_invest").offsetHeight;
       document.getElementById("popup_invest").style.border = "black 1px solid";
       document.getElementById("popup_invest").style.left = left +20 + "px";
       document.getElementById("popup_invest").style.top = top + "px";
   }
 	//计算显示位置       
    function calculateOffset_invest(field, attr) {
      var offset = 0;
      while(field) {
        offset += field[attr]; 
        field = field.offsetParent;
      }
      return offset;
    }
	//填写输入框
    function completeField_invest(cell) {
    	document.getElementById("searchgpdm_invest").value = cell.firstChild.nodeValue.split(" ")[0];
    	document.getElementById("gpdm_invest").value=cell.firstChild.nodeValue.split(" ")[0];
    	
        clearNames_invest();
    }
	//清除自动完成行
    function clearNames_invest() {
        var ind = document.getElementById("complete_body_invest").childNodes.length;
        for (var i = ind - 1; i >= 0 ; i--) {
             document.getElementById("complete_body_invest").removeChild(document.getElementById("complete_body_invest").childNodes[i]);
        }
        document.getElementById("popup_invest").style.border = "none";
    }
    function clearDiv_invest(obj){
    	if(obj.value==''){
    		obj.value='';
    	}else{
    		clearNames_invest();
    	}
    }
</script>
 
 <form name="fundFormsSearch" method="post"  action="${contextPath}/f10.do" id="fundFormsSearch">
 		<input type="hidden" name="method" value="check">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="34">&nbsp;</td>
            <td width="62" style="text-indent:0">基金查询</td>
            <td width="172" style="text-indent:0">
                         		
           <input name="searchgpdm" id="searchgpdm_invest"  onmouseover="this.focus()" onfocus="this.value=''" autocomplete="off"  type="text" size="30" maxlength="6" class="font_73" value="请输基金名称/基金代码"
					 onblur="javascript:clearDiv_invest(this);"
					 onkeyup="javascript:getSearchList_invest();"/>
					<div style="position:absolute;width:100px" id="popup_invest">
						<table id="complete_table_invest" bgcolor="#FFFAFA" border="0" cellspacing="0" cellpadding="0" />
							<tbody id="complete_body_invest"></tbody>
						</table>
					</div>
				<input type="hidden" name="gpdm" id="gpdm_invest" />	
            </td>
            <td width="499" class="single_rig_font left"><img src="/pic/news/query.gif" onmouseover="this.src='/pic/news/query_s.gif'" onmouseout="this.src='/pic/news/query.gif'" onclick="document.getElementById('fundFormsSearch').submit();" style="cursor: hand"/></td>
            <td width="12" class="right"></td>
          </tr>
        </table>
        </form>
