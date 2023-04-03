package com.tengxun.dao;

import com.tengxun.entity.List;
import com.tengxun.entity.Tally;
import com.tengxun.util.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class TallyDaoimp implements TallyDao{
    @Override
    public ArrayList<Tally> show(String intime, String otime) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(date);
        ArrayList<Tally> alist = new ArrayList<>();
        Connection conn = BaseDao.getconn();
        String sql = "select * from tally where 1=1";
        if(intime!=null && intime!=""){
            sql+=" and time >'"+intime+"'";
        }
        if(otime!=null && otime!=""){
            sql+=" and time <'"+otime+"'";
        }
        System.out.println(sql+"---消费情况---"+time);
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet re = pstmt.executeQuery();
            while(re.next()){
                Tally t = new Tally(re.getInt(1),
                        re.getString(2),
                        re.getDouble(3),
                        re.getString(4));
                alist.add(t);
            }
            return alist;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int add(Tally t) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(date);
        Connection conn = BaseDao.getconn();
        String sql = "insert into tally values (null,?,?,?)";
        System.out.println(sql+"----QQ添加---"+time);
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,t.getTime());
            pstmt.setDouble(2,t.getPrice());
            pstmt.setString(3,t.getBir());
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
        String sql=" delete  from  tally  where  id  in("+id+")";
        System.out.println(sql+"----消费删除---"+time);
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
}
