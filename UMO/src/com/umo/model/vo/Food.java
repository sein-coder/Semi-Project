package com.umo.model.vo;

import java.sql.Date;

public class Food {
	
	private int board_No;
	private String board_Writer;
	private String board_Title;
	private String board_Contents;
	private String board_MAP;
	private String board_Thumbnail;
	private String original_Filename;
	private String renamed_Filename;
	private Date board_Date;
	private int board_Count;
	private char writing_Status;
	private int board_Grade;
	private String board_tel;
	private String board_foodtype;
	private int board_foodbill;
	private String board_park;
	private String board_open;
	private String board_menu;

	public Food() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Food(int board_No, String board_Writer, String board_Title, String board_Contents, String board_MAP,
			String board_Thumbnail, String original_Filename, String renamed_Filename, Date board_Date, int board_Count,
			char writing_Status, int board_Grade, String board_tel, String board_foodtype, int board_foodbill,
			String board_park, String board_open, String board_menu) {
		super();
		this.board_No = board_No;
		this.board_Writer = board_Writer;
		this.board_Title = board_Title;
		this.board_Contents = board_Contents;
		this.board_MAP = board_MAP;
		this.board_Thumbnail = board_Thumbnail;
		this.original_Filename = original_Filename;
		this.renamed_Filename = renamed_Filename;
		this.board_Date = board_Date;
		this.board_Count = board_Count;
		this.writing_Status = writing_Status;
		this.board_Grade = board_Grade;
		this.board_tel = board_tel;
		this.board_foodtype = board_foodtype;
		this.board_foodbill = board_foodbill;
		this.board_park = board_park;
		this.board_open = board_open;
		this.board_menu = board_menu;
	}



	public int getBoard_No() {
		return board_No;
	}

	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}

	public String getBoard_Writer() {
		return board_Writer;
	}

	public void setBoard_Writer(String board_Writer) {
		this.board_Writer = board_Writer;
	}

	public String getBoard_Title() {
		return board_Title;
	}

	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}

	public String getBoard_Contents() {
		return board_Contents;
	}

	public void setBoard_Contents(String board_Contents) {
		this.board_Contents = board_Contents;
	}

	public String getBoard_MAP() {
		return board_MAP;
	}

	public void setBoard_MAP(String board_MAP) {
		this.board_MAP = board_MAP;
	}

	public String getBoard_Thumbnail() {
		return board_Thumbnail;
	}

	public void setBoard_Thumbnail(String board_Thumbnail) {
		this.board_Thumbnail = board_Thumbnail;
	}

	public String getOriginal_Filename() {
		return original_Filename;
	}

	public void setOriginal_Filename(String original_Filename) {
		this.original_Filename = original_Filename;
	}

	public String getRenamed_Filename() {
		return renamed_Filename;
	}

	public void setRenamed_Filename(String renamed_Filename) {
		this.renamed_Filename = renamed_Filename;
	}

	public Date getBoard_Date() {
		return board_Date;
	}

	public void setBoard_Date(Date board_Date) {
		this.board_Date = board_Date;
	}

	public int getBoard_Count() {
		return board_Count;
	}

	public void setBoard_Count(int board_Count) {
		this.board_Count = board_Count;
	}

	public char getWriting_Status() {
		return writing_Status;
	}

	public void setWriting_Status(char writing_Status) {
		this.writing_Status = writing_Status;
	}

	public int getBoard_Grade() {
		return board_Grade;
	}

	public void setBoard_Grade(int board_Grade) {
		this.board_Grade = board_Grade;
	}

	public String getBoard_tel() {
		return board_tel;
	}

	public void setBoard_tel(String board_tel) {
		this.board_tel = board_tel;
	}

	public String getBoard_foodtype() {
		return board_foodtype;
	}

	public void setBoard_foodtype(String board_foodtype) {
		this.board_foodtype = board_foodtype;
	}

	public int getBoard_foodbill() {
		return board_foodbill;
	}

	public void setBoard_foodbill(int board_foodbill) {
		this.board_foodbill = board_foodbill;
	}

	public String getBoard_park() {
		return board_park;
	}

	public void setBoard_park(String board_park) {
		this.board_park = board_park;
	}

	public String getBoard_open() {
		return board_open;
	}

	public void setBoard_open(String board_open) {
		this.board_open = board_open;
	}

	public String getBoard_menu() {
		return board_menu;
	}

	public void setBoard_menu(String board_menu) {
		this.board_menu = board_menu;
	}



	@Override
	public String toString() {
		return "Food [board_No=" + board_No + ", board_Writer=" + board_Writer + ", board_Title=" + board_Title
				+ ", board_Contents=" + board_Contents + ", board_MAP=" + board_MAP + ", board_Thumbnail="
				+ board_Thumbnail + ", original_Filename=" + original_Filename + ", renamed_Filename="
				+ renamed_Filename + ", board_Date=" + board_Date + ", board_Count=" + board_Count + ", writing_Status="
				+ writing_Status + ", board_Grade=" + board_Grade + ", board_tel=" + board_tel + ", board_foodtype="
				+ board_foodtype + ", board_foodbill=" + board_foodbill + ", board_park=" + board_park + ", board_open="
				+ board_open + ", board_menu=" + board_menu + "]";
	}
	
	
	

}
