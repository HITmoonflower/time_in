<!DOCTYPE HTML>
<html>
<head>
<title>Signup</title>
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
<!--webfonts-->
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!-- js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
</head> 
<body class="login-bg">
		<div class="login-body">
			<div class="login-heading">
				<h1>Sign up</h1>
			</div>
			<div class="login-info">
			
				<form id = "setupForm" action = "actionRegister.action" data-toggle="validator" role="form" method = "post">

					<div class="form-group">
					  <label for="inputUserID" class="control-label">UserID</label>
					  
					  
					   <input type="number" maxlength="10" class="form-control" id="inputUserID" name="user.userId" required>
					     <div class="help-block with-errors" ></div>
					   </div>		   
					  <div class="form-group">
					  <label for="inputPassword" class="control-label">Password</label>
					   <input type="password"  maxlength="10"  class="form-control" id="inputUserID" name="user.password" required>
					     <div class="help-block with-errors" ></div>
					   </div>




					<input type="submit" name="Sign In" value="Sign up">
					<div class="signup-text">
						<a href="login.jsp">Already have an account? Login here.</a>
					</div>
				
				</form>
				
			</div>
		</div>
		<div class="go-back login-go-back">
				<a href="index.html">Go To Home</a>
			</div>
		<div class="copyright login-copyright error-copyright">
           <p>Copyright &copy; 2017.HITmoonflower All rights reserved.</p>    
		</div>
	    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>		
       
       
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script>
        $.validate({
        	form : '#setupForm',
        	modules : 'security,html5'
        });
        </script>
</body>
</html>