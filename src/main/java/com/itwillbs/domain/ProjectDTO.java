package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProjectDTO {

	@Override
	public String toString() {
		return "ProjectDTO [p_num=" + p_num + ", id=" + id + ", region_num=" + region_num + ", region=" + region
				+ ", field_num=" + field_num + ", field=" + field + ", p_title=" + p_title + ", p_content=" + p_content
				+ ", p_writedate=" + p_writedate + ", p_deadline=" + p_deadline + ", p_readcount=" + p_readcount
				+ ", p_start=" + p_start + ", p_end=" + p_end + ", p_member=" + p_member + ", p_file=" + p_file
				+ ", matching=" + matching + ", name=" + name + "]";
	}
	private int p_num;
	private String id;
	private int region_num;
	private String region;
	private int field_num;
	private String field;
	private String p_title;
	private String p_content;
	private Timestamp p_writedate;
	private Timestamp p_deadline;
	private int p_readcount;
	private Timestamp p_start;
	private Timestamp p_end;
	private int p_member;
	private String p_file;
	private int matching; //회원 매칭
	private String name; //회원 회사명
	
	
	
	public int getMatching() {
		return matching;
	}
	public void setMatching(int matching) {
		this.matching = matching;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRegion_num() {
		return region_num;
	}
	public void setRegion_num(int region_num) {
		this.region_num = region_num;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getField_num() {
		return field_num;
	}
	public void setField_num(int field_num) {
		this.field_num = field_num;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public Timestamp getP_writedate() {
		return p_writedate;
	}
	public void setP_writedate(Timestamp p_writedate) {
		this.p_writedate = p_writedate;
	}
	public Timestamp getP_deadline() {
		return p_deadline;
	}
	public void setP_deadline(Timestamp p_deadline) {
		this.p_deadline = p_deadline;
	}
	public int getP_readcount() {
		return p_readcount;
	}
	public void setP_readcount(int p_readcount) {
		this.p_readcount = p_readcount;
	}
	public Timestamp getP_start() {
		return p_start;
	}
	public void setP_start(Timestamp p_start) {
		this.p_start = p_start;
	}
	public Timestamp getP_end() {
		return p_end;
	}
	public void setP_end(Timestamp p_end) {
		this.p_end = p_end;
	}
	public int getP_member() {
		return p_member;
	}
	public void setP_member(int p_member) {
		this.p_member = p_member;
	}
	public String getP_file() {
		return p_file;
	}
	public void setP_file(String p_file) {
		this.p_file = p_file;
	}
	
} // class ProjectDTO
