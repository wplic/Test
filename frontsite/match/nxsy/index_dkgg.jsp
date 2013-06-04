
<%@page import="com.cssweb.highStock.util.HighStockUtil"%><html>
    <head>
        <title>广发多空杠杆实盘转换比例走势</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <script type="text/javascript" src="./js/jquery.min.js"></script>
        <script type="text/javascript" src="./js/json2.js"></script>
        <script src="./js/highstock/highstock.js"></script>
        <%
        	String title = "";
        	String code = "878002";
        	String width = request.getParameter("width");
        	String height = request.getParameter("height");
        	code = request.getParameter("code")==null?code:request.getParameter("code");
        	if(width==null || "".equals(width) || !HighStockUtil.isNum(width)){
        		width=580+"";
        	}
        	if(height==null || "".equals(height) || !HighStockUtil.isNum(height)){
        		height=250+"";
        	}
        	if(!HighStockUtil.isNum(code)){
        		code="878002";//看涨份额
        	}
        	if(code.equals("878002")){
        		title="看涨份额";
        	}
        	if(code.equals("878003")){
        		title="看跌份额";
        	}
        	request.setAttribute("width",width);
        	request.setAttribute("height",height);
        	request.setAttribute("code",code);
        	request.setAttribute("title",title);
        %>
        <script type="text/javascript">
        var close_price;//昨日收盘转换比例
        var tickPositions=[];//y轴刻度
        var svs_close_price;//昨日收盘净值
       	$(function() {
       		$.ajax({
	           url: "${contextPath }/highStock/service/HighStock878002Domain.go?function=GetClose_price&code=${code}",
	           type: "post",
	           contentType:"application/json",
	           dataType: "json",
	           complete: function(data) {
		           if(data.responseText!="" && data.responseText!=null){
			           	 var jsondate = JSON.parse(data.responseText);
			           	 //alert(jsondate);
			           	 close_price = jsondate.close_price;//昨日收盘转换比例
			           	 svs_close_price = jsondate.svs_close_price;//昨日收盘净值
			           	 
			           	 //alert(close_price);
			           	 svs_close_price = new Number(svs_close_price).toFixed(3);
			           	 close_price = new Number(close_price).toFixed(3);
					 }
	           }
	         });
       		initData();
       	});//$ End	
			var seriesOptions = [],
				seriesCounter = 0,volume = [],
				names = ['实时转换比例','参考单位净值'],
				colors = Highcharts.getOptions().colors;
			var chart;
			function initData(){
				seriesOptions = [];
				seriesCounter = 0;
				tickPositions=[]
				$.each(names, function(i, name) {
				$.ajax({
		           url: "${contextPath }/highStock/service/HighStock878002Domain.go?function=InitData&code=${code}&name="+encodeURI(encodeURI(name)),
		           type: "post",
		           contentType:"application/json",
		           dataType: "json",
		           // cache: false,
		           complete: function(data) {
		              //eval("var json_data=" + data.responseText + ";");
		              if(data.responseText!=null){
			              var json_data = JSON.parse(data.responseText);
			              if(i==0){
			              	//如果转比例的第一个点是0，就把这个点的转换比例值设置为昨日收盘价
			              	//alert(json_data.length);
			              	for(var k=0;k<json_data.length;k++){
			              		var v = json_data[k];
								if(new Number(v[1]).toFixed(0)==0){
									json_data[k][1]=parseFloat(svs_close_price);
								}else{
									break;						
								}
			              	}
			              	//alert(json_data.length);
			              }
			              seriesOptions[i] = {
								name: name,
								data: json_data
							};
							seriesCounter++;
							if (seriesCounter == names.length) {
						         var dataMax = getMax(seriesOptions[1].data,seriesOptions[0].data);
	           	 				 var dataMin = getMin(seriesOptions[1].data,seriesOptions[0].data);
	           	 				 getYPoints(dataMax,dataMin);
					           	 //getYPoints_Mathabs(dataMax,dataMin,close_price);
					           	 createChart();
							}
						}
		           },
		           error:function(mm){
				        // alert("message error");
				    }
		       });//ajax End
			});//each End
			}
		$(document).ready(function () {
	        var time915 = getTimestamp("09:15:00");//当天9:15时间戳
			var time1500 = getTimestamp("15:00:00");//当天15:00时间戳
			var now = formatDateHHmmss(new Date());
			var nowLongTime = getTimestamp(now);//系统时间戳
			if(nowLongTime>=time915 && nowLongTime<=time1500){
	           setInterval("initData()",60000); //刷新间隔
	        }
	     });
	     function formatDateHHmmss(now) {
		　　var hour=now.getHours();
		　　var minute=now.getMinutes();
		　　var second=now.getSeconds();
		　　return hour+":"+minute+":00";
		}
			//格式日期
			function formatDate(now) {
	           var year=now.getFullYear();
			　　var month=now.getMonth()+1;
			　　var date=now.getDate();
			　　var hour=now.getHours();
			　　var minute=now.getMinutes();
				if(minute<10){
					minute = "0"+minute;
				}
			　　var second=now.getSeconds();
			　　return year+"年"+month+"月"+date+"日 "+hour+":"+minute+":00";
			}
			
		function getMax(json_data_jingzhi,json_data_bili){
       	 	var vMax=0;
       	 	for(var i=0;i<json_data_jingzhi.length;i++){
       	 		var v = json_data_jingzhi[i][1];
       	 		if(typeof(v)=='NaN'||typeof(v)=='nan'||v==null){
       	 			v = parseFloat(svs_close_price);
       	 		}
       	 		if(parseFloat(v)>vMax)
       	 		  vMax=parseFloat(v);
       	 	}
       	 	var vMax_bili=0;
       	 	for(var i=0;i<json_data_bili.length;i++){
       	 		var v_bili = json_data_bili[i][1];
       	 		if(typeof(v_bili)=='NaN'||typeof(v_bili)=='nan'||v_bili==null){
       	 			v_bili = parseFloat(svs_close_price);
       	 		}
       	 		if(parseFloat(v_bili)>vMax_bili)
       	 		  vMax_bili=parseFloat(v_bili);
       	 	}
       	 	return (vMax>vMax_bili)?vMax:vMax_bili;
       	 }
       	 
       	 function getMin(json_data_jingzhi,json_data_bili){
       	 	var vMin;
       	 	if(json_data_jingzhi!=null){
       	 		vMin = json_data_jingzhi[0][1];
       	 		if(typeof(vMin)=='NaN'||typeof(vMin)=='nan'||vMin==null){
       	 			vMin = parseFloat(svs_close_price);
       	 		}
       	 	}
       	 	for(var i=0;i<json_data_jingzhi.length;i++){
       	 		var v = json_data_jingzhi[i][1];
       	 		if(typeof(v)=='NaN'||typeof(v)=='nan'||v==null){
       	 			v = parseFloat(svs_close_price);
       	 		}
       	 		if(parseFloat(v)<vMin)
       	 		  vMin=parseFloat(v);
       	 	}
       	 	
       	 	var vMin_bili;
       	 	if(json_data_bili!=null){
       	 		vMin_bili = json_data_bili[0][1];
       	 		if(typeof(vMin_bili)=='NaN'||typeof(vMin_bili)=='nan'||vMin_bili==null){
       	 			vMin_bili = parseFloat(svs_close_price);
       	 		}
       	 	}
       	 	for(var i=0;i<json_data_bili.length;i++){
       	 		var v_bili = json_data_bili[i][1];
       	 		if(typeof(v_bili)=='NaN'||typeof(v_bili)=='nan'||v_bili==null){
       	 			v_bili = parseFloat(svs_close_price);
       	 		}
       	 		if(parseFloat(v_bili)<vMin)
       	 		  vMin_bili=parseFloat(v_bili);
       	 	}
       	 	return vMin>vMin_bili?vMin_bili:vMin;
       	 }
       	 function getYPoints(dataMax,dataMin){
       	 	var yMax = new Number(dataMax*(1+0.0005)).toFixed(3);
       	 	var yMin = new Number(dataMin*(1-0.0005)).toFixed(3);
       	 	var countYpoint = new Number((yMax-yMin)/3).toFixed(3);
       	 	var val=0;
       	 	tickPositions.push(new Number(parseFloat(yMin)-parseFloat(countYpoint)*2).toFixed(3));
       	 	tickPositions.push(new Number(parseFloat(yMin)-parseFloat(countYpoint)).toFixed(3));
       	 	tickPositions.push(yMin);
       	 	tickPositions.push(new Number(parseFloat(yMin)+parseFloat(countYpoint)).toFixed(3));
       	 	tickPositions.push(new Number(parseFloat(yMin)+parseFloat(countYpoint)+parseFloat(countYpoint)).toFixed(3));
       	 	tickPositions.push(yMax);
       	 	tickPositions.push(new Number(parseFloat(yMax)+parseFloat(countYpoint)).toFixed(3));
       	 	tickPositions.push(new Number(parseFloat(yMax)+parseFloat(countYpoint)*2).toFixed(3));
       	 }
       	 
       	 /**
       	 *获取Y轴精度
       	 *@param dataMax 沪深300指数峰值
       	 *@param dataMin 沪深300指数最低值
       	 *@param svs_close_price 昨日收盘价
       	 */
       	 function getYPoints_Mathabs(dataMax,dataMin,svs_close_price){
       	 	//alert(dataMax+","+dataMin+","+svs_close_price);
       	 	var yValue;
       	 	var vMax =  Math.abs(parseFloat(svs_close_price)-parseFloat(dataMax));
       	 	var vMin =  Math.abs(parseFloat(svs_close_price)-parseFloat(dataMin));
       	 	
       	 	if(vMax>vMin){
       	 		yValue = vMax;
       	 	}else{
       	 		yValue = vMin;
       	 	}
       	 	tickPositions.push(new Number(parseFloat(svs_close_price)-yValue).toFixed(3));
       	 	tickPositions.push(new Number(parseFloat(svs_close_price)-yValue/2).toFixed(3));
       	 	tickPositions.push(new Number(parseFloat(svs_close_price)).toFixed(3));
       	 	tickPositions.push(new Number(parseFloat(svs_close_price)+yValue/2).toFixed(3));
       	 	tickPositions.push(new Number(parseFloat(svs_close_price)+yValue).toFixed(3));
       	 	//alert(tickPositions);
       	 }
			
			//获取累计成交量
			function getLjCount(date){
				//alert(date);
				for(var i=0;i<volume.length;i++){
					var v = volume[i];
					if(date==v[0]){
						//alert(v[1]);
						return (typeof(v[1]) == "undefined")?0:v[1];
						//break;
					}
				}
			}
			
			function createChart() {
				Highcharts.setOptions({ 
				    global: { 
				        useUTC: false 
				    } 
				});
				chart = new Highcharts.StockChart({
				    chart: {
                        renderTo: 'container',
                        // 图表宽度
                        width: ${width},
                        // 图表高度
                        height: ${height}
                    },
                    title: {
                        text: '${title}',
                        margin:0,
                        y: 5.5,
                        style: {
			            	fontWeight: 'bold',
			            	fontSize: 15
			           }
                    },
                     credits:{
                        enabled: false,
                        href: "http://www.gf.com.cn",
                        text: '广发证券'
                    },
                    exporting:{
                        // 是否允许导出
                        enabled:false
                    },
				    rangeSelector: {
                        inputEnabled: false,
                        // 禁用量程按钮组
                        enabled:false
                    },
                    navigator: {
                  		// 禁用量程滚动条
                  		enabled:false	
                    },
				    //plotOptions: {
				    //	series: {
				    //		compare: 'percent'
				    //	}
				    //},
				    /**
					 * X轴坐标配置
					 * 
					 * @param {object}
					 *            dateTimeLabelFormats x轴日期时间格式化，不用修改直接使用
					 */
                    xAxis:{
                   		showEmpty:true,
                   		tickPositions:[getTimestamp("09:30:00"),getTimestamp("10:00:00"),getTimestamp("10:30:00"),
                   			getTimestamp("11:00:00"),getTimestamp("13:00:00"),getTimestamp("13:30:00"),
                   			getTimestamp("14:00:00"),getTimestamp("14:30:00"),getTimestamp("15:00:00")],
                   		labels: {							
                   			formatter: function() {		
                   			   return  Highcharts.dateFormat('%H:%M', this.value);	
                   		} },
                   		plotLines: [{
				    		value: getTimestamp("09:15:00"),
				    		width: 1,
				    		color: 'silver'
		    			},{
				    		value: getTimestamp("09:30:00"),
				    		width: 1,
				    		color: 'silver'
		    			},{
				    		value: getTimestamp("10:00:00"),
				    		width: 1,
				    		dashStyle: 'ShortDash',
				    		color: 'silver'
		    			},{
				    		value: getTimestamp("10:30:00"),
				    		width: 1,
				    		dashStyle: 'ShortDash',
				    		color: 'silver'
		    			},{
				    		value: getTimestamp("11:00:00"),
				    		width: 1,
				    		dashStyle: 'ShortDash',
				    		color: 'silver'
		    			},{
				    		value: getTimestamp("13:00:00"),
				    		width: 3,
				    		color: 'silver'
		    			},{
				    		value: getTimestamp("13:30:00"),
				    		width: 1,
				    		dashStyle: 'ShortDash',
				    		color: 'silver'
		    			},{
				    		value: getTimestamp("14:00:00"),
				    		width: 1,
				    		dashStyle: 'ShortDash',
				    		color: 'silver'
		    			},{
				    		value: getTimestamp("14:30:00"),
				    		width: 1,
				    		dashStyle: 'ShortDash',
				    		color: 'silver'
		    			},{
				    		value: getTimestamp("15:00:00"),
				    		width: 1,
				    		color: 'silver'
		    			}]
                    },
                    yAxis:{
                    	allowDecimals:true,
                    	min:0,
                    	//max:2,
                    	tickPositions:tickPositions,
                    	plotLines: [{
				    		value: svs_close_price,
				    		width: 3,
				    		color: 'silver',
				    		dashStyle: 'Solid',
				    		label: {
				    			text: svs_close_price,
				    			align: 'right',
				    			style:{
				    				color:'red'
				    			},
				    			y: -5,
				    			x: -5
				    		}
				    	}]
                    },
				    tooltip: {
				    	enabled: true,
				    	//这里约定气泡提示内容格式
		                /*xDateFormat: '%Y年%m月%d %H:%M:%S',
		                headerFormat: '<span style="font-weight: bold">{point.key}</span><br/>',
				    	pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b><br/>'
				    	*/
				    	formatter: function() {
		                    //var header = "<b>"+formatDate(new Date(this.x))+"</b>";
		                    var vs = new Number(new Number((new Number(this.points[0].point.y).toFixed(3)-close_price)).toFixed(3)/close_price*100).toFixed(2);
		                    //涨幅颜色 大于等于0均为红色，反之绿色
		                    var color = (vs>=0)?'red':'green';
		                    var s = '<b>'+ Highcharts.dateFormat('%Y年%m月%d日 %H:%M:%S', this.x) +'</b>';	  
			         		s += '<br/><span style="color:'+this.points[0].series.color+'">实时转换比例:'+ parseFloat(this.points[0].point.y).toFixed(3)+"    涨跌幅:</span><span style=\"color:"+color+"\">"+vs+"%</span>";	            		
			         		s += '<br/><span style="color:'+this.points[1].series.color+'">参考单位净值:'+ parseFloat(this.points[1].point.y).toFixed(4)+"</span>";	            		
			         		//s += '<br/><span style="color:green">累积成交量:'+ getLjCount(this.x)+"(份)</span>";	            
			         		return s;
		                }
				    },
				    legend: {
						enabled: true,
						verticalAlign: 'top',
						y: 10
					},
				    series: seriesOptions,
				    scrollbar:{
                    	enabled:false	
                    }
				});
			}
        function getTimestamp(t){
        	//var t = "09:30:00";
        	var now= new Date();
			var year=now.getFullYear();
			var month=now.getMonth()+1;
			var day=now.getDate();
			//var hour=now.getHours();
			//var minute=now.getMinutes();
			//var second=now.getSeconds();
			var datenowStr=year+"-"+month+"-"+day+" "+t;
			var str =datenowStr;
			var new_str = str.replace(/:/g,'-');
			new_str = new_str.replace(/ /g,'-');
			var arr = new_str.split("-");
			var datum = new Date(Date.UTC(arr[0],arr[1]-1,arr[2],arr[3]-8,arr[4],arr[5]));
			//var timestamp_ctime=datum.getTime()/1000;
        	//alert(timestamp_ctime);
        	//alert(new Date(timestamp_ctime));
        	//alert(new Date(datum.getTime()));
        	return datum.getTime();
        }
        </script>
    </head>
    <body>
        <div id="container" style="0px;margin-top: -8px;"></div>
    </body>
</html>
