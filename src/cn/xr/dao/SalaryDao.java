package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.*;

public interface SalaryDao {
	public int getCount(String str) throws SQLException;//根据工号查数据条数
	public int getmonCount(String str) throws SQLException;//根据工资月份查数据条数
	public boolean salcalua(Salary sal) throws SQLException;//写入数据
	public boolean add(Salary sal) throws SQLException;
	public boolean delete(String saltime, String eno) throws SQLException;
	public boolean update(Salary sal) throws SQLException;
	public List<Salary> queryEmAll(String eno, Page page) throws SQLException;//根据工号分页查询数据
	public List<Salary> querymonthAll(String saltime, Page page) throws SQLException;//根据工资月份分页查询数据
}
