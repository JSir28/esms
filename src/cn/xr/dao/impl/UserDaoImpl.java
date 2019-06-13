package cn.xr.dao.impl;

import java.sql.SQLException;

import javax.sql.DataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.xr.bean.User;
import cn.xr.dao.UserDao;
import cn.xr.util.C3P0Util;

public class UserDaoImpl implements UserDao{
	//����c3p0��dbutils
	DataSource ds = C3P0Util.getDataSource();
	QueryRunner qr = new QueryRunner(ds);
	String sql = "";
	//ע��
	public int add(User user) throws SQLException {
		sql = "insert into user value (?, ?, ?, ?, ?)";
		String querysql = "select * from user where username=?";
		
		User u = qr.query(querysql, new BeanHandler<User>(User.class), user.getUsername());		
		if(u != null) {
			return 0;
		}
		else {
			int rs = qr.update(sql, new Object[] {user.getUid(), user.getUsername(), user.getPassword(), user.getEmail(), user.getCode()});	
			
			if(rs != 0) {
				return 1;
			}
		}
		return 2;
	}
	//��¼
	public boolean queryUser(User user) throws SQLException {
		sql = "select * from user where username=? and password=?";
		
		User u = qr.query(sql, new BeanHandler<User>(User.class), new Object[] {user.getUsername(), user.getPassword()});		
		if(u != null) {
			return true;
		}
		return false;
	}
	@Override
	public User queryname(String username) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select * from user where username=?";
		User u = qr.query(sql, new BeanHandler<User>(User.class), username);		
		return u;
	}
	@Override
	public int reset(User user) throws SQLException {
		// TODO Auto-generated method stub
		sql = "update user set password=? where username=?";
		int u = qr.update(sql, new Object[] {user.getPassword(), user.getUsername()});
		return u;
	}
	
	
}
