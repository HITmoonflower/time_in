<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Homepage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Baxster Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

        <style type="text/css">
        #MapQueryPdo{
            height: 400px;
            width: 800px;
            margin: 0px
        }
        #MapShowAllPdo{
            height: 400px;
            width: 800px;
            margin: 0px
        }
        #MapAddPdo{
            height: 300px;
            width: 300px;
            margin: 0px
        }
    </style>
    <script type="application/x-javascript">

    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

    function hideURLbar() { window.scrollTo(0, 1); }


    function addRelation(){
	var checkBox = document.getElementsByName("pdoItem");
	var t = 0,num = 0;
	var pdoId = new Array();
	for (var i=0;i<checkBox.length;i++){
		if (checkBox[i].checked){
			pdoId[num] = checkBox[i].value;
			num++;
			t++;
		}
	}
	if (t == 2){
		document.getElementById("pdoId1").value = pdoId[0];
		document.getElementById("pdoId2").value = pdoId[1];
		document.getElementById("relation").submit();
	}
	else{
		alert("请选择两个pdo")
	}
}
    function insertTitle(path){
    	   var test1 = path.lastIndexOf("/");
    	   var test2 = path.lastIndexOf("\\");
    	   var test= Math.max(test1, test2)
    	   if(test<0){
    	     document.getElementById("fileName").value = path;
    	   }else{
    	    document.getElementById("fileName").value = path.substring(test + 1);
    	   }
    	}
    //function showAllPdoUrl(userId){
    	//  window.location.href="actionShowAll.action?userId="+userId;
    //}
    
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="css/timeline1.css">
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
<script src="js/jquery-3.2.1.min.js"></script>
<script src="layer/layer/layer.js"></script>
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
<link href="css/custom.css" rel="stylesheet">
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
                             <s:form name = "backToHomepage" action = "actionShowAll">
                                    <input type = "hidden" name = "userId" value = '<s:property value = "userId"/>'/>
                                </s:form>
                                <a href="javascript:document:backToHomepage.submit();"><i class="fa fa-home nav_icon"></i>个人主页</a>
                            </li>

                            <li>
                                <a href="javascript:queryPdoLayer();"><i class="fa fa-search nav_icon"></i>查询数据 </a>
                            </li>


                            <li>
                                <a href="javascript:addPdoLayer();"><i class="	fa fa-plus-square-o nav_icon"></i>添加pdo对象</a>
                            </li>
                            <li>
                                <a  onclick = 'addRelation()' ><i class="fa fa-plus-square nav_icon"></i>添加数据关联</a>
                            </li>



							 <li>
<<<<<<< HEAD



                                <a href="javascript:document:jumpAdd.submit();"><i class="fa fa-file nav_icon"></i>添加文件<span class="fa arrow"></span></a>
									
=======
							   
									 
								
                                <a href="javascript:document:jumpAdd.submit();"><i class="fa fa-th-large nav_icon"></i>新建PDO<span class="fa arrow"></span></a>
                            		
