<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Buttons</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Baxster Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<link rel="icon" href="favicon.ico" type="image/x-icon" >
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
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

<!--//webfonts--> 
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- Metis Menu -->

 <script>var i=3</script>
  <script>
  function getObj(id){
      return document.getElementById(id);
  }
  function addRow(){
      var tab=getObj("pdo");
      var row=tab.insertRow();
      row.className = "form-horizontal form-group ";
      row.style.thmem = "symple";
      var cell0=row.insertCell();
      var cell1=row.insertCell();
      var cell2=row.insertCell();
      temp = String(window.i);
      cell0.innerHTML='<input type="text"  id = "key'+temp+'">';
      cell0.className ="col-sm-4"; 
      cell1.innerHTML='<input type="text" name = "value'+temp+'" id = "value'+temp+'">';
      cell1.className ="col-sm-4";
      cell2.innerHTML='<input value="删除"type="button" class="btn btn-lg btn-primary  hvr-shutter-out-vertical" onclick="deleteRow(this)"/>';
      cell2.className ="col-sm-4"; 
      i++;
  }
  function deleteRow(obj){
      var row=obj.parentNode.parentNode;
      var tab=row.parentNode;
      tab.deleteRow(row.rowIndex);
      i--;
  }
  function getMap(){
	  // var date = document.getElementById("date");
	  //var spend = document.getElementById("spend");
	  //var place = document.getElementById("place");
	  //date.name = "infoMap.date";
	  //spend.name = "infoMap.spend";
	  //place.name = "infoMap.place";
	  for (var j = 3; j<window.i;j++){
		  var key = document.getElementById("key"+String(j));
		  var value = document.getElementById("value"+String(j));
		  value.name = "infoMap."+key.value;
	  }
	  var url = window.location.search;  
	  if (url.indexOf("?") != -1) {
	        var str = url.substr(1);
	        strs = str.split("=");
	        key = document.getElementById("Id");
	        key.value = strs[1];
	        document.getElementById("pdoForm").submit();
	    }
	  else{
	  alert("Error Happened")
	  }
  }
  </script>



