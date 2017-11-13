<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>QueryPdo</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Baxster Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- chart -->
<script src="js/Chart.js"></script>
<!-- //chart -->
<!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<!--webfonts-->
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic'
	rel='stylesheet' type='text/css'>

<!--//webfonts-->
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css"
	media="all">
<script src="js/wow.min.js"></script>
<script>
	new WOW().init();
</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>

<link href="css/custom.css" rel="stylesheet">

<script>
	function queryPdoUrl() {

		var startDate = document.getElementById("startDate");

		var endDate = document.getElementById("endDate");
		var maxSpend = document.getElementById("maxSpend");
		var minSpend = document.getElementById("minSpend");
		var placeIn = document.getElementById("place");
// 		IF (STARTDATE.VALUE != "")
// 		{
// 			 VAR RESULT = STARTDATE.VALUE.TRIM().MATCH(/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))$/);
// 		        IF(RESULT == NULL){
// 		            RETURN FALSE;
			
			
// 		}
// 		IF (ENDDATE.VALUE != "")
// 		{
// 			 VAR RESULT = ENDDATE.VALUE.TRIM().MATCH(/^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))$/);
// 		        IF(RESULT == NULL){
// 		            RETURN FALSE;
			
			
			
// 		}
// 		IF (MAXSPEND.VALUE != "")
// 		{
// 			 VAR RESULT = MAXSPEND.VALUE>=0 && MAXSPEND.VALUE<=100000000000  ;
// 		        IF(RESULT == NULL){
// 		            RETURN FALSE;
			
			
			
// 		}
// 		IF (MINSPEND.VALUE != "")
// 		{
// 			 VAR RESULT = MAXSPEND.VALUE>=0 && MAXSPEND.VALUE<=100000000000  ;
// 		        IF(RESULT == NULL){
// 		            RETURN FALSE;

// 		}

		
		
		
		
		if (startDate.value == "") {
			startDate.value = "0000-00-00";
		}

		if (endDate.value == "") {
			endDate.value = "3000-00-00";
		}
		if (minSpend.value == "") {
			minSpend.value = "0";
		}
		if (maxSpend.value == "") {
			maxSpend.value = "100000";
		}
		if (placeIn.value == "") {
			placeIn.value = "noPlaceInput";
		}

		document.getElementById("queryForm").submit();
		return true;
	}
</script>



