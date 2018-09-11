package my.shop.member;

import javax.naming.Context;
import javax.naming.InitialContext;
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
            ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
        } catch (Exception e) {
            System.out.println("MemberManager err" + e);
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
                System.out.println("zipRead err"+ e2);
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
                System.out.println("checkId err"+ e2);
            }
        }

        return b;
    }

    // registerproc.
    public boolean memInsert(MemberBean memBean) {
        boolean b = false;

        try {
            conn = ds.getConnection();
            String mSql = "INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(mSql);
            pstmt.setString(1, memBean.getId());
            pstmt.setString(2, memBean.getPasswd());
            pstmt.setString(3, memBean.getName());
            pstmt.setString(4, memBean.getEmail());
            pstmt.setString(5, memBean.getPhone());
            pstmt.setString(6, memBean.getZipcode());
            pstmt.setString(7, memBean.getAddress());
            pstmt.setString(8, memBean.getJob());

            if (pstmt.executeUpdate() > 0) b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("memInsert err"+ e2);
            }
        }

        return b;
    }

    public boolean loginCheck(String id, String passwd) {

        boolean b = false;

        try {
            conn = ds.getConnection();
            String cSql = "SELECT ID, PASSWD FROM MEMBER WHERE ID=? AND PASSWD=?";
            pstmt = conn.prepareStatement(cSql);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            b = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("loginCheck err"+ e2);
            }
        }


        return b;
    }

    public MemberBean getMember (String id) {
        MemberBean bean = null;

        try {
            conn = ds.getConnection();
            String mSql = "SELECT * FROM MEMBER WHERE ID=?";
            pstmt = conn.prepareStatement(mSql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                bean = new MemberBean();
                bean.setId(rs.getString("id"));
                bean.setPasswd(rs.getString("passwd"));
                bean.setName(rs.getString("name"));
                bean.setEmail(rs.getString("email"));
                bean.setPhone(rs.getString("phone"));
                bean.setZipcode(rs.getString("zipcode"));
                bean.setAddress(rs.getString("address"));
                bean.setJob(rs.getString("job"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("getMember err"+ e2);
            }
        }
        return bean;
    }

    public boolean memberUpdate(MemberBean bean, String id) {
        boolean b = false;

        try {
            conn = ds.getConnection();
            String sql = "UPDATE MEMBER SET PASSWD=?, NAME=?, EMAIL=?, PHONE=?, ZIPCODE=?, ADDRESS=?, JOB=? WHERE ID=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bean.getPasswd());
            pstmt.setString(2, bean.getName());
            pstmt.setString(3, bean.getEmail());
            pstmt.setString(4, bean.getPhone());
            pstmt.setString(5, bean.getZipcode());
            pstmt.setString(6, bean.getAddress());
            pstmt.setString(7, bean.getJob());
            pstmt.setString(8, id);
            if (pstmt.executeUpdate() > 0) b = true;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("memberUpdate err"+ e2);
            }
        }

        return b;
    }

    public boolean adminLoginChk(String adminid, String adminpasswd) {
        boolean b = false;

        try {
            conn = ds.getConnection();
            String aSql = "SELECT * FROM ADMIN WHERE ADMIN_ID=? AND ADMIN_PASSWD=?";
            pstmt = conn.prepareStatement(aSql);
            pstmt.setString(1, adminid);
            pstmt.setString(2, adminpasswd);
            rs = pstmt.executeQuery();
            b = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("adminLoginChk err"+ e2);
            }
        }
        return b;
    }

    // 회원전체 관리
    public ArrayList<MemberBean> getMemberAll() {

        ArrayList<MemberBean> list = new ArrayList<>();

        try {
            conn = ds.getConnection();
            String aSql = "SELECT * FROM MEMBER";
            pstmt = conn.prepareStatement(aSql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MemberBean bean = new MemberBean();
                bean.setId(rs.getString("id"));
                bean.setName(rs.getString("name"));
                bean.setPasswd(rs.getString("passwd"));
                bean.setEmail(rs.getString("email"));
                bean.setPhone(rs.getString("phone"));
                list.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        }

        return list;
    }


}
