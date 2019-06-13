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

<title>奖罚信息管理 | 小型人事工资管理</title>

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
							<i class="icon_documents_alt"></i>Reward
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i> <a href="index.jsp">Home</a>
							</li>
							<li>奖罚工资管理</li>
							<li>奖罚信息管理</li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6">
						<form class="input-group" action="/ESMS/Emquery" method='post'>
							<input type="hidden" name='type' value='rew' /> <input
								name='Ename' id='Ename' type="text" class="form-control"
								placeholder="输入姓名，查询员工信息..."> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">Go!</button>
							</span>
						</form>
						<br />
						<form class="input-group" action="/ESMS/Requery" method='post'>
							<input name='rekey' id='rekey' type="text" class="form-control"
								placeholder="输入关键字，查询奖惩信息..."> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">Go!</button>
							</span>
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
													<th><i class="icon_desktop"></i> 员工部门</th>
													<th><i class="icon_table"></i> 员工职级</th>
													<th><i class="icon_mobile"></i> 联系电话</th>
													<th><i class="icon_cogs"></i> 选择</th>
												</tr>
												<c:if test="${!empty emlist}">
													<c:forEach items="${emlist }" var="emlist">
														<tr>
															<td><img alt='我是${emlist.ename }'
																src="${emlist.imgsrc }" style="width: 45px;"></td>
															<td>${emlist.eno }</td>
															<td>${emlist.ename }</td>
															<td>${emlist.dname }</td>
															<td>${emlist.rname }</td>
															<td>${emlist.etel }</td>
															<td>
																<div class="btn-group">
																	<!-- 按钮触发模态框 -->
																	<form action="/ESMS/EmRequery" method='post'>
																		<input type='hidden' name='eno' id='eno'
																			value=${emlist.eno } /> <input type='hidden'
																			name='ename' id='ename' value=${emlist.ename } />
																		<button type='submit' class="btn btn-success"
																			onclick='openaddmodaleno(this)'>
																			<i class="icon_check_alt2"></i>
																		</button>
																		<button class="btn btn-success" data-toggle="modal"
																			data-target="#myModaladd"
																			onclick='openaddmodaladd(this)'>
																			<i class="icon_plus_alt2"></i>
																		</button>
																	</form>
																	<!-- 模态框 -->
																	<form method="post" action="/ESMS/Readd"
																		class="form-horizontal" role="form" id="myForm">
																		<div class="modal fade" id="myModaladd" tabindex="-1"
																			role="dialog" aria-labelledby="myModalLabel"
																			aria-hidden="true">
																			<div class="modal-dialog">
																				<div class="modal-content">
																					<div class="modal-header">
																						<button type="button" class="close"
																							data-dismiss="modal" aria-hidden="true">×</button>
																						<h4 class="modal-title" id="myModalLabel">
																							奖惩信息增加</h4>
																					</div>
																					<div class="modal-body">
																						<div class="form-group ">
																							<label for="cname" class="control-label col-lg-2">员工工号
																							</label>
																							<div class="col-lg-10">
																								<input id="enoadd" name="enoadd"
																									class="form-control" type="text" readonly />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="cname" class="control-label col-lg-2">员工姓名
																							</label>
																							<div class="col-lg-10">
																								<input id="enameadd" name="enameadd"
																									class="form-control" type="text" readonly />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="cname" class="control-label col-lg-2">员工部门
																							</label>
																							<div class="col-lg-10">
																								<input id="departadd" name="departadd"
																									class="form-control" type="text" readonly />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="cname" class="control-label col-lg-2">员工职级
																							</label>
																							<div class="col-lg-10">
																								<input id="rankadd" name="rankadd"
																									class="form-control" type="text" readonly />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="cname" class="control-label col-lg-2">奖罚类型选择</label>
																							<div class="col-lg-10">
																								<select id='rew_punadd' name='rew_punadd'
																									class="m-bot15 form-control" required>
																									<option value=''>请选择奖罚类型...</option>
																									<option value='奖'>奖</option>
																									<option value='罚'>罚</option>
																								</select>
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="cname" class="control-label col-lg-2">奖罚时间选择</label>
																							<div class="col-lg-10">
																								<div class="input-group date form_date"
																									data-date="" data-date-format="yyyy-mm-dd"
																									data-link-field="dtp_input2"
																									data-link-format="yyyy-mm-dd">
																									<input id='rewtimeadd' name="rewtimeadd"
																										class="form-control" size="16" type="text"
																										value="" onfocus="$(this).blur()" placeholder='请选择员工奖罚时间...'> <span
																										class="input-group-addon"> <span
																										onclick="removeaddtime()"
																										class="glyphicon glyphicon-remove-circle"></span>
																									</span> <span class="input-group-addon"> <span
																										class="glyphicon glyphicon-calendar"></span>
																									</span>
																								</div>
																								<br />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="ccomment"
																								class="control-label col-lg-2">奖罚内容</label>
																							<div class="col-lg-10">
																								<textarea class="form-control "
																									id="rewcontentadd" name="rewcontentadd"
																									required placeholder='请填写员工奖罚内容...'></textarea>
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="cname" class="control-label col-lg-2">奖罚金额
																							</label>
																							<div class="col-lg-10">
																								<input id="rewmoneyadd" name="rewmoneyadd"
																									class="form-control" type="text"
																									oninput="value=value.replace(/[^\d]/g,'')"
																									required placeholder='请填写员工奖罚金额...'/>
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
												<c:if test="${empty emlist}">
													<tr>
														<td width='100%' colspan='7'>请核对输入的员工姓名，重新查询员工信息！</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</section>
								</div>
							</div>
						</section>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<div class="row">
								<div class="col-lg-12">
									<section class="panel table-responsive">
										<header class="panel-heading">
											<h3>奖罚信息</h3>
										</header>
										<table class="table table-striped table-advance table-hover">
											<tbody>
												<tr>
													<th>奖罚编号</th>
													<th>员工工号</th>
													<th>员工姓名</th>
													<th>奖罚类型</th>
													<th>奖罚时间</th>
													<th>奖罚内容</th>
													<th>奖罚金额</th>
													<th><i class="icon_cogs"></i> 操作</th>
												</tr>
												<c:if test="${!empty relist}">
													<c:forEach items="${relist }" var="relist">
														<tr>
															<td>${relist.rewno }</td>
															<td>${relist.eno }</td>
															<td>${relist.ename }</td>
															<td>${relist.rew_pun }</td>
															<td>${relist.rewtime }</td>
															<td>${relist.rewcontent }</td>
															<td>${relist.rewmoney }</td>
															<td>
																<div class="btn-group">
																	<!-- 按钮触发模态框 -->
																	<form action="/ESMS/Redel" method="post">
																		<input type="hidden" id='rewnodel' name='rewnodel'
																			value=${relist.rewno }> <input type="hidden"
																			id='reenodel' name='reenodel' value=${relist.eno }>
																		<input type="hidden" id='enodel' name='enodel'
																			value=${relist.eno }> <input type="hidden"
																			id='enamedel' name='enamedel' value=${relist.ename } />
																		<input type="hidden" id='emlistdel' name='emlistdel'
																			value=${emlist } />
																		<button class="btn btn-success" data-toggle="modal"
																			data-target="#myModalup"
																			onclick='openaddmodalup(this)'>
																			<i class="glyphicon glyphicon-pencil"></i>
																		</button>
																		<button class="btn btn-danger" type="submit"
																			onclick="delcfm()">
																			<i class="icon_close_alt2"></i>
																		</button>
																	</form>
																	<form method="post" action="/ESMS/Reupdate"
																		class="form-horizontal" role="form" id="myForm"
																		onsubmit="return ">
																		<div class="modal fade" id="myModalup" tabindex="-1"
																			role="dialog" aria-labelledby="myModalLabel"
																			aria-hidden="true">
																			<!--  定义模态框，过渡效果为淡入，id为myModal,tabindex=-1可以禁用使用tab切换，aria-labelledby用于引用模态框的标题，aria-hidden=true保持模态框在触发前窗口不可见  -->
																			<div class="modal-dialog">
																				<!--  显示模态框对话框模型（若不写下一个div则没有颜色）  -->
																				<div class="modal-content">
																					<!--  显示模态框白色背景，所有内容都写在这个div里面  -->
																					<div class="btn-info modal-header">
																						<!--  模态框标题  -->
																						<button type="button" class="close"
																							data-dismiss="modal">&times;</button>
																						<!--  关闭按钮  -->
																						<h4>奖惩信息修改</h4>
																						<!--  标题内容  -->
																					</div>
																					<div class="modal-body">
																						<!--  模态框内容，我在此处添加一个表单 -->
																						<div class="form-group ">
																							<input type="hidden" id='rewnoup' name='rewnoup'>
																							<input type="hidden" id='enoup' name='enoup'>
																							<input type="hidden" id='enamequ' name='enamequ'>
																							<input type="hidden" id='rekeyup' name='rekeyup'>
																							<label for="cname" class="control-label col-lg-2">奖罚类型选择<span
																								class="required">*</span></label>
																							<div class="col-lg-10">
																								<select id='rew_punup' name='rew_punup'
																									class="m-bot15 form-control">
																									<option value=''>请选择奖罚类型...</option>
																									<option value='奖'>奖</option>
																									<option value='罚'>罚</option>
																								</select>
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="cname" class="control-label col-lg-2">奖罚时间选择<span
																								class="required">*</span></label>
																							<div class="col-lg-10">
																								<div class="input-group date form_date"
																									data-date="" data-date-format="yyyy-mm-dd"
																									data-link-field="dtp_input2"
																									data-link-format="yyyy-mm-dd">
																									<input id='rewtimeup' name="rewtimeup"
																										class="form-control" size="16" type="text"
																										value="" onfocus="$(this).blur()"> <span
																										class="input-group-addon"><span
																										onclick="removeuptime()"
																										class="glyphicon glyphicon-remove-circle"></span></span>
																									<span class="input-group-addon"><span
																										class="glyphicon glyphicon-calendar"></span></span>
																								</div>
																								<br />
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="ccomment"
																								class="control-label col-lg-2">奖罚内容<span
																								class="required">*</span></label>
																							<div class="col-lg-10">
																								<textarea class="form-control "
																									id="rewcontentup" name="rewcontentup" required></textarea>
																							</div>
																						</div>
																						<div class="form-group ">
																							<label for="cname" class="control-label col-lg-2">奖罚金额
																							</label>
																							<div class="col-lg-10">
																								<input id="rewmoneyup" name="rewmoneyup"
																									class="form-control"
																									oninput="value=value.replace(/[^\d]/g,'')"
																									type="text" required />
																							</div>
																						</div>
																					</div>
																					<div class="modal-footer">
																						<!--  模态框底部样式，一般是提交或者确定按钮 -->
																						<button type="submit" class="btn btn-info">确定</button>
																						<button type="button" class="btn btn-default"
																							data-dismiss="modal">取消</button>
																					</div>
																				</div>
																				<!-- /.modal-content -->
																			</div>
																		</div>
																		<!-- /.modal -->
																	</form>
																</div>
															</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${empty relist}">
													<tr>
														<td width='100%' colspan='8'>没有查询到相关的奖罚信息！</td>
													</tr>
												</c:if>
											</tbody>
										</table>
										<!-- 分关键字和员工姓名的两种查询方式实现分页 -->
										<c:if test="${empty rekey }">
											<table class="table table-striped table-advance table-hover">
												<tr>
													<td>共 ${page.totalCount} 条记录，当前为第 ${page.currentPage}
														页,共 ${page.totalPage} 页</td>
													<td><c:choose>
															<c:when test="${page.hasPrePage}">
																<a
																	href="/ESMS/EmRequery?eno=${eno }&ename=${ename }&currentPage=1">首页</a> | 
																<a
																	href="/ESMS/EmRequery?eno=${eno }&ename=${ename }&currentPage=${page.currentPage-1 }">上一页</a>
															</c:when>
															<c:otherwise> 首页 | 上一页 </c:otherwise>
														</c:choose> <c:choose>
															<c:when test="${page.hasNextPage}">
																<a
																	href="/ESMS/EmRequery?eno=${eno }&ename=${ename }&currentPage=${page.currentPage+1 }">下一页</a> | 
   																<a
																	href="/ESMS/EmRequery?eno=${eno }&ename=${ename }&currentPage=${page.totalPage }">尾页</a>
															</c:when>
															<c:otherwise> 下一页 | 尾页 </c:otherwise>
														</c:choose> 跳转到<input style="width: 40px" type="text" id='gopage' />页
														<button onclick='GoPage()' class='btn btn-success'>GO</button>
													</td>
												</tr>
											</table>
										</c:if>
										<c:if test="${!empty rekey }">
											<table class="table table-striped table-advance table-hover">
												<tr>
													<td>共 ${page.totalCount} 条记录，当前为第 ${page.currentPage}
														页,共 ${page.totalPage} 页</td>
													<td><c:choose>
															<c:when test="${page.hasPrePage}">
																<a href="/ESMS/Requery?rekey=${rekey }&currentPage=1">首页</a> | 
																<a
																	href="/ESMS/Requery?rekey=${rekey }&currentPage=${page.currentPage-1 }">上一页</a>
															</c:when>
															<c:otherwise> 首页 | 上一页 </c:otherwise>
														</c:choose> <c:choose>
															<c:when test="${page.hasNextPage}">
																<a
																	href="/ESMS/Requery?rekey=${rekey }&currentPage=${page.currentPage+1 }">下一页</a> | 
	   															<a
																	href="/ESMS/Requery?rekey=${rekey }&currentPage=${page.totalPage }">尾页</a>
															</c:when>
															<c:otherwise> 下一页 | 尾页 </c:otherwise>
														</c:choose> 跳转到 <input style="width: 40px" type="text" id='gopage' />页
														<button onclick='GoPage()' class='btn btn-success'>GO</button>
													</td>
												</tr>
											</table>
										</c:if>
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
	<!-- 获取表的数据到模态框 -->
	<script>
		function openaddmodaleno(obj) {
			document.getElementById("enodel").value = document
					.getElementById("eno").value;
		}
	</script>
	<script>
		function openaddmodaladd(obj) {
			$("#myModaladd").modal('show');
			var $td = $(obj).parents('tr').children('td');
			id = $td.eq(1).text();
			$('#enoadd').val(id);
			id = $td.eq(2).text();
			$('#enameadd').val(id);
			id = $td.eq(3).text();
			$('#departadd').val(id);
			id = $td.eq(4).text();
			$('#rankadd').val(id);
		}
	</script>
	<script>
		function openaddmodalup(obj) {
			$("#myModalup").modal('show');
			var $td = $(obj).parents('tr').children('td');
			id = $td.eq(0).text();
			console.log(id);
			$('#rewnoup').val(id);
			id = $td.eq(1).text();
			$('#enoup').val(id);
			id = $td.eq(3).text();
			$('#rew_punup').val(id);
			id = $td.eq(4).text();
			$('#rewtimeup').val(id);
			id = $td.eq(5).text();
			$('#rewcontentup').val(id);
			id = $td.eq(6).text();
			$('#rewmoneyup').val(id);

			document.getElementById("rekeyup").value = document
					.getElementById("rekey").value;
			document.getElementById("enamequ").value = document
					.getElementById("ename").value;
		}
	</script>
	<script type="text/javascript">
		function delcfm() {
			if (!confirm("确认要删除？")) {
				window.event.returnValue = false;
			}
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
			var url = null;
			if ("${emlist}" == null) {
				url = "/ESMS/Requery?rekey=${rekey }&currentPage=" + gopage;
			} else {
				url = "/ESMS/EmRequery?eno=${eno }&ename=${ename }&currentPage="
						+ gopage;
			}

			if ("${relist}" != null) {
				window.location.href = url;
			}
		}
	</script>

	<script type="text/javascript">
		function removeuptime() {
			document.getElementById("rewtimeup").value = "";
			document.getElementById("rewtimeup").text = "";
		}
	</script>

	<script type="text/javascript">
		function removeaddtime() {
			document.getElementById("rewtimeadd").value = "";
			document.getElementById("rewtimeadd").text = "";
		}
	</script>
</body>

</html>