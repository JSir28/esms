package cn.xr.bean;

import java.io.Serializable;
import java.util.Date;

public class Reward implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rewno;// �������
	private String eno;// ����
	private String ename;// ����
	private String rew_pun;// ��������
	private Date rewtime;// ����ʱ��
	private String rewcontent;// ��������
	private float rewmoney;// �������
	
	public Reward() {
		super();
	}

	public int getRewno() {
		return rewno;
	}

	public void setRewno(int rewno) {
		this.rewno = rewno;
	}

	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
		this.eno = eno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}
	
	public String getRew_pun() {
		return rew_pun;
	}

	public void setRew_pun(String rew_pun) {
		this.rew_pun = rew_pun;
	}

	public Date getRewtime() {
		return rewtime;
	}

	public void setRewtime(Date rewtime) {
		this.rewtime = rewtime;
	}

	public String getRewcontent() {
		return rewcontent;
	}

	public void setRewcontent(String rewcontent) {
		this.rewcontent = rewcontent;
	}

	public float getRewmoney() {
		return rewmoney;
	}

	public void setRewmoney(float rewmoney) {
		this.rewmoney = rewmoney;
	}

}
