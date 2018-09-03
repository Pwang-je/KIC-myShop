package my.shop.board;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;

public class BoardManager {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private DataSource ds;

    private int tot;    // 전체 레코드 수
    private int pList;  // 각 페이지 당 출력 레코드 수
    private int pageSu; // 전체 페이지 수

    public BoardManager() {
        try {
            Context context = new InitialContext();
            // dbcp pooling. (data base connection pooling.)
            ds = (DataSource) context.lookup("java:comp/env/jdbc_oracle");
        } catch (Exception e) {
            System.out.println("BoardManager err: " + e);
        }
    }
    // Const;

    public void saveData(BoardBean bean) {
        String sql = "INSERT INTO SHOPBOARD VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            System.out.println(bean.getName());
        } catch (Exception e) {

        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {

            }
        }
    }
    // public saveData;





}
