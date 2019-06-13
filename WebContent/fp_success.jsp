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

<title>重置密码邮件发送成功 | 小型人事工资管理</title>

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
					<p style="color:black;">重置密码邮件已发送至您的密保邮箱，请前往密保邮箱重置密码（<%=request.getParameter("email") %>）！！</p>
					<button id="signup" class="btn btn-info btn-lg btn-block"
						type="button"
						onclick="window.location.href='index.jsp'">首页</button>
					<button id="signup" class="btn btn-info btn-lg btn-block"
						type="button"
						onclick="window.location.href='login.jsp'">登录</button>
					<button id="signup" class="btn btn-info btn-lg btn-block"
						type="button"
						onclick="window.location.href='signup.jsp'">注册</button>

				</div>
			</form>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/particles.min.js"></script>
	<script src="js/app.js"></script>

</body>
</html>