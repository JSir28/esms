package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.*;

public interface EmDao {
	//��ȡԱ����
	public int getCountall() throws SQLException;
	//��ȡĳԱ����
	public int getCountname_rank_depart(String str) throws SQLException;
	//Ա����ְ����
	public boolean entry(Employee em) throws SQLException;
	//Ա����Ϣ�޸Ĳ���
	public boolean update(Employee em) throws SQLException;
	//Ա��ְ����������
	public boolean rankch(String eno, String rname) throws SQLException;
	//Ա�����ŵ�������
	public boolean departch(String eno, String dname) throws SQLException;
	//Ա����ְ����
	public boolean emout(String eno, String date) throws SQLException;
	//ɾ����ְԱ������
	public boolean emdel(String eno) throws SQLException;
	//�������ֲ�ѯ
	public List<Employee> queryOnename(String ename) throws SQLException;
	//���ݹ��Ų�ѯ
	public List<Employee> queryOneno(String eno) throws SQLException;
	//��ѯ����Ա��
	public List<Employee> queryAll() throws SQLException;
	//��ѯ����Ա������ҳ
	public List<Employee> queryall(Page page) throws SQLException;
	//��ѯԱ�������������ţ�ְ��
	public List<Employee> queryname_rank_depart(String str, Page page) throws SQLException;
}
