package my.shop.member;

import javax.naming.*;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class MemberManager {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    public MemberManager() {
        try {
            Context context = new InitialContext();
            ds = (DataSource) context.lookup("java:comp/env/jdbc_oracle");
        } catch (Exception e) {
            System.out.println("BoardManager err" + e);
        }
    }
    // Const.

    public ArrayList<ZipcodeBean> zipRead(String p_area3) {

        ArrayList<ZipcodeBean> list = new ArrayList<>();

        try {
            conn = ds.getConnection();
            String zSql = "SELECT * FROM ZIPTAB WHERE AREA3 LIKE ?";
            pstmt = conn.prepareStatement(zSql);
            pstmt.setString(1, p_area3 + "%" );
            rs = pstmt.executeQuery();
            while (rs.next()) {
//                System.out.println(rs.getString("zipcode"));
                ZipcodeBean bean = new ZipcodeBean();
                bean.setZipcode(rs.getString("zipcode"));   // 담는법.
                bean.setArea1(rs.getString("area1"));
                bean.setArea2(rs.getString("area2"));
                bean.setArea3(rs.getString("area3"));
                bean.setArea4(rs.getString("area4"));
                list.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("savedata err"+ e2);
            }
        }
        return list;
    }
    // ArrayList<ZipcodeBean>;


    public boolean checkId(String id) {
        boolean b = false;

        try {
            conn = ds.getConnection();
            String cSql = "SELECT ID FROM MEMBER WHERE ID=?";
            pstmt = conn.prepareStatement(cSql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            b = rs.next();  // 있으면 true, 없으면 false.
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("savedata err"+ e2);
            }
        }

        return b;
    }
}
