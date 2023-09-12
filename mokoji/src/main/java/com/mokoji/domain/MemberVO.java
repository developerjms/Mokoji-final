package com.mokoji.domain;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String mem_id, mem_pw, mem_name, mem_jumin, mem_tel, mem_favorite, mem_loc, mem_addr, mem_email, mem_fname, mem_realfname, mem_addrdetail,mem_sex;
	private int mem_code, mem_point, mem_age;
	
	//*************************************************
	MultipartFile file;	// write.jsp에 파일첨부시 name="file"과 동일한 변수명
	
	
	

	
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		// 업로드 파일 접근
				if(! file.isEmpty()){
					this.mem_fname = file.getOriginalFilename();
					
					// 실제 저장된 파일명 만들기
					UUID uuid = UUID.randomUUID();
					mem_realfname = uuid.toString() + "_" + mem_fname;
					
					//***********************************************
					// 해당 경로로 변경
					File f = new File("C:\\Users\\04-09\\git\\Mokoji\\mokoji\\src\\main\\webapp\\resources\\images\\"+mem_realfname);
					
					try {
						file.transferTo(f);
						
					} catch (IllegalStateException e) {				
						e.printStackTrace();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				}
	}
	
	public String getMem_sex() {
		return mem_sex;
	}
	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}
	public int getMem_age() {
		return mem_age;
	}
	public void setMem_age(int mem_age) {
		this.mem_age = mem_age;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_jumin() {
		return mem_jumin;
	}
	public void setMem_jumin(String mem_jumin) {
		this.mem_jumin = mem_jumin;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_favorite() {
		return mem_favorite;
	}
	public void setMem_favorite(String mem_favorite) {
		this.mem_favorite = mem_favorite;
	}
	public String getMem_loc() {
		return mem_loc;
	}
	public void setMem_loc(String mem_loc) {
		this.mem_loc = mem_loc;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_fname() {
		return mem_fname;
	}
	public void setMem_fname(String mem_fname) {
		this.mem_fname = mem_fname;
	}
	public String getMem_realfname() {
		return mem_realfname;
	}
	public void setMem_realfname(String mem_realfname) {
		this.mem_realfname = mem_realfname;
	}

	public String getMem_addrdetail() {
		return mem_addrdetail;
	}
	public void setMem_addrdetail(String mem_addrdetail) {
		this.mem_addrdetail = mem_addrdetail;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	
	
	
	

}
