package com.umo.model.vo;

import java.util.Date;

public class Comment {
	private int comment_no;
	private String comment_writer;
	private String class1;
	private String comment_contents;
	private String updatecode;
	private Date comment_date;
	private int board_no_ref;
	private	int comment_level;
	private int comment_refno;
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	public Comment(int comment_no, String comment_writer, String class1, String comment_contents, String updatecode,
			Date comment_date, int board_no_ref, int comment_level, int comment_refno) {
		super();
		this.comment_no = comment_no;
		this.comment_writer = comment_writer;
		this.class1 = class1;
		this.comment_contents = comment_contents;
		this.updatecode = updatecode;
		this.comment_date = comment_date;
		this.board_no_ref = board_no_ref;
		this.comment_level = comment_level;
		this.comment_refno = comment_refno;
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
	public String getClass1() {
		return class1;
	}
	public void setClass1(String class1) {
		this.class1 = class1;
	}
	public String getComment_contents() {
		return comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}
	public String getUpdatecode() {
		return updatecode;
	}
	public void setUpdatecode(String updatecode) {
		this.updatecode = updatecode;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
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
		return "Comment [comment_no=" + comment_no + ", comment_writer=" + comment_writer + ", class1=" + class1
				+ ", comment_contents=" + comment_contents + ", updatecode=" + updatecode + ", comment_date="
				+ comment_date + ", board_no_ref=" + board_no_ref + ", comment_level=" + comment_level
				+ ", comment_refno=" + comment_refno + "]";
	}
		
}
