package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.*;

public interface EmDao {
	//获取员工数
	public int getCountall() throws SQLException;
	//获取某员工数
	public int getCountname_rank_depart(String str) throws SQLException;
	//员工入职操作
	public boolean entry(Employee em) throws SQLException;
	//员工信息修改操作
	public boolean update(Employee em) throws SQLException;
	//员工职级调动操作
	public boolean rankch(String eno, String rname) throws SQLException;
	//员工部门调动操作
	public boolean departch(String eno, String dname) throws SQLException;
	//员工离职操作
	public boolean emout(String eno, String date) throws SQLException;
	//删除离职员工操作
	public boolean emdel(String eno) throws SQLException;
	//根据名字查询
	public List<Employee> queryOnename(String ename) throws SQLException;
	//根据工号查询
	public List<Employee> queryOneno(String eno) throws SQLException;
	//查询所有员工
	public List<Employee> queryAll() throws SQLException;
	//查询所有员工，分页
	public List<Employee> queryall(Page page) throws SQLException;
	//查询员工，姓名，部门，职级
	public List<Employee> queryname_rank_depart(String str, Page page) throws SQLException;
}
