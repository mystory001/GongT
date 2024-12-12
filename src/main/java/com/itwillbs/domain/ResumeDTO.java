package com.itwillbs.domain;

public class ResumeDTO {

	private int r_num;
	private String id;
	private int region_num;
	private String region;
	private int field_num;
	private String field;
	private String r_name;
	private int r_career;
	private String r_tech;
	private String r_form;
	private int r_salary;
	private String r_exp;
	private String r_content;

	private String r_file;
	private String name; // 회원 이름
	private int matching; // 회원 매칭

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMatching() {
		return matching;
	}

	public void setMatching(int matching) {
		this.matching = matching;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
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

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public int getR_career() {
		return r_career;
	}

	public void setR_career(int r_career) {
		this.r_career = r_career;
	}

	public String getR_tech() {
		return r_tech;
	}

	public void setR_tech(String r_tech) {
		this.r_tech = r_tech;
	}

	public String getR_form() {
		return r_form;
	}

	public void setR_form(String r_form) {
		this.r_form = r_form;
	}

	public int getR_salary() {
		return r_salary;
	}

	public void setR_salary(int r_salary) {
		this.r_salary = r_salary;
	}

	public String getR_exp() {
		return r_exp;
	}

	public void setR_exp(String r_exp) {
		this.r_exp = r_exp;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_file() {
		return r_file;
	}

	public void setR_file(String r_file) {
		this.r_file = r_file;
	}

	@Override
	public String toString() {
		return "ResumeDTO [r_num=" + r_num + ", id=" + id + ", region_num=" + region_num + ", region=" + region
				+ ", field_num=" + field_num + ", field=" + field + ", r_name=" + r_name + ", r_career=" + r_career
				+ ", r_tech=" + r_tech + ", r_form=" + r_form + ", r_salary=" + r_salary + ", r_exp=" + r_exp
				+ ", r_content=" + r_content + ", r_file=" + r_file + ", name=" + name + ", matching=" + matching + "]";
	}

}
