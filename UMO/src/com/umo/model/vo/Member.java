package com.umo.model.vo;

import java.util.Date;

public class Member {
private String memberId;
private String memberPw;
private String memberName;
private String email;
private String phone;
private String address;


@Override
public String toString() {
	return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", email=" + email
			+ ", phone=" + phone + ", address=" + address + "]";
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


public String getPhone() {
	return phone;
}


public void setPhone(String phone) {
	this.phone = phone;
}


public String getAddress() {
	return address;
}


public void setAddress(String address) {
	this.address = address;
}


public Member(String memberId, String memberPw, String memberName, String email, String phone, String address) {
	super();
	this.memberId = memberId;
	this.memberPw = memberPw;
	this.memberName = memberName;
	this.email = email;
	this.phone = phone;
	this.address = address;
}


public Member() {
	// TODO Auto-generated constructor stub
}



}
