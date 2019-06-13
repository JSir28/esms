<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.xr.bean.*"%>
<%@ page import="cn.xr.dao.*"%>
<%@ page import="cn.xr.dao.impl.*"%>
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

<title>职级信息管理 | 小型人事工资管理</title>

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
<script type="text/javascript">
	query();
	function query() {
		if ('${ranklist}' == null || '${ranklist}' == "") {
			window.location.href = "/ESMS/Rankquery";
		}
	}
</script>
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
							<i class="icon_table"></i>RANK MANAGENBET
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i> <a href="index.jsp">Home</a>
							</li>
							<li>企业职级管理</li>
							<li>职级信息管理</li>
						</ol>
					</div>
				</div>


				<br />
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<header class="panel-heading">
								<h3>
									员工信息
									<button class="btn btn-success" style="float:right;" data-toggle="modal"
										data-target="#myModaladd">
										<i class="icon_plus_alt2"></i>
									</button>
								</h3>
									<!-- 模态框 -->
									<form method="post" action="/ESMS/Rankadd" class="form-horizontal" role="form" id="myForm">
										<div class="modal fade" id="myModaladd" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel">企业职级信息增加</h4>
													</div>
													<div class="modal-body">
														<div class="form-group ">
															<label for="rnameadd" class="control-label col-lg-2">职级名称
															</label>
															<div class="col-lg-10">
																<input name="rnameadd" class="form-control" id="rnameadd"
																	type="text" required>
															</div>
														</div>

														<div class="form-group ">
															<label for="rsaladd" class="control-label col-lg-2">职级工资
															</label>
															<div class="col-lg-10">
																<input class="form-control" id="rsaladd" name="rsaladd"
																	type="text" oninput="value=value.replace(/[^\d]/g,'')"
																	required>
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">关闭</button>
														<button type="submit" class="btn btn-primary">
															提交更改</button>
													</div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
										</div>
									</form>
									<!-- /.modal -->
							</header>
							<div class="row">
								<div class="col-lg-12">
									<section class="panel table-responsive">
										<table class="table table-striped table-advance table-hover">
											<tbody>
												<tr>
													<th><i class="icon_table"></i> 职级编号</th>
													<th><i class="icon_table"></i> 职级名称</th>
													<th><i class="icon_table"></i> 职级工资</th>
													<th><i class="icon_cogs"></i> 选择</th>
												</tr>

												<c:if test="${!empty ranklist}">
													<c:forEach items="${ranklist }" var="list">
														<tr>
															<td>${list.rno }</td>
															<td>${list.rname }</td>
															<td>${list.rsal }</td>
															<td>
																<div class="btn-group">
																	<form action="/ESMS/Rankdel" method='post'>
																		<input type='hidden' name='rnodel' value=${list.rno }>
																		<!-- 按钮触发模态框 -->
																		<button class="btn btn-success" data-toggle="modal"
																			data-target="#myModalup" onclick='openaddmodal(this)'>
																			<i class="glyphicon glyphicon-pencil"></i>
																		</button>
																		<button class="btn btn-danger" type="submit"
																			onclick="delcfm()">
																			<i class="icon_close_alt2"></i>
																		</button>
																	</form>
																	<!-- 模态框 -->
																	<form method="post" action="/ESMS/Rankupdate"
																		class="form-horizontal" role="form" id="myForm">
																		<div class="modal fade" id="myModalup" tabindex="-1"
																			role="dialog" aria-labelledby="myModalLabel"
																			aria-hidden="true">
																			<div class="modal-dialog">
																				<div class="modal-content">
																					<div class="modal-header">
																						<button type="button" class="close"
																							data-dismiss="modal" aria-hidden="true">×</button>
																						<h4 class="modal-title" id="myModalLabel">
																							企业职级信息修改</h4>
																					</div>
																					<div class="modal-body">
																						<div class="form-group ">
																							<label for="rnoch" class="control-label col-lg-2">职级编号
																							</label>
																							<div class="col-lg-10">
																								<input name="rnoup" class="form-control"
																									id="rnoup" type="text" onfocus="$(this).blur()">
																							</div>
																						</div>

																						<div class="form-group ">
																							<label for="rnameup"
																								class="control-label col-lg-2">职级名称</label>
																							<div class="col-lg-10">
																								<input name="rnameup" class="form-control"
																									id="rnameup" type="text" required>
																							</div>
																						</div>

																						<div class="form-group ">
																							<label for="rsalup"
																								class="control-label col-lg-2">职级工资 </label>
																							<div class="col-lg-10">
																								<input class="form-control" id="rsalup"
																									name="rsalup" type="text"
																									oninput="value=value.replace(/[^\d]/g,'')"
																									required>
																							</div>
																						</div>
																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-default"
																							data-dismiss="modal">关闭</button>
																						<button type="submit" class="btn btn-primary">
																							提交更改</button>
																					</div>
																				</div>
																				<!-- /.modal-content -->
																			</div>
																			<!-- /.modal-dialog -->
																		</div>
																	</form>
																	<!-- /.modal -->
																</div>
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
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
	<!-- nice scroll -->
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
	<!-- 获取表的数据到模态框 -->
	<script>
		function openaddmodal(obj) {
			$("#myModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			id = $td.eq(0).text();
			$('#rnoup').val(id);
			id = $td.eq(1).text();
			$('#rnameup').val(id);
			id = $td.eq(2).text();
			$('#rsalup').val(id);

		}
	</script>
	<script type="text/javascript">
		function delcfm() {
			if (!confirm("确认要删除？")) {
				window.event.returnValue = false;
			}
		}
	</script>
</body>

</html>