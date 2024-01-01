package com.user;

import java.sql.Date;


public class post 
{
private int id;
private String title;
private String content;
private Userdetails user;

public post(int id, String title, String content, Userdetails user) {
	super();
	this.id = id;
	this.title = title;
	this.content = content;

	this.user = user;
}
public post() {
	super();
	// TODO Auto-generated constructor stub
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Userdetails getUser() {
	return user;
}
public void setUser(Userdetails user) {
	this.user = user;
}





}
