package com.itwillbs.domain;

import java.sql.Timestamp;

public class InquiryDTO {

	private int i_num;
	private String admin_id;
	private String id;
	private String i_title;
	private String i_content;
	private Timestamp i_date;
	private String asw_title;
	private String asw_content;
	private Timestamp asw_date;

	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getI_title() {
		return i_title;
	}

	public void setI_title(String i_title) {
		this.i_title = i_title;
	}

	public String getI_content() {
		return i_content;
	}

	public void setI_content(String i_content) {
		this.i_content = i_content;
	}

	public Timestamp getI_date() {
		return i_date;
	}

	public void setI_date(Timestamp i_date) {
		this.i_date = i_date;
	}

	public String getAsw_title() {
		return asw_title;
	}

	public void setAsw_title(String asw_title) {
		this.asw_title = asw_title;
	}

	public String getAsw_content() {
		return asw_content;
	}

	public void setAsw_content(String asw_content) {
		this.asw_content = asw_content;
	}

	public Timestamp getAsw_date() {
		return asw_date;
	}

	public void setAsw_date(Timestamp asw_date) {
		this.asw_date = asw_date;
	}

	@Override
	public String toString() {
		return "InquiryDTO [i_num=" + i_num + ", admin_id=" + admin_id + ", id=" + id + ", i_title=" + i_title
				+ ", i_content=" + i_content + ", i_date=" + i_date + ", asw_title=" + asw_title + ", asw_content="
				+ asw_content + ", asw_date=" + asw_date + "]";
	}

}
