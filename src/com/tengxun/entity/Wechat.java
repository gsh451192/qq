package com.tengxun.entity;

public class Wechat {
    private int wid;
    private String wsex;
    private String wname;
    private String wtel;
    private int lid;
    private String link;

    @Override
    public String toString() {
        return "Wechat{" +
                "wid=" + wid +
                ", wsex='" + wsex + '\'' +
                ", wname='" + wname + '\'' +
                ", wtel='" + wtel + '\'' +
                ", lid=" + lid +
                ", link='" + link + '\'' +
                '}';
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getWsex() {
        return wsex;
    }

    public void setWsex(String wsex) {
        this.wsex = wsex;
    }

    public String getWname() {
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname;
    }

    public String getWtel() {
        return wtel;
    }

    public void setWtel(String wtel) {
        this.wtel = wtel;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Wechat(int wid, String wsex, String wname, String wtel, int lid, String link) {
        this.wid = wid;
        this.wsex = wsex;
        this.wname = wname;
        this.wtel = wtel;
        this.lid = lid;
        this.link = link;
    }
    public Wechat(int wid, String wsex, String wname, String wtel, int lid) {
        this.wid = wid;
        this.wsex = wsex;
        this.wname = wname;
        this.wtel = wtel;
        this.lid = lid;

    }
    public Wechat(String wsex, String wname, String wtel, int lid) {
        this.wsex = wsex;
        this.wname = wname;
        this.wtel = wtel;
        this.lid = lid;

    }
}