>>>>>>> origin/master
                            		<ul class="nav nav-second-level collapse">
                            		<li>
                                     <s:form id = "fileForm">
                                     
											<input type = "hidden" name = "userId" value = '<s:property value = "userId"/>'/>
											<input type = "hidden" name = "excelFileName" id = "fileName"/>
										 <input type = "file" name = "excelFile" style="color: #FFFFFF"
										  onChange="if(this.value)insertTitle(this.value);"  />
										  <input type="text" list="name_list" name="tranName" id="uploadExcelName"/>
                                    <datalist id="name_list">
                                     <s:iterator value = "queryRes" var = "pdoName" status = "sta">
                                     <option label='<s:property value="%{#pdoName.key}" />' value='<s:property value="%{#pdoName.key}" />' />
                                     </s:iterator>
                                    </datalist>
									&nbsp;&nbsp;	  

                                    <!-- 
                                       <center><input type = "button" class="btn  btn-default fa fa-upload"
                                       value = "提交" onclick="importExcel();" />
                                      --> 
                                       
                                      <button type="button" onclick="importExcel();" class="btn btn-default  btn-info" aria-label="Left Align">
										 <span class="fa fa-upload" aria-hidden="true"></span>提交
									</button>
										 						
																
																
                                   </li>
                                   </s:form>
                                </ul>

                            </li>



                            <li>
                                <a href="login.jsp"><i class="fa fa-sign-out nav_icon"></i>logout</a>
                            </li>

						<!--  
                            <li>
                                <a href="#" class="chart-nav"><i class="fa fa-bar-chart nav_icon"></i>Extras<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level collapse">
                                    <li>
									                   <a href="" class="chart-nav"><i class="fa fa-bar-chart nav_icon"></i>统计个人数据信息</a>
                                    </li>
                                    <li>
                                      <a href="" class="chart-nav"><i class="fa fa-location-arrow nav_icon"></i>地图选点</a>
                                   </li>
                                </ul>
                               
                            </li>
                          
                          --> 
                            
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
                    <a href="https://github.com/HITmoonflower/time_in">
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
                        <h2>所有PDO</h2>
                    </div>
                    <div class="panel panel-widget">
                    <div class="tabbable" id="tabs-391969">
                    
        <ul class="nav nav-tabs">
          <li class="active">
             <a href="#panel-474133" data-toggle="tab">分类显示</a>
          </li>
          <li>
             <a href="#panel-805073" data-toggle="tab">按时间线展示</a>
          </li>
           <li>
             <a href="#panel-map" id="showByPlace"data-toggle="tab" onclick="javasript:layer.tips('输入不精确的地址可能会出现定位不精确的情况', '#showByPlace');">在地图上展示</a>
          </li>
        </ul>
        
      
      <div class="tab-content">
          <div class="tab-pane active" id="panel-474133">
      
                        <div class="tables">


                            <s:form action = "actionAddRelatePdo.action" id = "relation">

                                <input type="hidden" name="userId" id = "Id" value = '<s:property value = "userId"/>'/>
                                <input type="hidden" name="pdo1" id="pdoId1"/>
                                <input type="hidden" name="pdo2" id="pdoId2"/>
                                </s:form>




                             <s:iterator value = "queryRes" var = "pdoName" status = "sta">
                             <!-- 抽屉div class不可改变，通过改变div范围改变效果应用范围-->
                             <div class="drawerTotal">
                             <!-- 抽屉头部div -->
                             <div class="drawerHead">
		                            <div class="row clearfix">
													<div class="col-md-10 column">
														<h3>
																<button type="button" class="btn btn-default btn-lg  btn-info" aria-label="Left Align">
																  <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>详细
																</button>
																														
														
																&nbsp;&nbsp;&nbsp;
															<s:property value="%{#pdoName.key}" />
																
														</h3>
													</div>
													<div class="col-md-1 column">
		
														<h3>
															
															<s:property value="#pdoName.value.size()" />
															<s:if test="#pdoName.value==null">
									                              	0
									                              	</s:if>
		
														</h3>
													</div>
													<div class="col-md-1 column">
														 <!-- 生成表单div -->
                             
							                             <div class="showForm">
							                             <s:form class="genePdoForm">
							                             <input type="hidden" name = "userId" value = '<s:property value = "userId"/>'/>
							                             <input type="hidden" name = "userID" value = '<s:property value = "userId"/>'/>
							                             <input type="hidden" class="getName" name = "tranName" value ='<s:property value="%{#pdoName.key}" />'/>
							                             
							                             		<button type="button" class="btn btn-default btn-lg  btn-info"  aria-label="Right Align">
  																	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
																</button>

							                             </s:form>
							                             </div>
													<br>
													</div>
		
												</div>




									</div>
									<!-- 抽屉折叠div -->
									<div class="drawer" style="display: none">

										<table style="table-layout:fixed"
											class="table table-condensed table-hover table-bordered">

											<s:iterator value="#pdoName.value" var="pdo" status="s">

												<thead>
													<tr>

														<s:if test="#s.Count <= 1">
															<th style="width:20px"></th>
															<s:iterator value="#pdo.infoMap" status="ss" var="map">
																<th style="white-space:nowrap;text-align:center"><s:property value="%{#map.key}" /></th>
															</s:iterator>
															<th style="width:160px"></th>
														</s:if>
													</tr>
												</thead>
												<tbody>
													<tr>
														<!-- 复选框  -->
														<td style="width:20px;text-align:center;vertical-align:middle"><input type="checkbox" name="pdoItem"
															value='<s:property value = "#pdo.pdoID"/>'></td>
														<s:iterator value="#pdo.infoMap" status="ss" var="map">
															<td style="white-space:nowrap;text-align:center;vertical-align:middle"><s:property value="%{#map.value}" /></td>
														</s:iterator>
														<td style="text-align:center">
															<!-- 关联pdo -->
															<div class="relateForm">
																<form id="relateForm" class="navbar-form navbar-left">
																	<div style="display: none">
																		<input type="text" name="pdoId"
																			value='<s:property value = "#pdo.pdoID" />' /> <input
																			name="userId" value='<s:property value = "userId"/>' />
																	</div>
																	<div class="col-md-11 column">
																		<div class="getRealteButton">
																			<center>
																				<input type="button" class="btn btn-lg btn-success"
																					value="相关数据" onclick="getRelate()" /></center>
																		</div>
																	</div>
																</form>
															</div>

														</td>
													</tr>
												</tbody>
											</s:iterator>

										</table>
									</div>
								</div>
							</s:iterator>


                </div>
                </div>
                
