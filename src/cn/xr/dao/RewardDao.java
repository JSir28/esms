package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.Page;
import cn.xr.bean.Reward;

public interface RewardDao {
	public int getkeyCount(String str) throws SQLException;//���ݹؼ��ֻ�ȡ��������
	public int getCount(String eno) throws SQLException;//����Ա�����Ż�ȡ��������
	public boolean add(Reward re) throws SQLException;
	public boolean delete(String rewno) throws SQLException;
	public boolean update(Reward re) throws SQLException;
	public List<Reward> query(String str, Page page) throws SQLException;//���ݹؼ��ַ�ҳ��ѯ
	public List<Reward> queryEmAll(String eno, Page page) throws SQLException;//����Ա�����ŷ�ҳ��ѯ
	public List<Reward> queryAll(Page page) throws SQLException;//
	public double queryrew(String eno, String saltime) throws SQLException;//��ѯ��������
	public double querypun(String eno, String saltime) throws SQLException;//��ѯ�۷�����
}
