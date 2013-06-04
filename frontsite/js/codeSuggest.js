/**
 * <ul>
 * <li>功能:股票的下拉提示</li>
 * <li>作者：李广猛 </li>
 * <li>E-MAIL:ligm@cssweb.com.cn</li>
 * </ul>
 */
var req;
function StockSuggest(bashPath) {

	this.bashPath = bashPath ? bashPath : '';

	this.inputField = null;

	this.stockContainer = null;

	this.pageNo = 1;

	this.item = 0;

	this.lastEl = null;

	this.inputId = '';

	this.baseContainer = null;

	this.popContainer = null;

	this.popDiv = null;

	this.stockCode = null;

	this.stockType = null;

	this.form = null;

	this.initContiner = function() {
		this.getStockContainer();
	}
	this.setInputId = function(id) {
		this.inputId = id;
	}
	this.getInputId = function() {
		return this.inputId;
	}
	this.regist = function(el) {
		this.inputField = el;
		if (el != null && el != undefined) {
			this.registEvent();
		}
	}
	this.registForm = function(formName) {
		this.form = document.forms[formName];
	}
	this.registById = function(elId) {
		this.setInputId(elId);
		var el = document.getElementById(elId);
		this.regist(el);
	}
	this.registEvent = function() {
		var scop = this;
		if (this.inputField == null || this.inputField == undefined) {
			alert("请选择绑定到元素!");
			return;
		}
		this.inputField.onfocus = function() {

		}
		this.inputField.onkeyup = function(eventTag) {
			var event = eventTag || window.event;
			var currentKey = event.charCode || event.keyCode;
			scop.getSuggestList(event);
		}
		// this.initContiner();
		// 注册事件
	}

	this.init = function() {
		this.item = 0;
		this.pageNo = 1;
		this.lastEl = null;
	}
	this.getInput = function() {
		if (this.inputField == null || this.inputField == undefined) {
			if (this.getInputId() == '') {
				alert("请选择绑定到元素!");
				return;
			} else {
				this.inputField = document.getElementById(this.getInputId());
			}
		}
		return this.inputField;
	}
	this.getSuggestList = function(evt) {
		var event = evt || window.event;
		var currentKey = event.charCode || event.keyCode;
		var scop = this;
		var menuItems = scop.getStockContainer().childNodes;
		if (currentKey == 40 || currentKey == 38) {// 上下键选择
			if (currentKey == 40) {
				if (scop.item < menuItems.length - 1) {
					scop.item++;
				} else {
					return;
				}
			} else if (currentKey == 38) {
				if (scop.item > 1) {
					scop.item--;
				} else {
					return;
				}
			}
			if (scop.lastEl != null) {
				scop.lastEl.onmouseout();
			}
			menuItems[scop.item].onmouseover();
			scop.lastEl = menuItems[scop.item];
			return;
		} else if (currentKey == 37 || event.keyCode == 39) {
			if (menuItems.length > 0)
				menuItems[scop.item].onmouseover();
		} else if (currentKey == 13) {
			scop.submit();
		} else {
			this.item = 0;
			this.popDiv.style.display = "";
			var stockCode = this.getInput().value;
			if (stockCode.length > 0) {
				this.connect(stockCode, scop.pageNo);
			}
		}
	}
	this.setValues=function(obj){
		var nodes = obj.childNodes;
		this.stockCode.value = nodes[0].innerHTML;
		this.typeField.value = nodes[3].innerHTML;
	}
	this.submit = function(obj) {
		if (obj == undefined || obj == null) {
			var menuItems = this.getStockContainer().childNodes;
			var curEl = menuItems[this.item];
			var tds = curEl.childNodes;
				this.getInput().value = tds[0].innerHTML + ' ' + tds[1].innerHTML;
				this.popDiv.style.display = "none";
			if (this.stockCode != null && this.typeField != null) {
				this.stockCode.value = tds[0].innerHTML;
				//this.typeField.value = tds[3].innerHTML;
			    this.typeField.value=encodeURIComponent(tds[3].innerHTML);
				if (this.form != null) {
					 this.form.submit();
				}
			}
		} else {
				var nodes = obj.childNodes;
				this.getInput().value = nodes[0].innerHTML + ' ' + nodes[1].innerHTML ;
				this.popDiv.style.display = "none";
			if (this.stockCode != null && this.typeField != null) {
				this.stockCode.value = nodes[0].innerHTML;
				this.typeField.value =encodeURIComponent(nodes[3].innerHTML);
				if (this.form != null) {
					 this.form.submit();
				}
			}
		}

	}
	this.connect = function(stockCode, pageNo) {
		var scop = this;
		if (req == null) {
			req = createRequest();
		}
		var url = scop.bashPath + "/f10.do?method=searchBondAndFundAndStockList&inputCode=" + encodeURIComponent(stockCode) + "&pageNo" + scop.pageNo;
		req.open("GET", url, true);
		req.onreadystatechange = function() {
			if (req.readyState == 4) { // 判断对象状态
				if (req.status == 200) { // 信息已经成功返回，开始处理信息
					 scop.build(req.responseXML.getElementsByTagName("result"));
				} else { // 页面不正常
					window.alert("您所请求的页面有异常。");
				}
			}
		}
		req.send(null);
	}
	this.clear = function() {
		var scop = this;
		if (this.baseContainer != null) {
			var menuItems = scop.getStockContainer().childNodes;
			for (var i = menuItems.length - 1; i >= 0; i--) {
				scop.getStockContainer().removeChild(menuItems[i]);
			}
		}
	}
	this.getStockContainer = function() {
		var parentNode = this.getInput().parentNode;
		var popDiv = document.getElementById("popup");
		if (popDiv == null || popDiv == undefined) {
			popDiv = document.createElement("div");
			popDiv.setAttribute('id', 'popup');
			popDiv.style.cssText = "position:absolute;z-index:100111; width:300px";
			var popChild = document.createElement("table");
			popChild.setAttribute("id", "complete_tablea");
			popChild.setAttribute("border", "0");
			popChild.setAttribute("cellspacing", "0");
			popChild.setAttribute("cellpadding", "0");
			popChild.style.cssText = "width:100%;border-left:1px solid #C1DAD7;border-top:1px solid #C1DAD7;border-bottom:1px solid #C1DAD7;border-right:1px solid #C1DAD7";
			var continer = document.createElement("tbody");
			continer.setAttribute("id", "complete_bodya");
			popChild.appendChild(continer);
			popDiv.appendChild(popChild);
			parentNode.appendChild(popDiv);
			this.popContainer = parentNode;
			this.popDiv = popDiv;
			this.baseContainer = popChild;
			
		} else {
			this.popDiv = document.getElementById("popup");
			this.popContainer = popDiv.parentNode;
			this.baseContainer = document.getElementById("complete_tablea");
			this.stockContainer = document.getElementById("complete_bodya");
		}
		if (this.form != null) {
				if (this.form.gpdm == undefined) {
					var gpdmField = document.createElement("input");
					gpdmField.setAttribute("type", "hidden");
					gpdmField.setAttribute("id", "gpdm");
					gpdmField.setAttribute("name", "gpdm");
					this.stockCode = gpdmField;
					var typeField = document.createElement("input");
					typeField.setAttribute("type", "hidden");
					typeField.setAttribute("id", "type");
					typeField.setAttribute("name", "type");
					this.typeField = typeField;
					this.form.appendChild(gpdmField);
					this.form.appendChild(typeField);
				}
			}
		return this.stockContainer;
	}
	this.build = function(result) {
		var scop = this;
		this.clear();
		var row, cell, txtNode;
		 scop.setOffsets();
		row = document.createElement("tr");
		row.bgColor = "#ffffff";
		cell = document.createElement("th");
		cell1 = document.createElement("th");
		cell2 = document.createElement("th");
		cell3 = document.createElement("th");
		cell.innerHTML = "代码";
		row.appendChild(cell);
		cell1.innerHTML = "简称";
		row.appendChild(cell1);
		cell2.innerHTML = "拼音";
		row.appendChild(cell2);
		cell3.innerHTML = "类型";
		row.appendChild(cell3);
		this.getStockContainer().appendChild(row);
		for (var i = 0; i < result.length; i++) {
			var nextNode = result[i].firstChild.data;
			row = document.createElement("tr");
			row.style.backgroundColor = "#ffffff";
			row.id = "row" + i;
			row.onmouseout = function() {
				this.style.backgroundColor = "#ffffff";
			};
			row.onmouseover = function() {
				if(scop.lastEl!=null){
					scop.lastEl.onmouseout();
				}
				this.style.backgroundColor = "#fceab0";
			};
			row.onmousedown = function() {
				scop.submit(this);
			};

			cell = document.createElement("td");
			cell.id = "cell" + i;
			cell.style.borderRight = "1px solid #b8b4b6";
			cell.style.borderBottom = "1px solid #b8b4b6";
			cell.style.fontSize = "11px";
			cell.style.padding = "6px 6px 6px 12px";
			cell.style.color = "#4f6b72";

			cell1 = document.createElement("td");
			cell1.id = "cell1" + i;
			cell1.style.borderRight = "1px solid #b8b4b6";
			cell1.style.borderBottom = "1px solid #b8b4b6";
			cell1.style.fontSize = "11px";
			cell1.style.padding = "6px 6px 6px 12px";
			cell1.style.color = "#4f6b72";

			cell2 = document.createElement("td");
			cell2.id = "cell2" + i;
			cell2.style.borderRight = "1px solid #b8b4b6";
			cell2.style.borderBottom = "1px solid #b8b4b6";
			// cell2.style.background="#F5FAFA";
			cell2.style.fontSize = "11px";
			cell2.style.padding = "6px 6px 6px 12px";
			cell2.style.color = "#4f6b72";

			cell3 = document.createElement("td");
			cell3.id = "cell3" + i;
			cell3.style.borderRight = "1px solid #b8b4b6";
			cell3.style.borderBottom = "1px solid #b8b4b6";
			// cell3.style.background="#F5FAFA";
			cell3.style.fontSize = "11px";
			cell3.style.padding = "6px 6px 6px 12px";
			cell3.style.color = "#4f6b72";

			txtNode = document.createTextNode(nextNode);
			cell.innerHTML = txtNode.nodeValue.split(" ")[0];
			row.appendChild(cell);

			txtNode = document.createTextNode(nextNode);
			cell1.innerHTML = txtNode.nodeValue.split(" ")[6];
			row.appendChild(cell1);

			txtNode = document.createTextNode(nextNode);
			cell2.innerHTML = txtNode.nodeValue.split(" ")[12];
			row.appendChild(cell2);

			txtNode = document.createTextNode(nextNode);
			cell3.innerHTML = txtNode.nodeValue.split(" ")[18];
			row.appendChild(cell3);

			this.getStockContainer().appendChild(row);
		}
		var menuItems = this.getStockContainer().childNodes;
		if(menuItems.length>1){
				scop.lastEl=menuItems[1];
				scop.setValues(menuItems[1]);
				scop.item=1;
				menuItems[1].onmouseover();	
			}
	}
	this.setOffsets = function() {
		this.popContainer.style.width = "120px";
		var left = this.calculateOffset(this.getInput(), "offsetLeft") - 180;
		var top = this.calculateOffset(this.getInput(), "offsetTop") + this.getInput().offsetHeight + 5;
		this.popDiv.style.border = "black 1px solid";
		this.popDiv.style.left = left + 20 + "px";
		this.popDiv.style.top = top + "px";
	}
	// 计算显示位置
	this.calculateOffset = function(field, attr) {
		var offset = 0;
		while (field) {
			offset += field[attr];
			field = field.offsetParent;
		}
		return offset;
	}
}
var createRequest = function() {
	var req;
	if (window.XMLHttpRequest) { // Mozilla 浏览器
		req = new XMLHttpRequest();
	} else if (window.ActiveXObject) { // IE浏览器
		try {
			req = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				alert('创建AJAX请求错误!');
				return;
			}
		}
	}
	return req;
}
var input = document.getElementById("stockInput");