<div class="tab-pane" id="panel-805073">                
<div class="container-fluid">
        <div class="col-md-12">
           

            <div class="row">
                <div class="timeline timeline-single-column">
                    <s:iterator value = "queryT" var = "pdoName" status = "sta">

                    <span class="timeline-label">
                        <span class="label label-info"><s:property value="%{#pdoName.key}" /></span>
                    </span>
                    <s:iterator value="#pdoName.value" var="pdo" status="s">
                    <div class="timeline-item">
                        <div class="timeline-point timeline-point-success">
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="timeline-event timeline-event-success">
                            <div class="timeline-heading">
                                <h4> <s:property value="%{#pdo.name}" /></h4>
                            </div>
                          
                            <div class="timeline-body">
                            <table class="table table-striped table-hover">
                                <tr><s:iterator value="#pdo.infoMap" status="ss" var="map">
                                    <th style=" width:200px"><s:property value="%{#map.key}" /></th>
                                    </s:iterator>
                                </tr>
                                <tr><s:iterator value="#pdo.infoMap" status="ss" var="map">
                                    <td style=" width:200px"><s:property value="%{#map.value}" /></td>
                                    </s:iterator>
                                </tr>
                                
                            </table>
                     
                            </div>
                            <div class="timeline-footer">
                                <p class="text-right"><s:property value="%{#pdoName.key}" /></p>
                            </div>
                        </div>
                    </div>

                   </s:iterator>
                    </s:iterator>
                </div>
            </div>
        </div>
    </div>
			</div>
        
<div class="tab-pane" id="panel-map">
<div id="MapShowAllPdo"></div>
     
</div></div>
				<!-- 查询页面 -->


