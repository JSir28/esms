package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.*;

public interface DepartDao {
	public boolean add(Department depart) throws SQLException;//���Ӳ���
	public boolean delete(String dno) throws SQLException;//ɾ������
	public boolean update(Department depart) throws SQLException;//���²���
	public Department query(String dname) throws SQLException;//��ѯ��������
	public List<Department> queryAll() throws SQLException;//��ѯ���в�����Ϣ
}
