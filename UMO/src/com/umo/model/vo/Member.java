package com.umo.model.vo;

import java.util.Date;

public class Member {
private String memberId;
private String memberPw;
private String memberName;
private String email;
private String phone;
private String address;
private Date join_Date;
private int kh_cNo;
private int attendance_count;
private int grade;
private int point;

public Member() {
	// TODO Auto-generated constructor stub
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

public Member(String memberId, String memberPw, String memberName, String email, String phone, String address,
		Date join_Date, int kh_cNo, int attendance_count, int grade, int point) {
	super();
	this.memberId = memberId;
	this.memberPw = memberPw;
	this.memberName = memberName;
	this.email = email;
	this.phone = phone;
	this.address = address;
	this.join_Date = join_Date;
	this.kh_cNo = kh_cNo;
	this.attendance_count = attendance_count;
	this.grade = grade;
	this.point = point;
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

public Date getJoin_Date() {
	return join_Date;
}

public void setJoin_Date(Date join_Date) {
	this.join_Date = join_Date;
}

public int getKh_cNo() {
	return kh_cNo;
}

public void setKh_cNo(int kh_cNo) {
	this.kh_cNo = kh_cNo;
}

public int getAttendance_count() {
	return attendance_count;
}

public void setAttendance_count(int attendance_count) {
	this.attendance_count = attendance_count;
}

public int getGrade() {
	return grade;
}

public void setGrade(int grade) {
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
	return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", email=" + email
			+ ", phone=" + phone + ", address=" + address + ", join_Date=" + join_Date + ", kh_cNo=" + kh_cNo
			+ ", attendance_count=" + attendance_count + ", grade=" + grade + ", point=" + point + "]";
}




}