$.validator.addMethod("isPositive",date()
<font color='#E47068'>请输入XXXX-XX-XX形式的日期</font>");


<!--//Metis Menu -->
</head>
<body class="cbp-spmenu-push">
	<div class="main-content">
		<!--left-fixed -navigation-->
		<div class="sidebar" role="navigation">
			<div class="navbar-collapse">
				<nav
					class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right dev-page-sidebar mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar"
					id="cbp-spmenu-s1">
					<div class="scrollbar scrollbar1">
						<ul class="nav" id="side-menu">
							<li><s:form name="backToHomepage" action="actionShowAll">
									<input type="hidden" name="userId"
										value='<s:property value = "userId"/>' />
								</s:form> <a href="javascript:document:backToHomepage.submit();"><i
									class="fa fa-home nav_icon"></i>个人主页</a></li>

							<li><s:form name="jumpQuery" action="actionJumpQuery">
									<input type="hidden" name="userId"
										value='<s:property value = "userId"/>' />
								</s:form> <a href="javascript:document:jumpQuery.submit();"><i
									class="fa fa-book nav_icon"></i>查询数据 </a> <!-- /nav-second-level -->
							</li>


							<li><s:form name="jumpAdd" action="actionJumpAdd">
									<input type="hidden" name="userId"
										value='<s:property value = "userId"/>' />
								</s:form> <a href="javascript:document:jumpAdd.submit();"><i
									class="fa fa-th-large nav_icon"></i>添加pdo对象</a></li>
							<li><a onclick='addRelation()'><i
									class="fa fa-th-large nav_icon"></i>添加数据关联</a></li>

							<li><a href="login.jsp"><i
									class="fa fa-th-large nav_icon"></i>logout</a></li>


							<li><a href="#" class="chart-nav"><i
									class="fa fa-bar-chart nav_icon"></i>Extras<span
									class="fa arrow"></span></a>
								<ul class="nav nav-second-level collapse">
									<li><a href="" class="chart-nav"><i
											class="fa fa-bar-chart nav_icon"></i>统计个人数据信息</a></li>
									<li><a href="" class="chart-nav"><i
											class="fa fa-location-arrow nav_icon"></i>地图选点</a></li>
								</ul> <!-- //nav-second-level --></li>
						</ul>
					</div>
					<!-- //sidebar-collapse -->
				</nav>
			</div>
		</div>
		<!--left-fixed -navigation-->
		<!-- header-starts -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--logo -->
				<div class="logo">
					<a href="index.html">
						<ul>
							<li><img src="images/logo1.png" alt="" /></li>
							<li>
								<h1>HITmoonflower</h1>
							</li>
							<div class="clearfix"></div>
						</ul>
					</a>
				</div>
				<!--//logo-->

			</div>

			<div class="header-right">
				<!--notification menu end -->
				<div class="profile_details">
					<ul>
						<li class="dropdown profile_details_drop"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false">
								<div class="profile_img">
									<span class="prfil-img"><img src="images/user.png"
										alt=""> </span>
									<div class="clearfix"></div>
								</div>
						</a>
							<ul class="dropdown-menu drp-mnu">

								<li><a href="login.jsp"><i class="fa fa-sign-out"></i>
										Logout</a></li>
							</ul></li>
					</ul>
				</div>
				<!--toggle button start-->
				<button id="showLeftPush">
					<i class="fa fa-bars"></i>
				</button>
				<!--toggle button end-->
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- //header-ends -->
		<!-- main content start-->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
				<!--grids-->
				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>查询pdo数据</h2>
					</div>








					<div class="container">
						<div class="row clearfix">
							<div class="col-md-2 column"></div>
							<div class="col-md-8 column">
								<s:form action="actionQueryPdo" Class="form-horizontal"
									theme="simple" id="queryForm" data-toggle="validator"
									role="form">

									<input type="hidden" name="userId"
										value='<s:property value = "userId"/>' />


									<div class="form-group">
										<label for="inputPassword" class="control-label">Date</label>
										<div class="form-inline row">
											<div class="form-group col-sm-6">

												<input type="text" name="info.startDate"
													class="form-control" data-error="请输入形如xxxx-xx-xx的合法日期"
													pattern="^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))"
													date() id="startDate" />
												<div class="help-block">请输入形如xxxx-xx-xx的合法日期</div>

											</div>
											<div class="form-group col-sm-6">
												<input type="text" name="info.endDate" class="form-control"
													data-error="请输入形如xxxx-xx-xx的合法日期"
													pattern="^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))"
													date() id="endDate" />

											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword" class="control-label">Spend</label>
										<div class="form-inline row">
											<div class="form-group col-sm-6">
												<input type="number" min=0 max=100000000000000
													name="info.minSpend" Class="form-control" id="minSpend" />


												<div class="help-block">必须是正整数!</div>
											</div>
											<div class="form-group col-sm-6">
												<input type="number" min=0 max=100000000000000
													name="info.maxSpend" Class="form-control" id="maxSpend" />


												<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>



									<div class="form-group">
										<label for="inputEmail" class="control-label">place</label> <input
											type="text" maxlength="20" name="info.place"
											Class="form-control" id="place" />


										<div class="help-block with-errors"></div>
										<div class="help-block">最大长度是20!</div>
									</div>

									<div class="form-group">

										<center>
											<button type="submit"
												class="btn  btn-lg btn-primary  hvr-shutter-out-vertical"
												onsubmit="  queryPdoUrl()">queryPdo</button>
										</center>
										
										<!--onsubmit 显示正常,但是存在的问题是无法查询数据
										onclick可以正确的查询数据但是无法拦截用户的错误查询  -->
									</div>
								</s:form>

							</div>
							<div class="col-md-2 column"></div>
						</div>
					</div>



				</div>
				<!--//grids-->

			</div>
		</div>
		<!--footer-->
		<div class="dev-page">

			<!-- page footer -->
			<!-- dev-page-footer-closed dev-page-footer-fixed -->
			<div class="dev-page-footer dev-page-footer-fixed">
				<!-- container -->
				<div class="container">
					<div class="copyright">
						<p>Copyright &copy; 2017.HITmoonflower All rights reserved.</p>
					</div>
					<!-- page footer buttons -->


				</div>
				<!-- //container -->
			</div>
			<!-- /page footer -->
		</div>
		<!-- Classie -->
		<script src="js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById('cbp-spmenu-s1'), showLeftPush = document
					.getElementById('showLeftPush'), body = document.body;

			showLeftPush.onclick = function() {
				classie.toggle(this, 'active');
				classie.toggle(body, 'cbp-spmenu-push-toright');
				classie.toggle(menuLeft, 'cbp-spmenu-open');
				disableOther('showLeftPush');
			};

			function disableOther(button) {
				if (button !== 'showLeftPush') {
					classie.toggle(showLeftPush, 'disabled');
				}
			}
		</script>
		<!-- Bootstrap Core JavaScript -->

		<script type="text/javascript" src="js/bootstrap.min.js"></script>

		<script type="text/javascript" src="js/dev-loaders.js"></script>
		<script type="text/javascript" src="js/dev-layout-default.js"></script>
		<script type="text/javascript" src="js/jquery.marquee.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet">

		<script type="text/javascript" src="js/jquery.jqcandlestick.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/jqcandlestick.css" />

		<!--max-plugin-->
		<script type="text/javascript" src="js/plugins.js"></script>
		<!--//max-plugin-->

		<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
</body>
</html>