<div id="queryPdoLayer" style="display: none">
					<div class="main-page">
						<!--grids-->
						<div class="grids">
							<div class="progressbar-heading grids-heading">
								<div class="col-md-12 column">
									<div class="alert alert-success alert-dismissable">
										<center><strong><h3>
											查询数据页面
										</h3> </strong> 
									</div>
								</div>
							</div>
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-2 column"></div>
									<div class="col-md-8 column">
										<s:form Class="form-horizontal" id="queryForm" action=""
											theme="simple" data-toggle="validator" role="form">
											<input type="hidden" name="userId"
												value='<s:property value = "userId"/>' />
											<div class="form-group">
												<h3><label for="inputPassword" class="col-sm-2 control-label">Date:</label></h3>
												<div class="form-inline row">
													<div class="form-group col-sm-5">

														<input type="text" name="info.startDate"
															class="form-control" data-error="请输入形如xxxx-xx-xx的合法日期"
															pattern="^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))"
															date() id="startDate" />
														<div class="help-block">请输入形如xxxx-xx-xx的合法日期</div>
													</div>
													<div class="form-group col-sm-5">
														<input type="text" name="info.endDate"
															class="form-control" data-error="请输入形如xxxx-xx-xx的合法日期"
															pattern="^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))"
															date() id="endDate" />
													</div>
												</div>
											</div>
											<div class="form-group">
												<h3><label for="inputPassword" class="col-sm-2 control-label">Spend:</label></h3>
												<div class="form-inline row">
													<div class="form-group col-sm-5">
														<input type="text" 
															name="info.minSpend" Class="form-control" id="minSpend" />
														<div class="help-block">必须是正整数!</div>
													</div>
													<div class="form-group col-sm-5">
														<input type="text"
															name="info.maxSpend" Class="form-control" id="maxSpend" />
														<div class="help-block with-errors"></div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<h3><label for="inputEmail" class=" col-sm-2 control-label">place:</label></h3>
											
													<div class="form-group col-sm-8">
													
															<input type="text" maxlength="100" name="info.place"
																Class="form-control" id="queryPdoPlace" />
													</div>
												
											</div>
											<div id="MapQueryPdo" tabindex="0"></div>
											<div class="form-group">
												<center>
													<button type="button"
														class="btn  btn-lg btn-primary  hvr-shutter-out-vertical"
														onclick="jsonQueryPdo()">查询</button>
												</center>
											</div>
										</s:form>
									</div>
									<div class="col-md-2 column"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
<div id="addPdoLayer" style="display:none">
<form Class="form-horizontal" theme="simple" method="post" id = "pdoForm" data-toggle="validator" role="form">
            <input type="hidden" name="userID" value = '<s:property value = "userId"/>' />
            <input type="hidden" name="userId" value = '<s:property value = "userId"/>' />

            	<div class="alert alert-dismissable alert-info">
							
					 <strong><center><h4>
						请选择你要添加的属性.
					</h4>
				</div>

              <table id = "pdo">
              <tr class="form-group">
                    <th class="col-sm-6">属性</th>
                    <th class="col-sm-6">Value</th>
                    
             </tr><br>
              <tr class="form-group">
                    <td class="col-sm-6" >name</td>
                    <td class="col-sm-6">
                        <input type="text" Class="form-control" name = "tranName" id="addHeaderName"/>
                        
                    </td>
              <tr class="form-group">
                    <td class="col-sm-6" >属性1</td>
                    <td class="col-sm-6">
                        <input type="text" Class="form-control" name="header[0]" value="datetime"/>
                    </td>
             </tr>
             </tr>
              <tr class="form-group">
                    <td class="col-sm-6" >属性2</td>
                    <td class="col-sm-6">
                        <input type="text" Class="form-control" name="header[1]" value="spend"/>
                        
                    </td>
             </tr>
              <tr class="form-group">
                    <td class="col-sm-6">属性3</td>
                    <td class="col-sm-6">
                        <input type="text" maxlength="10" Class="form-control" name="header[2]" value = 'place'/>
                    </td>
             </tr>
             
             </table>
             <br><br>  <br>
		          <div class="form-group">
		                    <div class="col-sm-offset-1 col-sm-4">
		                    
		                <button type="button" class="btn  btn-lg btn-primary  hvr-shutter-out-vertical" onclick="jsonAddPdo()">AddPdo</button>

							</div>
							<div class="col-sm-offset-2 col-sm-4">
								<button type="button"
									class="btn btn-lg btn-primary  hvr-shutter-out-vertical"
									onclick="addRow()">AddRow</button>


							</div>
						</div>
					</form>


</div>                
<div id="relatePdoLayer" style="display:none">
   <table class="table">
       	<thead>
         	
        </thead>
        <tbody id="relateTable">
			
		</tbody>
	</table>
