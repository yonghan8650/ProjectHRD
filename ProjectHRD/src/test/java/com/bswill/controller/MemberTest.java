package com.bswill.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class MemberTest {

	private static final Logger logger = LoggerFactory.getLogger(MemberTest.class);

	// DB 접속 DateSource 객체 필요
	@Inject
	private DataSource ds;
	// 암호화처리 PWEncoder 객체 필요
	@Inject
	private PasswordEncoder pwEncoder;

	// @Test
	public void test_회원가입() throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		for (int i = 0; i < 100; i++) {

			// 1. DB 연결
			con = ds.getConnection();
			// 2. sql 구문 작성 & pstmt 객체
			sql = "insert into hrd_employee(employee_id,passwd) values(?,?)";
			pstmt = con.prepareStatement(sql);
			// ???

			// 비밀번호 암호화
			pstmt.setString(2, pwEncoder.encode("passwd"));

			// 3. sql 구문 실행 - for

			// 비밀번호 암호화
			pstmt.setString(2, pwEncoder.encode("pw" + i));

			if (i < 80) {
				pstmt.setInt(1, i);
			} else if (i < 90) {
				pstmt.setInt(1, i);
			} else {
				pstmt.setInt(1, i);
			}

			// 4. sql 실행
			pstmt.executeUpdate();

			// 자원해제 hikariCP는 커넥션을 10개밖에 유지하지 못하기 때문에 자원을해제 해주어야함
			pstmt.close();
			con.close();

		} // for
	}// test_회원가입()

	@Test
	public void test_비밀번호암호화() throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		// 1. DB 연결
		con = ds.getConnection();
		// 2. sql 구문 작성 & pstmt 객체
		/*
		 * insert into tbl_employee(employee_id, passwd,
		 * emp_name,profil,birth,gender,emp_tel,emp_mail,emp_addr,job_id,deptid,
		 * start_date) value(1000,'?','이부장','2008101102.png', '1986-10-20',1,
		 * '010-1111-2223','2008101104@gmail.com','김해시',902,101,'1986-10-20');
		 */

		sql = "insert into tbl_employee(employee_id, passwd, emp_name, profil, birth, gender, emp_tel, emp_mail, emp_addr, job_id, deptid, start_date) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		// ???

		// 비밀번호 암호화
		String encryptedPassword = pwEncoder.encode("4000");

		// ?에 값 설정
		pstmt.setInt(1, 4000); // 예시로 employee_id를 설정
		pstmt.setString(2, encryptedPassword); // 암호화된 비밀번호 설정
		pstmt.setString(3, "어드민"); // 예시로 emp_name 설정
		pstmt.setString(4, "admin.png"); // 예시로 profil 설정
		pstmt.setString(5, "1986-10-20"); // 예시로 birth 설정
		pstmt.setInt(6, 1); // 예시로 gender 설정
		pstmt.setString(7, "010-1111-2213"); // 예시로 emp_tel 설정
		pstmt.setString(8, "2008101124@gmail.com"); // 예시로 emp_mail 설정
		pstmt.setString(9, "김해시"); // 예시로 emp_addr 설정
		pstmt.setInt(10, 902); // 예시로 job_id 설정
		pstmt.setInt(11, 101); // 예시로 deptid 설정
		pstmt.setString(12, "1986-10-20"); // 예시로 start_date 설정

		// 3. sql 구문 실행 - for

		// 비밀번호 암호화
		/*
		 * pstmt.setString(2, pwEncoder.encode("pw" + i));
		 * 
		 * if (i < 80) { pstmt.setInt(1, i); } else if (i < 90) { pstmt.setInt(1, i); }
		 * else { pstmt.setInt(1, i); }
		 */

		// 4. sql 실행
		pstmt.executeUpdate();

		// 자원해제 hikariCP는 커넥션을 10개밖에 유지하지 못하기 때문에 자원을해제 해주어야함
		pstmt.close();
		con.close();

	}// test_회원가입()

	// sql쿼리와 ???값넣는것만 바꿈
	// @Test
	public void test_회원인증정보_가입() throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		for (int i = 0; i < 100; i++) {

			// 1. DB 연결
			con = ds.getConnection();
			// 2. sql 구문 작성 & pstmt 객체
			sql = "insert into hrd_employee_auth(employee_id,auth) values(?,?)";
			pstmt = con.prepareStatement(sql);
			// ???

			// 3. sql 구문 실행 - for

			if (i < 80) {
				pstmt.setInt(1, i);
				pstmt.setString(2, "ROLE_USER");
			} else if (i < 90) {
				pstmt.setInt(1, i);
				pstmt.setString(2, "ROLE_MANAGER");
			} else {
				pstmt.setInt(1, i);
				pstmt.setString(2, "ROLE_ADMIN");
			}

			// 4. sql 실행
			pstmt.executeUpdate();

			// 자원해제 hikariCP는 커넥션을 10개밖에 유지하지 못하기 때문에 자원을해제 해주어야함
			pstmt.close();
			con.close();

		} // for

	}

}
