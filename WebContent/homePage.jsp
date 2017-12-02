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

						<li><a href="javascript:queryPdoLayer();"><i
								class="fa fa-book nav_icon"></i>查询数据 </a></li>


						<li><a href="javascript:addPdoLayer();"><i
								class="fa fa-th-large nav_icon"></i>添加pdo对象</a></li>
						<li><a onclick='addRelation()'><i
								class="fa fa-th-large nav_icon"></i>添加数据关联</a></li>



						<li><a href="javascript:document:jumpAdd.submit();"><i
								class="fa fa-th-large nav_icon"></i>添加文件<span class="fa arrow"></span></a>

							<ul class="nav nav-second-level collapse">
								<s:form id="fileForm">
									<input type="hidden" name="userId"
										value='<s:property value = "userId"/>' />
									<input type="hidden" name="excelFileName" id="fileName" />

									<li class="btn btn-default">

										<center>
											<input type="file" name="excelFile"
												onChange="if(this.value)insertTitle(this.value);" />
										</center>
									</li>
									<br />
									<li class="btn btn-default">

										<center>
											<input type="button" class="btn  btn-default" value="submit"
												onclick="importExcel();" />
									</li>
								</s:form>
							</ul></li>



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
				<!-- //sidebar-collapse --> </nav>
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



		<div id="page-wrapper">
			<div class="main-page">
				<!--grids-->




				<div class="grids">
					<div class="progressbar-heading grids-heading">
						<h2>用户数据</h2>
					</div>
					<div class="panel panel-widget">
						<div class="tables">


							<s:form action="actionAddRelatePdo.action" id="relation">

								<input type="hidden" name="userId" id="Id"
									value='<s:property value = "userId"/>' />
								<input type="hidden" name="pdo1" id="pdoId1" />
								<input type="hidden" name="pdo2" id="pdoId2" />
							</s:form>




							<s:iterator value="queryRes" var="pdoName" status="sta">
								<!-- 抽屉div class不可改变，通过改变div范围改变效果应用范围-->
								<div class="drawerTotal">
									<!-- 抽屉头部div -->
									<div class="drawerHead">



										<div class="row clearfix">
											<div class="col-md-4 column">

												<h3>
													<s:property value="%{#pdoName.key}" />

												</h3>
											</div>
											<div class="col-md-4 column">

												<h3>
													共
													<s:property value="#pdoName.value.size()" />
													条数据

												</h3>
											</div>
											<div class="col-md-4 column">
												<!-- 生成表单div -->
												<div class="showForm">
													<h3>
														<input class="btn btn-primary  hvr-shutter-out-vertical"
															value="在此模板添加新数据" />
													</h3>
												</div>

											</div>

										</div>









										<div class="hiddenGenerateForm" style="display: none">
											<s:iterator value="#pdoName.value" var="pdo" status="pdos">
												<s:if test="#pdos.Count <= 1">
													<div class="panel panel-widget">
														<div class="tables">
															<s:form id="generateAddForm">
																<input type="hidden" name="userID"
																	value='<s:property value = "userId"/>' />

																<table id="pdoInfo" class="table">
																	<tr class="info">
																		<td>
																			<center>Name</center>
																		</td>
																		<td>
																			<center>
																				<input type="text" name='name'
																					value='<s:property value="#pdo.name"/>'
																					readonly='readonly' />
																			</center>
																		</td>
																	</tr>
																	<s:iterator value="#pdo.infoMap" var="map">
																		<tr>
																			<td><center>
																					<s:property value="#map.key" />
																				</center></td>
																			<td>
																				<center>
																					<input type="text"
																						name='infoMap.<s:property value="#map.key"/>' />
																				</center>
																			</td>
																		</tr>
																	</s:iterator>
																</table>
																<div class="col-md-10 column">
																	<center>
																		<input type="button" class="btn btn-lg btn-primary"
																			onclick="jsonGenerateAddPdo(this)" value="addPdo" />
																	</center>
																</div>
															</s:form>
														</div>

													</div>
												</s:if>
											</s:iterator>
										</div>

										<!-- 
                             <s:iterator value = "#pdoName.value" var = "pdo" status = "s">
                             <tr>
                             <td></td>
                             <s:if test="#s.Count <= 1">
                             <s:iterator value="#pdo.infoMap" status="ss" var = "map">
                                  <th><s:property value="%{#map.key}" /></th>
                             </s:iterator>
                             </s:if>
                             </tr></s:iterator>
                                 <s:form action = "actionForm">
                                     <input type="hidden" name="userId" value = '<s:property value = "userId"/>'/>
                                     <input type="hidden" name="tranName" value = '<s:property value="#pdoName.key" />'/>
                                     <input type="submit" class="btn btn-primary  hvr-shutter-out-vertical" value="generateForm"/>
						 		</s:form>
						 		 -->

									</div>
									<!-- 抽屉折叠div -->
									<div class="drawer" style="display: none">

										<table
											class="table table-condensed table-hover table-bordered">

											<s:iterator value="#pdoName.value" var="pdo" status="s">

												<thead>
													<tr>

														<s:if test="#s.Count <= 1">
															<th></th>
															<s:iterator value="#pdo.infoMap" status="ss" var="map">
																<th><s:property value="%{#map.key}" /></th>
															</s:iterator>
															<th></th>
														</s:if>
													</tr>
												</thead>
												<tbody>
													<tr>
														<!-- 复选框  -->
														<th><input type="checkbox" name="pdoItem"
															value='<s:property value = "#pdo.pdoID"/>'></th>
														<s:iterator value="#pdo.infoMap" status="ss" var="map">
															<th><s:property value="%{#map.value}" /></th>
														</s:iterator>
														<th>
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
																					value="相关数据" onclick="getRelate()" />
																		</div>
																	</div>
																</form>
															</div>

														</th>
													</tr>
												</tbody>
											</s:iterator>

										</table>
									</div>
								</div>
							</s:iterator>

						</div>
					</div>


				</div>
				<!-- 查询页面 -->


				<div id="queryPdoLayer" style="display: none">
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
										<s:form Class="form-horizontal" id="queryForm" action=""
											theme="simple" data-toggle="validator" role="form">
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
														<input type="text" name="info.endDate"
															class="form-control" data-error="请输入形如xxxx-xx-xx的合法日期"
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
												<label for="inputEmail" class="control-label">place</label>
												<input type="text" maxlength="20" name="info.place"
													Class="form-control" id="place" />
												<div class="help-block with-errors"></div>
												<div class="help-block">最大长度是20!</div>
											</div>
											<div class="form-group">
												<center>
													<button type="button"
														class="btn  btn-lg btn-primary  hvr-shutter-out-vertical"
														onclick="jsonQueryPdo()">queryPdo</button>
												</center>
											</div>
										</s:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="addPdoLayer" style="display: none">
					<form Class="form-horizontal" theme="simple" method="post"
						id="pdoForm" data-toggle="validator" role="form"
						onchange="getMap()">
						<input type="hidden" name="userID"
							value='<s:property value = "userId"/>' /> <input type="hidden"
							name="userId" value='<s:property value = "userId"/>' />
						
						<div class="alert alert-dismissable alert-info">
							
							 <strong><center><h4>
								请选择你要添加的属性.
							</h4>
						</div>
						
						
						<table id="pdo">
							<tr class="form-group">
								<th class="col-sm-2">Key</th>
								<th class="col-sm-8">Value</th>
								<th class="col-sm-2">Operation</th>
							</tr>
							<br>
							<tr class="form-group">
								<td class="col-sm-4">Date</td>
								<td class="col-sm-4"><input type="text"
									data-error="请输入形如xxxx-xx-xx的合法日期"
									pattern="^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1]))"
									Class="form-control" id="addDate" />
									<div class="help-block with-errors"></div></td>
							</tr>
							<br>
							<tr class="form-group">
								<td class="col-sm-4">name</td>
								<td class="col-sm-4"><input type="text" maxlength="10"
									Class="form-control" name="name" />
									<div class="help-block with-errors"></div></td>
							</tr>
							<br>
							<tr class="form-group">
								<td class="col-sm-4">Spend</td>
								<td class="col-sm-4"><input type="number" min=0
									max=10000000000 Class="form-control" id="addSpend" />
									<div class="help-block with-errors"></div></td>
							</tr>
							<br>
							<tr class="form-group">
								<td class="col-sm-4">Place</td>
								<td class="col-sm-4"><input type="text" maxlength="10"
									Class="form-control" id="addPlace" name="infoMap.place" />
									<div class="help-block with-errors"></div></td>
							</tr>
							<br>
						</table>
						<br> <br> <br> <br>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4">

								<button type="button"
									class="btn  btn-lg btn-primary  hvr-shutter-out-vertical"
									onclick="jsonAddPdo()">AddPdo</button>
							</div>
							<div class="col-sm-offset-2 col-sm-4">
								<button type="button"
									class="btn btn-lg btn-primary  hvr-shutter-out-vertical"
									onclick="addRow()">AddRow</button>


							</div>
						</div>
					</form>



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

			//ajax请求导入excel
			function importExcel(){
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
						var msg;
						var obj = JSON.parse(data);
						if (obj.importRes == "emptyHeader"){
							msg="请添加键";
						}else if(obj.importRes == "emptyContent"){
							msg="请添加值！";
						}else if(obj.importRes == "typeError"){
							msg="文件类型只能是xls或者xlsx！";
						}else if(obj.importRes == "fileNotFound"){
							msg="文件不存在！";
						}else if(obj.importRes == "error"){
							msg="上传失败！";
						}else{
							location.reload("true");
                            msg="导入成功！"
						}
						layer.open({
			        		  type: 1,
			        		  title:"ImportMessage",
			        		  skin: 'layui-layer-demo',
			        		  closeBtn: 0,
			        		  anim: 2,
			        		  area:['240px','120px'],
			        		  shadeClose: true,
			        		  content: msg
			        		});

					},
					error : function(e){
						msg="上传失败！";
					}
				});
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
	        			layer.open({
		                    type:1,
		                    title:"AddPdo",
		                    area:['1000px','600px'],
		                    shadeClose:true,
		                    content:$(this).parents('.drawerHead').children('.hiddenGenerateForm')
		                })
	        			$(this).parents('.drawerHead').children('.hiddenGenerateForm').style.display="block";
	        		})
	        	})
	        })
	        //查找pdo抽屉
	        function queryPdoLayer(){
	        	layer.open({
	        		type:1,
	        		title:"queryPdo",
	        		area:['1000px','600px'],
                    shadeClose:true,
                    content:$("#queryPdoLayer")
	        	})
	        }
	        //添加pdo抽屉
	        function addPdoLayer(){
	                layer.open({
	                    type:1,
	                    title:"AddPdo",
	                    area:['1000px','600px'],
	                    shadeClose:true,
	                    content:$("#addPdoLayer")
	                })
	            }
	        var i=3
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
	            cell1.innerHTML='<input type="text" class="form-control" name = "value'+temp+'" id = "value'+temp+'">';
	            cell1.className ="col-sm-4  ";
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
	   function jsonGenerateAddPdo(){
		var formData = new FormData(document.getElementById("generateAddForm"));
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
		
	}
	      
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
            	                  area:['1000px','600px'],
            	                        shadeClose:true,
            	                        content:$("#relatePdoLayer")
            	                })
            	        }
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
		                    content:'没有查询到符合属性的数据'
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
