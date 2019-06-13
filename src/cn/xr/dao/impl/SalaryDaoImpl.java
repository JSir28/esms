package cn.xr.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.xr.bean.Page;
import cn.xr.bean.Salary;
import cn.xr.dao.SalaryDao;
import cn.xr.util.C3P0Util;

public class SalaryDaoImpl implements SalaryDao {

	//连接c3p0和dbutils
	DataSource ds = C3P0Util.getDataSource();
	QueryRunner qr = new QueryRunner(ds);
	String sql = "";
	
	
	@Override
	public boolean add(Salary sal) throws SQLException {
		// TODO Auto-generated method stub
		sql = "insert into salary value(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		int rs = qr.update(sql, new Object[] {sal.getSaltime(), sal.getEno(), sal.getSalbase(), sal.getSalreward(), sal.getSalpunish(), sal.getInsu_fund(), sal.getSalall(), sal.getPertax(), sal.getSalactual()});
		if (rs > 0) {
			return true;
		}
		
		return false;
	}

	@Override
	public boolean delete(String saltime, String eno) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Salary sal) throws SQLException {
		// TODO Auto-generated method stub
		sql = "update salary set Salbase=?, Salreward=?, Salpunish=?, Insu_fund=?, Salall=?, Pertax=?, Salactual=? where Saltime=? and Eno=?";
		
		int rs = qr.update(sql, new Object[] {sal.getSalbase(), sal.getSalreward(), sal.getSalpunish(), sal.getInsu_fund(), sal.getSalall(), sal.getPertax(), sal.getSalactual(), sal.getSaltime(), sal.getEno()});
		if (rs > 0) {
			return true;
		}
		
		return false;	
	}

	@Override//按工号分页查询
	public List<Salary> queryEmAll(String eno, Page page) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select salary.*, Ename, Dname, Rname from employee join salary on salary.Eno=employee.Eno join rank on employee.Rno=Rank.Rno join department on employee.Dno=department.Dno where employee.Eno = ? and Estate='在职' order by Saltime DESC limit ?,? ";
		
		List<Salary> list = qr.query(sql, new BeanListHandler<Salary>(Salary.class), new Object[] {eno, page.getBeginIndex(), page.getEveryPage()});
		
		return list;
	}


	@Override//按月份查询分页查询
	public List<Salary> querymonthAll(String saltime, Page page) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select salary.*, Ename, Dname, Rname from employee join salary on salary.Eno=employee.Eno join rank on employee.Rno=Rank.Rno join department on employee.Dno=department.Dno where Saltime=? and Estate='在职' order by Eno ASC limit ?,? ";
		
		List<Salary> list = qr.query(sql, new BeanListHandler<Salary>(Salary.class), new Object[] {saltime, page.getBeginIndex(), page.getEveryPage()});
		
		return list;
	}

	@Override//计算工资，写入数据库
	public boolean salcalua(Salary sal) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select * from salary where Saltime=? and Eno=?";
		List<Salary> list = qr.query(sql, new BeanListHandler<Salary>(Salary.class), new Object[] {sal.getSaltime(), sal.getEno()});
		boolean bool = true;
		if (list.size() > 0) {
			bool = update(sal);
		}
		else {
			bool = add(sal);
		}
		
		return bool;
	}

	@Override//按工号获取记录数
	public int getCount(String Eno) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select count(*) from salary where Eno=?";
    	int count = Integer.parseInt(String.valueOf(qr.query(sql,new ScalarHandler<Integer>(), Eno)));
		return count;
	}

	@Override//按月份获取记录数
	public int getmonCount(String saltime) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select count(*) from salary where Saltime=?";
    	int count = Integer.parseInt(String.valueOf(qr.query(sql,new ScalarHandler<Integer>(), saltime)));
		
		return count;
	}

}
