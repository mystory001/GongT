package com.itwillbs.domain;

import java.sql.Timestamp;

public class ChatDTO {

	private int c_num;
	private int p_num;
	private String fid;
	private String cid;
	private int c_matching;
	private String id;

	private String c_content;
	private Timestamp c_time;

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
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

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getC_matching() {
		return c_matching;
	}

	public void setC_matching(int c_matching) {
		this.c_matching = c_matching;
	}

}
