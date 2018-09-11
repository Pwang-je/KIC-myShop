package my.shop.product;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderManager {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    public OrderManager() {
        try {
            Context context = new InitialContext();
            ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
        } catch (Exception e) {
            System.out.println("OrderManager err" + e);
        }
    }

    public void insertOrder(OrderBean order) {
        try {
            conn = ds.getConnection();
            String iSql = "INSERT INTO SHOP_ORDER (PRODUCT_NO, QUANTITY, SDATE, STATE, ID) VALUES (?,?,now(),?,?)";
            pstmt = conn.prepareStatement(iSql);
            pstmt.setString(1, order.getProduct_no());
            pstmt.setString(2, order.getQuantity());
            pstmt.setString(3, "1");
            pstmt.setString(4, order.getId());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("getProductAll err"+ e2);
            }
        }
    }
    // insertOrder;

    public ArrayList<OrderBean> getOrder(String id) {

        ArrayList<OrderBean> olist = new ArrayList<>();

        try {
            conn = ds.getConnection();
            String oSql = "SELECT * FROM SHOP_ORDER WHERE ID=?";
            pstmt = conn.prepareStatement(oSql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                OrderBean bean = new OrderBean();
                bean.setNo(rs.getString("no"));
                bean.setProduct_no(rs.getString("product_no"));
                bean.setQuantity(rs.getString("quantity"));
                bean.setSdate(rs.getString("sdate"));
                bean.setState(rs.getString("state"));
                bean.setId(rs.getString("id"));
                olist.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("getProductAll err"+ e2);
            }
        }

        return olist;
    }

    // 모든 order목록 읽어오기.
    public ArrayList<OrderBean> getOrderAll() {

        ArrayList<OrderBean> alist = new ArrayList<>();

        try {
            conn = ds.getConnection();
            String aSql = "SELECT * FROM SHOP_ORDER ORDER BY NO DESC";
            pstmt = conn.prepareStatement(aSql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                OrderBean bean = new OrderBean();
                bean.setNo(rs.getString("no"));
                bean.setProduct_no(rs.getString("product_no"));
                bean.setQuantity(rs.getString("quantity"));
                bean.setSdate(rs.getString("sdate"));
                bean.setState(rs.getString("state"));
                bean.setId(rs.getString("id"));
                alist.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("getOrderAll err"+ e2);
            }
        }
        return alist;
    }

    public OrderBean getOrderDetail(String no) {

        OrderBean bean = null;

        try {
            conn = ds.getConnection();
            String odSql = "SELECT * FROM SHOP_ORDER WHERE NO=?";
            pstmt = conn.prepareStatement(odSql);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                bean = new OrderBean();
                bean.setNo(rs.getString("no"));
                bean.setProduct_no(rs.getString("product_no"));
                bean.setQuantity(rs.getString("quantity"));
                bean.setSdate(rs.getString("sdate"));
                bean.setState(rs.getString("state"));
                bean.setId(rs.getString("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("getOrderDetail err"+ e2);
            }
        }
        return bean;
    }

    public boolean updateOrder(String no, String state) {

        boolean b = false;
        try {
            conn = ds.getConnection();
            String uSql = "UPDATE SHOP_ORDER SET STATE=? WHERE NO=?";
            pstmt = conn.prepareStatement(uSql);
            pstmt.setString(1, state);
            pstmt.setString(2, no);
            if (pstmt.executeUpdate() > 0) b = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("updateOrder err"+ e2);
            }
        }
        return b;
    }
}
