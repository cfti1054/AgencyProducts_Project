package com.payment;

	public class paymentDTO {
		private String user_id;
		private String user_name;
		private String user_pwd;
		private String reg_date;
		private String birth;
		private String zip;
		private String tel1;
		private String tel2;
		private String tel3;
		private String tel;
		private String email1;
		private String email2;
		private String email;
		private String addr1;

		// 주문 내역
		private String payment_id;
		private String total_price;
		private String payment_date;

		// 주문 상세 내역
		private long detail_num;
		private String goods_price;
		private long order_count;
		
		private String goods_name;

		public String getUser_id() {
			return user_id;
		}

		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}

		public String getUser_name() {
			return user_name;
		}

		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}

		public String getUser_pwd() {
			return user_pwd;
		}

		public void setUser_pwd(String user_pwd) {
			this.user_pwd = user_pwd;
		}

		public String getReg_date() {
			return reg_date;
		}

		public void setReg_date(String reg_date) {
			this.reg_date = reg_date;
		}

		public String getBirth() {
			return birth;
		}

		public void setBirth(String birth) {
			this.birth = birth;
		}

		public String getZip() {
			return zip;
		}

		public void setZip(String zip) {
			this.zip = zip;
		}

		public String getTel1() {
			return tel1;
		}

		public void setTel1(String tel1) {
			this.tel1 = tel1;
		}

		public String getTel2() {
			return tel2;
		}

		public void setTel2(String tel2) {
			this.tel2 = tel2;
		}

		public String getTel3() {
			return tel3;
		}

		public void setTel3(String tel3) {
			this.tel3 = tel3;
		}

		public String getTel() {
			return tel;
		}

		public void setTel(String tel) {
			this.tel = tel;
		}

		public String getEmail1() {
			return email1;
		}

		public void setEmail1(String email1) {
			this.email1 = email1;
		}

		public String getEmail2() {
			return email2;
		}

		public void setEmail2(String email2) {
			this.email2 = email2;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getAddr1() {
			return addr1;
		}

		public void setAddr1(String addr1) {
			this.addr1 = addr1;
		}

		public String getAddr2() {
			return addr2;
		}

		public void setAddr2(String addr2) {
			this.addr2 = addr2;
		}

		public int getEnabled() {
			return enabled;
		}

		public void setEnabled(int enabled) {
			this.enabled = enabled;
		}

		public String getPayment_id() {
			return payment_id;
		}

		public void setPayment_id(String payment_id) {
			this.payment_id = payment_id;
		}

		public String getTotal_price() {
			return total_price;
		}

		public void setTotal_price(String total_price) {
			this.total_price = total_price;
		}

		public String getPayment_date() {
			return payment_date;
		}

		public void setPayment_date(String payment_date) {
			this.payment_date = payment_date;
		}

		public long getDetail_num() {
			return detail_num;
		}

		public void setDetail_num(long detail_num) {
			this.detail_num = detail_num;
		}

		public String getGoods_price() {
			return goods_price;
		}

		public void setGoods_price(String goods_price) {
			this.goods_price = goods_price;
		}

		public long getOrder_count() {
			return order_count;
		}

		public void setOrder_count(long order_count) {
			this.order_count = order_count;
		}

		public String getGoods_name() {
			return goods_name;
		}

		public void setGoods_name(String goods_name) {
			this.goods_name = goods_name;
		}

		private String addr2;
		private int enabled;

	}

