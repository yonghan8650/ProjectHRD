<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div style="min-height: 1136.28px;">

	<section class="content-header">
		<h1>메인</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">User profile</li>
		</ol>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-md-3">

				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="img-responsive img-fluid" style="margin: auto;" src="/resources/img/bswill.jpg">
						<h3 class="profile-username text-center">BSWILL</h3>
						<p class="text-muted text-center">IT 기업</p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>창립일</b> <a class="pull-right">2018.03.27</a></li>
							<li class="list-group-item"><b>주소</b> <a class="pull-right">삼한골든게이트</a></li>
							<li class="list-group-item"><b>연락처</b> <a class="pull-right">051-803-0909</a></li>
							<li class="list-group-item"><b>E-mail</b> <a class="pull-right">BSWILL@gmail.com</a></li>
						</ul>
					</div>

				</div>


				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">About BSWILL</h3>
					</div>

					<div class="box-body">
						<strong><i class="fa fa-flag margin-r-5"></i> &nbsp; 2018년 Bswill 설립</strong>
						<p class="text-muted">Bswill은 창립자인 Will에 의해 설립되었습니다. 회사는 혁신적인 기술 솔루션을 개발하여 고객들에게 가치를 제공하는 것을 목표로 시작되었습니다.</p>
						<hr>
						<strong><i class="fa fa-genderless margin-r-5"></i> &nbsp; 2021년 제품 런칭 및 초기 성장</strong>
						<p class="text-muted">Bswill은 첫 제품을 출시하고 이를 통해 시장에서 긍정적인 피드백을 받았습니다. 회사는 초기 성장을 경험하며 고객 기반을 확장하기 시작했습니다.</p>
						<hr>
						<strong><i class="fa fa-genderless margin-r-5"></i> &nbsp; 2022년 투자 유치 및 인력 확충</strong>
						<p class="text-muted">Bswill은 성장을 지속하기 위해 외부 투자를 유치하고 인력을 확충하였습니다. 이를 통해 제품 개발 및 마케팅 노력을 강화하고 글로벌 시장 진출을 준비했습니다.</p>
						<hr>
						<strong><i class="fa fa-genderless margin-r-5"></i> &nbsp; 2023년 글로벌 시장 진출</strong>
						<p class="text-muted">Bswill은 제품의 글로벌 시장 진출을 시작했습니다. 다양한 지역에서의 고객들과의 파트너십을 구축하고 협력하여 국제적으로 사업을 확장했습니다.</p>
						<hr>
						<strong><i class="fa fa-genderless margin-r-5"></i> &nbsp; 2024년 지속적인 혁신 및 성장 </strong>
						<p class="text-muted">Bswill은 지속적인 기술 혁신과 제품 개선을 통해 시장에서의 경쟁력을 강화하고 성장을 지속했습니다. 회사는 고객 중심의 비전을 추구하며 새로운 시장 기회를 탐색하고 있습니다.</p>
						<hr>
					</div>

				</div>

			</div>

			<div class="col-md-9">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true">대시보드</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="activity">
							<div class="user-block">
								<div class="row">
									<div class="col-lg-4 col-xs-6">
										<div class="small-box bg-green">
											<div class="inner">
												<h3>${currentEmpCnt}</h3>
												<p>재직자수</p>
											</div>
											<div class="icon">
												<i class="ion ion-person-add"></i>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-xs-6">
										<div class="small-box bg-yellow">
											<div class="inner">
												<h3>${restEmpCnt }</h3>
												<p>휴직자수</p>
											</div>
											<div class="icon">
												<i class="ion ion-person-add"></i>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-xs-6">
										<div class="small-box bg-aqua">
											<div class="inner">
												<h3>13</h3>
												<p>사원수</p>
											</div>
											<div class="icon">
												<i class="ion ion-person-add"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="box">
									<div class="box-header">
										<h3 class="box-title">부서정보</h3>
									</div>

									<div class="box-body no-padding">
										<table class="table table-striped">
											<tbody>
												<tr>
													<th style="width: 10px">#</th>
													<th>부서번호</th>
													<th>부서이름</th>
												</tr>


												<c:forEach var="info" items="${deptInfo}" varStatus="stat">
													<tr>
														<td>${stat.count }</td>
														<td>${info.DEPTID }</td>
														<td>${info.DEPTNM }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

								</div>
							</div>
							<div class="col-md-6">
								<div class="box">
									<div class="box-header">
										<h3 class="box-title">직책정보</h3>
									</div>

									<div class="box-body no-padding">
										<table class="table table-striped">
											<tbody>
												<tr>
													<th style="width: 10px">#</th>
													<th>직책번호</th>
													<th>직책이름</th>
												</tr>


												<c:forEach var="info" items="${jobInfo}" varStatus="stat">
													<tr>
														<td>${stat.count }</td>
														<td>${info.JOB_ID }</td>
														<td>${info.JOB }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>

</div>

<%@ include file="../include/footer.jsp"%>