</div>                 
<div id="gnenrateFormLayer" style="display:none">
         <div class="panel panel-widget">
         
         <div class="col-md-12 column">
			<div class="alert alert-success alert-dismissable">
				<center><strong><h3>
					添加数据
				</h3> </strong> 
			</div>
		</div>
         
         
         
              <div class="tables">
                  <s:form class = "generateAddForm">
                       <input type="hidden" name="userID" value = '<s:property value = "userId"/>'/>
                           <table id = "genePdoFormInfo" class="table">
                                  </table>
                                  <div class = "addPdoByGeneButton">
                                  <div class="col-md-12 column">
                                  <center>
                                  <input type = "button" class="btn btn-lg btn-primary" onclick = "jsonGenerateAddPdo(this)" value = "确认"/>
                                  </center>
                                  </div>
                                  </div>
                                  </s:form>
                                </div>
                              </div>
            </div> 
				</div>
<div id="relatePdoLayer" style="display: none">
					<div class="container">
						<div class="row clearfix">
							<div class="col-md-12 column">
								<div class="row clearfix">
									<div class="col-md-2 column"></div>


									<div class="col-md-6 column">
										<table class="table ">
											<thead>

											</thead>
											<tbody id="relateTable">


											</tbody>
										</table>

									</div>



									<div class="col-md-4 column"></div>
								</div>
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


	</div>
	<!-- Classie -->

		<script src="js/classie.js"></script>
		<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.2&key=b58724f1cb6b3589a9f864c179ede219"></script>
<script type="text/javascript">
var mapShowAll = new AMap.Map('MapShowAllPdo',{
    resizeEnable: true,
    zoom: 5,
    center: [116.39,39.9]
});

var showPlaceStr='${queryP}';
var showPlace = eval('(' + showPlaceStr + ')');
$.each(showPlace,function(place,pdo){
      AMap.service('AMap.Geocoder',function(){//回调函数
    	    geocoder = new AMap.Geocoder({
    	    });
      geocoder.getLocation(place, function (status, result) {
    	  alert
          if (status == 'complete' && result.geocodes.length) {
                  //marker.setPosition(result.geocodes[0].location);
                  var ss=result.geocodes[0].location
                  var marker = new AMap.Marker({
                      position: ss,
                      map: mapShowAll
                  });
              }
        });
      })
});


