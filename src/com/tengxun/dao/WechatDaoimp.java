package com.tengxun.dao;

import com.tengxun.entity.Wechat;
import com.tengxun.util.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class WechatDaoimp implements WechatDao{
    @Override
    public ArrayList<Wechat> sele(String name, String sex, String tel, String lid) {
        ArrayList<Wechat> alist = new ArrayList<>();
        Connection conn = BaseDao.getconn();
        String sql = "select * from wechat,folk where wechat.lid=folk.lid ";
        if(name!=null && name!=""){
            sql+=" and wname like '%"+name+"%'";
        }
        if(sex!=null && sex!=""){
            sql+=" and wsex ='"+sex+"'";
        }
        if(tel!=null && tel!=""){
            sql+=" and wtel like '%"+tel+"%'";
        }
        if(lid!=null && lid!=""){
            sql+=" and lid ='"+lid+"'";
        }

        System.out.println(sql+"----微信查询");
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet re = pstmt.executeQuery();
            while(re.next()){
                int id = re.getInt(1);
                String name1 = re.getString(2);
                String sex1 = re.getString(3);
                String tel1 = re.getString(4);
                int lid1 = re.getInt(5);
                Wechat l = new Wechat(id,sex1,name1,tel1,lid1);
                alist.add(l);
            }
            return alist;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int add(Wechat w) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(date);
        Connection conn = BaseDao.getconn();
        String sql = "insert into wechat values (null,?,?,?,?)";
        System.out.println(sql+"----微信添加---"+time);
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,w.getWname());
            pstmt.setString(2,w.getWsex());
            pstmt.setString(3,w.getWtel());
            pstmt.setInt(4,w.getLid());
            int le = pstmt.executeUpdate();
            return le;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int update(Wechat w) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(date);
        Connection conn = BaseDao.getconn();
        String sql = "update wechat set wsex=?,wname=?,wtel=?,lid=? where wid=?";
        System.out.println(sql+"----微信修改---"+time);
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,w.getWsex());
            pstmt.setString(2,w.getWname());
            pstmt.setString(3,w.getWtel());
            pstmt.setInt(4,w.getLid());
            pstmt.setInt(5,w.getWid());
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
        String sql=" delete  from  wechat  where  wid  in("+id+")";
        System.out.println(sql+"----微信删除---"+time);
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            int num = ps.executeUpdate();
            return  num;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{

        }
        return 0;
    }
}