<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
<link href="css/demo-page.css" rel="stylesheet" media="all">
<link href="css/hover.css" rel="stylesheet" media="all">
<!--//Metis Menu -->
</head> 
<body class="cbp-spmenu-push">
    <div class="main-content">
        <!--left-fixed -navigation-->
        <div class="sidebar" role="navigation">
            <div class="navbar-collapse">
                <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right dev-page-sidebar mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" id="cbp-spmenu-s1">
                    <div class="scrollbar scrollbar1">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="index.html"><i class="fa fa-home nav_icon"></i>个人主页</a>
                            </li>
                           
                            <li>
                                <a href="#" onclick = 'queryPdoUrl("<s:property value = 'user.userId'/>")'><i class="fa fa-book nav_icon"></i>查询数据 </a>

                                <!-- /nav-second-level -->
                            </li>
                            
                           
                            <li>
                                <a onclick = 'addPdoUrl("<s:property value = 'user.userId'/>")'><i class="fa fa-th-large nav_icon"></i>添加pdo对象<span class="fa arrow"></span></a>
                            </li>
                             <li>
                                <a onclick = 'addPdoUrl("<s:property value = 'user.userId'/>")'><i class="fa fa-th-large nav_icon"></i>添加pdo对象<span class="fa arrow"></span></a>
                            </li>
                            
                            <li>
                                <a href="login.jsp"><i class="fa fa-th-large nav_icon"></i>logout</a>
                            </li>
                            
                            
                            <li>
                                <a href="#" class="chart-nav"><i class="fa fa-bar-chart nav_icon"></i>Extras<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level collapse">
                                    <li>
									 <a href="#" class="chart-nav"><i class="fa fa-bar-chart nav_icon"></i>统计个人数据信息</a>
                                    </li>
                                    <li>
                                      <a href="#" class="chart-nav"><i class="fa fa-location-arrow nav_icon"></i>地图选点</a>
                                   </li>
                                </ul>
                                <!-- //nav-second-level -->
                            </li>
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
                                <h1>HITmoonflower</h1></li>
                            <div class="clearfix"> </div>
                        </ul>
                    </a>
                </div>
                <!--//logo-->
                
            </div>

            <div class="header-right">
                <!--notification menu end -->
                <div class="profile_details">
                    <ul>
                        <li class="dropdown profile_details_drop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <div class="profile_img">
                                    <span class="prfil-img"><img src="images/user.png" alt=""> </span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                            <ul class="dropdown-menu drp-mnu">
                                
                                <li> <a href="login.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!--toggle button start-->
                <button id="showLeftPush"><i class="fa fa-bars"></i></button>
                <!--toggle button end-->
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!-- //header-ends -->
        <!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
				<!--grids-->







				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>AddPdo</h2>
					</div>
					







					<div class="container">
						<div class="row clearfix">
						

		<center><s:form action="actionAddPdo" Class="form-horizontal" theme="simple" id = "pdoForm">
            <input type="hidden" name="userID" id="Id" />
              <table id = "pdo">
              <tr class="form-group">
                    <th class="col-sm-2">Key</th>
                    <th class="col-sm-8">Value</th>
                    <th class="col-sm-2">Operation</th>
             </tr><br>
              <tr class="form-group">
                    <td class="col-sm-4" >Date</td>
                    <td class="col-sm-4">
                        <input type="text" name="infoMap.datetime" Class="form-control" id = "date"/>
                    </td>
             </tr><br>
              <tr class="form-group">
                    <td class="col-sm-4" >name</td>
                    <td class="col-sm-4">
                        <input type="text" name="infoMap.name" Class="form-control" id = "spend"/>
                    </td>
             </tr><br>
              <tr class="form-group">
                    <td class="col-sm-4" >Spend</td>
                    <td class="col-sm-4">
                        <input type="text" name="infoMap.spend" Class="form-control" id = "spend"/>
                    </td>
             </tr><br>
              <tr class="form-group">
                    <td class="col-sm-4">Place</td>
                    <td class="col-sm-4">
                        <input type="text" name="infoMap.place" Class="form-control" id = "place"/>
                    </td>
             </tr><br>
             </table>
             <br><br>  <br><br>
		          <div class="form-group">
		                    <div class="col-sm-offset-2 col-sm-4">
		                    
		                <button type="button" class="btn  btn-lg btn-primary  hvr-shutter-out-vertical" onclick = "getMap()" >AddPdo</button>
							</div>
							<div class="col-sm-offset-2 col-sm-4">
		                       <button type="button" class="btn btn-lg btn-primary  hvr-shutter-out-vertical" onclick = "addRow()" >AddRow</button>

		              
		                    </div>
          		  </div>
          </s:form>


								
							</div>
							<div class="col-md-4 column">
							</div>
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
        <!--//footer-->
	</div>
	<!-- Classie -->
		<script src="js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			

			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!-- Bootstrap Core JavaScript --> 
		
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/dev-loaders.js"></script>
        <script type="text/javascript" src="js/dev-layout-default.js"></script>
		<script type="text/javascript" src="js/jquery.marquee.js"></script>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		
		<!-- candlestick -->
		<script type="text/javascript" src="js/jquery.jqcandlestick.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/jqcandlestick.css" />
		<!-- //candlestick -->
		
		<!--max-plugin-->
		<script type="text/javascript" src="js/plugins.js"></script>
		<!--//max-plugin-->
		
		<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
		
		<!-- real-time-updates -->
		<script language="javascript" type="text/javascript" src="js/jquery.flot.js"></script>
		<script type="text/javascript">

		$(function() {

			// We use an inline data source in the example, usually data would
			// be fetched from a server

			var data = [],
				totalPoints = 300;

			function getRandomData() {

				if (data.length > 0)
					data = data.slice(1);

				// Do a random walk

				while (data.length < totalPoints) {

					var prev = data.length > 0 ? data[data.length - 1] : 50,
						y = prev + Math.random() * 10 - 5;

					if (y < 0) {
						y = 0;
					} else if (y > 100) {
						y = 100;
					}

					data.push(y);
				}

				// Zip the generated y values with the x values

				var res = [];
				for (var i = 0; i < data.length; ++i) {
					res.push([i, data[i]])
				}

				return res;
			}

			// Set up the control widget

			var updateInterval = 30;
			$("#updateInterval").val(updateInterval).change(function () {
				var v = $(this).val();
				if (v && !isNaN(+v)) {
					updateInterval = +v;
					if (updateInterval < 1) {
						updateInterval = 1;
					} else if (updateInterval > 2000) {
						updateInterval = 2000;
					}
					$(this).val("" + updateInterval);
				}
			});

			var plot = $.plot("#placeholder", [ getRandomData() ], {
				series: {
					shadowSize: 0	// Drawing is faster without shadows
				},
				yaxis: {
					min: 0,
					max: 100
				},
				xaxis: {
					show: false
				}
			});

			function update() {

				plot.setData([getRandomData()]);

				// Since the axes don't change, we don't need to call plot.setupGrid()

				plot.draw();
				setTimeout(update, updateInterval);
			}

			update();

			// Add the Flot version string to the footer

			$("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
		});

		</script>
		<!-- //real-time-updates -->


		
</body>
</html>

