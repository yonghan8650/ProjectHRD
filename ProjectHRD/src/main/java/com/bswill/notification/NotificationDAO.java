package com.bswill.notification;

import java.util.List;




public interface NotificationDAO {
	
    List<Notification> getAllNotifications();
	
    Notification getNotificationById(int id);
	
    void readNotification(String link);
    
    void createNotification(Notification notification);
	
    void deleteNotification(int id);
	
    void deleteAllNotifications();
}

