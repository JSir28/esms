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

<title>忘记密码 | 小型人事工资管理</title>

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
					<p style="color: black;">正在发送重置密码邮件，请稍后...</p>
					<%
						request.getSession().removeAttribute("user");
					%>
				</div>
			</form>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/particles.min.js"></script>
	<script src="js/app.js"></script>

	<script type="text/javascript">
		setTimeout("rescheck()", 1000);
		function rescheck() {//传入表单参数
			$.ajax({
						url : 'Sendfpemail',
						type : "post",
						dataType : "json",
						data : {
							"username" : '<%=request.getParameter("username")%>'
						},
						success : function(data) {
							window.location.href = "fp_success.jsp?email=" + data.email;//跳转到邮件发送成功界面
						}
					});
		}
	</script>
</body>
</html>