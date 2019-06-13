package cn.xr.bean;

import java.io.Serializable;

public class Salary implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String saltime;// ���ʱ��·�
	private String eno;// ����
	private String ename;// ����
	private String rname;// ְ������
	private String dname;// ��������
	private double salbase;// ְ������
	private double salreward;// ��������
	private double salpunish;// �۷�����
	private double insu_fund;// ����һ��
	private double salall;// ʵ�ʹ���
	private double pertax;// ��˰
	private double salactual;// ʵ������

	public Salary() {
		super();
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getSaltime() {
		return saltime;
	}

	public void setSaltime(String saltime) {
		this.saltime = saltime;
	}

	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
		this.eno = eno;
	}

	public double getSalbase() {
		return salbase;
	}

	public void setSalbase(double salbase) {
		this.salbase = salbase;
	}

	public double getSalreward() {
		return salreward;
	}

	public void setSalreward(double salreward) {
		this.salreward = salreward;
	}

	public double getSalpunish() {
		return salpunish;
	}

	public void setSalpunish(double salpunish) {
		this.salpunish = salpunish;
	}

	public double getInsu_fund() {
		return insu_fund;
	}

	public void setInsu_fund(double insu_fund) {
		this.insu_fund = insu_fund;
	}

	public double getSalall() {
		return salall;
	}

	public void setSalall(double salall) {
		this.salall = salall;
	}

	public double getPertax() {
		return pertax;
	}

	public void setPertax(double pertax) {
		this.pertax = pertax;
	}

	public double getSalactual() {
		return salactual;
	}

	public void setSalactual(double salactual) {
		this.salactual = salactual;
	}

}
