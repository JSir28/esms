package cn.xr.bean;

import java.io.Serializable;

public class Rank implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rno;// 职级编号
	private String rname;// 职级名称
	private int rsal;// 职级工资

	public Rank() {
		super();
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}
	
	public int getRsal() {
		return rsal;
	}

	public void setRsal(int rsal) {
		this.rsal = rsal;
	}

}
