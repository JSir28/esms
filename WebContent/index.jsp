<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.xr.bean.*"%>
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

<title>主页 | 小型人事工资管理系统</title>

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="css/elegant-icons-style.css" rel="stylesheet" />
<link href="css/font-awesome.min.css" rel="stylesheet" />
<!-- owl carousel -->
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
<!-- Custom styles -->
<link rel="stylesheet" href="css/fullcalendar.css">
<link href="css/widgets.css" rel="stylesheet">
<link href="css/loginstyle.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />
<link href="css/xcharts.min.css" rel=" stylesheet">
<link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
</head>
<body class="login-img2-body">
	<!-- container section start -->
	<section id="container" class="">

		<div id="particles-js">
			<header class="header dark-bg">
				<div class="toggle-nav">
					<div class="icon-reorder tooltips"
						data-original-title="Toggle Navigation" data-placement="bottom"></div>
				</div>

				<!--logo start-->
				<a href="index.jsp" class="logo">小型人事工资<span class="lite">管理系统</span></a>
				<!--logo end-->

				<div class="top-nav notification-row">
					<%
						User user = (User) request.getSession().getAttribute("user");
						if (user == null) {
					%>
					<a class="btn btn-primary" href="login.jsp">Login</a> &nbsp;&nbsp;
					<a class="btn btn-success" href="signup.jsp">Sign up</a>
					<%
						} else {
					%>
					<!-- notificatoin dropdown start-->
					<ul class="nav pull-right top-menu">

						<!-- alert notification end-->
						<!-- user login dropdown start-->
						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle" href="#"> <span class="profile-ava">
									<img alt="" src="img/avatar1_small.jpg">
							</span> <span class="username">Welcome Administrator : ${user.username }</span> <b class="caret"></b>
						</a>
							<ul class="dropdown-menu extended logout">
								<li class="eborder-top"><a href="rp.jsp?username=${user.username }"><i
										class="icon_profile"></i> Reset Password</a></li>
								<li><a href="/ESMS/Dologout"><i class="icon_key_alt"></i>
										Log Out</a></li>
							</ul></li>
						<!-- user login dropdown end -->
					</ul>
					<!-- notificatoin dropdown end-->
					<%
						}
					%>
				</div>
			</header>
			<!--header end-->

			<!--sidebar start-->
			<aside>
				<div id="sidebar" class="nav-collapse ">
					<!-- sidebar menu start-->
					<ul class="sidebar-menu">
						<li class="active"><a class="" href="index.jsp"> <i
								class="icon_house_alt"></i> <span>首 页</span>
						</a></li>
						<li class="sub-menu"><a href="javascript:;" class=""> <i
								class="icon_document_alt"></i> <span>企业员工管理</span> <span
								class="menu-arrow arrow_carrot-right"></span>
						</a>
							<ul class="sub">
								<li><a class="" href="entry.jsp">员工入职</a></li>
								<li><a class="" href="emout.jsp">员工离职</a></li>
								<li><a class="" href="emp.jsp">员工信息管理</a></li>
							</ul></li>
						<li class="sub-menu"><a href="javascript:;" class=""> <i
								class="icon_desktop"></i> <span>企业部门管理</span> <span
								class="menu-arrow arrow_carrot-right"></span>
						</a>
							<ul class="sub">
								<li><a class="" href="departch.jsp">部门调动管理</a></li>
								<li><a class="" href="depart.jsp">部门信息管理</a></li>
							</ul></li>
						<li class="sub-menu"><a href="javascript:;" class=""> <i
								class="icon_table"></i> <span>企业职级管理</span> <span
								class="menu-arrow arrow_carrot-right"></span>
						</a>
							<ul class="sub">
								<li><a class="" href="rankch.jsp">职级调动管理</a></li>
								<li><a class="" href="rank.jsp">职级信息管理</a></li>
							</ul></li>
						<li class="sub-menu"><a href="javascript:;" class=""> <i
								class="icon_documents_alt"></i> <span>奖罚工资管理</span> <span
								class="menu-arrow arrow_carrot-right"></span>
						</a>
							<ul class="sub">
								<li><a class="" href="reward.jsp">奖罚信息管理</a></li>
								<li><a class="" href="salarycal.jsp">工资核算</a></li>
								<li><a class="" href="salaryquery.jsp">工资查询</a></li>
							</ul></li>

					</ul>
					<!-- sidebar menu end-->
				</div>
			</aside>
			<!--sidebar end-->
		</div>
	</section>
	<!-- container section start -->
	<!-- javascripts -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui-1.10.4.min.js"></script>
	<script src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
	<!-- bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- nice scroll -->
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<!-- charts scripts -->
	<script src="js/jquery.sparkline.js" type="text/javascript"></script>
	<script src="js/owl.carousel.js"></script>
	<!-- jQuery full calendar -->
	<script src="js/fullcalendar.min.js"></script>
	<!--script for this page only-->
	<script src="js/calendar-custom.js"></script>
	<script src="js/jquery.rateit.min.js"></script>
	<!-- custom select -->
	<script src="js/jquery.customSelect.min.js"></script>

	<!--custome script for all page-->
	<script src="js/scripts.js"></script>
	<!-- custom script for this page-->
	<script src="js/sparkline-chart.js"></script>
	<script src="js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="js/xcharts.min.js"></script>
	<script src="js/jquery.autosize.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/gdp-data.js"></script>
	<script src="js/morris.min.js"></script>
	<script src="js/sparklines.js"></script>
	<script src="js/charts.js"></script>
	<script src="js/jquery.slimscroll.min.js"></script>
	<script src="js/particles.min.js"></script>
	<script src="js/app.js"></script>
</body>
</html>