package com.umo.memo.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.umo.memo.model.vo.Memo;
import com.umo.model.vo.Board;

public class MemoDao {

	public List<Memo> selectGetMemoList(Connection conn,String userId) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Memo> list = new ArrayList();

		String sql="select * from notes where receive_id ='"+userId+"'";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Memo memo = new Memo();
				memo.setNotes_no(rs.getInt("notes_no"));
				memo.setNotes_contnet(rs.getString("notes_content"));
				memo.setSend_id(rs.getString("send_id"));
				memo.setReceive_id(rs.getString("receive_id"));
				memo.setSent_date(rs.getDate("sent_date"));
				memo.setRead_date(rs.getDate("read_date"));
				list.add(memo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public List<Memo> selectSendMemoList(Connection conn,String userId) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Memo> list = new ArrayList();

		String sql="select * from notes where send_id ='"+userId+"'";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Memo memo = new Memo();
				memo.setNotes_no(rs.getInt("notes_no"));
				memo.setNotes_contnet(rs.getString("notes_content"));
				memo.setSend_id(rs.getString("send_id"));
				memo.setReceive_id(rs.getString("receive_id"));
				memo.setSent_date(rs.getDate("sent_date"));
				memo.setRead_date(rs.getDate("read_date"));
				list.add(memo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public Memo selectMemo(Connection conn, String memoNo) {
		Statement stmt = null;
		ResultSet rs = null;
		Memo memo = new Memo();

		String sql="select * from notes where notes_no ='"+memoNo+"'";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				memo.setNotes_no(rs.getInt("notes_no"));
				memo.setNotes_contnet(rs.getString("notes_content"));
				memo.setSend_id(rs.getString("send_id"));
				memo.setReceive_id(rs.getString("receive_id"));
				memo.setSent_date(rs.getDate("sent_date"));
				memo.setRead_date(rs.getDate("read_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return memo;
	}

	public int updateReadDate(Connection conn, Memo memo) {
		Statement stmt = null;
		int result = 0;
		
		String sql = "update notes set read_date = sysdate where notes_no = "+memo.getNotes_no();
		
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}

	public int insertMemo(Connection conn, Memo memo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into notes values(SEQ_notes_No.nextval, ? , ? , ? , default , null)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memo.getReceive_id());
			pstmt.setString(2, memo.getSend_id());
			pstmt.setString(3, memo.getNotes_contnet());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
