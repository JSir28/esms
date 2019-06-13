<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.xr.bean.*"%>
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

<title>工资核算 | 小型人事工资管理</title>

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="css/elegant-icons-style.css" rel="stylesheet" />
<link href="css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
</head>
<body>
	<!-- container section start -->
	<section id="container" class="">

		<header class="header dark-bg">
			<div class="toggle-nav">
				<div class="icon-reorder tooltips"
					data-original-title="Toggle Navigation" data-placement="bottom"></div>
			</div>

			<!--logo start-->
			<a href="index.jsp" class="logo">小型人事工资<span class="lite">管理系统</span></a>
			<!--logo end-->

			<div class="top-nav notification-row">
				<!-- notificatoin dropdown start-->
				<ul class="nav pull-right top-menu">
					<!-- alert notification end-->
					<!-- user login dropdown start-->
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt="" src="img/avatar1_small.jpg">
						</span> <span class="username">Welcome Administrator : ${user.username }</span>
							<b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<li class="eborder-top"><a href="reset.jsp"><i
									class="icon_profile"></i> Reset Password</a></li>
							<li><a href="/ESMS/Dologout"><i class="icon_key_alt"></i>
									Log Out</a></li>
						</ul></li>
					<!-- user login dropdown end -->
				</ul>
				<!-- notificatoin dropdown end-->
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

		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="icon_documents_alt"></i>Salary Calculation
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i> <a href="index.jsp">Home</a>
							</li>
							<li>奖罚工资管理</li>
							<li>工资核算</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<form action="/ESMS/Salcalua" method='post'>
							<div class="input-group date form_date" data-date=""
								data-date-format="yyyy-mm" data-link-field="dtp_input2"
								data-link-format="yyyy-mm">
								<input class="form-control" type="text" id="saltime" name='saltime' placeholder="请输入所核算工资表年月，开始计算..."
									onfocus="$(this).blur()"> <span class="input-group-addon"><span onclick="removetime()"
									class="glyphicon glyphicon-remove-circle"></span></span> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span> <span
									class="input-group-btn">
									<button class="btn btn-default" type="submit">Go!</button>
								</span>
							</div>
						</form>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.row -->
				<br />
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<header class="panel-heading">
								<h3>工资计算结果列表</h3>
							</header>
							<div class="row">
								<div class="col-lg-12">
									<section class="panel table-responsive">
										<table class="table table-striped table-advance table-hover">
											<tbody>
												<tr>
													<th>工资表月份</th>
													<th>员工工号</th>
													<th>员工姓名</th>
													<th>员工部门</th>
													<th>员工职级</th>
													<th>职级基础工资</th>
													<th>奖励工资</th>
													<th>扣罚工资</th>
													<th>五险一金</th>
													<th>应发工资</th>
													<th>个人所得税</th>
													<th>实发工资</th>
													<th>选择</th>
												</tr>
												<c:if test="${!empty salmolist}">
													<c:forEach items="${salmolist }" var="salmolist">
														<tr>
															<td>${salmolist.saltime }</td>
															<td>${salmolist.eno }</td>
															<td>${salmolist.ename }</td>
															<td>${salmolist.dname }</td>
															<td>${salmolist.rname }</td>
															<td>${salmolist.salbase }</td>
															<td>${salmolist.salreward }</td>
															<td>${salmolist.salpunish }</td>
															<td>${salmolist.insu_fund }</td>
															<td>${salmolist.salall }</td>
															<td>${salmolist.pertax }</td>
															<td>${salmolist.salactual }</td>
															<td>
																<div class="btn-group">
																	<a class="btn btn-success" href="#"><i
																		class="icon_check_alt2"></i></a>
																</div>
															</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${empty salmolist}">
													<tr>
														<td width='100%' colspan='13'>没有查询到本月份的工资信息！</td>
													</tr>
												</c:if>
											</tbody>
										</table>
										<table class="table table-striped table-advance table-hover">
											<tr>
												<td>共 ${page.totalCount} 条记录，当前为第 ${page.currentPage} 页,共 ${page.totalPage} 页</td>
												<td><c:choose>
														<c:when test="${page.hasPrePage}">
															<a href="/ESMS/Salcalua?saltime=${saltime }&currentPage=1">首页</a> | 
															<a href="/ESMS/Salcalua?saltime=${saltime }&currentPage=${page.currentPage-1 }">上一页</a>
														</c:when>
														<c:otherwise> 首页 | 上一页 </c:otherwise>
													</c:choose> <c:choose>
														<c:when test="${page.hasNextPage}">
															<a href="/ESMS/Salcalua?saltime=${saltime }&currentPage=${page.currentPage+1 }">下一页</a> | 
	   														<a href="/ESMS/Salcalua?saltime=${saltime }&currentPage=${page.totalPage }">尾页</a>
														</c:when>
														<c:otherwise> 下一页 | 尾页 </c:otherwise>
													</c:choose> 跳转到<input style="width: 40px" type="text" id='gopage' />页
													<button onclick='GoPage()' class='btn btn-success'>GO</button>
												</td>
											</tr>
										</table>
									</section>
								</div>
							</div>
						</section>
					</div>
				</div>

			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- container section end -->
	<!-- javascripts -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- nicescroll -->
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<!--custome script for all page-->
	<script src="js/scripts.js"></script>
	<!-- jquery validate js -->
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<!-- custom form validation script for this page-->
	<script src="js/form-validation-script.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_date').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 3,
			minView : 3,
			forceParse : 0,
			endDate : new Date()
		});
	</script>
	<script type="text/javascript">
		function GoPage() {
			var gopage = document.getElementById("gopage").value;
			if (gopage == null || gopage <= 0) {
				gopage = 1;
			} else if (gopage > "${page.totalPage}") {
				gopage = "${page.totalPage}";
			}
			var url = "/ESMS/Salcalua?saltime=${saltime }&currentPage=" + gopage;

			window.location.href = url;
		}
	</script>
	
	<script type="text/javascript">
		function removetime() {
			 $("#saltime").val("");
		}
	</script>
	

</body>

</html>