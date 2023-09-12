package com.mokoji.domain;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class ChallengeVO {
	private String chall_name, chall_content, chall_loc, chall_gender, chall_pic, chall_rpic;
	private int chall_code, chall_age, chall_tot, chall_week, chall_left;
	private String chall_startdate, chall_enddate;
	MultipartFile challengefile;
	
	
	public MultipartFile getChallengefile() {
		return challengefile;
	}
	
	public void setChallengefile(MultipartFile challengefile) {
		this.challengefile = challengefile;
		//업로드 파일 접근
		if(! challengefile.isEmpty()) {
			this.chall_pic = challengefile.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			chall_rpic = uuid.toString() + "_" + chall_pic;
			
			File f = new File("C:\\Users\\04-09\\git\\Mokoji\\mokoji\\src\\main\\webapp\\resources\\images\\"+ chall_rpic);
			
			try {
				challengefile.transferTo(f);
				
			}catch (IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				
				e.printStackTrace();
			}
		}
		
	}

	public String getChall_name() {
		return chall_name;

	}
	public void setChall_name(String chall_name) {
		this.chall_name = chall_name;
	}
	
	public String getChall_content() {
		return chall_content;
	}
	public void setChall_content(String chall_content) {
		this.chall_content = chall_content;
	}
	public String getChall_loc() {
		return chall_loc;
	}
	public void setChall_loc(String chall_loc) {
		this.chall_loc = chall_loc;
	}
	public String getChall_gender() {
		return chall_gender;
	}
	public void setChall_gender(String chall_gender) {
		this.chall_gender = chall_gender;
	}
	public String getChall_pic() {
		return chall_pic;
	}
	public void setChall_pic(String chall_pic) {
		this.chall_pic = chall_pic;
	}
	public String getChall_rpic() {
		return chall_rpic;
		
	}
	public void setChall_rpic(String chall_rpic) {
		this.chall_rpic = chall_rpic;
	}
	public int getChall_code() {
		return chall_code;
	}
	public void setChall_code(int chall_code) {
		this.chall_code = chall_code;
	}
	public int getChall_age() {
		return chall_age;
	}
	public void setChall_age(int chall_age) {
		this.chall_age = chall_age;
	}
	public int getChall_tot() {
		return chall_tot;
	}
	public void setChall_tot(int chall_tot) {
		this.chall_tot = chall_tot;
	}
	public int getChall_week() {
		return chall_week;		
	}
	public void setChall_week(int chall_week) {
		this.chall_week = chall_week;
	}

	public String getChall_startdate() {
		return chall_startdate;
	}

	public void setChall_startdate(String chall_startdate) {
		this.chall_startdate = chall_startdate;
	}

	public String getChall_enddate() {
		return chall_enddate;
	}

	public void setChall_enddate(String chall_enddate) {
		this.chall_enddate = chall_enddate;
	}

	public int getChall_left() {
		return chall_left;
	}

	public void setChall_left(int chall_left) {
		this.chall_left = chall_left;
	}

	
	
}
