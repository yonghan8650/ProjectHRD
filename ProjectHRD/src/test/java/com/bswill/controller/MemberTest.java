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

	//@Test
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
		// sql쿼리와 ???값넣는것만 바꿈
		//@Test
		public void test_회원인증정보_가입() throws Exception{
			
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "";
			
			for(int i=0;i<100;i++) {
				
			
			// 1. DB 연결
			con = ds.getConnection();
			// 2. sql 구문 작성 & pstmt 객체
			sql = "insert into hrd_employee_auth(employee_id,auth) values(?,?)";
			pstmt = con.prepareStatement(sql);
			// ???
			
			// 3. sql 구문 실행 - for
			
			
			if(i < 80) {
				pstmt.setInt(1, i);
				pstmt.setString(2, "ROLE_USER");
			}else if(i < 90) {
				pstmt.setInt(1, i);
				pstmt.setString(2, "ROLE_MANAGER");
			}else {
				pstmt.setInt(1, i);
				pstmt.setString(2, "ROLE_ADMIN");
			}
			
			//4. sql 실행
			pstmt.executeUpdate();
			
			// 자원해제 hikariCP는 커넥션을 10개밖에 유지하지 못하기 때문에 자원을해제 해주어야함
			pstmt.close();
			con.close();
			
			
			}//for
	
	
		}
		
}
