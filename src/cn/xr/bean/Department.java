package cn.xr.bean;

import java.io.Serializable;

public class Department implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int dno;// ���ű��
	private String dname;// ��������
	private String dbuss;// ����ҵ��


	public Department() {
		super();
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDbuss() {
		return dbuss;
	}

	public void setDbuss(String dbuss) {
		this.dbuss = dbuss;
	}

}
