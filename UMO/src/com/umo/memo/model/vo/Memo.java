package com.umo.memo.model.vo;

import java.sql.Date;

public class Memo {
	
	private int notes_no;
	private String receive_id;
	private String send_id;
	private String notes_contnet;
	private Date sent_date;
	private Date read_date;
	
	public Memo() {
		// TODO Auto-generated constructor stub
	}

	public Memo(int notes_no, String receive_id, String send_id, String notes_contnet, Date sent_date,
			Date read_date) {
		super();
		this.notes_no = notes_no;
		this.receive_id = receive_id;
		this.send_id = send_id;
		this.notes_contnet = notes_contnet;
		this.sent_date = sent_date;
		this.read_date = read_date;
	}

	public int getNotes_no() {
		return notes_no;
	}

	public void setNotes_no(int notes_no) {
		this.notes_no = notes_no;
	}

	public String getReceive_id() {
		return receive_id;
	}

	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getNotes_contnet() {
		return notes_contnet;
	}

	public void setNotes_contnet(String notes_contnet) {
		this.notes_contnet = notes_contnet;
	}

	public Date getSent_date() {
		return sent_date;
	}

	public void setSent_date(Date sent_date) {
		this.sent_date = sent_date;
	}

	public Date getRead_date() {
		return read_date;
	}

	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}
	
	
	
}
