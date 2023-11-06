package com.goods;

public class GoodsDTO {
   // 굿즈 테이블
   private String goods_id;
   private String goods_name;
   private String act_id;
   private String group_name;
   private int goods_count;
   private String reg_date;
   private String goods_acc;
   private int goods_price;
   private String goods_price2;
   
   // 굿즈 사진첩 테이블
   private long photo_num;
   private String img_name;
   private String[] img_names;

   public String getGoods_id() {
      return goods_id;
   }

   public void setGoods_id(String goods_id) {
      this.goods_id = goods_id;
   }

   public String getGoods_name() {
      return goods_name;
   }

   public void setGoods_name(String goods_name) {
      this.goods_name = goods_name;
   }

   public String getAct_id() {
      return act_id;
   }

   public void setAct_id(String act_id) {
      this.act_id = act_id;
   }

   public int getGoods_count() {
      return goods_count;
   }

   public void setGoods_count(int goods_count) {
      this.goods_count = goods_count;
   }

   public String getReg_date() {
      return reg_date;
   }

   public void setReg_date(String reg_date) {
      this.reg_date = reg_date;
   }

   public String getGoods_acc() {
      return goods_acc;
   }

   public void setGoods_acc(String goods_acc) {
      this.goods_acc = goods_acc;
   }

   public int getGoods_price() {
      return goods_price;
   }

   public void setGoods_price(int goods_price) {
      this.goods_price = goods_price;
   }

   public long getPhoto_num() {
      return photo_num;
   }

   public void setPhoto_num(long photo_num) {
      this.photo_num = photo_num;
   }

   public String getImg_name() {
      return img_name;
   }

   public void setImg_name(String img_name) {
      this.img_name = img_name;
   }

public String getGroup_name() {
	return group_name;
}

public void setGroup_name(String group_name) {
	this.group_name = group_name;
}

public String[] getImg_names() {
	return img_names;
}

public void setImg_names(String[] img_names) {
	this.img_names = img_names;
}

public String getGoods_price2() {
	return goods_price2;
}

public void setGoods_price2(String goods_price2) {
	this.goods_price2 = goods_price2;
}


}