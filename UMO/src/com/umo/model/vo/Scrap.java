package com.umo.model.vo;

import java.sql.Date;

public class Scrap {
	public int board_no;
	public String board_type;
	public String board_title;
	public String board_writer;
	public Date board_date;
	public char board_status;
	

	public Scrap() {
		// TODO Auto-generated constructor stub
	}


	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	public String getBoard_type() {
		return board_type;
	}


	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}


	public String getBoard_title() {
		return board_title;
	}


	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}


	public String getBoard_writer() {
		return board_writer;
	}


	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}


	public Date getBoard_date() {
		return board_date;
	}


	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}


	public char getBoard_status() {
		return board_status;
	}


	public void setBoard_status(char board_status) {
		this.board_status = board_status;
	}


	public Scrap(int board_no, String board_type, String board_title, String board_writer, Date board_date,
			char board_status) {
		super();
		this.board_no = board_no;
		this.board_type = board_type;
		this.board_title = board_title;
		this.board_writer = board_writer;
		this.board_date = board_date;
		this.board_status = board_status;
	}


	@Override
	public String toString() {
		return "Scrap [board_no=" + board_no + ", board_type=" + board_type + ", board_title=" + board_title
				+ ", board_writer=" + board_writer + ", board_date=" + board_date + ", board_status=" + board_status
				+ "]";
	}
	
	
	
}
