package com.bswill.notification;

import org.springframework.jdbc.core.JdbcTemplate;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class NotificationDAOImpl implements NotificationDAO {
    private JdbcTemplate jdbcTemplate;

    public NotificationDAOImpl(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Notification> getAllNotifications() {
        String sql = "SELECT * FROM notification";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            return mapRowToNotification(rs);
        });
    }

    @Override
    public Notification getNotificationById(int id) {
        String sql = "SELECT * FROM notification WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> {
            return mapRowToNotification(rs);
        });
    }

    @Override
    public void createNotification(Notification notification) {
        String sql = "INSERT INTO notification (message, created_at) VALUES (?, ?)";
        jdbcTemplate.update(sql, notification.getNoti_title(), notification.getCreatedAt());
    }

    @Override
    public void deleteNotification(int id) {
        String sql = "DELETE FROM notification WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public void deleteAllNotifications() {
        String sql = "DELETE FROM notification";
        jdbcTemplate.update(sql);
    }

    private Notification mapRowToNotification(ResultSet rs) throws SQLException {
        Notification notification = new Notification();
        notification.setEmployee_id(rs.getInt("id"));
        notification.setNoti_title(rs.getString("message"));
        notification.setCreatedAt(rs.getDate("created_at"));
        return notification;
    }

	@Override
	public void readNotification(String link) {
		
	    
		
	}

	

	
    
    
}

