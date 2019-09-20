package com.umo.model.vo;

import java.sql.Date;

public class Inquery {
	
	private int board_No;
	private String board_Writer;
	private String board_Title;
	private String board_Contents;
	private String inputCode;
	private String outputCode;
	private String code_Type;
	private String original_FileName;
	private String renamed_FileName;
	private Date board_Date;
	private int board_Count;
	private char writing_Status;
	
	public Inquery() {
		// TODO Auto-generated constructor stub
	}

	public Inquery(int board_No, String board_Writer, String board_Title, String board_Contents, String inputCode,
			String outputCode, String code_Type, String original_FileName, String renamed_FileName, Date board_Date,
			int board_Count, char writing_Status) {
		super();
		this.board_No = board_No;
		this.board_Writer = board_Writer;
		this.board_Title = board_Title;
		this.board_Contents = board_Contents;
		this.inputCode = inputCode;
		this.outputCode = outputCode;
		this.code_Type = code_Type;
		this.original_FileName = original_FileName;
		this.renamed_FileName = renamed_FileName;
		this.board_Date = board_Date;
		this.board_Count = board_Count;
		this.writing_Status = writing_Status;
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

	public String getInputCode() {
		return inputCode;
	}

	public void setInputCode(String inputCode) {
		this.inputCode = inputCode;
	}

	public String getOutputCode() {
		return outputCode;
	}

	public void setOutputCode(String outputCode) {
		this.outputCode = outputCode;
	}

	public String getCode_Type() {
		return code_Type;
	}

	public void setCode_Type(String code_Type) {
		this.code_Type = code_Type;
	}

	public String getOriginal_FileName() {
		return original_FileName;
	}

	public void setOriginal_FileName(String original_FileName) {
		this.original_FileName = original_FileName;
	}

	public String getRenamed_FileName() {
		return renamed_FileName;
	}

	public void setRenamed_FileName(String renamed_FileName) {
		this.renamed_FileName = renamed_FileName;
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

	@Override
	public String toString() {
		return "Inquery [board_No=" + board_No + ", board_Writer=" + board_Writer + ", board_Title=" + board_Title
				+ ", board_Contents=" + board_Contents + ", inputCode=" + inputCode + ", outputCode=" + outputCode
				+ ", code_Type=" + code_Type + ", original_FileName=" + original_FileName + ", renamed_FileName="
				+ renamed_FileName + ", board_Date=" + board_Date + ", board_Count=" + board_Count + ", writing_Status="
				+ writing_Status + "]";
	}
	
	
}
