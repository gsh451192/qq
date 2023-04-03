package com.tengxun.servite;

import com.tengxun.dao.ListDao;
import com.tengxun.dao.ListDaoimp;
import com.tengxun.entity.Admin;
import com.tengxun.entity.List;

import java.util.ArrayList;

public class ListServiteimp implements ListServite{
    private ListDao ld = new ListDaoimp();

    @Override
    public ArrayList<List> sele(String name, String sex, String number,String link1) {
        return ld.sele(name,sex,number,link1);
    }

    @Override
    public int add(List l) {
        return ld.add(l);
    }

    @Override
    public int dele(String id) {
        return ld.dele(id);
    }

    @Override
    public int update(List l) {
        return ld.update(l);
    }

    @Override
    public Admin login(String name, String pwd) {
        return ld.login(name,pwd);
    }

    @Override
    public int enroll(Admin a) {
        return ld.enroll(a);
    }
}
