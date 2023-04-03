package com.tengxun.servite;

import com.tengxun.entity.Admin;
import com.tengxun.entity.List;

import java.util.ArrayList;

public interface ListServite {
    public ArrayList<List> sele(String name, String sex, String number,String link1);
    public int add(List l);
    public int dele(String id);
    public int update(List l);
    public Admin login(String name, String pwd);
    public int enroll(Admin a);
}
