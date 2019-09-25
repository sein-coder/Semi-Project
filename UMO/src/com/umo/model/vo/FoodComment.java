package com.umo.model.vo;

import java.sql.Date;

public class FoodComment {
	private int comment_No;
	private String comment_Writer;
	private String comment_Contents;
	private Date Date;
	private int board_no_Ref;
	private int comment_Level;
	private int comment_Refno;
	
	public FoodComment() {
		// TODO Auto-generated constructor stub
	}

	public FoodComment(int comment_No, String comment_Writer, String comment_Contents, java.sql.Date date,
			int board_no_Ref, int comment_Level, int comment_Refno) {
		super();
		this.comment_No = comment_No;
		this.comment_Writer = comment_Writer;
		this.comment_Contents = comment_Contents;
		Date = date;
		this.board_no_Ref = board_no_Ref;
		this.comment_Level = comment_Level;
		this.comment_Refno = comment_Refno;
	}

	public int getComment_No() {
		return comment_No;
	}

	public void setComment_No(int comment_No) {
		this.comment_No = comment_No;
	}

	public String getComment_Writer() {
		return comment_Writer;
	}

	public void setComment_Writer(String comment_Writer) {
		this.comment_Writer = comment_Writer;
	}

	public String getComment_Contents() {
		return comment_Contents;
	}

	public void setComment_Contents(String comment_Contents) {
		this.comment_Contents = comment_Contents;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		Date = date;
	}

	public int getBoard_no_Ref() {
		return board_no_Ref;
	}

	public void setBoard_no_Ref(int board_no_Ref) {
		this.board_no_Ref = board_no_Ref;
	}

	public int getComment_Level() {
		return comment_Level;
	}

	public void setComment_Level(int comment_Level) {
		this.comment_Level = comment_Level;
	}

	public int getComment_Refno() {
		return comment_Refno;
	}

	public void setComment_Refno(int comment_Refno) {
		this.comment_Refno = comment_Refno;
	}

	@Override
	public String toString() {
		return "FoodComment [comment_No=" + comment_No + ", comment_Writer=" + comment_Writer + ", comment_Contents="
				+ comment_Contents + ", Date=" + Date + ", board_no_Ref=" + board_no_Ref + ", comment_Level="
				+ comment_Level + ", comment_Refno=" + comment_Refno + "]";
	}
	
	
	
}
	