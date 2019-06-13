<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.xr.bean.*"%>
<%@ page import="cn.xr.dao.*"%>
<%@ page import="cn.xr.dao.impl.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	RankDao rdao = new RankDaoImpl();
	DepartDao ddao = new DepartDaoImpl();
	List<Rank> ranklist = rdao.queryAll();
	List<Department> departlist = ddao.queryAll();
	
	request.setAttribute("ranklist", ranklist);
	request.setAttribute("departlist", departlist);
	
	request.setAttribute("path", path);
	request.setAttribute("basePath", basePath);
	
	
%>
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

<title>员工入职 | 小型人事工资管理</title>

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
<link href="css/city-picker.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/fileinput.css" media="all" rel="stylesheet"
	type="text/css" />
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
							<i class="icon_document_alt"></i>EMPLOYEE HIRES
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i> <a href="index.jsp">Home</a>
							</li>
							<li>企业员工管理</li>
							<li>员工入职</li>
						</ol>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading">
								<h3>员工入职信息录入</h3>
							</header>
							<div class="panel-body">
								<div class="form">
									<form class="form-validate form-horizontal" id="register_form"
										method="post" action="/ESMS/Entry">
										<div class="form-group">
											<label for="eimg" class="control-label col-lg-2"> </label> <img
												class="col-lg-10" id="imgMemPhoto" alt="NOT Found"
												style="width: auto; height: auto; max-width: 40%; max-height: 40%;"
												src="images/404.jpg">
										</div>
										<div class="form-group ">
											<label for="ename" class="control-label col-lg-2">员工照片<span
												class="required">*</span></label>
											<div class="col-lg-10" class='btn-file'>
												<input class="form-control" type="text" name="photo"
													id="photo" onfocus="$(this).blur()" value=''/> <input
													class='btn btn-success' style="float: left;" type="button"
													id="buttonUpload" onclick="return ajaxFileUpload();"
													value="上传图片" /> <input class='btn btn-file'
													style="width: 300px; float: left;" id="uploadFileInput"
													type="file" size="45" name="uploadFileInput"
													required="required" />
											</div>
										</div>
										<div class="form-group ">
											<label for="ename" class="control-label col-lg-2">员工姓名
												<span class="required">*</span>
											</label>
											<div class="col-lg-10">
												<input class="form-control" id="ename" name="ename"
													type="text" placeholder="请输入员工姓名..." required />
											</div>
										</div>
										<div class="form-group ">
											<label for="sex" class="control-label col-lg-2">员工性别
												<span class="required">*</span>
											</label>
											<div class="col-lg-10">
												<select name="sex" id="sex" class="form-control m-bot15"
													required>
													<option value=''>请选择性别...</option>
													<option value='男'>男</option>
													<option value='女'>女</option>
												</select>
											</div>
										</div>
										<div class="form-group ">
											<label for="birthday" class="control-label col-lg-2">出生日期
												<span class="required">*</span>
											</label>
											<div class="col-lg-10">
												<div class="input-group date form_date" data-date=""
													data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
													data-link-format="yyyy-mm-dd">
													<input id='birthday' name="birthday" class="form-control"
														size="16" type="text" placeholder="请选择出生日期..." required
														onfocus="$(this).blur()"> <span
														class="input-group-addon"> <span
														onclick="removebirtime()"
														class="glyphicon glyphicon-remove-circle"></span>
													</span> <span class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"> </span>
													</span>
												</div>
											</div>
										</div>
										<div class="form-group ">
											<label for="education" class="control-label col-lg-2">教育层次
												<span class="required">*</span>
											</label>
											<div class="col-lg-10">
												<select name="education" id="education"
													class="form-control m-bot15" required>
													<option value=''>请选择教育层次...</option>
													<option value='小学'>小学</option>
													<option value='初中'>初中</option>
													<option value='高中'>高中</option>
													<option value='专科'>专科</option>
													<option value='本科'>本科</option>
													<option value='硕士研究生'>硕士研究生</option>
													<option value='博士研究生'>博士研究生</option>
													<option value='博士后研究生'>博士后研究生</option>
												</select>
											</div>
										</div>
										<div class="form-group ">
											<label for="telephone" class="control-label col-lg-2">联系电话
												<span class="required">*</span>
											</label>
											<div class="col-lg-10">
												<input class="form-control" id="telephone" name="telephone"
													type="text" oninput="value=value.replace(/[^\d]/g,'')" maxlength='12'
													required placeholder="请输入员工联系电话..."/>
											</div>
										</div>
										<div class="form-group ">
											<label for="address" class="control-label col-lg-2">家庭住址
												<span class="required">*</span>
											</label>
											<div class="col-lg-10">
												<input id="address" name='address' class="form-control"
													onfocus="$(this).blur()" type="text"
													data-toggle="city-picker" required>
											</div>
										</div>
										<div class="form-group ">
											<label for="department" class="control-label col-lg-2">入职部门
												<span class="required">*</span>
											</label>
											<div class="col-lg-10">
												<select name="department" id="department"
													class="form-control m-bot15" required>
													<option value=''>请选择入职部门...</option>
													<c:forEach items="${departlist }" var="departlist">
														<option value='${departlist.dname }'>${departlist.dname }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group ">
											<label for="rank" class="control-label col-lg-2">入职职级
												<span class="required">*</span>
											</label>
											<div class="col-lg-10">
												<select name="rank" id="rank" class="form-control m-bot15"
													required>
													<option value=''>请选择入职职级...</option>
													<c:forEach items="${ranklist }" var="ranklist">
														<option value='${ranklist.rname }'>${ranklist.rname }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group ">
											<label for="entrydate" class="control-label col-lg-2">入职日期
												<span class="required">*</span>
											</label>
											<div class="col-lg-10">
												<div class="input-group date form_date" data-date=""
													data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
													data-link-format="yyyy-mm-dd">
													<input id='entrydate' name="entrydate" class="form-control"
														size="16" type="text" onfocus="$(this).blur()" required placeholder="请选择员工入职日期...">
													<span class="input-group-addon"> <span
														onclick="removeintime()"
														class="glyphicon glyphicon-remove-circle"></span>
													</span> <span class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"> </span>
													</span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-offset-2 col-lg-10">
												<button class="btn btn-primary" type="submit" >保存提交</button>
												<button class="btn btn-default" type="button"
													onclick="window.location.reload()">重置</button>
											</div>
										</div>
									</form>
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
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- nicescroll -->
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<!--custome script for all page-->
	<script src="js/scripts.js"></script>
	<script src="js/city-picker.data.js"></script>
	<script src="js/city-picker.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/ajaxfileupload.js"></script>
	<script type="text/javascript">
		$('.form_date').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0,
			endDate : new Date()
		});
	</script>

	<script type="text/javascript">
		function removeintime() {
			document.getElementById("entrydate").value = "";
		}
	</script>

	<script type="text/javascript">
		function removebirtime() {
			document.getElementById("birthday").value = "";
		}
	</script>

	<script type="text/javascript">
		function ajaxFileUpload() {

			$("#loading").ajaxStart(function() {
				$(this).show();
			})//开始上传文件时显示一个图片
			.ajaxComplete(function() {
				$(this).hide();
			});//文件上传完成将图片隐藏起来

			$.ajaxFileUpload({
				url : '${basePath}Fileupload', //需要链接到服务器地址
				secureuri : false,
				fileElementId : 'uploadFileInput', //文件选择框的id属性
				dataType : 'json', //服务器返回的格式，可以是json
				success : function(data, status) //相当于java中try语句块的用法
				{
					$('#photo').val(data.fileName);
					$("#imgMemPhoto").attr("src", "./" + data.fileName);

				}
			});
		}
	</script>

</body>
</html>
