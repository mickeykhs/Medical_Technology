<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<!-- 구글 차트 호출을 위한 js 파일 라이브러리 임포트 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>


<div>
	<div class="row row-cols-4">
		<div class="col-md-6 col-sm-6 col-sm-6" style="height: 800px;">
			<div class="card card-success" id="chart_div1" style="width: 755px;">
			</div>
		</div>
		<div class="col-md-6 col-sm-6 col-sm-6">
			<div class="card card-success" id="chart_div2" style="width: 755px;"></div>
		</div>
	</div>
	
</div>

<script type="text/javascript">
	$(function() {
		// 구글 차트 라이브러리 로딩(메모리에 올림)
		google.load("visualization", "1", {
			"packages" : [ "corechart" ]
		});
		google.setOnLoadCallback(drawChart1);
		google.setOnLoadCallback(drawChart2);
		// responsetext : json 데이터를 텍스트로 읽어들임. console.log로 볼 수 있음

		function drawChart1() {
			let jsonData = $.ajax({
				url : "/medical/chart01",
				dataType : "json",
				async : false
			}).responseText;
			console.log("jsonData : " + jsonData);

			// 데이터 테이블 생성
			let data = new google.visualization.DataTable(jsonData);
			// 차트를 출력할 div 선택(PieChart, LineChart, ColumnChart)
			let chart = new google.visualization.LineChart(document
					.getElementById("chart_div1"));

			var options = {
				title : "2022년 월별 매출금액 합계",
				curveType : "function",
				width : 750,
				height : 600,
				hAxis : {
					title : '가로축',
					textStyle : {
						color : '#FFF'
					}
				},
				titleTextStyle : {
					color : 'white' // 타이틀 색
				},
				vAxis : {
					title : '세로축',
					textStyle : {
						color : '#FFF'
					}
				},
				series : { // 선색
					0 : {
						color : '#3596F7'
					},
					1 : {
						color : '#3596F7'
					}
				},
				legend : { // 항목
					textStyle : {
						fontSize : 14,
						color : 'white'
					}
				},

				backgroundColor : {
					fill : '#15243E',
				}

			};

			// 차트객체(chart).draw(데이터테이블(data), 옵션)
			chart.draw(data, options);
		}

		function drawChart2() {
			let jsonData = $.ajax({
				url : "/medical/chart02",
				dataType : "json",
				async : false
			}).responseText;
			console.log("jsonData : " + jsonData);

			// 데이터 테이블 생성
			let data = new google.visualization.DataTable(jsonData);
			// 차트를 출력할 div 선택(PieChart, LineChart, ColumnChart)
			let chart = new google.visualization.AreaChart(document
					.getElementById("chart_div2"));

			var options = {
				title : "2022년 월별 환자 수 ",
				curveType : "function",
				width : 750,
				height : 600,
				hAxis : {
					title : '가로축',
					textStyle : {
						color : '#FFF'
					}
				},
				titleTextStyle : {
					color : 'white' // 타이틀 색
				},
				vAxis : {
					title : '세로축',
					textStyle : {
						color : '#FFF'
					}
				},
				series : { // 선색
					0 : {
						color : '#3596F7'
					},
					1 : {
						color : '#3596F7'
					}
				},
				legend : { // 항목
					textStyle : {
						fontSize : 14,
						color : 'white'
					}
				},

				backgroundColor : {
					fill : '#15243E',
				}

			};

			// 차트객체(chart).draw(데이터테이블(data), 옵션)
			chart.draw(data, options);
		}
		

	});
</script>

<!-- <div id="chart_div"></div> -->