var map = new AMap.Map('MapQueryPdo',{
    resizeEnable: true,
    zoom: 13,
    center: [116.39,39.9]
});
AMap.plugin('AMap.Geocoder',function(){
    var geocoder = new AMap.Geocoder({
    });
    var marker = new AMap.Marker({
        map:map,
        bubble:true
    })
    var input = document.getElementById('queryPdoPlace');
    var message = document.getElementById('message');
    map.on('click',function(e){
        marker.setPosition(e.lnglat);
        geocoder.getAddress(e.lnglat,function(status,result){
            if(status=='complete'){
                input.value = result.regeocode.formattedAddress
                message.innerHTML = ''
            }else{
                message.innerHTML = '无法获取地址'
            }
        })
    })

    input.onchange = function(e){
        var address = input.value;
        geocoder.getLocation(address,function(status,result){
            if(status=='complete'&&result.geocodes.length){
                marker.setPosition(result.geocodes[0].location);
                map.setCenter(marker.getPosition())
                message.innerHTML = ''
            }else{
                message.innerHTML = '无法获取位置'
            }
        })
    }

});
</script>
<script type="text/javascript" src="https://webapi.amap.com/demos/js/liteToolbar.js"></script>
		<script>
		var i=3
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

		     //ajax请求导入excel
		      function importExcel(){
		   	   if ($('#uploadExcelName')[0].value==""){
		   		   layer.tips('请输入name', '#uploadExcelName',{
		   			  tips: [3, '#78BA32'] //还可配置颜色
		   		});
		   		   return
		   	   }
		   	 var formData = new FormData(document.getElementById("fileForm"));
	            $.ajax({
	              type : "post",
	              url : 'actionImport',
	              data : formData,
	              async : false,
	              cache : false,
	              contentType : false,
	              processData : false,
	              success : function(data){
	                var obj = JSON.parse(data);
	                if (obj.importRes == "emptyHeader"){
	                  layer.alert("请添加键");
	                }else if(obj.importRes == "addHeaderSuccess"){
	                  alert("导入模板成功");
	                }else if(obj.importRes == "addHeaderFail"){
	                  alert("导入模板失败");
	                }else if(obj.importRes == "existPdo"){
	                  alert("当前pdo模板已存在")
	                }else if(obj.importRes == "addPdoSuccess"){
	                  alert("导入成功")
	                }else if(obj.importRes == "notSameHeader"){
	                  alert("当前模板和已有模板冲突!")
	                }else if(obj.importRes == "typeError"){
	                  layer.alert("文件类型只能是xls或者xlsx！");
	                }else if(obj.importRes == "fileNotFound"){
	                  alert("文件不存在！");
	                }else if(obj.importRes == "error"){
	                  alert("上传失败！");
	                }else{
	                  
	                }
	                  
	              },
	              error : function(e){
	                alert("上传失败！");
	              }
	            });
	            get();
	          }

			//抽屉效果
	        $(document).ready(function(){
	            //$(".drawerTotal").each(function(){
	                //$(this).children(".drawer").hide();
	            //});
	            $(".drawerHead").each(function(){
	                $(this).click(function(){
	                    if($(this).parents(".drawerTotal").children(".drawer").css("display") != "none"){
	                        $(this).parents(".drawerTotal").children(".drawer").slideUp();
	                    }else{
	                        $(this).parents(".drawerTotal").children(".drawer").slideDown();
	                    }
	                });
	            });
	        });
	        //生成表单
	        $(document).ready(function(){
	        	$('.showForm').each(function(){
	        		$(this).click(function(){
	        			  $("#genePdoFormInfo").empty();
	        			  var geneAddData=$(this).children('.genePdoForm');
	        			  var formData = new FormData(geneAddData[0]);
	                $.ajax({
	        		        type : "post",
	        		        url : 'actionForm',
	        		        data : formData,
	        		        async : false,
	        		        cache : false,
	        		        contentType : false,
	        		        processData : false,
	        		        success : function(data){
	        		          var obj = JSON.parse(data);
	        		          $.each(obj.header,function(n,key){
	        		        	  if (n==0){
	        		        		  var name="<tr  class='info'><td> <center>Name</center></td><td><center><input type = 'text' name = 'name' value='"+key+"' readonly='readonly'/></center></td></tr> ";
	        		        		  //name=name+"<tr style='width:20px'><td></td><td></td></tr>";
	        		        		  $("#genePdoFormInfo").append(name);
	        		        	  }
	        		        	  else{
	        		        		  var info="<tr><td><center>"+key+"</center></td><td><center><input type = 'text' name = 'infovalue["+String(n-1)+"]'/></center>";
	        		        		  info=info+"<input type='hidden' name='infokey["+String(n-1)+"]' value='"+key+"'/></td></tr>";
	        		        		  //info=info+"<tr><td></td><td></td></tr>";
	        		        		  $("#genePdoFormInfo").append(info);
	        		        	  }
	        		          })
	        		          layer.open({
                                type:1,
                                title:"添加数据",
                                area:['500px','600px'],
                                      shadeClose:true,
                                      content:$("#gnenrateFormLayer")
                              })
	        		        }
	        			});
	        			
	        			/*
	        			layer.open({
		                    type:1,
		                    title:"AddPdo",
		                    area:['1000px','600px'],
		                    shadeClose:true,
		                    content:$(this).parents('.drawerHead').children('.hiddenGenerateForm')
		                })
	        			$(this).parents('.drawerHead').children('.hiddenGenerateForm').style.display="block";
	        		*/
	        		})
	        	})
	        })
	        //查找pdo抽屉
	        function queryPdoLayer(){
	        	layer.open({
	        		type:1,
	        		title:"queryPdo",
	        		area:['1200px','600px'],
                    shadeClose:true,
                    content:$("#queryPdoLayer")
	        	})
	        }
	        //添加pdo抽屉
	        function addPdoLayer(){
	        	for(var i=3;i<8;i++){
	        		var str="#newShuXing"+String(i);
	        		$(str).remove();
	        	}
	        	window.i=3
	                layer.open({
	                    type:1,
	                    title:"AddPdo",  
	                    area:['400px','600px'],
	                    shadeClose:true,
	                    content:$("#addPdoLayer")
	                })
	            }
	        
	        function getObj(id){
	            return document.getElementById(id);
	        }
	        function addRow(){
	        	if (window.i>=8){
	        		layer.alert("最多有8个属性");
	        		return
	        	}
	        	var tab=$('#pdo');
	        	var cell='<tr class="form-group" id="newShuXing'+String(window.i)+'"><td class="col-sm-4" >属性'+String(window.i+1)+
	        	'</td><td class="col-sm-4"><input type="text" Class="form-control" name="header['+
	        		String(window.i)+']" value="spend"/></td> </tr>';
	        	tab.append(cell);
	        	/*
	            var tab=getObj("pdo");
	            var row=tab.insertRow();
	            row.className = "form-horizontal form-group ";
	            row.style.thmem = "symple";
	            var cell0=row.insertCell();
	            var cell1=row.insertCell();
	            var cell2=row.insertCell();
	            temp = String(window.i);
	            cell0.innerHTML="属性"+String(window.i+1);
	            cell0.className ="col-sm-4";
	            cell1.innerHTML='<input type="text" name = "header'+temp+'" value = "header'+temp+'">';
	            cell1.className ="col-sm-4";
	            //cell2.innerHTML='<input value="删除"type="button" class="btn btn-lg btn-primary  hvr-shutter-out-vertical" onclick="deleteRow(this)"/>';
	           // cell2.className ="col-sm-4";
*/
	            i++;
	            
	        }
	        function deleteRow(obj){
	            var row=obj.parentNode.parentNode;
	            var tab=row.parentNode;
	            tab.deleteRow(row.rowIndex);
	            i--;
	        }
	        function getMap(){
	        	var date = document.getElementById("addDate");
	      	  var spend = document.getElementById("addSpend");
	      	  var place = document.getElementById("addPlace");
	      	  if (date.value.trim() != ""){
	      	  	date.name = "infoMap.datetime";
	      	  }
	      	  if (spend.value.trim() != ""){
	      		  spend.name = "infoMap.spend";
	      	  }
	      	if (place.value.trim() != ""){
	              place.name = "infoMap.place";
	            }
	      	  for (var j = 3; j<window.i;j++){
	      		  var key = document.getElementById("key"+String(j));
	      		  var value = document.getElementById("value"+String(j));
	      		  value.name = "infoMap."+key.value;
	      	  }
	      	  
	      	  if(data.value.trim() != ""){
	              var result = date.value.trim().match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
	              if(result == null){
	                  return false;
	              }
	      	  }
	      	  if(spend.value.trim() != ""){
	      		 var reg = /^\d+(?=\.{0,1}\d+$|$)/;
	      		 if(!reg.test(num)){
	      				return false ;
	      		 }
	      	   }
	      	 return true;
	        }
	      //json添加pdo
  function jsonAddPdo(){
	   if ($('#addHeaderName')[0].value==""){
		   layer.tips('请输入name', '#addHeaderName');
		   return
	   }
    var formData = new FormData(document.getElementById("pdoForm"));
    $.ajax({
      type : "post",
      url : 'actionAddPdo',
      data : formData,
      async : false,
      cache : false,
      contentType : false,
      processData : false,
      success : function(data){
        var obj = JSON.parse(data);
        layer.open({
                type: 1,
                title:"AddPdo Message",
                skin: 'layui-layer-demo',
                closeBtn: 0,
                anim: 2,
                area:['240px','120px'],
                shadeClose: true,
                content: obj.result,
                end:function (){
                  location.reload();
                }
              });
 
      },
      error : function(e){
        msg="上传失败！";
      }
    });
    get();
  }
	      //生成表单添加数据
	   
	    $(document).ready(function(){
	    	  $('.addPdoByGeneButton').each(function(){
	    		  $(this).click(function(){
	    			  var geneAddData=$(this).parents('.generateAddForm')[0];
	    			  var formData = new FormData(geneAddData);
	    		       $.ajax({
	    		       type : "post",
	    		      url : 'actionAddPdoData',
	    		      data : formData,
	    		      async : false,
	    		      cache : false,
	    		      contentType : false,
	    		      processData : false,
	    		      success : function(data){
	    		        var obj = JSON.parse(data);
	    		        layer.open({
	    		                type: 1,
	    		                title:"AddPdo Message",
	    		                skin: 'layui-layer-demo',
	    		                closeBtn: 0,
	    		                anim: 2,
	    		                area:['240px','120px'],
	    		                shadeClose: true,
	    		                content: obj.result,
	    		                end: function () {
	    		                        location.reload();
	    		                    }
	    		              });

	    		      },
	    		      error : function(e){
	    		        msg="上传失败！";
	    		      }
	    		    });
	    		    get();
	    		  })
	    	  })
	    })
	   //json获取关联数据
	   $(document).ready(function(){
           $('.getRealteButton').each(function(){
             $(this).click(function(){
            	 $("#relateTable").empty();
            	 var formData=$(this).parents('.relateForm').children('form').serializeArray();
            	 //console.log(formData);
            	 var uploadData = new FormData();
            	 //var jsonData={};
            	 for (var i=0;i<2;i++){
            		 var str=formData[i].name;
            		 uploadData.append(str,formData[i].value);
            		 //jsonData[str]=formData[i].value;
            	 }
            	 //console.log(jsonData);
            	 $.ajax({
            	        type : "post",
            	        url : 'actionShowRelate',
            	        data : uploadData,
            	        async : false,
            	        cache : false,
            	        contentType : false,
            	        processData : false,
            	        success : function(data){
            	          var obj = JSON.parse(data);
            	          if(obj.datas.length==0){
            	        	  
            	        	  
            	        	  $("#relateTable").append("请尝试添加相关数据.");
            	        	  
            	        	  layer.open({
            	                  type:1,
            	                  title:"没找到相关数据",
            	                  area:['200px','100px'],
            	                        shadeClose:true,
            	                        content:$("#relatePdoLayer")
            	                })
            	        	 
            	          }
            	          else{
            	           $.each(obj.datas,function(n,onedata){
            	              //var nameInfo = '<tr class="info"><td>name</td><td>'+onedata.name+'</td></tr>';
            	              $("#relateTable").append(
            	            		  '<center><div class="row clearfix">'+
            	            				'<center><div class="col-md-4 column"></div><div class="col-md-8 column">'+
            	            					'<center><div class="alert alert-dismissable alert-success">'+
            	            					'<center><strong><h3>'+
            	            						'类的名字:'+
            	            						 onedata.name+
            	            						 '</h3>'+ 
                 	            					'</div>'+ 
                     	            				'</div>'+ 
                     	            			'</div>' );
            	              $.each(onedata,function(key,value){
            	                  var str='<tr class="info"><td>'+key+'</td><td>'+value+'</td></tr>';
            	                if (key != "name"){
            	                    $("#relateTable").append(str);
            	                }
            	                }
            	            
            	            	
            	              );  $("#relateTable").append('<tr ><td></td><td></td></tr>');
            	              $("#relateTable").append('<tr ><td></td><td></td></tr>');
            	              $("#relateTable").append('<tr ><td></td><td></td></tr>');
            	              });
            	           layer.open({
            	                  type:1,
            	                  title:"相关的数据",
            	                  area:['1000px','650px'],
            	                        shadeClose:true,
            	                        content:$("#relatePdoLayer")
            	                })
            	        }}
            	      });
             })
           })
         })
	      
	    //json查询pdo
	   function jsonQueryPdo() {
			var formData = new FormData(document.getElementById("queryForm"));
			$.ajax({
				type : "post",
				url : 'actionQueryPdo',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(data){
					var obj = JSON.parse(data);
					if (obj.result == "success"){
						document.getElementById("queryForm").action="actionQueryPdoSuccess.action";
						document.getElementById("queryForm").submit();
					}
					else{
						layer.open({
			        		type:1,
			        		title:"Error Message",
			        		area:['240px','120px'],
		                    shadeClose:true,
		                    content:obj.result
			        	})
					}
					
				}
			});
			get();
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
