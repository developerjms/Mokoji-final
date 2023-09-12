package com.mokoji.domain;

public class CategoryVO {
	private String cthigh_name, ctmid_name, ctmid_pic;
	private int cthigh_code, ctmid_code;

	
	
	
	public String getCtmid_pic() {
		return ctmid_pic;
	}

	public void setCtmid_pic(String ctmid_pic) {
		this.ctmid_pic = ctmid_pic;
	}

	public int getCthigh_code() {
		return cthigh_code;
	}

	public void setCthigh_code(int cthigh_code) {
		this.cthigh_code = cthigh_code;
	}

	public String getCthigh_name() {
		return cthigh_name;
	}

	public void setCthigh_name(String cthigh_name) {
		this.cthigh_name = cthigh_name;
	}

	public String getCtmid_name() {
		return ctmid_name;
	}

	public int getCtmid_code() {
		return ctmid_code;
	}

	public void setCtmid_code(int ctmid_code) {
		this.ctmid_code = ctmid_code;
	}

	public void setCtmid_name(String ctmid_name) {
		this.ctmid_name = ctmid_name;
	}
	
}
