package com.bswill.notification;
import java.util.Date;

public class Notification {
    private int employee_id;
    private String noti_title;
    private Date createdAt;
    private String noti_link;
	
    public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int id) {
		this.employee_id = id;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String message) {
		this.noti_title = message;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getNoti_link() {
		return noti_link;
	}
	public void setNoti_link(String link) {
		this.noti_link = link;
	}
    
	

    // 생성자, getter, setter 생략
}

