package com.tengxun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.tengxun.dao.ListDao;
import com.tengxun.entity.Admin;
import com.tengxun.entity.List;
import com.tengxun.util.BaseDao;

import javax.xml.crypto.Data;

public class ListDaoimp implements ListDao{


	@Override
	public ArrayList<List> sele(String name, String sex, String number,String link1) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);

		ArrayList<List> alist = new ArrayList<>();
		Connection conn = BaseDao.getconn();
		String sql = "select * from list where 1=1";
		if(name!=null && name!=""){
			sql+=" and name like '%"+name+"%'";
		}
		if(sex!=null && sex!=""){
			sql+=" and sex ='"+sex+"'";
		}
		if(number!=null && number!=""){
			sql+=" and number like '%"+number+"%'";
		}
		if(link1!=null && link1!=""){
			sql+=" and link ='"+link1+"'";
		}

		System.out.println(sql+"----QQ查询---"+time);
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet re = pstmt.executeQuery();
			while(re.next()){
				int id = re.getInt(1);
				String name1 = re.getString(2);
				String sex1 = re.getString(3);
				String number1 = re.getString(4);
				int link = re.getInt(5);
				List l = new List(id,sex1, name1, number1,link);
				alist.add(l);
			}
			return alist;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int add(List l) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		Connection conn = BaseDao.getconn();
		String sql = "insert into list values (null,?,?,?,?)";
		System.out.println(sql+"----QQ添加---"+time);
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,l.getName());
			pstmt.setString(2,l.getSex());
			pstmt.setString(3,l.getNumber());
			pstmt.setInt(4,l.getLink());
			int le = pstmt.executeUpdate();
			return le;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int dele(String id) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		Connection conn = BaseDao.getconn();
		String sql=" delete  from  list  where  id  in("+id+")";
		System.out.println(sql+"----QQ删除---"+time);
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			int num = ps.executeUpdate();
			return  num;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{

		}
		return 0;
	}

	@Override
	public int update(List l) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		Connection conn = BaseDao.getconn();
		String sql = "update list set sex=?,name=?,number=?,link=? where id=?";
		System.out.println(sql+"----QQ修改---"+time);
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,l.getSex());
			pstmt.setString(2,l.getSex());
			pstmt.setString(3,l.getSex());
			pstmt.setInt(4,l.getLink());
			pstmt.setInt(5,l.getId());
			int le = pstmt.executeUpdate();
			return le;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public Admin login(String name, String pwd) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		Connection conn = BaseDao.getconn();
		String sql = "SELECT * FROM admin WHERE name=? and pwd = ?";
		System.out.println(sql+"----微服登录---"+time);
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,pwd);
			ResultSet re = pstmt.executeQuery();
			while(re.next()){
				Admin a = new Admin(re.getInt(1),re.getString(2),re.getString(3));
				return a;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int enroll(Admin a) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		Connection conn = BaseDao.getconn();
		String sql = "insert into admin values (null,?,?)";
		System.out.println(sql+"----注册添加---"+time);
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,a.getUname());
			pstmt.setString(2,a.getUpwd());

			int le = pstmt.executeUpdate();
			return le;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

}
