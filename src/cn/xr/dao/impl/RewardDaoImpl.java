package cn.xr.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import cn.xr.bean.*;
import cn.xr.dao.RewardDao;
import cn.xr.util.*;

public class RewardDaoImpl implements RewardDao{
	//����c3p0��dbutils
	DataSource ds = C3P0Util.getDataSource();
	QueryRunner qr = new QueryRunner(ds);
	String sql = "";

	public boolean add(Reward re) throws SQLException {
		sql = "insert into reward(Eno, Rew_pun, Rewtime, Rewcontent, Rewmoney) value (?, ?, ?, ?, ?)";

		int rs = qr.update(sql, new Object[] {re.getEno(), re.getRew_pun(), re.getRewtime(),
				 re.getRewcontent(), re.getRewmoney() });

		if (rs != 0) {
			return true;
		}
		return false;
	}

	public boolean delete(String rewno) throws SQLException {
		sql = "delete from reward where Rewno=?";

		int rs = qr.update(sql, rewno);

		if (rs != 0) {
			return true;
		}
		return false;
	}

	public boolean update(Reward re) throws SQLException {
		sql = "update reward set Eno=?, Rew_pun=?, Rewtime=?, Rewcontent=?, Rewmoney=? where Rewno=?";

		int rs = qr.update(sql, new Object[] {  re.getEno(), re.getRew_pun(), re.getRewtime(),
				re.getRewcontent(), re.getRewmoney(), re.getRewno()});

		if (rs != 0) {
			return true;
		}
		return false;
	}

	//���ؼ��ֲ�ѯ����ҳ
	public List<Reward> query(String str, Page page) throws SQLException {
		sql = "select * from reward join employee on reward.Eno = employee.Eno where Ename like '%"+str+"%' or Rewno like '%"+str+"%' or reward.Eno like '%"+str+"%' or Rew_pun like '%"+str+"%' or Rewtime like '%"+str+"%' or Rewcontent like '%"+str+"%' or Rewmoney like '%"+str+"%' and Estate= '��ְ' order by Eno ASC, Rewno ASC limit ?,? ";

		List<Reward> list = qr.query(sql, new BeanListHandler<Reward>(Reward.class),
				new Object[] {page.getBeginIndex(), page.getEveryPage()});
		return list;
	}

	//�����Ų�ѯ����ҳ
	public List<Reward> queryEmAll(String eno, Page page) throws SQLException {
		List<Reward> list = null;

		if (page == null) {
			sql = "select reward.*, ename from reward join employee on reward.Eno = employee.Eno where reward.Eno=? and Estate= '��ְ' order by Rewno ASC ";
			list = qr.query(sql, new BeanListHandler<Reward>(Reward.class),eno);
		}
		else {
			sql = "select reward.*, ename from reward join employee on reward.Eno = employee.Eno where reward.Eno=? and Estate= '��ְ'  order by Rewno ASC  limit ?,? ";
			list = qr.query(sql, new BeanListHandler<Reward>(Reward.class), new Object[] {eno, page.getBeginIndex(), page.getEveryPage()});
		}
		
		return list;
	}

	//��ѯ������Ϣ����ҳ
	public List<Reward> queryAll(Page page) throws SQLException {
		sql = "select reward.*, ename from reward join employee on reward.Eno = employee.Eno where Estate= '��ְ' order by Eno ASC, Rewno ASC limit ?,? ";

		List<Reward> list = qr.query(sql, new BeanListHandler<Reward>(Reward.class), new Object[] {page.getBeginIndex(), page.getEveryPage()});
		
		return list;
	}

	public double queryrew(String eno, String saltime) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select sum(Rewmoney) from reward where Rew_pun='��' and Eno=? and Rewtime like'"+saltime+"-%'";
		if (qr.query(sql, new ScalarHandler<Double>(), eno) == null) {
			return 0;
		}
		double rs = qr.query(sql, new ScalarHandler<Double>(), eno);
		return rs;
	}

	public double querypun(String eno, String saltime) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select sum(Rewmoney) from reward where Rew_pun='��' and Eno=? and Rewtime like'"+saltime+"-%'";
		if (qr.query(sql, new ScalarHandler<Double>(), eno) == null) {
			return 0;
		}
		double rs = qr.query(sql, new ScalarHandler<Double>(), eno);
		return rs;
	}

	@Override//���ݹؼ��ֻ�ȡ��¼����
	public int getkeyCount(String str) throws SQLException {
		// TODO Auto-generated method stub
		sql = "select count(Ename) from reward join employee on reward.Eno = employee.Eno where Ename like '%"+str+"%' or Rewno like '%"+str+"%' or reward.Eno like '%"+str+"%' or Rew_pun like '%"+str+"%' or Rewtime like '%"+str+"%' or Rewcontent like '%"+str+"%' or Rewmoney like '%"+str+"%' and Estate= '��ְ' ";
		int count = 0;
		count = Integer.parseInt(String.valueOf(qr.query(sql,new ScalarHandler<Integer>())));
        return count;
	}

	@Override//���ݹ��Ż�ȡ��¼����
	public int getCount(String eno) throws SQLException {
		// TODO Auto-generated method stub
		sql = "";
		int count = 0;
        if (eno == "") {
        	sql = "select count(*) from reward";
        	count = Integer.parseInt(String.valueOf(qr.query(sql,new ScalarHandler<Integer>())));
        }
        else {
        	sql = "select count(*) from reward where Eno=?";
        	count = Integer.parseInt(String.valueOf(qr.query(sql,new ScalarHandler<Integer>(), eno)));
        }
        return count;
	}
	
}
