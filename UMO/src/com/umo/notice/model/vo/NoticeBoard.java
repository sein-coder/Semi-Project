package com.umo.notice.model.vo;

import java.sql.Date;

public class NoticeBoard {
	
	private int no;
	private String writer;
	private String title;
	private String content;
	private String original_filename;
	private String renamed_filename;
	private Date date;
	private int count;
	private char writing_status;
	private int board_grade;//추천수 통계
	private String boardType; //게시판 종류
	
	public NoticeBoard() {
		// TODO Auto-generated constructor stub
	}

	public NoticeBoard(int no, String writer, String title, String content, String original_filename, String renamed_filename,
			Date date, int count, char writing_status, int board_grade, String boardType) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.original_filename = original_filename;
		this.renamed_filename = renamed_filename;
		this.date = date;
		this.count = count;
		this.writing_status = writing_status;
		this.board_grade = board_grade;
		this.boardType = boardType;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOriginal_filename() {
		return original_filename;
	}

	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}

	public String getRenamed_filename() {
		return renamed_filename;
	}

	public void setRenamed_filename(String renamed_filename) {
		this.renamed_filename = renamed_filename;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public char getWriting_status() {
		return writing_status;
	}

	public void setWriting_status(char writing_status) {
		this.writing_status = writing_status;
	}

	public int getBoard_grade() {
		return board_grade;
	}

	public void setBoard_grade(int board_grade) {
		this.board_grade = board_grade;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", original_filename=" + original_filename + ", renamed_filename=" + renamed_filename + ", date="
				+ date + ", count=" + count + ", writing_status=" + writing_status + ", board_grade=" + board_grade
				+ ", boardType=" + boardType + "]";
	}
	
	
	

	
	
	
	

}
