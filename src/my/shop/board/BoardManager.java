package my.shop.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardManager { //디비연동
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	private int tot; // 전체레코드 수
	private int pList =5; // 각 페이지 당 출력 레코드 수
	private int pageSu; //전체 페이지 수
	
	
	public BoardManager() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc_oracle");
		} catch (Exception e) {
			System.out.println("BoardManager err" + e);
		}
	}
	
	public int currentGetMaxNum() {
		String sql = "select max(num) from shopboard";
		int cnt = 0;
		try {
			conn = ds.getConnection();
			pstmt= conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) cnt = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("currentGetMaxNum err" + e);
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {
				System.out.println("savedata err"+ e2);
			}
		}
		return cnt;
	}
	
	
	
	public void saveData(BoardBean bean) { 
		String sql = "insert into shopboard values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			//System.out.println(bean.getName());
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());   //번호
			pstmt.setString(2, bean.getName()); //이름
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getMail());
			pstmt.setString(5, bean.getTitle());
			pstmt.setString(6, bean.getCont());
			pstmt.setString(7, bean.getBip());
			pstmt.setString(8, bean.getBdate());
			
			pstmt.setInt(9, 0);  //readcnt 0을줘야함			
			pstmt.setInt(10, bean.getGnum());
			pstmt.setInt(11, 0);
			pstmt.setInt(12, 0);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("savedata err: " + e);
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {
				System.out.println("savedata err"+ e2);
			}
		}
	}
	
	public ArrayList<BoardDto> getDataAll(int page, String stype, String sword){ // 전용 컬렉션 = generic
		ArrayList<BoardDto> list = new ArrayList<>();
		String sql = "select * from shopboard";
		try {
			conn = ds.getConnection();
			if(sword==null) {
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
			}else { //검색
				sql += " where " + stype + " like ?";
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sword + "%");
			}
			
			
			rs = pstmt.executeQuery();
			for(int i=0; i< (page - 1)*pList; i++) {
				rs.next(); // 처음엔 0, 4, 9....
			}
			int k = 0;
			while(rs.next() && k < pList) {
				BoardDto dto = new BoardDto(); //필요한거 출력
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setNested(rs.getInt("nested"));
				
				list.add(dto);
				k++;
				
			}
		} catch (Exception e) {
			System.out.println("getDataAll err" +e);
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		return list;
	}
	public void totalList() { //토탈 수얻기
		String sql = "select count(*) from shopboard";
		try {
			conn = ds.getConnection();
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("total err" + e);
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {
				
			}
		}
	}
	public int getPageSu() { //전체 페이지 수 얻기
		pageSu = tot/pList;
		if(tot % pList>0) pageSu++;
		return pageSu;
		
	}
	
	public BoardDto getData(String num) {
		
		String sql = " select * from shopboard where num=?";
		BoardDto dto = null;
		try {
			conn= ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new BoardDto();
				dto.setName(rs.getString("name"));
				System.out.println(dto.getName());
				dto.setPass(rs.getString("pass"));
				dto.setMail(rs.getString("mail"));
				dto.setTitle(rs.getString("title"));
				dto.setCont(rs.getString("cont"));
				dto.setBip(rs.getString("bip"));
				dto.setBdate(rs.getString("bdate"));
				dto.setReadcnt(rs.getInt("readcnt"));
			}
		} catch (Exception e) {
			System.out.println("getData err : " + e);
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {
				
			}
		}
		
		return dto;
	}

	public void updateReadcnt(String num) {
		String sql = "UPDATE SHOPBOARD  SET READCNT= READCNT + 1 WHERE NUM = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadcnt err: " + e);
		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {

			}
		}
	}


	// 댓글용.
	public BoardDto getReplayData(String num) {

		String sql = " select * from shopboard where num=?";
		BoardDto dto = null;
		try {
			conn= ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				dto=new BoardDto();
				dto.setTitle(rs.getString("title"));
				dto.setGnum(rs.getInt("gnum"));
				dto.setOnum(rs.getInt("onum"));
				dto.setNested(rs.getInt("nested"));
			}
		} catch (Exception e) {
			System.out.println("getData err : " + e);
		}finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {

			}
		}

		return dto;
	}

	public void updateOnum (int gnum, int onum) {

		// 같은 그룹의 레코드는 모두 작업에 참여한다.
		// 같은 그룹의 onum 값은 변경될 수 있다.
		// 댓글의 onum 은 이미 db에 있는 onum 보다 크거나 같은 값을 변경.
		String sql = "UPDATE SHOPBOARD SET ONUM = ONUM + 1 WHERE ONUM >= ? AND GNUM =?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, onum);
			pstmt.setInt(2, gnum);
			pstmt.executeUpdate();

		} catch (SQLException e) {

		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {

			}
		}
	}

	// 댓글 저장용.
	public void saveReplyData(BoardBean bean) {

	}


}
