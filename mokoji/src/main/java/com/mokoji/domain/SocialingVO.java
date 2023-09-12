package com.mokoji.domain;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class SocialingVO {
	private String social_name, social_content, social_loc, social_pic, social_rpic, social_gender, social_signtype;
	private int social_code, social_tot, social_cost, social_maxage, social_left; 
	private Date social_starttime, social_date;
	MultipartFile socialingfile;
	public MultipartFile getSocialingfile() {
		return socialingfile;
	}
	public String getSocial_gender() {
		return social_gender;
	}
	public void setSocial_gender(String social_gender) {
		this.social_gender = social_gender;
	}
	public int getSocial_maxage() {
		return social_maxage;
	}
	public void setSocial_maxage(int social_maxage) {
		this.social_maxage = social_maxage;
	}
	public void setSocialingfile(MultipartFile socialingfile) {
		this.socialingfile = socialingfile;
		
		// 업로드 파일 접근
				if(! socialingfile.isEmpty()){
					this.social_pic = socialingfile.getOriginalFilename();
					
					// 실제 저장된 파일명 만들기
					UUID uuid = UUID.randomUUID();
					social_rpic = uuid.toString() + "_" + social_pic;
					
					//***********************************************
					// 해당 경로로 변경
					File f = new File("C:\\Users\\04-09\\git\\Mokoji\\mokoji\\src\\main\\webapp\\resources\\images\\"+ social_rpic);
					
					try {
						socialingfile.transferTo(f);
						
					} catch (IllegalStateException e) {				
						e.printStackTrace();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				}
	}
	public String getSocial_name() {
		return social_name;
	}
	public void setSocial_name(String social_name) {
		this.social_name = social_name;
	}
	
	public String getSocial_content() {
		return social_content;
	}
	public void setSocial_content(String social_content) {
		this.social_content = social_content;
	}
	public Date getSocial_starttime() {
		return social_starttime;
	}
	public void setSocial_starttime(Date social_starttime) {
		this.social_starttime = social_starttime;
	}
	public Date getSocial_date() {
		return social_date;
	}
	public void setSocial_date(Date social_date) {
		this.social_date = social_date;
	}
	public String getSocial_loc() {
		return social_loc;
	}
	public void setSocial_loc(String social_loc) {
		this.social_loc = social_loc;
	}
	public String getSocial_pic() {
		return social_pic;
	}
	public void setSocial_pic(String social_pic) {
		this.social_pic = social_pic;
	}
	public String getSocial_rpic() {
		return social_rpic;
	}
	public void setSocial_rpic(String social_rpic) {
		this.social_rpic = social_rpic;
	}
	public int getSocial_code() {
		return social_code;
	}
	public void setSocial_code(int social_code) {
		this.social_code = social_code;
	}
	public int getSocial_tot() {
		return social_tot;
	}
	public void setSocial_tot(int social_tot) {
		this.social_tot = social_tot;
	}
	public int getSocial_cost() {
		return social_cost;
	}
	public void setSocial_cost(int social_cost) {
		this.social_cost = social_cost;
	}
	public String getSocial_signtype() {
		return social_signtype;
	}
	public void setSocial_signtype(String social_signtype) {
		this.social_signtype = social_signtype;
	}
	public int getSocial_left() {
		return social_left;
	}
	public void setSocial_left(int social_left) {
		this.social_left = social_left;
	}
	
}