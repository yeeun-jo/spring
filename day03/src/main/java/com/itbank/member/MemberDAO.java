package com.itbank.member;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Repository	// 저장소 : 데이터가 저장되어 있는 DB에 접근하는 객체
public class MemberDAO {

	@Autowired
	private ComboPooledDataSource ds;
	
	@Autowired
	private JdbcTemplate jt;
	
	// 회원목록 보여주는 방법1
	public List<MemberDTO> selectAll(){
		System.out.println("selectAll연결이 잘 되었나 ~~? ");
		
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from member2 order by userid";
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setIdx(rs.getInt("idx"));
				dto.setUserid(rs.getString("userid"));
				dto.setUsername(rs.getString("username"));
				dto.setUserpw(rs.getString("userpw"));
				list.add(dto);
			}
			return list;
		}catch(SQLException e) {
			System.out.println("sql 오류 : " + e);
		}finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch(Exception e) {}
		}
		return null;
	}

	// 회원목록 보여주는 방법2
	public List<MemberDTO> selectAll2(){
		String sql = "select * from member2 order by userid";
		List<MemberDTO> list = null;
		
		RowMapper<MemberDTO> rowMapper = (ResultSet rs, int row) -> {
			MemberDTO dto = new MemberDTO();
			dto.setEmail(rs.getString("email"));
			dto.setGender(rs.getString("gender"));
			dto.setIdx(rs.getInt("idx"));
			dto.setUserid(rs.getString("userid"));
			dto.setUsername(rs.getString("username"));
			dto.setUserpw(rs.getString("userpw"));
			return dto;
		};
		list = jt.query(sql, rowMapper);
		return list;
	}

	// 회원가입
	public int insertMember(MemberDTO user) {
		String sql = "insert into member2 (userid,userpw,username,email,gender) "
				+ "values('%s','%s','%s','%s','%s')"; 
	
		sql = String.format(sql, user.getUserid(),user.getUserpw(),user.getUsername(),user.getEmail(),user.getGender());
		
		return jt.update(sql);
	}

}
