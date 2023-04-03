package com.tengxun.dao;

import java.util.ArrayList;

import com.tengxun.entity.Admin;
import com.tengxun.entity.List;

public interface ListDao {
	public ArrayList<List> sele(String name,String sex,String tel,String lid);

	public int add(List l);
	public int dele(String id);
	public int update(List l);
	public Admin login(String name,String pwd);
	public int enroll(Admin a);
}
