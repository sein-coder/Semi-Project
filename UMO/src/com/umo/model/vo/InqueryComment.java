package com.umo.model.vo;

import java.sql.Date;

public class InqueryComment {
	private int comment_no;
	private String comment_writer;
	private String comment_contents;
	private int board_no_Ref;
	private int comment_level;
	private int comment_Refno;
	private Date comment_date;
	
	public InqueryComment() {
		// TODO Auto-generated constructor stub
	}

	public InqueryComment(int comment_no, String comment_writer, String comment_contents,
			int board_no_Ref, int comment_level, int comment_Refno, Date comment_date) {
		super();
		this.comment_no = comment_no;
		this.comment_writer = comment_writer;
		this.comment_contents = comment_contents;
		this.board_no_Ref = board_no_Ref;
		this.comment_level = comment_level;
		this.comment_Refno = comment_Refno;
		this.comment_date = comment_date;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public String getComment_writer() {
		return comment_writer;
	}

	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}

	public String getComment_contents() {
		return comment_contents;
	}

	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}

	public int getBoard_no_Ref() {
		return board_no_Ref;
	}

	public void setBoard_no_Ref(int board_no_Ref) {
		this.board_no_Ref = board_no_Ref;
	}

	public int getComment_level() {
		return comment_level;
	}

	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
	}

	public int getComment_Refno() {
		return comment_Refno;
	}

	public void setComment_Refno(int comment_Refno) {
		this.comment_Refno = comment_Refno;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	
	
	
}
