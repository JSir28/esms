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

<title>管理员登录 | 小型人事工资管理</title>

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" media="screen" rel="stylesheet">
<!-- bootstrap theme -->
<link href="css/bootstrap-theme.css" media="screen" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="css/elegant-icons-style.css" media="screen" rel="stylesheet" />
<link href="css/font-awesome.css" media="screen" rel="stylesheet" />
<!-- Custom styles -->
<link href="css/loginstyle.css" media="screen" rel="stylesheet">
<link href="css/style-responsive.css" media="screen" rel="stylesheet" />
</head>
<body class="login-img2-body">
	<div id="particles-js">
		<div class="container">
			<form class="login-form" action="" method='post' id="loginform"
				name="loginform">
				<div class="login-wrap">
					<p class="login-img">
						<i class="icon_lock_alt"></i>
					</p>
					<div class="input-group">
						<span class="input-group-addon"><i class="icon_profile"></i></span>
						<input id="username" name="username" type="text"
							class="form-control" placeholder="Username" autofocus>
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="icon_key_alt"></i></span>
						<input id="password" name="password" type="password"
							class="form-control" placeholder="Password">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="icon_profile"></i></span>
						<input id="vcode" name="vcode" type="text" class="form-control"
							placeholder="Vcode">
					</div>
					<div class="input-group">
						<p style="font-size: 20px; font-family: 楷体; margin-bottom: 0px"
							id='popDiv'></p>
					</div>
					<div class="input-group">
						<a href="#" id="changeImg" class="pull-right">
							<canvas id="canvas" width="120" height="40"></canvas> 看不清？换一张
						</a>
					</div>
					<label class="checkbox"> <input type="checkbox"
						value="remember-me"> Remember me One Week |<span
						class="pull-right"> <a href="fp.jsp"> Forgot Password?</a>
					</span>
					</label>
					<button id="login" class="btn btn-primary btn-lg btn-block"
						type="button" onclick='logincheck(this.form)'>Login</button>
					<a class="btn btn-info btn-lg btn-block" href="signup.jsp"
						role="button">Sign up</a>
				</div>
			</form>
		</div>



	</div>

	<!-- scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/particles.min.js"></script>
	<script src="js/app.js"></script>
	<script>
		var code;
		/**生成一个随机数**/
		function randomNum(min, max) {
			return Math.floor(Math.random() * (max - min) + min);
		}
		/**生成一个随机色**/
		function randomColor(min, max) {
			var r = randomNum(min, max);
			var g = randomNum(min, max);
			var b = randomNum(min, max);
			return "rgb(" + r + "," + g + "," + b + ")";
		}
		drawPic();
		//按键响应刷新验证码
		document.getElementById("changeImg").onclick = function(e) {
			e.preventDefault();
			drawPic();
		}

		/**绘制验证码图片**/
		function drawPic() {
			var canvas = document.getElementById("canvas");
			var width = canvas.width;
			var height = canvas.height;
			var ctx = canvas.getContext('2d');
			ctx.textBaseline = 'bottom';

			/**绘制背景色**/
			ctx.fillStyle = randomColor(180, 240); //颜色若太深可能导致看不清
			ctx.fillRect(0, 0, width, height);
			/**绘制文字**/
			var str = 'ABCEFGHJKLMNPQRSTWXY123456789';
			code = "";
			for (var i = 0; i < 4; i++) {
				var txt = str[randomNum(0, str.length)];
				code += txt;
				ctx.fillStyle = randomColor(50, 160); //随机生成字体颜色
				ctx.font = randomNum(15, 40) + 'px SimHei'; //随机生成字体大小
				var x = 10 + i * 25;
				var y = randomNum(25, 45);
				var deg = randomNum(-45, 45);
				//修改坐标原点和旋转角度
				ctx.translate(x, y);
				ctx.rotate(deg * Math.PI / 180);
				ctx.fillText(txt, 0, 0);
				//恢复坐标原点和旋转角度
				ctx.rotate(-deg * Math.PI / 180);
				ctx.translate(-x, -y);
			}
			/**绘制干扰线**/
			for (var i = 0; i < 8; i++) {
				ctx.strokeStyle = randomColor(40, 180);
				ctx.beginPath();
				ctx.moveTo(randomNum(0, width), randomNum(0, height));
				ctx.lineTo(randomNum(0, width), randomNum(0, height));
				ctx.stroke();
			}
			/**绘制干扰点**/
			for (var i = 0; i < 100; i++) {
				ctx.fillStyle = randomColor(0, 255);
				ctx.beginPath();
				ctx.arc(randomNum(0, width), randomNum(0, height), 1, 0,
						2 * Math.PI);
				ctx.fill();
			}
		}
	</script>
	<script type="text/javascript">
		function logincheck(loginform) {//传入表单参数
			if (loginform.username.value == "") { //验证用户名是否为空
				document.getElementById("popDiv").innerHTML = "请输入用户名！";
				loginform.password.value = "";
				loginform.username.focus();
				drawPic();
				return false;
			}
			if (loginform.password.value == "") { //验证密码是否为空
				document.getElementById("popDiv").innerHTML = "请输入密码!";
				loginform.password.focus();
				drawPic();
				return false;
			}
			if (loginform.vcode.value.length <= 0) {
				document.getElementById("popDiv").innerHTML = "请输入验证码！";
				drawPic();
				return false;
			} else if (loginform.vcode.value.toUpperCase() != code
					.toUpperCase()) {
				document.getElementById("popDiv").innerHTML = "验证码输入有误！";
				loginform.vcode.value = "";
				loginform.vcode.focus();
				drawPic();
				return false;
			}
			var time = 0;
			if ($("input[type='checkbox']").is(':checked')) {
				time = 60 * 60 * 24 * 7;
			} else {
				time = 60 * 30;
			}
			loginform.username.value = infilter(loginform.username.value);
			loginform.password.value = infilter(loginform.password.value);
			$
					.ajax({
						url : 'Dologin',
						type : "post",
						dataType : "json",
						data : {
							"username" : loginform.username.value,
							"password" : loginform.password.value,
							"time" : time
						},
						success : function(data) {
							if (data == 0) {
								document.getElementById("popDiv").innerHTML = "您输入的用户名或密码有错！";
								loginform.username.value = "";
								loginform.password.value = "";
								loginform.vcode.value = "";
								drawPic();
								loginform.username.focus();
								return false;
							} else if (data == 1) {
								window.location.href = "index.jsp ";//跳转到主页
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