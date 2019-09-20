package com.umo.model.vo;

public class Comment {
	private int board_no;
	private String board_writer;
	private String board_contends;
	private String updatecode;
	private int board_no_ref;
	private	int comment_level;
	private int comment_refno;
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	public Comment(int board_no, String board_writer, String board_contends, String updatecode, int board_no_ref,
			int comment_level, int comment_refno) {
		super();
		this.board_no = board_no;
		this.board_writer = board_writer;
		this.board_contends = board_contends;
		this.updatecode = updatecode;
		this.board_no_ref = board_no_ref;
		this.comment_level = comment_level;
		this.comment_refno = comment_refno;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_contends() {
		return board_contends;
	}
	public void setBoard_contends(String board_contends) {
		this.board_contends = board_contends;
	}
	public String getUpdatecode() {
		return updatecode;
	}
	public void setUpdatecode(String updatecode) {
		this.updatecode = updatecode;
	}
	public int getBoard_no_ref() {
		return board_no_ref;
	}
	public void setBoard_no_ref(int board_no_ref) {
		this.board_no_ref = board_no_ref;
	}
	public int getComment_level() {
		return comment_level;
	}
	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
	}
	public int getComment_refno() {
		return comment_refno;
	}
	public void setComment_refno(int comment_refno) {
		this.comment_refno = comment_refno;
	}
	@Override
	public String toString() {
		return "Comment [board_no=" + board_no + ", board_writer=" + board_writer + ", board_contends=" + board_contends
				+ ", updatecode=" + updatecode + ", board_no_ref=" + board_no_ref + ", comment_level=" + comment_level
				+ ", comment_refno=" + comment_refno + "]";
	}
	
	
}
