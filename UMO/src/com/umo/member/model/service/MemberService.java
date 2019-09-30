
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



}
