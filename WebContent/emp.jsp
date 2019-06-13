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

<title>员工信息修改 | 小型人事工资管理</title>

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
						</span> <span class="username">Welcome Administrator :
								${user.username }</span> <b class="caret"></b>
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
							<i class="icon_document_alt"></i>EMPLOYEE MANAGEMENT
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i> <a href="index.jsp">Home</a>
							</li>
							<li>企业员工管理</li>
							<li>员工信息管理</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<form class="input-group" action="/ESMS/Emlookup" method='post'>
							<input name='str' id="str" type="text" class="form-control"
								placeholder="输入姓名/部门名称、职级名称，查询员工信息..." value="${str == null ? '':str }"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">Go!</button>
							</span>
						</form>
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.row -->
				<br />
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<header class="panel-heading">
								<h3>员工信息</h3>
							</header>
							<div class="row">
								<div class="col-lg-12">
									<section class="panel table-responsive">
										<table class="table table-striped table-advance table-hover">
											<tbody>
												<tr>
													<th><i class="glyphicon glyphicon-camera"></i> 员工照片</th>
													<th><i class="icon_profile"></i> 员工工号</th>
													<th><i class="icon_profile"></i> 员工姓名</th>
													<th><i class="icon_profile"></i> 员工性别</th>
													<th><i class="glyphicon glyphicon-calendar"></i> 出生日期</th>
													<th><i class="glyphicon glyphicon-bookmark"></i> 教育层次</th>
													<th><i class="icon_mobile"></i> 联系电话</th>
													<th><i class="glyphicon glyphicon-home"></i> 家庭住址</th>
													<th><i class="icon_desktop"></i> 员工部门</th>
													<th><i class="icon_table"></i> 员工职级</th>
													<th><i class="icon_table"></i> 在职状态</th>
													<th><i class="glyphicon glyphicon-time"></i> 入职时间</th>
													<th><i class="glyphicon glyphicon-time"></i> 离职时间</th>
													<th><i class="icon_cogs"></i> 更新信息</th>
												</tr>
												<c:if test="${!empty emlist}">
													<c:forEach items="${emlist }" var="emlist">
														<tr>
															<td><img alt='我是${emlist.ename }' src="${emlist.imgsrc }" style="width:45px;"></td>
															<td>${emlist.eno }</td>
															<td>${emlist.ename }</td>
															<td>${emlist.esex }</td>
															<td>${emlist.ebir }</td>
															<td>${emlist.eedu }</td>
															<td>${emlist.etel }</td>
															<td>${emlist.eaddr }</td>
															<td>${emlist.dname }</td>
															<td>${emlist.rname }</td>
															<td>${emlist.estate }</td>
															<td>${emlist.eintime }</td>
															<td>${emlist.eouttime }</td>
															<td>
																<div class="btn-group">
																	<c:if test="${!empty emlist.eouttime}">
																		<!-- 按钮触发模态框 -->
																		<form action="/ESMS/Emdelete" method='post'>
																		<input type="hidden" id='outenodel' name='outenodel' value=${emlist.eno }>
																			<button class="btn btn-danger" type='submit' onclick="delcfm()">
																				<i class="icon_close_alt2"></i>
																			</button>
																		</form>
																	</c:if>
																	<c:if test="${empty emlist.eouttime}">
																		<!-- 按钮触发模态框 -->
																		<button class="btn btn-success" data-toggle="modal"
																			data-target="#myModal" onclick='openaddmodal(this)'>
																			<i class="glyphicon glyphicon-pencil"></i>
																		</button>
																	</c:if>

																	<!-- 模态框 -->
																	<form method="post" action="/ESMS/Emupdate"
																		class="form-horizontal" role="form" id="myForm">
																		<div class="modal fade" id="myModal" tabindex="-1"
																			role="dialog" aria-labelledby="myModalLabel"
																			aria-hidden="true">
																			<div class="modal-dialog">
																				<div class="modal-content">
																					<div class="modal-header">
																						<button type="button" class="close"
																							data-dismiss="modal" aria-hidden="true">×</button>
																						<h4 class="modal-title" id="myModalLabel">
																							员工个人信息修改</h4>
																					</div>
																					<div class="modal-body">
																						<div class="form-group ">
																							<label for="eno" class="control-label col-lg-2">员工工号
																							</label>
																							<div class="col-lg-10">
																								<input class=" form-control" id="eno" name="eno"
																									type="text" readonly />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="ename" class="control-label col-lg-2">员工姓名
																							</label>
																							<div class="col-lg-10">
																								<input class=" form-control" id="ename"
																									name="ename" type="text" required />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="sex" class="control-label col-lg-2">员工性别
																							</label>
																							<div class="col-lg-10">
																								<input class="form-control" id="sex" name="sex"
																									type="text" readonly />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="birthday"
																								class="control-label col-lg-2">出生日期 </label>
																							<div class="col-lg-10">
																								<div class="input-group date form_date"
																									data-date="" data-date-format="yyyy-mm-dd"
																									data-link-field="dtp_input2"
																									data-link-format="yyyy-mm-dd">
																									<input id='birthday' name="birthday"
																										class="form-control" size="16" type="text"
																										value="" required onfocus="$(this).blur()">
																									<span class="input-group-addon"> <span
																										onclick="removebirtime()"
																										class="glyphicon glyphicon-remove-circle"></span>
																									</span> <span class="input-group-addon"> <span
																										class="glyphicon glyphicon-calendar"> </span>
																									</span>
																								</div>
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="education"
																								class="control-label col-lg-2">教育层次 </label>
																							<div class="col-lg-10">
																								<select name="education" id="education"
																									class="form-control m-bot15" required>
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
																							<label for="telephone"
																								class="control-label col-lg-2">联系电话 </label>
																							<div class="col-lg-10">
																								<input class="form-control" id="telephone"
																									name="telephone" type="text"
																									oninput="value=value.replace(/[^\d]/g,'')"
																									required maxlength='12' />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="address"
																								class="control-label col-lg-2">家庭住址 </label>
																							<div class="col-lg-10">
																								<div class="input-group">
																									<input id="address" name='address'
																										style="width: 23.5%;" class="form-control"
																										onfocus="$(this).blur()" type="text"
																										data-toggle="city-picker" required>
																								</div>
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="department"
																								class="control-label col-lg-2">入职部门 </label>
																							<div class="col-lg-10">
																								<input type="text" name="department"
																									id="department" class="form-control" readonly>
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="rank" class="control-label col-lg-2">入职职级

																							</label>
																							<div class="col-lg-10">
																								<input type="text" name="rank" id="rank"
																									class="form-control" readonly>
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="entrydate"
																								class="control-label col-lg-2">入职日期 </label>
																							<div class="col-lg-10">
																								<div class="input-group date form_date"
																									data-date="" data-date-format="yyyy-mm-dd"
																									data-link-field="dtp_input2"
																									data-link-format="yyyy-mm-dd">
																									<input id='entrydate' name="entrydate"
																										class="form-control" size="16" type="text"
																										value="" onfocus="$(this).blur()" required>
																									<span class="input-group-addon"> <span
																										onclick="removeintime()"
																										class="glyphicon glyphicon-remove-circle"></span>
																									</span> <span class="input-group-addon"> <span
																										class="glyphicon glyphicon-calendar"> </span>
																									</span>
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
												<c:if test="${empty emlist}">
													<tr>
														<td width='100%' colspan='15'>请核对输入的员工姓名或部门名称或职级名称，重新查询员工信息！</td>
													</tr>
												</c:if>
											</tbody>
										</table>
										<table class="table table-striped table-advance table-hover">
											<tr>
												<td>共 ${page.totalCount} 条记录，当前为第 ${page.currentPage}
													页,共 ${page.totalPage} 页</td>
												<td><c:choose>
														<c:when test="${page.hasPrePage}">
															<a href="/ESMS/Emlookup?str=${str }&currentPage=1">首页</a> | 
																<a
																href="/ESMS/Emlookup?str=${str }&currentPage=${page.currentPage-1 }">上一页</a>
														</c:when>
														<c:otherwise> 首页 | 上一页 </c:otherwise>
													</c:choose> <c:choose>
														<c:when test="${page.hasNextPage}">
															<a
																href="/ESMS/Emlookup?str=${str }&currentPage=${page.currentPage+1 }">下一页</a> | 
	   															<a
																href="/ESMS/Emlookup?str=${str }&currentPage=${page.totalPage }">尾页</a>
														</c:when>
														<c:otherwise> 下一页 | 尾页 </c:otherwise>
													</c:choose> 跳转到<input style="width: 40px;" type="text" id='gopage' />页
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
	<script>
		function openaddmodal(obj) {
			$("#myModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			id = $td.eq(1).text();
			$('#eno').val(id);
			id = $td.eq(2).text();
			$('#ename').val(id);
			id = $td.eq(3).text();
			$('#sex').val(id);
			id = $td.eq(4).text();
			$('#birthday').val(id);
			id = $td.eq(5).text();
			$('#education').val(id);
			id = $td.eq(6).text();
			$('#telephone').val(id);
			id = $td.eq(7).text();
			$('#address').val(id);
			id = $td.eq(8).text();
			$('#department').val(id);
			id = $td.eq(9).text();
			$('#rank').val(id);
			id = $td.eq(11).text();
			$('#entrydate').val(id);
		}
	</script>
	<script type="text/javascript">
		function GoPage() {
			var gopage = document.getElementById("gopage").value;
			if (gopage == null || gopage <= 0) {
				gopage = 1;
			} else if (gopage > "${page.totalPage}") {
				gopage = "${page.totalPage}";
			}
			var url = "/ESMS/Emlookup?str=${str }&currentPage=" + gopage;

			window.location.href = url;
		}
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
		function delcfm() {
			if (!confirm("确认要删除？")) {
				window.event.returnValue = false;
			}
		}
	</script>
</body>
</html>
