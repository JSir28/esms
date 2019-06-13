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
					<div class="input-group">
						<span class="input-group-addon"><i class="icon_profile"></i></span>
						<input id="username" name="username" type="text"
							class="form-control" placeholder="Username" autofocus>
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
					<button id="signup" class="btn btn-info btn-lg btn-block"
						type="button" onclick="rescheck(this.form)">Send Email To Reset Password</button>
				</div>
			</form>
		</div>
	</div>

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
	<script>
		function rescheck(resform) {//传入表单参数
			//cleartime();
			if (resform.username.value == "") { //验证用户名是否为空
				document.getElementById("popDiv").innerHTML = "请输入用户名！";
				resform.username.focus();
				return false;
			}
			if (resform.vcode.value.length <= 0) {
				document.getElementById("popDiv").innerHTML = "请输入验证码！";
				drawPic();
				return false;
			} else if (resform.vcode.value.toUpperCase() != code.toUpperCase()) {
				document.getElementById("popDiv").innerHTML = "验证码输入有误！";
				resform.vcode.value = "";
				resform.vcode.focus();
				drawPic();
				return false;
			}
			resform.username.value = infilter(resform.username.value);
			$.ajax({
						url : 'Sendfpemail',
						type : "post",
						dataType : "json",
						data : {
							"username" : resform.username.value
						},
						success : function(data) {
							if(data.flag == 0){
								document.getElementById("popDiv").innerHTML = "您输入的用户名不存在！";
								resform.username.value = "";
								resform.vcode.value = "";
								drawPic();
								resform.username.focus();
								return false;
							}
							else{
								window.location.href = "fp_success.jsp?email=" + data.email;//跳转到邮件发送成功界面
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