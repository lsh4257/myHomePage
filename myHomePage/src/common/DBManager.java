package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBManager {

	// 인스턴스 주소를 저장하기 위한 참조 변수
	private static Connection conn;

	// Connection 관련 정보 상수
	private final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private final static String USER = "java";
	private final static String PASS = "1234";

	// 반드시 생성자를 private로 선언하여 은닉화 시킨다.
	// --> 외부에서 인스턴스를 생성하지 못하도록 선언
	// --> 이유 : 공유해서 사용해야 하는데 객체 생성 후 사용하게 되면 의미가 없음(사용자 실수를 막는 용도)

	private DBManager() { // default 생성자 생성
	}

	// 인스턴스를 생성 또는 기존 인스턴스를 반환하는
	public static Connection getConnection() {
		conn = null;

		try {
			if (conn == null) {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USER, PASS);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return conn;

	}

	// SELECT 를 수행한후 자원해제를 위한 메소드(자원반납)
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}