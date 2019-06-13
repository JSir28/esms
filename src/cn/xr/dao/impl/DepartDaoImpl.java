package cn.xr.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.xr.bean.Department;
import cn.xr.dao.DepartDao;
import cn.xr.util.C3P0Util;

public class DepartDaoImpl implements DepartDao {

	// ����c3p0��dbutils
	DataSource ds = C3P0Util.getDataSource();
	QueryRunner qr = new QueryRunner(ds);
	String sql = "";

	@Override
	public boolean add(Department depart) throws SQLException {
		// TODO Auto-generated method stub
		sql = "insert into department(Dname, Dbuss) values(?, ?)";
		int rs = qr.update(sql, new Object[] { depart.getDname(), depart.getDbuss() });
		if (rs != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String dno) throws SQLException {
		// TODO Auto-generated method stub
		sql = "delete from department where Dno=?";
		int rs = qr.update(sql, dno);
		if (rs != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean update(Department depart) throws SQLException {
		// TODO Auto-generated method stub
		sql = "update department set Dname=?, Dbuss=? where Dno=?";
		int rs = qr.update(sql, new Object[] { depart.getDname(), depart.getDbuss(), depart.getDno() });
		if (rs != 0) {
			return true;
		}
		return false;
	}

	@Override
	public Department query(String dname) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select * from department where Dname=? order by Dno ASC";

		Department depart = qr.query(sql, new BeanHandler<Department>(Department.class), dname);

		return depart;
	}

	@Override
	public List<Department> queryAll() throws SQLException {
		// TODO Auto-generated method stub
		sql = "select * from department order by Dno ASC";

		List<Department> list = qr.query(sql, new BeanListHandler<Department>(Department.class));

		return list;
	}

}
