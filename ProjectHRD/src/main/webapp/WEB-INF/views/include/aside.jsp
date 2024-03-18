<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="info">
	<img src=""> ${emp_name } ${department } ${position } ${emp_email }
</div>
<div class="hrd">
	<h3>인사관리</h3>
	<a href="/emp/empview">인사 정보 조회</a>
	<c:if test="${emp_name eq 'admin' }">
		<a href="/emp/emplist">인사 목록 조회</a>
		<a href="/emp/empregist">인사 정보 입력</a>
	</c:if>
	<hr>
	<h3>경조비관리</h3>
	<a href="/emp/eventapp">경조비 신청</a>
	<a href="/emp/eventview">경조비 현황 조회</a>
	<c:if test="${emp_name eq 'admin' }">
		<a href="/emp/eventhandle">경조비 처리</a>
	</c:if>
</div>