package cn.xr.bean;

import java.io.Serializable;
import java.util.Date;

public class Employee implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String eno;// ����
	private String dname;// ��������
	private String rname;// ְ������
	private String ename;// ����
	private String esex;// ����
	private Date ebir;// ��������
	private String eedu;// �������
	private String etel;// ��ϵ�绰
	private String eaddr;// ��ͥסַ
	private String estate;// ��ְ״̬
	private Date eintime;// ��ְʱ��
	private Date eouttime;// ��ְʱ��
	private String imgsrc;// ��Ƭ��ַ


	public Employee() {
		super();
	}

	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
		this.eno = eno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEsex() {
		return esex;
	}

	public void setEsex(String esex) {
		this.esex = esex;
	}

	public Date getEbir() {
		return ebir;
	}

	public void setEbir(Date ebir) {
		this.ebir = ebir;
	}

	public String getEedu() {
		return eedu;
	}

	public void setEedu(String eedu) {
		this.eedu = eedu;
	}

	public String getEtel() {
		return etel;
	}

	public void setEtel(String etel) {
		this.etel = etel;
	}

	public String getEaddr() {
		return eaddr;
	}

	public void setEaddr(String eaddr) {
		this.eaddr = eaddr;
	}

	public String getEstate() {
		return estate;
	}

	public void setEstate(String estate) {
		this.estate = estate;
	}
	public Date getEintime() {
		return eintime;
	}

	public void setEintime(Date eintime) {
		this.eintime = eintime;
	}

	public Date getEouttime() {
		return eouttime;
	}

	public void setEouttime(Date eouttime) {
		this.eouttime = eouttime;
	}
	public String getImgsrc() {
		return imgsrc;
	}

	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}

}
