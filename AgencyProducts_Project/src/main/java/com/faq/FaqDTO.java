package com.faq;

public class FaqDTO {
	private long faq_num;
	private String faq_case;
	private String faq_subject;
	private String faq_content;
	
	public long getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(long faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_case() {
		return faq_case;
	}
	public void setFaq_case(String faq_case) {
		this.faq_case = faq_case;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
}
