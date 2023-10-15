package com.mystudy.bbs.vo;

public class BbsVO {
	private String bbsIdx;
	private String subject;
	private String writer;
	private String content;
	private String fileName;
	private String oriName;
	private String pwd;
	private String writeDate;
	private String ip;
	private int hit;
	
	public String getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(String bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "BbsVO [bbsIdx=" + bbsIdx + ", subject=" + subject + ", writer=" + writer + ", content=" + content
				+ ", fileName=" + fileName + ", oriName=" + oriName + ", pwd=" + pwd + ", writeDate=" + writeDate
				+ ", ip=" + ip + ", hit=" + hit + "]";
	}


	
}