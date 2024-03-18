package com.bswill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bswill.notification.NotificationDAO;

@Controller
public class NotificationController {
    private NotificationDAO notificationDAO;

    @Autowired
    public NotificationController(NotificationDAO notificationDAO) {
        this.notificationDAO = notificationDAO;
    }

    @GetMapping("/notifications")
    public String showNotifications(Model model) {
        model.addAttribute("notifications", notificationDAO.getAllNotifications());
        return "notification-list";
    }
}

