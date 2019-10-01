
package com.umo.member.model.service;

import com.umo.member.model.dao.MemberDao;
import com.umo.model.vo.Member;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;
import java.sql.Connection;
public class MemberService {

	private MemberDao dao=new MemberDao();
	
	public int registMember(Member m)
	{
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	
	public Member selectId(String id,String pw)
	{
		Connection conn=getConnection();
		Member m=dao.selectId(conn,id,pw);
		close(conn);
		return m;
	}
	
	public int updateMember(Member m) {
	      Connection conn=getConnection();
	      int result=dao.updateMember(conn,m);
	      if(result>0) {commit(conn);}
	      else {rollback(conn);}
	      close(conn);
	      return result;
	}

	public Member selectPointId(String member_id) {
		Connection conn=getConnection();
		Member m=dao.selectPointId(conn,member_id);
		close(conn);
		return m;
	}

	public Member idCheck(String id)
	{
		Connection conn=getConnection();
		Member m=dao.idCheck(conn,id);
		
		close(conn);
	return m;
	}	

	public Member findId(int kH_No) {
		Connection conn=getConnection();
		Member m=dao.findId(conn,kH_No);
		return m;
   }
	
	public Member selectOne(String userId) {
		Connection conn=getConnection();
		Member m=dao.selectOne(conn,userId);

		close(conn);
		return m;
	}

	public Member findPw(String id, int kH_No) {
		Connection conn=getConnection();
		Member m=dao.findPw(conn,id,kH_No);

		close(conn);
		return m;
	}
	public Member numCheck(int khnum,String name) {
		Connection conn=getConnection();
		Member m=dao.numCheck(conn,khnum,name);

		close(conn);
		return m;
	}

}
