package my.shop.product;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class ProductManager {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    public ProductManager() {
        try {
            Context context = new InitialContext();
            ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
        } catch (Exception e) {
            System.out.println("ProductManager err" + e);
        }
    }
    // Const;

    public ArrayList<ProductBean> getProductAll() {
        ArrayList<ProductBean> list = new ArrayList<>();

        try {
            conn = ds.getConnection();
            String sql = "SELECT * FROM SHOP_PRODUCT";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductBean bean = new ProductBean();
                bean.setNo(rs.getInt("no"));
                bean.setName(rs.getString("name"));
                bean.setPrice(rs.getString("price"));
                bean.setDetail(rs.getString("detail"));
                bean.setSdate(rs.getString("sdate"));
                bean.setStock(rs.getString("stock"));
                bean.setImage(rs.getString("image"));
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
                System.out.println("getProductAll err"+ e2);
            }
        }
        return list;
    }


    public boolean insertProduct(HttpServletRequest request) {
        boolean b = false;

        try {
            // 업로드할 이미지 절대경로.
            String uploadDir = "C:\\work\\myShop\\web\\data";
            MultipartRequest multi = new MultipartRequest(request, uploadDir, 1014 * 1024 * 5, "UTF-8", new DefaultFileRenamePolicy());
            conn = ds.getConnection();
            String sql = "INSERT INTO SHOP_PRODUCT (NAME, PRICE, DETAIL, SDATE, STOCK, IMAGE) VALUES (?,?,?,now(),?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getParameter("price"));
            pstmt.setString(3, multi.getParameter("detail"));
            pstmt.setString(4, multi.getParameter("stock"));
            // 이미지 받는법.
            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(5, "ready.gif");
            } else {
                pstmt.setString(5, multi.getFilesystemName("image"));
            }

            if (pstmt.executeUpdate() > 0) b = true;    // 실행

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("insertProduct err"+ e2);
            }
        }
        return b;
    }

    public ProductBean getProduct(String no) {
        ProductBean bean = null;

        try {
            conn = ds.getConnection();
            String pSql = "SELECT * FROM SHOP_PRODUCT WHERE NO=?";
            pstmt = conn.prepareStatement(pSql);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                bean = new ProductBean();
                bean.setNo(rs.getInt("no"));
                bean.setName(rs.getString("name"));
                bean.setPrice(rs.getString("price"));
                bean.setDetail(rs.getString("detail"));
                bean.setSdate(rs.getString("sdate"));
                bean.setStock(rs.getString("stock"));
                bean.setImage(rs.getString("image"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("getProduct err"+ e2);
            }
        }
        return bean;
    }


    public boolean updateProduct(HttpServletRequest request) {

        boolean b = false;

        try {
            conn = ds.getConnection();
            String uSql = "UPDATE SHOP_PRODUCT SET NAME=?, PRICE=?, DETAIL=?, STOCK=? WHERE NO=?";
            pstmt = conn.prepareStatement(uSql);
            pstmt.setString(1, "name");
            pstmt.setString(2, "price");
            pstmt.setString(3, "detail");
            pstmt.setString(4, "stock");
            pstmt.setString(5, "no");
            if (pstmt.executeUpdate() > 0) b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("updateProduct err"+ e2);
            }
        }
        return b;
    }

    public boolean deleteProduct (String no) {

        boolean b = false;

        try {
            conn = ds.getConnection();
            String dSql = "DELETE FROM SHOP_PRODUCT WHERE NO=?";
            pstmt = conn.prepareStatement(dSql);
            pstmt.setString(1, no);
            if (pstmt.executeUpdate() > 0) b = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("deleteProduct err"+ e2);
            }
        }
        return b;
    }

    // 고객이 상품 주문 시, 주문 수 만큼 재고량에서 빼기
    public void reduceProduct(OrderBean order) {
        try {
            conn = ds.getConnection();
            String rSql = "UPDATE SHOP_PRODUCT SET STOCK=(STOCK = ?) WHERE NO=?";
            pstmt = conn.prepareStatement(rSql);
            pstmt.setString(1, order.getQuantity());
            pstmt.setString(2, order.getProduct_no());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null) rs.close();
                if(pstmt !=null) pstmt.close();
                if(conn !=null) conn.close();
            } catch (Exception e2) {
                System.out.println("reduceProduct err"+ e2);
            }
        }
    }
}
