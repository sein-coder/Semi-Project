package com.umo.memo.model.service;

import java.sql.Connection;
import java.util.List;

import com.umo.memo.model.dao.MemoDao;
import com.umo.memo.model.vo.Memo;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.commit;


public class MemoService {

	private MemoDao dao = new MemoDao();
	
	public List<Memo> selectGetMemoList(String userId) {
		Connection conn = getConnection();
		List<Memo> list = dao.selectGetMemoList(conn,userId);
		close(conn);
		return list;
	}

	public List<Memo> selectSendMemoList(String userId) {
		Connection conn = getConnection();
		List<Memo> list = dao.selectSendMemoList(conn,userId);
		close(conn);
		return list;
	}

	public Memo selectMemo(String memoNo, String type) {
		Connection conn = getConnection();
		Memo memo = dao.selectMemo(conn,memoNo);
		if(memo!=null && type.equals("receive")) {
			int result = dao.updateReadDate(conn,memo);
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		close(conn);
		return memo;
	}

	public int insertMemo(Memo memo) {
		Connection conn = getConnection();
		int result = dao.insertMemo(conn,memo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
