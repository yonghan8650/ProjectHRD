<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div class="content">

	${viewEmpVO }

	<div class="row">
		<div class="col-md-3">

			<div class="box box-primary">
				<div class="box-body box-profile">
					<img class="profile-user-img img-responsive img-circle" src="file:///D://upload//temp//${viewEmpVO.PROFIL }" alt="User profile picture">
					<h3 class="profile-username text-center">${viewEmpVO.emp_name }</h3>
					<p class="text-muted text-center">${viewEmpVO.DEPTNM }&nbsp;&nbsp;${viewEmpVO.JOB }</p>
					<ul class="list-group list-group-unbordered">
						<li class="list-group-item"><b>Followers</b> <a class="pull-right">1,322</a></li>
						<li class="list-group-item"><b>Following</b> <a class="pull-right">543</a></li>
						<li class="list-group-item"><b>Friends</b> <a class="pull-right">13,287</a></li>
					</ul>
				</div>

			</div>

		</div>

		<div class="col-md-9">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
					<li><a href="#timeline" data-toggle="tab">Timeline</a></li>
					<li><a href="#settings" data-toggle="tab">Settings</a></li>
				</ul>
				<div class="tab-content">
					<div class="active tab-pane" id="activity">

						<form class="form-horizontal">
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">Name</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputName" placeholder="Name">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">Email</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputEmail" placeholder="Email">
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="Name">
								</div>
							</div>
							<div class="form-group">
								<label for="inputExperience" class="col-sm-2 control-label">Experience</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="inputSkills" class="col-sm-2 control-label">Skills</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputSkills" placeholder="Skills">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label> <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-danger">Submit</button>
								</div>
							</div>
						</form>

					</div>

					<div class="tab-pane" id="timeline">

						<div class="box-body no-padding">
							<table class="table table-striped">
								<tbody>
									<tr>
										<th style="width: 10px">#</th>
										<th>Task</th>
										<th>Progress</th>
										<th style="width: 40px">Label</th>
									</tr>
									<tr>
										<td>1.</td>
										<td>Update software</td>
										<td>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
											</div>
										</td>
										<td>
											<span class="badge bg-red">55%</span>
										</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Clean database</td>
										<td>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
											</div>
										</td>
										<td>
											<span class="badge bg-yellow">70%</span>
										</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Cron job running</td>
										<td>
											<div class="progress progress-xs progress-striped active">
												<div class="progress-bar progress-bar-primary" style="width: 30%"></div>
											</div>
										</td>
										<td>
											<span class="badge bg-light-blue">30%</span>
										</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Fix and squish bugs</td>
										<td>
											<div class="progress progress-xs progress-striped active">
												<div class="progress-bar progress-bar-success" style="width: 90%"></div>
											</div>
										</td>
										<td>
											<span class="badge bg-green">90%</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>

					<div class="tab-pane" id="settings">

						<div class="box-body no-padding">
							<table class="table table-striped">
								<tbody>
									<tr>
										<th style="width: 10px">#</th>
										<th>Task</th>
										<th>Progress</th>
										<th style="width: 40px">Label</th>
									</tr>
									<tr>
										<td>1.</td>
										<td>Update software</td>
										<td>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-danger" style="width: 55%"></div>
											</div>
										</td>
										<td>
											<span class="badge bg-red">55%</span>
										</td>
									</tr>
									<tr>
										<td>2.</td>
										<td>Clean database</td>
										<td>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
											</div>
										</td>
										<td>
											<span class="badge bg-yellow">70%</span>
										</td>
									</tr>
									<tr>
										<td>3.</td>
										<td>Cron job running</td>
										<td>
											<div class="progress progress-xs progress-striped active">
												<div class="progress-bar progress-bar-primary" style="width: 30%"></div>
											</div>
										</td>
										<td>
											<span class="badge bg-light-blue">30%</span>
										</td>
									</tr>
									<tr>
										<td>4.</td>
										<td>Fix and squish bugs</td>
										<td>
											<div class="progress progress-xs progress-striped active">
												<div class="progress-bar progress-bar-success" style="width: 90%"></div>
											</div>
										</td>
										<td>
											<span class="badge bg-green">90%</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

</div>
<%@ include file="../include/footer.jsp"%>