package com.tengxun.entity;

public class Folk {
    private int lid;
    private String link;

    @Override
    public String toString() {
        return "Folk{" +
                "lid=" + lid +
                ", link='" + link + '\'' +
                '}';
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

    public Folk(int lid, String link) {
        this.lid = lid;
        this.link = link;
    }
}
