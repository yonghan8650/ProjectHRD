<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div class="content">
	<div class="box" style="min-height: 600px;">
		<div class="box-header">
			<h3 class="box-title">경조비 신청</h3>
		</div>
		<div class="box-body">
			<form action="" method="post">
				<input type="hidden" id="employee_id" name="employee_id" value="${employee_id }">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<div class="form-group">
					<label>경조구분</label>
					<select class="form-control select2 select2-hidden-accessible" id="eve_class" name="eve_class" style="width: 520px;" tabindex="-1" aria-hidden="true">
						<option selected="selected" value="회갑">회갑</option>
						<option value="결혼">결혼</option>
						<option value="출산">출산</option>
						<option value="상">상</option>
					</select>
				</div>
				<div class="form-group">
					<label>대상자명</label> <input type="text" class="form-control" id="eve_subject" name="eve_subject" style="width: 520px;" placeholder="대상자명" required>
				</div>
				<div class="form-group">
					<label>경조일자</label>
					<div class="input-group date">
						<input type="date" class="form-control pull-right" id="eve_date" name="eve_date" style="width: 520px;" max="9999-12-31" required>
					</div>
				</div>
				<div class="form-group">
					<label>신청금액</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-dollar"></i></span> <input type="text" class="form-control" style="width: 485px;" id="eve_amount" pattern="[0-9]*" value="0" name="eve_amount">
					</div>
				</div>

				<button type="submit" class="btn btn-primary">신청하기</button>

			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>