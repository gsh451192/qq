package com.tengxun.servite;

import com.tengxun.entity.Tally;

import java.util.ArrayList;

public interface TallyServite {
    public ArrayList<Tally> show(String intime, String otime);
    public int add(Tally t);
    public int dele(String id);
}
