<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/img/favicon.ico" type="image/x-icon">
<title>BSWILL HRD</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<script src="https://kit.fontawesome.com/ce16b4434b.js" crossorigin="anonymous"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<!-- jQuery 2.1.4 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="/common/main" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels --> <span class="logo-mini">HRD</span> <!-- logo for regular state and mobile devices --> <span class="logo-lg"><b>BSWILL</b> HRD</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						<!-- Notifications: style can be found in dropdown.less -->
						<li class="dropdown notifications-menu"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span class="label label-warning">${notificationCount}</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header"><span>알림이 ${notificationCount}개 있습니다.</span>
									<div class="notification-buttons">
										<form action="<%=request.getContextPath()%>/noti/notifications" method="GET">
											<button type="submit">알림목록</button>
										</form>
										<form action="<%=request.getContextPath()%>/noti/deleteAllNoti" method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
											<button type="submit">모두삭제</button>
										</form>
									</div></li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<!-- 알림 목록 출력 -->
										<c:forEach var="notification" items="${notiListSelect}">
											<li>
												<div>
													<span>${notification.employee_id}</span> <span><a href="${notification.noti_link}">${notification.noti_title}</a></span> <span>${notification.noti_check == 0 ? '읽지 않음' : '읽음'}</span>
													<!-- 알림 확인을 위한 폼 -->
													<form action="${pageContext.request.contextPath}/noti/readNoti" method="post" style="display: inline;">
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <input type="hidden" name="employee_id" value="${notification.employee_id}"> <input type="hidden" name="noti_title" value="${notification.noti_title}"> <input type="hidden" name="noti_time" value="${notification.noti_time}">
														<button type="submit">확인</button>
													</form>
												</div>
											</li>
										</c:forEach>
									</ul>
								</li>
							</ul></li>
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="/emp/download?PROFIL=${sessionScope.evo.PROFIL }" class="user-image" alt="User Image" /> <span class="hidden-xs">${sessionScope.evo.emp_name } </span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img src="/emp/download?PROFIL=${sessionScope.evo.PROFIL }" class="img-circle" alt="User Image" />
									<p>
										${sessionScope.evo.emp_name } <small>Member since ${sessionScope.evo.start_date }</small>
									</p></li>
								<!-- Menu Body -->
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="/common/changePw" class="btn btn-default btn-flat">비밀번호 변경</a>
									</div>
									<div class="pull-right">
										<form action="/customLogout" method="post" onsubmit="showAlert()">
											<!-- 폼태그정보를 post방식으로 전달할때 csrf토큰정보 필요 -->
											<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> <input type="submit" class="btn btn-default btn-flat" value="로그아웃">
										</form>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
						<li><a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="/emp/download?PROFIL=${sessionScope.evo.PROFIL }" class="img-circle" alt="User Image" />
					</div>
					<div class="pull-left info">
						<p>${sessionScope.evo.emp_name }</p>
						<c:if test="${not empty sessionScope.evo}">
							<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
						</c:if>
						<c:if test="${empty sessionScope.evo}">
							<a href="#"><i class="fa fa-circle text-danger"></i> Offline</a>
						</c:if>
					</div>
				</div>
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">Menu</li>
					<li class="treeview"><a href="#"> <i class="fa-solid fa-user"> </i> &nbsp <span>인사 관리</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/emp/viewEmp"><i class="fa fa-circle-o"></i> 인사정보조회 </a></li>
							<sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
								<li><a href="/emp/registEmp"><i class="fa fa-circle-o"></i> 인사정보등록 </a></li>
								<li><a href="/emp/listEmp?searchType=employee_id&keyword="><i class="fa fa-circle-o"></i> 인사목록조회 </a></li>
							</sec:authorize>
							<li><a href="/emp/applyEvent"><i class="fa fa-circle-o"></i> 경조비신청 </a></li>
							<li><a href="/emp/viewEvent?searchType=eve_class&keyword="><i class="fa fa-circle-o"></i> 경조비신청내역 </a></li>
							<sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
								<li><a href="/emp/listEvent?searchType=employee_id&keyword="><i class="fa fa-circle-o"></i> 경조비신청관리 </a></li>
							</sec:authorize>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa-solid fa-building"></i> &nbsp <span>근태 관리</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/attendance/list"><i class="fa fa-circle-o"></i> 출퇴근 조회 </a></li>
							<li><a href="/leaves/requests"><i class="fa fa-circle-o"></i> 휴가 신청 내역 </a></li>
							<li><a href="/leaves/annualLeave"><i class="fa fa-circle-o"></i> 연차조회 </a></li>
							<li><a href="/leaves/annualLeaveAdd"><i class="fa fa-circle-o"></i> 연차생성 </a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa-solid fa-won-sign"></i> &nbsp <span>급여 관리</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> 메뉴1 </a></li>
							<li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> 메뉴2 </a></li>
							<li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> 메뉴3 </a></li>
							<li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> 메뉴4 </a></li>
							<li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> 메뉴5 </a></li>
							<li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> 메뉴6 </a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa-solid fa-people-roof"></i> &nbsp <span>조직도</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="../org/orgList"><i class="fa fa-circle-o"></i> 조직도 </a></li>
							<li><a href="../org/orgFavor"><i class="fa fa-circle-o"></i> 즐겨찾기 </a></li>
							<li><a href="../org/orgDept"><i class="fa fa-circle-o"></i> 전체	부서 </a></li>
						</ul></li>
					<li class="treeview"><a href="/board/list"> <i class="fa-regular fa-clipboard"></i> &nbsp &nbsp <span> 공지사항</span>
					</a></li>
					<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i> <span>UI Elements</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> 메뉴1 </a></li>
							</sec:authorize>
							<li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> 메뉴2 </a></li>
							<li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> 메뉴3 </a></li>
							<li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> 메뉴4 </a></li>
							<li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> 메뉴5 </a></li>
							<li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> 메뉴6 </a></li>
						</ul></li>
			</section>
			<!-- /.sidebar -->
		</aside>
		<script>
			function showAlert() {
				alert("로그아웃 되었습니다.");
			}
		</script>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<ol class="breadcrumb">
					<!-- 					<li></li> -->
					<!-- 					<li></li> -->
					<!-- 					<li></li> -->
				</ol>
			</section>