//급여를 1500으로 바꾸어 주세요
package ex22_4_PreparedStatement;
import java.sql.*;
public class JdbcEx2_update {
	public static void main(String[] args) {
		// SQL문 작성하기
		StringBuilder sql = new StringBuilder();
		sql.append("update professor ");
		sql.append("set sal = ? ");
		sql.append("where profno = ? ");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnUtil.getConnection();
			
			// PreparedStatement 객체 얻기
			pstmt = conn.prepareStatement(sql.toString());
			
			// 파라미터 셋팅
			// 쿼리의 ?(바인딩 변수)에 대체될 실제값 지정하기
			pstmt.setInt(1, 1500);
			pstmt.setInt(2, 9920);
			
			// 쿼리 실행
			int result = pstmt.executeUpdate();
			System.out.println(result + "개의 행이 변경 되었습니다.");
		} catch(SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
