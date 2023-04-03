package com.tengxun.entity;

public class List {
	private int id;
	private String sex;
	private String name;
	private String number;
	private int link;

	public int getLink() {
		return link;
	}

	public void setLink(int link) {
		this.link = link;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}

	@Override
	public String toString() {
		return "List{" +
				"id=" + id +
				", sex='" + sex + '\'' +
				", name='" + name + '\'' +
				", number='" + number + '\'' +
				", link=" + link +
				'}';
	}

	public List(String sex, String name, String number) {
		this.sex = sex;
		this.name = name;
		this.number = number;
	}

	public List(int id, String sex, String name, String number) {
		this.id = id;
		this.sex = sex;
		this.name = name;
		this.number = number;
	}

	public List(String sex, String name, String number, int link) {
		this.sex = sex;
		this.name = name;
		this.number = number;
		this.link = link;
	}

	public List(int id, String sex, String name, String number, int link) {
		this.id = id;
		this.sex = sex;
		this.name = name;
		this.number = number;
		this.link = link;
	}
}
