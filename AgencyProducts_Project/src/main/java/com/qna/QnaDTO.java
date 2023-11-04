package com.qna;

public class QnaDTO {

	private long question_num;
	private String user_id;
	private String category_name;
	private String q_content;
	private String q_subject;
	private String q_reg_date;
	private String ans_date;
	private String ans_content;
	public long getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(long question_num) {
		this.question_num = question_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_reg_date() {
		return q_reg_date;
	}
	public void setQ_reg_date(String q_reg_date) {
		this.q_reg_date = q_reg_date;
	}
	public String getAns_date() {
		return ans_date;
	}
	public void setAns_date(String ans_date) {
		this.ans_date = ans_date;
	}
	public String getAns_content() {
		return ans_content;
	}
	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}
	
	
}
