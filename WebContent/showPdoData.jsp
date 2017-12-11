<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Homepage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Baxster Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
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
                            <s:form name = "jumpQuery" action = "actionJumpQuery">
                                    <input type = "hidden" name = "userId" value = '<s:property value = "userId"/>'/>
                                </s:form>
                                <a href="javascript:document:jumpQuery.submit();"><i class="fa fa-book nav_icon"></i>查询数据 </a>

                                <!-- /nav-second-level -->
                            </li>
                            
                           
                            <li>
                                <s:form name = "jumpAdd" action = "actionJumpAdd">
                                    <input type = "hidden" name = "userId" value = '<s:property value = "userId"/>'/>
                                </s:form>
                                <a href="javascript:document:jumpAdd.submit();"><i class="fa fa-th-large nav_icon"></i>添加pdo对象</a>
                            </li>
                            <li>
                                <a  onclick = 'addRelation()' ><i class="fa fa-th-large nav_icon"></i>添加数据关联</a>
                            </li>
							
							
							
							 <li>
							   
									 
								
                                <a href="javascript:document:jumpAdd.submit();"><i class="fa fa-th-large nav_icon"></i>新建PDO<span class="fa arrow"></span></a>
                            		
                            		<ul class="nav nav-second-level collapse">
                                     <s:form id = "fileForm">
									<input type = "hidden" name = "userId" value = '<s:property value = "userId"/>'/>
									<input type = "hidden" name = "excelFileName" id = "fileName"/>
									
                                    <li class="btn btn-default">
								
									  <center><input type = "file" name = "excelFile"
									  onChange="if(this.value)insertTitle(this.value);"  />
									  </center>
                                    </li>
                                    <br/>
                                    <li class="btn btn-default">
                                     
                                       <center><input type = "button" class="btn  btn-default"
                                       value = "submit" onclick="importExcel();" />
                                   </li>
                                   </s:form>
                                </ul>
                                
                            </li>
                            
                            
                            
                            <li>
                                <a href="login.jsp"><i class="fa fa-th-large nav_icon"></i>logout</a>
                            </li>
                            
                            
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
                        <div class="tables">

                     
                            <s:form action = "actionAddRelatePdo.action" id = "relation">
                                <input type="hidden" name="userId" id = "Id" value = '<s:property value = "userId"/>'/>
                                <input type="hidden" name="pdo1" id="pdoId1"/>
                                <input type="hidden" name="pdo2" id="pdoId2"/>
                                </s:form>

                            

                             
                             <s:iterator value = "queryRes" var = "pdo" status = "sta">
                             <table class="table">
                             <thead>
                                <tr>
                                
                                    <!-- 复选框  
                                   <!--  
                                  <td rowspan = "2"><input type = "checkbox" name = "pdoItem" value = '<s:property value = "#pdo.pdoID"/>'></td>
                          			-->
                                  
                                  
                                  
                                  
                                  <s:iterator value="#pdo.infoMap" status="ss" var = "map">
                                  <th><s:property value="%{#map.key}" /></th>
                                  </s:iterator>
                                  <!-- generateFrom 按钮 -->
                                  <td rowspan = "2">
                                        <s:form action = "actionForm">
                                          <input type="hidden" name="userId" value = '<s:property value="#pdo.userID" />'/>
                                          <input type="hidden" name="pdoId" value = '<s:property value="#pdo.pdoID" />'/>
                                          <input type="submit" class="btn btn-primary  hvr-shutter-out-vertical" value="generateForm"/> 
                                       	
                                        </s:form>
                                        </td>
                                 <td rowspan = "2">
                                        <s:form action = "actionShowDetail">
                                          <input type="hidden" name="pdoId" value = '<s:property value="#pdo.pdoID" />'/>
                                          <input type="hidden" name="userId" value = '<s:property value="userId" />'/>
                                          <input type="submit" class="btn btn-primary  hvr-shutter-out-vertical"  value="详细数据"/> 
                                        </s:form>
                                 </td>
                                <tr/>
                             </thead>
                             <tbody>
                                <tr class="danger">
                                    
                                   
                                  <s:iterator value="#pdo.infoMap" status="ss" var = "map">
                                  <th><s:property value="%{#map.value}" /></th>
                                  </s:iterator>
                                    <th></th><th></th>
                                </tr>
                             </tbody>
                             </table>
                             </s:iterator>
                             
                            
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
						var obj = JSON.parse(data);
						if (obj.importRes == "emptyHeader"){
							alert("请添加键");
						}else if(obj.importRes == "emptyContent"){
							alert("请添加值！");
						}else if(obj.importRes == "typeError"){
							alert("文件类型只能是xls或者xlsx！");
						}else if(obj.importRes == "fileNotFound"){
							alert("文件不存在！");
						}else if(obj.importRes == "error"){
							alert("上传失败！");
						}else{
							location.reload("true");
                            alert("导入成功！")
						}
							
					},
					error : function(e){
						alert("上传失败！");
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
