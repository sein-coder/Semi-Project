package com.umo.model.vo;

import java.util.Date;

public class Member {
private String memberId;
private String memberPw;
private String memberName;
private String email;
private String class1;
private int khno;

public Member() {
	// TODO Auto-generated constructor stub
}

public Member(String memberId, String memberPw, String memberName, String email, String class1, int khno) {
	super();
	this.memberId = memberId;
	this.memberPw = memberPw;
	this.memberName = memberName;
	this.email = email;
	this.class1 = class1;
	this.khno = khno;
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

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getClass1() {
	return class1;
}

public void setClass1(String class1) {
	this.class1 = class1;
}

public int getKhno() {
	return khno;
}

public void setKhno(int khno) {
	this.khno = khno;
}

@Override
public String toString() {
	return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", email=" + email
			+ ", class1=" + class1 + ", khno=" + khno + "]";
}



}
