package cn.xr.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Util {

	//连接池
	private static ComboPooledDataSource ds = new ComboPooledDataSource();
	//得到数据源
	public static DataSource getDataSource() {
		return ds;
	}

	// 2得到数据库的连接
	public static Connection getConnection() {
		Connection conn;
		try {
			conn = ds.getConnection();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return conn;
	}

	// 3.释放资源
	public static void release(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null)
				rs.close();
		} 
		catch (Exception ex) {
		}
		try {
			if (st != null)
				st.close();
		} 
		catch (Exception ex) {
		}
		try {
			if (conn != null)
				conn.close();
		} 
		catch (Exception ex) {
		}
		conn = null;
		st = null;
		rs = null;
	}

}
