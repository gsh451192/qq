package com.tengxun.dao;

import com.tengxun.entity.List;
import com.tengxun.entity.Tally;

import java.util.ArrayList;

public interface TallyDao {
    public ArrayList<Tally> show(String intime,String otime);
    public int add(Tally t);
    public int dele(String id);
}
