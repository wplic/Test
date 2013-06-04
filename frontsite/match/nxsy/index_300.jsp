
<%@page import="com.cssweb.highStock.util.HighStockUtil"%><html>
    <head>
        <title>沪深300走势指数</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <script type="text/javascript" src="./js/jquery.min.js"></script>
        <script type="text/javascript" src="./js/json2.js"></script>
        <script src="./js/highstock/highstock.js"></script>
        <!-- 源数据 -->
        <%
        	String width = request.getParameter("width");
        	String height = request.getParameter("height");
        	if(width==null || "".equals(width) || !HighStockUtil.isNum(width)){
        		width=580+"";
        	}
        	if(height==null || "".equals(height) || !HighStockUtil.isNum(height)){
        		height=290+"";
        	}
        	request.setAttribute("width",width);
        	request.setAttribute("height",height);
        %>
        <script type="text/javascript">
       var json_data;//数据源
       var close_price=0;//昨日净值
       var tickPositions=[];//y轴刻度
         $(function(){
         		//getYPoints(6000,4000,6600.999);
        	 	initData();
        	 });
       	 function initData(){
       	    tickPositions=[];
	        $.ajax({
	           url: "${contextPath }/highStock/service/HighStockHS300Domian.go?function=InitData",
	           type: "post",
	           contentType:"application/json",
	           dataType: "json",
	           // cache: false,.responseText
	           complete: function(data) {
	              //alert(typeof(data));
	           	  //alert(JSON.stringify(data));
	              //eval("json_data=" + data.responseText + ";");
	              try{
	              	json_data = JSON.parse(data.responseText);
	              	$.ajax({
			           url: "${contextPath }/highStock/service/HighStockHS300Domian.go?function=GetClose_price",
			           type: "post",
			           contentType:"application/json",
			           dataType: "json",
			           complete: function(data) {
			           	if(data.responseText!="" && data.responseText!=null){
			           	 var jsondate = JSON.parse(data.responseText);
			           	 close_price = jsondate.close_price;//昨日收盘价
			           	 close_price = new Number(close_price).toFixed(2);
			           	 }
			           	 //json_data = [[1363742100000,null],[1363742160000,null],[1363742220000,null],[1363742280000,null],[1363742340000,null],[1363742400000,null],[1363742460000,null],[1363742520000,null],[1363742580000,null],[1363742640000,null],[1363742700000,null],[1363742760000,null],[1363742820000,null],[1363742880000,null],[1363742940000,null],[1363743000000,null],[1363743060000,null],[1363743120000,null],[1363743180000,null],[1363743240000,null],[1363743300000,null],[1363743360000,null],[1363743420000,null],[1363743480000,null],[1363743540000,null],[1363743600000,null],[1363743660000,2550.595],[1363743720000,2547.58],[1363743780000,2541.753],[1363743840000,2536.973],[1363743900000,2537.927],[1363743960000,2537.854],[1363744020000,2539.639],[1363744080000,2539.811],[1363744140000,2540.005],[1363744200000,2541.308],[1363744260000,2541.872],[1363744320000,2545.545],[1363744380000,2556.378],[1363744440000,2556.439],[1363744500000,2556.71],[1363744560000,2555.577],[1363744620000,2555.303],[1363744680000,2554.402],[1363744740000,2557.319],[1363744800000,2563.238],[1363744860000,2566.239],[1363744920000,2566.723],[1363744980000,2566.615],[1363745040000,2565.271],[1363745100000,2564.026],[1363745160000,2559.032],[1363745220000,2557.656],[1363745280000,2557.071],[1363745340000,2558.118],[1363745400000,2558.118],[1363745460000,2558.768],[1363745520000,2558.339],[1363745580000,2557.775],[1363745640000,2556.276],[1363745700000,2555.71],[1363745760000,2569.013],[1363745820000,2569.479],[1363745880000,2562.267],[1363745940000,2561.884],[1363746000000,2561.613],[1363746060000,2556.809],[1363746120000,2558.828],[1363746180000,2559.424],[1363746240000,2560.114],[1363746300000,null],[1363746360000,null],[1363746420000,null],[1363746480000,null],[1363746540000,null],[1363746600000,null],[1363746660000,null],[1363746720000,null],[1363746780000,null],[1363746840000,null],[1363746900000,null],[1363746960000,null],[1363747020000,null],[1363747080000,null],[1363747140000,null],[1363747200000,null],[1363747260000,null],[1363747320000,null],[1363747380000,null],[1363747440000,null],[1363747500000,null],[1363747560000,null],[1363747620000,null],[1363747680000,null],[1363747740000,null],[1363747800000,null],[1363747860000,null],[1363747920000,null],[1363747980000,null],[1363748040000,null],[1363748100000,null],[1363748160000,null],[1363748220000,null],[1363748280000,null],[1363748340000,null],[1363748400000,null],[1363748460000,null],[1363748520000,null],[1363748580000,null],[1363748640000,null],[1363748700000,null],[1363748760000,null],[1363748820000,null],[1363748880000,null],[1363748940000,null],[1363749000000,null],[1363749060000,null],[1363749120000,null],[1363749180000,null],[1363749240000,null],[1363749300000,null],[1363749360000,null],[1363749420000,null],[1363749480000,null],[1363749540000,null],[1363749600000,null],[1363749660000,null],[1363749720000,null],[1363749780000,null],[1363749840000,null],[1363749900000,null],[1363749960000,null],[1363750020000,null],[1363750080000,null],[1363750140000,null],[1363750200000,null],[1363755600000,null],[1363755660000,null],[1363755720000,null],[1363755780000,null],[1363755840000,null],[1363755900000,null],[1363755960000,null],[1363756020000,null],[1363756080000,null],[1363756140000,null],[1363756200000,null],[1363756260000,null],[1363756320000,null],[1363756380000,null],[1363756440000,null],[1363756500000,null],[1363756560000,null],[1363756620000,null],[1363756680000,null],[1363756740000,null],[1363756800000,null],[1363756860000,null],[1363756920000,null],[1363756980000,null],[1363757040000,null],[1363757100000,null],[1363757160000,null],[1363757220000,null],[1363757280000,null],[1363757340000,null],[1363757400000,null],[1363757460000,null],[1363757520000,null],[1363757580000,null],[1363757640000,null],[1363757700000,null],[1363757760000,null],[1363757820000,null],[1363757880000,null],[1363757940000,null],[1363758000000,null],[1363758060000,null],[1363758120000,null],[1363758180000,null],[1363758240000,null],[1363758300000,null],[1363758360000,null],[1363758420000,null],[1363758480000,null],[1363758540000,null],[1363758600000,null],[1363758660000,null],[1363758720000,null],[1363758780000,null],[1363758840000,null],[1363758900000,null],[1363758960000,null],[1363759020000,null],[1363759080000,null],[1363759140000,null],[1363759200000,null],[1363759260000,null],[1363759320000,null],[1363759380000,null],[1363759440000,null],[1363759500000,null],[1363759560000,null],[1363759620000,null],[1363759680000,null],[1363759740000,null],[1363759800000,null],[1363759860000,null],[1363759920000,null],[1363759980000,null],[1363760040000,null],[1363760100000,null],[1363760160000,null],[1363760220000,null],[1363760280000,null],[1363760340000,null],[1363760400000,null],[1363760460000,null],[1363760520000,null],[1363760580000,null],[1363760640000,null],[1363760700000,null],[1363760760000,null],[1363760820000,null],[1363760880000,null],[1363760940000,null],[1363761000000,null],[1363761060000,null],[1363761120000,null],[1363761180000,null],[1363761240000,null],[1363761300000,null],[1363761360000,null],[1363761420000,null],[1363761480000,null],[1363761540000,null],[1363761600000,null],[1363761660000,null],[1363761720000,null],[1363761780000,null],[1363761840000,null],[1363761900000,null],[1363761960000,null],[1363762020000,null],[1363762080000,null],[1363762140000,null],[1363762200000,null],[1363762260000,null],[1363762320000,null],[1363762380000,null],[1363762440000,null],[1363762500000,null],[1363762560000,null],[1363762620000,null],[1363762680000,null],[1363762740000,null],[1363762800000,null]];
			           	 //json_data = [[1363742100000,null],[1363742160000,null],[1363742220000,null],[1363742280000,null],[1363742340000,null],[1363742400000,null],[1363742460000,null],[1363742520000,null],[1363742580000,null],[1363742640000,null],[1363742700000,null],[1363742760000,null],[1363742820000,null],[1363742880000,null],[1363742940000,null],[1363743000000,null],[1363743060000,null],[1363743120000,null],[1363743180000,null],[1363743240000,null],[1363743300000,null],[1363743360000,null],[1363743420000,null],[1363743480000,null],[1363743540000,null],[1363743600000,null],[1363743660000,2550.407],[1363743720000,2547.58],[1363743780000,2547.765],[1363743840000,2537.82],[1363743900000,2537.927],[1363743960000,2537.854],[1363744020000,2539.639],[1363744080000,2539.811],[1363744140000,2540.017],[1363744200000,2541.308],[1363744260000,2541.872],[1363744320000,2545.545],[1363744380000,2556.46],[1363744440000,2556.439],[1363744500000,2556.71],[1363744560000,2555.577],[1363744620000,2555.303],[1363744680000,2554.967],[1363744740000,2557.319],[1363744800000,2557.93],[1363744860000,2566.239],[1363744920000,2566.723],[1363744980000,2566.698],[1363745040000,2566.615],[1363745100000,2564.026],[1363745160000,2559.032],[1363745220000,2557.656],[1363745280000,2557.071],[1363745340000,2557.459],[1363745400000,2558.118],[1363745460000,2558.992],[1363745520000,2558.28],[1363745580000,2557.775],[1363745640000,2556.795],[1363745700000,2556.439],[1363745760000,2569.013],[1363745820000,2569.479],[1363745880000,2566.555],[1363745940000,2561.884],[1363746000000,2561.613],[1363746060000,2556.809],[1363746120000,2558.828],[1363746180000,2559.424],[1363746240000,2560.221],[1363746300000,2560.204],[1363746360000,2560.298],[1363746420000,2561.068],[1363746480000,2561.163],[1363746540000,2561.43],[1363746600000,2562.424],[1363746660000,2564.185],[1363746720000,2565.614],[1363746780000,2565.928],[1363746840000,2566.342],[1363746900000,2566.71],[1363746960000,2571.303],[1363747020000,2569.055],[1363747080000,2568.667],[1363747140000,2569.028],[1363747200000,2568.325],[1363747260000,2567.784],[1363747320000,2568.149],[1363747380000,2568.358],[1363747440000,2571.539],[1363747500000,2574.343],[1363747560000,2574.44],[1363747620000,2576.066],[1363747680000,2574.8],[1363747740000,2575.225],[1363747800000,2574.122],[1363747860000,2573.924],[1363747920000,2575.895],[1363747980000,2578.608],[1363748040000,2578.608],[1363748100000,2581.09],[1363748160000,2580.613],[1363748220000,2579.535],[1363748280000,null],[1363748340000,null],[1363748400000,null],[1363748460000,null],[1363748520000,null],[1363748580000,null],[1363748640000,null],[1363748700000,null],[1363748760000,null],[1363748820000,null],[1363748880000,null],[1363748940000,null],[1363749000000,null],[1363749060000,null],[1363749120000,null],[1363749180000,null],[1363749240000,null],[1363749300000,null],[1363749360000,null],[1363749420000,null],[1363749480000,null],[1363749540000,null],[1363749600000,null],[1363749660000,null],[1363749720000,null],[1363749780000,null],[1363749840000,null],[1363749900000,null],[1363749960000,null],[1363750020000,null],[1363750080000,null],[1363750140000,null],[1363750200000,null],[1363755600000,null],[1363755660000,null],[1363755720000,null],[1363755780000,null],[1363755840000,null],[1363755900000,null],[1363755960000,null],[1363756020000,null],[1363756080000,null],[1363756140000,null],[1363756200000,null],[1363756260000,null],[1363756320000,null],[1363756380000,null],[1363756440000,null],[1363756500000,null],[1363756560000,null],[1363756620000,null],[1363756680000,null],[1363756740000,null],[1363756800000,null],[1363756860000,null],[1363756920000,null],[1363756980000,null],[1363757040000,null],[1363757100000,null],[1363757160000,null],[1363757220000,null],[1363757280000,null],[1363757340000,null],[1363757400000,null],[1363757460000,null],[1363757520000,null],[1363757580000,null],[1363757640000,null],[1363757700000,null],[1363757760000,null],[1363757820000,null],[1363757880000,null],[1363757940000,null],[1363758000000,null],[1363758060000,null],[1363758120000,null],[1363758180000,null],[1363758240000,null],[1363758300000,null],[1363758360000,null],[1363758420000,null],[1363758480000,null],[1363758540000,null],[1363758600000,null],[1363758660000,null],[1363758720000,null],[1363758780000,null],[1363758840000,null],[1363758900000,null],[1363758960000,null],[1363759020000,null],[1363759080000,null],[1363759140000,null],[1363759200000,null],[1363759260000,null],[1363759320000,null],[1363759380000,null],[1363759440000,null],[1363759500000,null],[1363759560000,null],[1363759620000,null],[1363759680000,null],[1363759740000,null],[1363759800000,null],[1363759860000,null],[1363759920000,null],[1363759980000,null],[1363760040000,null],[1363760100000,null],[1363760160000,null],[1363760220000,null],[1363760280000,null],[1363760340000,null],[1363760400000,null],[1363760460000,null],[1363760520000,null],[1363760580000,null],[1363760640000,null],[1363760700000,null],[1363760760000,null],[1363760820000,null],[1363760880000,null],[1363760940000,null],[1363761000000,null],[1363761060000,null],[1363761120000,null],[1363761180000,null],[1363761240000,null],[1363761300000,null],[1363761360000,null],[1363761420000,null],[1363761480000,null],[1363761540000,null],[1363761600000,null],[1363761660000,null],[1363761720000,null],[1363761780000,null],[1363761840000,null],[1363761900000,null],[1363761960000,null],[1363762020000,null],[1363762080000,null],[1363762140000,null],[1363762200000,null],[1363762260000,null],[1363762320000,null],[1363762380000,null],[1363762440000,null],[1363762500000,null],[1363762560000,null],[1363762620000,null],[1363762680000,null],[1363762740000,null],[1363762800000,null]]
			           	 //close_price = 2525.10;
			           	 var dataMax = getMax(json_data);
			           	 var dataMin = getMin(json_data);
			           	 getYPoints(dataMax,dataMin,close_price);
			           	 initChart();
			           }
			         });
	              }catch(ex){
	              
	              }
	           },
	           error:function(mm){
			        // alert("message error");
			    }
	       });
       	 };
       	 
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
       	 function getMax(json_data){
       	 	var vMax=0;
       	 	for(var i=0;i<json_data.length;i++){
       	 		var v = json_data[i][1];
       	 		if(typeof(v)=='NaN'||typeof(v)=='nan'||v==null){
       	 			v = parseFloat(close_price);
       	 		}
       	 		if(parseFloat(v)>vMax)
       	 		  vMax=parseFloat(v);
       	 	}
       	 	//alert(vMax);
       	 	return vMax;
       	 }
       	 
       	 function getMin(json_data){
       	 	var vMin;
       	 	if(json_data!=null){
       	 		vMin = json_data[0][1];
       	 		if(typeof(vMin)=='NaN'||typeof(vMin)=='nan'||vMin==null){
       	 			vMin = parseFloat(close_price);
       	 		}
       	 	}
       	 	for(var i=0;i<json_data.length;i++){
       	 		var v = json_data[i][1];
       	 		if(typeof(v)=='NaN'||typeof(v)=='nan'||v==null){
       	 			v = parseFloat(close_price);
       	 		}
       	 		if(v<vMin)
       	 		  vMin=parseFloat(v);
       	 	}
       	 	return vMin;
       	 }
       	 
       	 /**
       	 *获取Y轴精度
       	 *@param dataMax 沪深300指数峰值
       	 *@param dataMin 沪深300指数最低值
       	 *@param close_price 昨日收盘价
       	 */
       	 function getYPoints(dataMax,dataMin,close_price){
       	 	var c=parseInt(new Number(close_price).toFixed(0));
       	 	var yValue=0;
       	 	var vMax =  Math.abs(c-dataMax);
       	 	var vMin =  Math.abs(c-dataMin);
       	 	
       	 	if(vMax>vMin){
       	 		yValue = vMax;
       	 	}else{
       	 		yValue = vMin;
       	 	}
       	 	tickPositions.push(parseInt(new Number(c-yValue).toFixed(0)));
       	 	tickPositions.push(parseInt(new Number(c-yValue/2).toFixed(0)));
       	 	tickPositions.push(parseInt(new Number(c).toFixed(0)));
       	 	tickPositions.push(parseInt(new Number(c+yValue/2).toFixed(0)));
       	 	tickPositions.push(parseInt(new Number(c+yValue).toFixed(0)));
       	 	//alert(tickPositions);
       	 }
       	 
       	 // 图表
            function initChart() {
                 Highcharts.setOptions({ 
				    global: { 
				        useUTC: false 
				    } 
				});
								
                var chart1 = new Highcharts.StockChart({
                    /**
					 * 图表配置
					 * 
					 * @param {string}
					 *            renderTo 图表加载的位置
					 * @param {int}
					 *            width 图表的宽度
					 * @param {int}
					 *            hight 图表的高度
					 */
                    chart: {
                        renderTo: 'container',
                        // 图表宽度
                        width: ${width},
                        // 图表高度
                        height: ${height},
                        marginTop: 0
                    },
                    
                    exporting:{
                        // 是否允许导出
                        enabled:false
                    },
        			 credits:{
                        enabled: true,
                        href: "http://www.gf.com.cn",
                        text: '广发证券'
                    },
                    rangeSelector: {
                        // 缩放选择按钮，是一个数组。
                        // 其中type可以是： 'millisecond', 'second', 'minute', 'day',
						// 'week', 'month', 'ytd' (year to date), 'year' 和
						// 'all'。
                        // 其中count是指多少个单位type。
                        // 其中text是配置显示在按钮上的文字
                        // 是否允许input标签选框
                        inputEnabled: false,
                        // 禁用量程按钮组
                        enabled:false
                    },
                    
                    navigator: {
                  		// 禁用量程滚动条
                  		enabled:false	
                    },
                    /**
					 * 气泡示说明标签
					 * 
					 * @param {string}
					 *            xDateFormat 日期时间格式化
					 */
		            tooltip: {
		                enabled: true,
		                crosshairs: true,
		                shared:false,
		                //这里重写了气泡提示内容
		                formatter: function() {
		                    var header = "<b>"+formatDate(new Date(this.x))+"</b>";
		                    //涨幅
		                    var vs = new Number(new Number((new Number(this.point.y).toFixed(2)-close_price)).toFixed(2)/close_price*100).toFixed(2);
		                    //涨跌
		                    var vs_zd=new Number((new Number(this.point.y).toFixed(2)-close_price)).toFixed(2);
		                    //涨幅颜色 大于等于0均为红色，反之绿色
		                    var color = (vs>=0)?'red':'green';
		                    var color_zd = (vs_zd>=0)?'red':'green';
		                    var label = '<br/><span style="color:' + this.point.series.color + '">' + 
		                    			this.point.series.name +'：'+new Number(this.point.y).toFixed(2)+'</span> '+
		                    			'<br/><span style="color:' + this.point.series.color + '">' + '涨跌：</span><span style="color:'+color_zd+'">'+vs_zd+'</span>'+
		                    			'<br/><span style="color:' + this.point.series.color + '">' + '涨幅：</span><span style="color:'+color+'">'+vs+'%</span>';
		                    if (label != "") {
		                        return header + label;
		                    } else {
		                        return false;
		                    }
		                }
		            },
                    yAxis:{
                    	/*tickPositions:[new Number(close_price-20).toFixed(0),new Number(close_price-10).toFixed(0),
                    		new Number(close_price).toFixed(0),new Number(close_price+10).toFixed(0),
                    		new Number(close_price+20).toFixed(0)],*/
                    	tickPositions:tickPositions,
                    	plotLines: [{
				    		value: close_price,
				    		width: 3,
				    		color: 'silver',
				    		dashStyle: 'Solid',
				    		label: {
				    			text: close_price,
				    			align: 'right',
				    			style:{
				    				color:'red'
				    			},
				    			y: -5,
				    			x: 0
				    		}
				    	}]
                    },
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
                    
                    /**
					 * 数据源配置，本身是一个对象数组
					 * 
					 * @param {string}
					 *            name 数据序列的名称
					 * @param {array}
					 *            data 数据序列，是一个对象数组。data的结构：[[时间戳, 值], [时间戳, 值],
					 *            [时间戳, 值], ……]
					 */
                    series: [{
                            name: '指数',
                            type: 'area',
                            data: json_data,
							tooltip: {
								valueDecimals: 2
							},
                            fillColor : {
								linearGradient : {
									x1: 0, 
									y1: 0, 
									x2: 0, 
									y2: 1
								},
								stops : [[0, Highcharts.getOptions().colors[0]], [1, 'rgba(0,0,0,0)']]
							},
							threshold: null
                        }],
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
        </script>
    </head>
    <body>
        <div id="container"></div>
    </body>
</html>
