package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.*;

public interface SalaryDao {
	public int getCount(String str) throws SQLException;//���ݹ��Ų���������
	public int getmonCount(String str) throws SQLException;//���ݹ����·ݲ���������
	public boolean salcalua(Salary sal) throws SQLException;//д������
	public boolean add(Salary sal) throws SQLException;
	public boolean delete(String saltime, String eno) throws SQLException;
	public boolean update(Salary sal) throws SQLException;
	public List<Salary> queryEmAll(String eno, Page page) throws SQLException;//���ݹ��ŷ�ҳ��ѯ����
	public List<Salary> querymonthAll(String saltime, Page page) throws SQLException;//���ݹ����·ݷ�ҳ��ѯ����
}
