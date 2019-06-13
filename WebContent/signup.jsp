<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>管理员注册 | 小型人事工资管理</title>

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
			<form class="login-form" action="" method='post' id="register_form"
				name="register_form">
				<div class="login-wrap">
					<p class="login-img">
						<i class="icon_lock_alt"></i>
					</p>
					<div class="input-group">
						<span class="input-group-addon"><i class="icon_profile"></i></span>
						<input id="username" name="username" type="text"
							class="form-control" placeholder="Username" autofocus onkeyup="value=value.replace(/[\u4E00-\u9FA5]/g,'')">
					</div>
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
						<span class="input-group-addon"><i class="icon_mail"></i></span> <input
							id="email" name="email" type="email" class="form-control"
							placeholder="Email Like'***@xyz.com'">
					</div>
					<div class="input-group">
						<p style="font-size: 20px; font-family: 楷体; margin-bottom: 0px"
							id='popDiv'></p>
					</div>
					<div class="input-group">
						<input id="agree" type="checkbox" value="1"> <span>已阅读并同意
						<a data-toggle="modal" data-target="#myModaladd">
						<!-- 按钮触发模态框 -->
						<span class="lan">《使用协议》</span></a></span>
						<!-- 模态框 -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">《使用协议》</h4>
									</div>
									<div class="modal-body">
										<p align="center">使用协议</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">不同意</button>
										<button type="submit" class="btn btn-primary">同意</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					</div>
					<button id="signup" class="btn btn-info btn-lg btn-block"
						type="button" onclick="regcheck(this.form)">Sign up</button>
				</div>
			</form>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/particles.min.js"></script>
	<script src="js/app.js"></script>
	<script>
		function regcheck(register_form) {//传入表单参数
			if (register_form.username.value == "") { //验证用户名是否为空
				document.getElementById("popDiv").innerHTML = "请输入用户名！";
				register_form.password.value = "";
				register_form.checkpassword.value = "";
				register_form.username.focus();
				return false;
			}
			if (register_form.password.value == "") { //验证密码是否为空
				document.getElementById("popDiv").innerHTML = "请输入密码!";
				register_form.password.focus();
				return false;
			}
			if (register_form.checkpassword.value == "") { //验证密码是否为空
				document.getElementById("popDiv").innerHTML = "请输入确认密码! ";
				register_form.checkpassword.focus();
				return false;
			}
			if (register_form.password.value != register_form.checkpassword.value) {
				document.getElementById("popDiv").innerHTML = "两次密码输入不一致！  ";
				register_form.checkpassword.value = "";
				register_form.password.value = "";
				register_form.password.focus();
				return false;
			}
			if (register_form.email.value == "") { //验证邮箱是否为空
				document.getElementById("popDiv").innerHTML = "请输入密保邮箱! ";
				register_form.email.focus();
				return false;
			}
	        var eregexp=/^\w+@\w+\.\w{2,4}$/g;
			if (!register_form.email.value.match(eregexp)) { //验证邮箱格式
				document.getElementById("popDiv").innerHTML = "请输入正确的邮箱格式! ";
				register_form.email.value = "";
				register_form.email.focus();
				return false;
			}
			if (!$("input[type='checkbox']").is(':checked')) {
				document.getElementById("popDiv").innerHTML = "请同意《使用协议》！   ";
				return false;
			}
			register_form.username.value = infilter(register_form.username.value);
			register_form.password.value = infilter(register_form.password.value);
			$
					.ajax({
						url : 'Dosignup',
						type : "post",
						dataType : "json",
						data : {
							"username" : register_form.username.value,
							"password" : register_form.password.value,
							"email" : register_form.email.value
						},
						success : function(data) {
							if (data == -2) {
								document.getElementById("popDiv").innerHTML = "密码过长！ ";
								register_form.checkpassword.value = "";
								register_form.password.value = "";
								register_form.password.focus();
								return false;
							} else if (data == -1) {
								document.getElementById("popDiv").innerHTML = "密码过短！  ";
								register_form.checkpassword.value = "";
								register_form.password.value = "";
								register_form.password.focus();
								return false;
							} else if (data == 0) {
								document.getElementById("popDiv").innerHTML = "该用户名已存在！ ";
								register_form.username.value = "";
								register_form.password.value = "";
								register_form.checkpassword.value = "";
								register_form.email.value = "";
								register_form.username.focus();
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