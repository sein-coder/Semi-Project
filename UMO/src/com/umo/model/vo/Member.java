package com.umo.model.vo;

import java.util.Date;

public class Member {
private String memberId;
private String memberPw;
private String memberName;
private String class1;
private String email;
private int khno;
private Date join_date;
private int attendance_count;
private char grade;
private int point;

public Member() {
	// TODO Auto-generated constructor stub
}

public Member(String memberId, String memberPw, String memberName, String class1, String email, int khno,
		Date join_date, int attendance_count, char grade, int point) {
	super();
	this.memberId = memberId;
	this.memberPw = memberPw;
	this.memberName = memberName;
	this.class1 = class1;
	this.email = email;
	this.khno = khno;
	this.join_date = join_date;
	this.attendance_count = attendance_count;
	this.grade = grade;
	this.point = point;
}

public String getMemberId() {
	return memberId;
}

public void setMemberId(String memberId) {
	this.memberId = memberId;
}

public String getMemberPw() {
	return memberPw;
}

public void setMemberPw(String memberPw) {
	this.memberPw = memberPw;
}

public String getMemberName() {
	return memberName;
}

public void setMemberName(String memberName) {
	this.memberName = memberName;
}

public String getClass1() {
	return class1;
}

public void setClass1(String class1) {
	this.class1 = class1;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public int getKhno() {
	return khno;
}

public void setKhno(int khno) {
	this.khno = khno;
}

public Date getJoin_date() {
	return join_date;
}

public void setJoin_date(Date join_date) {
	this.join_date = join_date;
}

public int getAttendance_count() {
	return attendance_count;
}

public void setAttendance_count(int attendance_count) {
	this.attendance_count = attendance_count;
}

public char getGrade() {
	return grade;
}

public void setGrade(char grade) {
	this.grade = grade;
}

public int getPoint() {
	return point;
}

public void setPoint(int point) {
	this.point = point;
}

@Override
public String toString() {
	return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", class1="
			+ class1 + ", email=" + email + ", khno=" + khno + ", join_date=" + join_date + ", attendance_count="
			+ attendance_count + ", grade=" + grade + ", point=" + point + "]";
}




}