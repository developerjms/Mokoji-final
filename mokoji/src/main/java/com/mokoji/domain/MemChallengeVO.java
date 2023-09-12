package com.mokoji.domain;

import java.util.Date;

public class MemChallengeVO {
	private String mchall_fin;
	private int mchall_code, chall_code ,mem_code,mchall_cnt,mcmct_code;
	private Date mchall_date;
	public String getMchall_fin() {
		return mchall_fin;
	}
	public void setMchall_fin(String mchall_fin) {
		this.mchall_fin = mchall_fin;
	}
	public int getMchall_code() {
		return mchall_code;
	}
	public void setMchall_code(int mchall_code) {
		this.mchall_code = mchall_code;
	}
	public int getChall_code() {
		return chall_code;
	}
	public void setChall_code(int chall_code) {
		this.chall_code = chall_code;
	}
	public int getMem_code() {
		return mem_code;
	}
	public void setMem_code(int mem_code) {
		this.mem_code = mem_code;
	}
	public int getMchall_cnt() {
		return mchall_cnt;
	}
	public void setMchall_cnt(int mchall_cnt) {
		this.mchall_cnt = mchall_cnt;
	}
	public int getMcmct_code() {
		return mcmct_code;
	}
	public void setMcmct_code(int mcmct_code) {
		this.mcmct_code = mcmct_code;
	}
	public Date getMchall_date() {
		return mchall_date;
	}
	public void setMchall_date(Date mchall_date) {
		this.mchall_date = mchall_date;
	}
	
	

}
