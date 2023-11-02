package com.entertainer;

public class EntertainerDTO {
	//entertainer(연예인)
	private String act_id; // 활동ID
	private String group_name;
	private String img_name;
	
	// job
	private String job_num; // 직업코드
	private String job_name;
	
	// enter_detail(상세정보)
	private String enter_id; // 연예인ID
	private String enter_name;
	private String enter_birth;
	private String debut_date;
	private String stage_name;
	
	// action
	private String action_num; // 분류코드
	private String action_name;
	
	// enter_action
	private long ac_list_num; // 활동내역 코드(seq)
	private String action_content;
	private String start_date;
	private String end_date;
	
	
	public String getAct_id() {
		return act_id;
	}
	public void setAct_id(String act_id) {
		this.act_id = act_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getJob_num() {
		return job_num;
	}
	public void setJob_num(String job_num) {
		this.job_num = job_num;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public String getEnter_id() {
		return enter_id;
	}
	public void setEnter_id(String enter_id) {
		this.enter_id = enter_id;
	}
	public String getEnter_name() {
		return enter_name;
	}
	public void setEnter_name(String enter_name) {
		this.enter_name = enter_name;
	}
	public String getEnter_birth() {
		return enter_birth;
	}
	public void setEnter_birth(String enter_birth) {
		this.enter_birth = enter_birth;
	}
	public String getDebut_date() {
		return debut_date;
	}
	public void setDebut_date(String debut_date) {
		this.debut_date = debut_date;
	}
	public String getStage_name() {
		return stage_name;
	}
	public void setStage_name(String stage_name) {
		this.stage_name = stage_name;
	}
	public String getAction_num() {
		return action_num;
	}
	public void setAction_num(String action_num) {
		this.action_num = action_num;
	}
	public String getAction_name() {
		return action_name;
	}
	public void setAction_name(String action_name) {
		this.action_name = action_name;
	}
	public long getAc_list_num() {
		return ac_list_num;
	}
	public void setAc_list_num(long ac_list_num) {
		this.ac_list_num = ac_list_num;
	}
	public String getAction_content() {
		return action_content;
	}
	public void setAction_content(String action_content) {
		this.action_content = action_content;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
	
}
