package cn.xr.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.xr.bean.*;
import cn.xr.dao.*;
import cn.xr.util.*;

public class RankDaoImpl implements RankDao {

	//连接c3p0和dbutils
	DataSource ds = C3P0Util.getDataSource();
	QueryRunner qr = new QueryRunner(ds);
	String sql = "";
	
	@Override
	public boolean add(Rank r) throws SQLException {
		// TODO Auto-generated method stub
		sql = "insert into rank(Rname, Rsal) values(?, ?)";
		int rs = qr.update(sql, new Object[] {r.getRname(), r.getRsal()});
		if (rs != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String rno) throws SQLException {
		// TODO Auto-generated method stub
		sql = "delete from rank where Rno=?";
		int rs = qr.update(sql, rno);
		if (rs != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean update(Rank r) throws SQLException {
		// TODO Auto-generated method stub
		sql = "update rank set Rname=?, Rsal=? where Rno=?";
		int rs = qr.update(sql, new Object[] {r.getRname(), r.getRsal(), r.getRno()});
		if (rs != 0) {
			return true;
		}
		return false;
	}

	@Override//按职级明查询职级
	public Rank query(String rname) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select * from rank where Rname = ? order by Rno ASC";
		
		Rank ra = qr.query(sql, new BeanHandler<Rank>(Rank.class), rname);
		
		return ra;
	}

	@Override
	public List<Rank> queryAll() throws SQLException {
		// TODO Auto-generated method stub
		sql = "select * from rank order by Rno ASC";
		
		List<Rank> list = qr.query(sql, new BeanListHandler<Rank>(Rank.class));
		
		return list;
	}

}
