package cn.xr.dao;

import java.sql.SQLException;

import cn.xr.bean.User;

public interface UserDao {

	public int add(User user) throws SQLException;//ע��
	public int reset(User user) throws SQLException;//��¼
	public boolean queryUser(User user) throws SQLException;//��¼
	public User queryname(String username) throws SQLException;//��¼
}
