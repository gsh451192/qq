package com.tengxun.entity;

public class Tally {
    private int id;
    private String time;
    private Double price;
    private String bir;

    @Override
    public String toString() {
        return "Tally{" +
                "id=" + id +
                ", time='" + time + '\'' +
                ", price=" + price +
                ", bir='" + bir + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getBir() {
        return bir;
    }

    public void setBir(String bir) {
        this.bir = bir;
    }

    public Tally( String time, Double price, String bir) {
        this.time = time;
        this.price = price;
        this.bir = bir;
    }

    public Tally(int id, String time, Double price, String bir) {
        this.id = id;
        this.time = time;
        this.price = price;
        this.bir = bir;
    }
}
