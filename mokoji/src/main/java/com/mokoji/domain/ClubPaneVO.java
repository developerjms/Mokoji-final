package com.mokoji.domain;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class ClubPaneVO {
	private String cp_name, cp_content, cp_date, cp_pic, cp_rpic; 
	private int cp_code, cp_cnt, cp_likes;
	MultipartFile clubpanefile;
	
	public MultipartFile getClubpanefile() {
		return clubpanefile;
	}
	public void setClubpanefile(MultipartFile clubpanefile) {
		this.clubpanefile = clubpanefile;
		
		// 업로드 파일 접근
		if(! clubpanefile.isEmpty()){
			this.cp_pic = clubpanefile.getOriginalFilename();
			
			// 실제 저장된 파일명 만들기
			UUID uuid = UUID.randomUUID();
			cp_rpic = uuid.toString() + "_" + cp_pic;
			
			//***********************************************
			// 해당 경로로 변경
			File f = new File("C:\\Users\\04-09\\git\\Mokoji\\mokoji\\src\\main\\webapp\\resources\\images\\"+cp_rpic);
			
			try {
				clubpanefile.transferTo(f);
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
	}

	public String getCp_name() {
		return cp_name;
	}
	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}
	public String getCp_content() {
		return cp_content;
	}
	public void setCp_content(String cp_content) {
		this.cp_content = cp_content;
	}
	public String getCp_date() {
		return cp_date;
	}
	public void setCp_date(String cp_date) {
		this.cp_date = cp_date;
	}
	public String getCp_pic() {
		return cp_pic;
	}
	public void setCp_pic(String cp_pic) {
		this.cp_pic = cp_pic;
	}
	public int getCp_code() {
		return cp_code;
	}
	public void setCp_code(int cp_code) {
		this.cp_code = cp_code;
	}
	public int getCp_cnt() {
		return cp_cnt;
	}
	public void setCp_cnt(int cp_cnt) {
		this.cp_cnt = cp_cnt;
	}
	public int getCp_likes() {
		return cp_likes;
	}
	public void setCp_likes(int cp_likes) {
		this.cp_likes = cp_likes;
	}

	public String getCp_rpic() {
		return cp_rpic;
	}
	public void setCp_rpic(String cp_rpic) {
		this.cp_rpic = cp_rpic;
		
	}
	
	
}
