<%@ page contentType="text/html; charset=utf-8" language="java"%>

<style type="text/css"> 
	th { 
	    font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
	    color: #4f6b72; 
	    border-right: 1px solid #C1DAD7; 
	    border-bottom: 1px solid #C1DAD7; 
	    border-top: 1px solid #C1DAD7; 
	    letter-spacing: 2px; 
	    text-transform: uppercase; 
	    text-align: left; 
	    padding: 6px 6px 6px 12px; 
	    background: #CAE8EA; 
	} 
</style>

<script type="text/javascript">
	var XMLHttpReq_invest;
    var completeDiv_invest = document.getElementById("popup_invest");
    var inputField_invest = document.getElementById("searchgpdm_invest");
    var completeTable_invest = document.getElementById("complete_table_invest");
    var completeBody_invest = document.getElementById("complete_body_invest");
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
    function getSearchList_invest(str) {
        inputField_invest = document.getElementById("searchgpdm_invest");            
        completeTable_invest = document.getElementById("complete_table_invest");
        completeDiv_invest = document.getElementById("popup_invest");
        completeBody_invest = document.getElementById("complete_body_invest");
        document.getElementById("gpdm_invest").value=inputField_invest.value;
        if (inputField_invest.value.length > 0) {
            createXMLHttpRequest_invest();   
            var url = "${contextPath}/f10.do?method=searchSecuritiesList&type=zq&gpdm=" + encodeURIComponent(str);  
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
       
       row = document.createElement("tr");
       row.bgColor="#FFFFCC";
       
       cell = document.createElement("th");
       cell1 = document.createElement("th");    
       cell2 = document.createElement("th");       
       
       cell.innerHTML = "代码";
       row.appendChild(cell);
      
       cell1.innerHTML = "简称";
       row.appendChild(cell1);
       
       cell2.innerHTML = "拼音";       
       row.appendChild(cell2);
       
       completeBody_invest.appendChild(row);         
       
       for (var i = 0; i < size; i++) {
           var nextNode = names[i].firstChild.data;
           row = document.createElement("tr");
           row.onmouseout = function() {this.style.backgroundColor ='#FFFAFA';};
           row.onmouseover = function() {this.style.backgroundColor ='#f4a460';};
           row.onmousedown = function() { completeField_invest(this); } ; 
                
           cell = document.createElement("td");
           cell.style.borderRight="1px solid #C1DAD7";
           cell.style.borderBottom="1px solid #C1DAD7";
           cell.style.fontSize="11px";
           cell.style.padding="6px 6px 6px 12px";
           cell.style.color="#4f6b72";           
           
           cell1 = document.createElement("td"); 
           cell1.style.borderRight="1px solid #C1DAD7";
           cell1.style.borderBottom="1px solid #C1DAD7";
           cell1.style.fontSize="11px";
           cell1.style.padding="6px 6px 6px 12px";
           cell1.style.color="#4f6b72";               
              
           cell2 = document.createElement("td");  
           cell2.style.borderRight="1px solid #C1DAD7";
           cell2.style.borderBottom="1px solid #C1DAD7";
           cell2.style.fontSize="11px";
           cell2.style.padding="6px 6px 6px 12px";
           cell2.style.color="#4f6b72";                 
                       
           txtNode = document.createTextNode(nextNode);
           cell.innerHTML = txtNode.nodeValue.split(" ")[0];
           row.appendChild(cell);
          
           txtNode = document.createTextNode(nextNode);
           cell1.innerHTML = txtNode.nodeValue.split(" ")[6];
           row.appendChild(cell1);
           
           txtNode = document.createTextNode(nextNode);
           cell2.innerHTML = txtNode.nodeValue.split(" ")[12];         
           row.appendChild(cell2);
           
           completeBody_invest.appendChild(row);
       }
   }
	//设置显示位置                
   function setOffsets_invest() {
       completeTable_invest.style.width = "190px";
       var left = calculateOffset_invest(inputField_invest, "offsetLeft")-20;
       var top = calculateOffset_invest(inputField_invest, "offsetTop") + inputField_invest.offsetHeight;
       completeDiv_invest.style.border = "black 1px solid";
       completeDiv_invest.style.left = left +20 + "px";
       completeDiv_invest.style.top = top + "px";
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
    	document.getElementById("popup_invest").style.display="none";
    	inputField_invest.value = cell.cells.item(0).innerHTML;
    	document.getElementById("gpdm_invest").value=cell.cells.item(0).innerHTML;
    	document.getElementById("type").value=cell.cells.item(2).innerHTML;    	
       clearNames_invest();
    }
	//清除自动完成行
    function clearNames_invest() {
    	var objTbody = document.getElementById("complete_body_invest");
        var ind = objTbody.childNodes.length;
        for (var i = ind - 1; i >= 0 ; i--) {
             objTbody.removeChild(objTbody.childNodes[i]);
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

<form name="frm" id="frm" method="post"
	action="${contextPath}/f10.do?method=check" target="_parent">
	<table width="50%" border="0" cellspacing="0" cellpadding="0">
	<tr height="4">
		<td colspan="4"></td>
	</tr>
     <tr>
       <td width="34">&nbsp;</td>
       <td width="82" style="text-indent:0">债券查询</td>
       <td width="172" style="text-indent:0"><input name="searchgpdm" id="searchgpdm_invest"
					onmouseover="this.focus()" onfocus="this.value=''"
					autocomplete="off" type="text" size="30" maxlength="6"
					class="input2" value="请输入债券代码"
					onblur="javascript:clearDiv_invest(this);"
					onkeyup="javascript:document.getElementById('popup_invest').style.display='';getSearchList_invest(this.value);" onclick="javascript:this.value='';"/>
					<div style="position:absolute;width:185px" id="popup_invest">
					<table id="complete_table_invest" bgcolor="#FFFAFA" border="0"
						cellspacing="0" cellpadding="0" style="border-left:1px solid #C1DAD7;border-top:1px solid #C1DAD7;border-bottom:1px solid #C1DAD7;border-right:1px solid #C1DAD7"/>
						<tbody id="complete_body_invest"></tbody>
					</table>
				</div>
				<input type="hidden" name="gpdm" id="gpdm_invest" />
				<input type="hidden" name="type" id="type" />
		</td>
       <td width="85" style="text-indent:0"><input type="submit" class="but_01" name="button"style="cursor: hand" id="button" value="提交" /></td>
     </tr>
   </table>
	
</form>
<script type="text/javascript" language="javascript">
	(function (bool) {
	//兼容FF一些方法
		
		if (bool) {
			
			window.__defineGetter__("event", function () {
			//兼容Event对象
				var o = arguments.callee;
				do {
					if (o.arguments[0] instanceof Event) return o.arguments[0];
				} while (o = o.caller);
				return null;
			});
			
		}

	})(/Firefox/.test(window.navigator.userAgent));

	var i=0;

	document.onkeydown = function () {
		var tb = document.getElementById("complete_table_invest");
		var e = window.event;
		if (e.keyCode == 38){
			for(var k=0;k<document.getElementById("complete_table_invest").rows.length;k++){
				document.getElementById("tb").rows.item(k).bgColor="";
			}   
			document.getElementById("complete_table_invest").rows.item(--i%tb.rows.length).bgColor="#FF0000";
			document.getElementById("show").value=document.getElementById("complete_table_invest").rows.item(i%tb.rows.length).innerHTML;   
		}
		if (e.keyCode == 40){   
			for(var k=0;k<document.getElementById("complete_table_invest").rows.length;k++){
				document.getElementById("complete_table_invest").rows.item(k).bgColor="";   
			}   
			document.getElementById("complete_table_invest").rows.item(++i%tb.rows.length).bgColor="#FF0000";   
			document.getElementById("show").value=document.getElementById("complete_table_invest").rows.item(i%tb.rows.length).innerHTML;   
        }
	};
</script>