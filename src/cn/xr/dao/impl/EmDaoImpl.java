package cn.xr.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.xr.bean.*;
import cn.xr.dao.EmDao;
import cn.xr.util.C3P0Util;

public class EmDaoImpl implements EmDao {
	//连接c3p0和dbutils
	DataSource ds = C3P0Util.getDataSource();
	QueryRunner qr = new QueryRunner(ds);
	String sql = "";

	//按照姓名查询员工列表信息
	public List<Employee> queryOnename(String ename) throws SQLException {
		sql = "select employee.*, Dname, Rname from employee join rank on employee.Rno=Rank.Rno join department on employee.Dno=department.Dno where Ename=? and Estate='在职' order by Eno ASC";

		List<Employee> list = qr.query(sql, new BeanListHandler<Employee>(Employee.class), new Object[] { ename });

		return list;
	}

	//按工号查询员工信息
	public List<Employee> queryOneno(String eno) throws SQLException {
		sql = "select employee.*, Dname, Rname from employee join rank on employee.Rno=Rank.Rno join department on employee.Dno=department.Dno where Eno=? and Estate='在职' order by Eno ASC";

		List<Employee> list = qr.query(sql, new BeanListHandler<Employee>(Employee.class), new Object[] { eno });

		return list;
	}

	//查询所有员工
	public List<Employee> queryAll() throws SQLException {
		sql = "select employee.*, Dname, Rname from employee join rank on employee.Rno=Rank.Rno join department on employee.Dno=department.Dno and Estate='在职' order by Eno ASC";

		List<Employee> list = qr.query(sql, new BeanListHandler<Employee>(Employee.class));

		return list;
	}

	//员工离职操作
	public boolean emout(String eno, String date) throws SQLException {
		// TODO Auto-generated method stub
		sql = "update employee set Estate=?,Eouttime=? where Eno=?";

		int rs = qr.update(sql, new Object[] {"离职", date, eno});

		if (rs != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean rankch(String eno, String rname) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select * from rank where Rname=?";
		Rank rank = qr.query(sql, new BeanHandler<Rank>(Rank.class), rname);
		sql = "update employee set Rno=? where Eno=?";
		int rs = qr.update(sql, new Object[] {rank.getRno(), eno});
		if (rs != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean departch(String eno, String dname) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select * from department where Dname=?";
		Department depart = qr.query(sql, new BeanHandler<Department>(Department.class), dname);
		sql = "update employee set Dno=? where Eno=?";
		int rs = qr.update(sql, new Object[] {depart.getDno(), eno});
		if (rs != 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean entry(Employee em) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select * from department where Dname=?";
		Department depart = qr.query(sql, new BeanHandler<Department>(Department.class), em.getDname());
		sql = "select * from rank where Rname=?";
		Rank rank = qr.query(sql, new BeanHandler<Rank>(Rank.class), em.getRname());
		
		sql = "insert into employee(Dno, Rno, Ename, Esex, Ebir, Eedu, Etel, Eaddr, Estate, Eintime, imgsrc) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int rs = qr.update(sql, new Object[] {depart.getDno(), rank.getRno(), em.getEname(), em.getEsex(), em.getEbir(), em.getEedu(), em.getEtel(), em.getEaddr(), em.getEstate(), em.getEintime(), em.getImgsrc()});
		if (rs != 0) {
			return true;
		}	
		return false;
	}

	@Override
	public boolean update(Employee em) throws SQLException {
		// TODO Auto-generated method stub
		sql = "update employee set Ename=?, Ebir=?, Eedu=?, Etel=?, Eaddr=?, Eintime=? where Eno=?";
		
		int rs = qr.update(sql, new Object[] {em.getEname(), em.getEbir(), em.getEedu(), em.getEtel(), em.getEaddr(), em.getEintime(), em.getEno()});
		if (rs > 0) {
			return true;
		}
		
		return false;
	}

	@Override
	public List<Employee> queryall(Page page) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select employee.*, Dname, Rname from employee join rank on employee.Rno=Rank.Rno join department on employee.Dno=department.Dno order by Eno ASC limit ?, ?";

		List<Employee> list = qr.query(sql, new BeanListHandler<Employee>(Employee.class), new Object[] {page.getBeginIndex(), page.getEveryPage()});

		return list;
	}

	@Override
	public List<Employee> queryname_rank_depart(String str, Page page) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select employee.*, Dname, Rname from employee join rank on employee.Rno=Rank.Rno join department on employee.Dno=department.Dno where Dname like '%"+str+"%' or Rname like '%"+str+"%' or Ename like '%"+str+"%' order by Eno ASC limit ?, ?";

		List<Employee> list = qr.query(sql, new BeanListHandler<Employee>(Employee.class), new Object[] {page.getBeginIndex(), page.getEveryPage()});

		return list;
	}

	@Override
	public int getCountall() throws SQLException {
		// TODO Auto-generated method stub
		sql = "select count(Eno) from employee join rank on employee.Rno=Rank.Rno join department on employee.Dno=department.Dno ";
		int count = 0;
		count = Integer.parseInt(String.valueOf(qr.query(sql,new ScalarHandler<Integer>())));
        return count;
	}

	@Override
	public int getCountname_rank_depart(String str) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select count(Eno) from employee join rank on employee.Rno=Rank.Rno join department on employee.Dno=department.Dno where Dname like '%"+str+"%' or Rname like '%"+str+"%' or Ename like '%"+str+"%' ";
		int count = 0;
		count = Integer.parseInt(String.valueOf(qr.query(sql,new ScalarHandler<Integer>())));
        return count;
	}

	@Override
	public boolean emdel(String eno) throws SQLException {
		// TODO Auto-generated method stub
		sql = "delete from employee where Eno=?";
		int rs = qr.update(sql, new Object[] {eno});
		if (rs != 0) {
			return true;
		}
		return false;
	}


}
