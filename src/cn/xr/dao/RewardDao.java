package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.Page;
import cn.xr.bean.Reward;

public interface RewardDao {
	public int getkeyCount(String str) throws SQLException;//根据关键字获取数据条数
	public int getCount(String eno) throws SQLException;//根据员工工号获取数据条数
	public boolean add(Reward re) throws SQLException;
	public boolean delete(String rewno) throws SQLException;
	public boolean update(Reward re) throws SQLException;
	public List<Reward> query(String str, Page page) throws SQLException;//根据关键字分页查询
	public List<Reward> queryEmAll(String eno, Page page) throws SQLException;//根据员工工号分页查询
	public List<Reward> queryAll(Page page) throws SQLException;//
	public double queryrew(String eno, String saltime) throws SQLException;//查询奖励工资
	public double querypun(String eno, String saltime) throws SQLException;//查询扣罚工资
}
