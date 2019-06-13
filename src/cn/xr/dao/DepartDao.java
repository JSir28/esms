package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.*;

public interface DepartDao {
	public boolean add(Department depart) throws SQLException;//增加部门
	public boolean delete(String dno) throws SQLException;//删除部门
	public boolean update(Department depart) throws SQLException;//更新部门
	public Department query(String dname) throws SQLException;//查询单个部门
	public List<Department> queryAll() throws SQLException;//查询所有部门信息
}
