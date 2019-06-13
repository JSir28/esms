package cn.xr.dao;

import java.sql.SQLException;
import java.util.List;

import cn.xr.bean.*;

public interface RankDao {
	public boolean add(Rank r) throws SQLException;//����ְ��
	public boolean delete(String rno) throws SQLException;//ɾ��ְ��
	public boolean update(Rank r) throws SQLException;//����ְ��
	public Rank query(String rname) throws SQLException;//��ѯ����ְ��
	public List<Rank> queryAll() throws SQLException;//��ѯ����ְ����Ϣ
}
