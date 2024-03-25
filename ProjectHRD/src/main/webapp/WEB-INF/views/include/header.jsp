<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Dashboard</title>
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
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <body class="skin-blue sidebar-mini">
    <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->
        <a href="/common/main" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini">HRD</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>BSWILL</b> HRD</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              
              <!-- Notifications: style can be found in dropdown.less -->
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the page and may cause design problems
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-red"></i> 5 new members joined
                        </a>
                      </li>

                      <li>
                        <a href="#">
                          <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-user text-red"></i> You changed your username
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
              
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image"/>
                  <span class="hidden-xs">사용자 이름</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                    <p>
                      사용자 이름 - 직책
                      <small>Member since 입사일</small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">내 정보</a>
                    </div>
                    <div class="pull-right">
                      <a href="#" class="btn btn-default btn-flat">로그아웃</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
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
              <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>사용자 이름</p>

              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">Menu</li>
            <li class="treeview">
              <a href="#">
                <i class="fa-solid fa-user"> </i>
                <span>인사 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> 메뉴1 </a></li>
                <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> 메뉴2 </a></li>
                <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> 메뉴3 </a></li>
                <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> 메뉴4 </a></li>
                <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> 메뉴5 </a></li>
                <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> 메뉴6 </a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa-solid fa-building"></i>
                <span>근태 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> 메뉴1 </a></li>
                <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> 메뉴2 </a></li>
                <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> 메뉴3 </a></li>
                <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> 메뉴4 </a></li>
                <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> 메뉴5 </a></li>
                <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> 메뉴6 </a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa-solid fa-won-sign"></i>
                <span>급여 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> 메뉴1 </a></li>
                <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> 메뉴2 </a></li>
                <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> 메뉴3 </a></li>
                <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> 메뉴4 </a></li>
                <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> 메뉴5 </a></li>
                <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> 메뉴6 </a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa-solid fa-people-roof"></i>
                <span>조직도</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> 메뉴1 </a></li>
                <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> 메뉴2 </a></li>
                <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> 메뉴3 </a></li>
                <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> 메뉴4 </a></li>
                <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> 메뉴5 </a></li>
                <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> 메뉴6 </a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="/board/list">
                <i class="fa-regular fa-clipboard"></i>
                <span>공지사항</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>UI Elements</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> 메뉴1 </a></li>
                <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> 메뉴2 </a></li>
                <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> 메뉴3 </a></li>
                <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> 메뉴4 </a></li>
                <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> 메뉴5 </a></li>
                <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> 메뉴6 </a></li>
              </ul>
            </li>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            General Form Elements
            <small>Preview</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Forms</a></li>
            <li class="active">General Elements</li>
          </ol>
        </section>