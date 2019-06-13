package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.*;

public interface RankDao {
	public boolean add(Rank r) throws SQLException;//增加职级
	public boolean delete(String rno) throws SQLException;//删除职级
	public boolean update(Rank r) throws SQLException;//更新职级
	public Rank query(String rname) throws SQLException;//查询单个职级
	public List<Rank> queryAll() throws SQLException;//查询所有职级信息
}
