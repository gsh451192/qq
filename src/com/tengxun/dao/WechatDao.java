package com.tengxun.dao;

import com.tengxun.entity.Admin;
import com.tengxun.entity.List;
import com.tengxun.entity.Wechat;

import java.util.ArrayList;

public interface WechatDao {
    public ArrayList<Wechat> sele(String name, String sex, String tel, String lid);

    public int add(Wechat w);

    public int update(Wechat w);

    public int dele(String id);

}
