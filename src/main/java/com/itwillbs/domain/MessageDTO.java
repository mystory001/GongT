package com.itwillbs.domain;

import java.sql.Timestamp;

public class MessageDTO {

	private int cc_num;
	private int c_num;
	private String id;
	private String c_content;
	private Timestamp c_time;
	
	public int getCc_num() {
		return cc_num;
	}
	public void setCc_num(int cc_num) {
		this.cc_num = cc_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Timestamp getC_time() {
		return c_time;
	}
	public void setC_time(Timestamp c_time) {
		this.c_time = c_time;
	}
	
	
	
}
