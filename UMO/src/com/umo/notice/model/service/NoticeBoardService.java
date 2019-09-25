package com.umo.notice.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.umo.model.vo.BoardComment;
import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.dao.NoticeBoardDao;

public class NoticeBoardService {
	
	private NoticeBoardDao dao= new NoticeBoardDao();
	
	//공지글 총 갯수
	public int countNoticeList() {	
		Connection conn=getConnection();	
		int result=dao.countNoticeList(conn);
		close(conn);
		return result;
	}
	//공지 전체 리스트 불러오기
	public List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage){
		Connection conn=getConnection();		
		List<NoticeBoard> list=dao.selectNoticeBoardList(conn, cPage, numPerPage);
		close(conn);	
		return list; 
	}
	//선택된 공지사항 내용 확인
	public NoticeBoard noticeBoardContent(int no) {
		Connection conn=getConnection();
		NoticeBoard nb=dao.noticeBoardContent(conn, no);
		close(conn);
		return nb;
	}
	//새로운 공지 작성
	public int noticeWrite(NoticeBoard nb) {
		Connection conn=getConnection();
		int result=dao.noticeWrite(conn,nb);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	//마지막에 작성한 공지사항 글 번호 불러오기
	public int lastNoticeContentNo(String writer) {
		Connection conn=getConnection();
		int no=dao.lastNoticeContentNo(conn,writer);
		close(conn);
		return no;
	}
	
	public int noticeUpdate(NoticeBoard nb) {
		System.out.println(nb.getOriginal_filename()+" "+nb.getRenamed_filename());
		Connection conn=getConnection();
		int result=dao.noticeUpdate(conn,nb);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	public NoticeBoard selectnoticeBoard(int no,boolean hasRead) {
		Connection conn=getConnection();
		NoticeBoard b=dao.noticeBoardContent(conn,no);
		if(!hasRead&&b!=null) {
			int result=dao.updateReadCount(conn,no);
			if(result>0) {commit(conn);}
			else {rollback(conn);}
		}
		close(conn);
		return b;
	}
	public List<BoardComment> selectnoticeBoardComment(int no){
		Connection conn=getConnection();
		List<BoardComment> list=dao.selectnoticeBoardComment(conn,no);
		close(conn);
		return list;
	}
	public int insertnoticeBoardComment(BoardComment bc) {
		Connection conn=getConnection();
		int result=dao.insertnoticeBoardComment(conn,bc);
		if(result>0) {
			commit(conn);
		}else {rollback(conn);}
		close(conn);
		return result;
		
		
	}
	public int deleteNoticeBoardComment(int no) {
		Connection conn=getConnection();
		int result=dao.deleteNoticeBoardComment(conn,no);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public int noticeDelete(int no)
	{
		Connection conn=getConnection();
		int result=dao.noticeDelete(conn,no);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}

}
