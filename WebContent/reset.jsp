<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="img/favicon.png">

<title>重置密码 | 小型人事工资管理</title>

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="css/elegant-icons-style.css" rel="stylesheet" />
<link href="css/font-awesome.css" rel="stylesheet" />
<!-- Custom styles -->
<link href="css/loginstyle.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-img2-body">
	<div id="particles-js">
		<div class="container">
			<form class="login-form" action="" method='post' id="resform"
				name="resform">
				<div class="login-wrap">
					<p class="login-img">
						<i class="icon_lock_alt"></i>
					</p>
					<input type="hidden" name='username' id='username' value=<%=request.getParameter("username") %>>
					<div class="input-group">
						<span class="input-group-addon"><i class="icon_key_alt"></i></span>
						<input id="password" name="password" type="password"
							class="form-control" placeholder="Password : Length 6-20">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="icon_key_alt"></i></span>
						<input id="checkpassword" name="checkpassword" type="password"
							class="form-control" placeholder="Check Password">
					</div>
					<div class="input-group">
						<p style="font-size: 20px; font-family: 楷体; margin-bottom: 0px"
							id='popDiv'></p>
					</div>
					<button id="signup" class="btn btn-info btn-lg btn-block"
						type="button" onclick="rescheck(this.form)">Reset Password</button>
				</div>
			</form>
		</div>
	</div>

	<script src="js/jquery.js"></script>
	<script src="js/particles.min.js"></script>
	<script src="js/app.js"></script>
	<script>
		function rescheck(resform) {//传入表单参数
			console.log(resform.username.value)
			if (resform.password.value == "") { //验证密码是否为空
				document.getElementById("popDiv").innerHTML = "请输入密码!";
				resform.password.focus();
				return false;
			}
			if (resform.checkpassword.value == "") { //验证密码是否为空
				document.getElementById("popDiv").innerHTML = "请输入确认密码! ";
				resform.checkpassword.focus();
				return false;
			}
			if (resform.password.value != resform.checkpassword.value) {
				document.getElementById("popDiv").innerHTML = "两次密码输入不一致！  ";
				resform.checkpassword.value = "";
				resform.password.value = "";
				resform.password.focus();
				return false;
			}
			resform.username.value = infilter(resform.username.value);
			resform.password.value = infilter(resform.password.value);
			$.ajax({
						url : 'Reset',
						type : "post",
						dataType : "json",
						data : {
							"username" : resform.username.value,
							"password" : resform.password.value,
						},
						success : function(data) {
							if (data == -2) {
								document.getElementById("popDiv").innerHTML = "密码过长！ ";
								resform.checkpassword.value = "";
								resform.password.value = "";
								resform.password.focus();
								return false;
							} else if (data == -1) {
								document.getElementById("popDiv").innerHTML = "密码过短！  ";
								resform.checkpassword.value = "";
								resform.password.value = "";
								resform.password.focus();
								return false;
							} else if (data == 0) {
								document.getElementById("popDiv").innerHTML = "密码重置失败！  ";
								resform.checkpassword.value = "";
								resform.password.value = "";
								resform.password.focus();
								return false;
							} else {
								window.location.href = "login.jsp ";//跳转到登录界面
							}
						}
					});
		}
	</script>
	<script type="text/javascript">
		//HTML标签过滤
		function infilter(msg) {
			var msg = msg.replace(/<\/?[^>]*>/g, ''); //去除HTML Tag
			msg = msg.replace(/[|]*\n/, '') //去除行尾空格
			msg = msg.replace(/&npsp;/ig, ''); //去掉npsp
			return msg;
		}
	</script>
</body>
</html>