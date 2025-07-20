package com.company.Utilte;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil { 
    private static final String URL = "jdbc:mysql://localhost:3306/hospital";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Maruthi@2002";

    static {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
          
        }catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load MySQL JDBC driver", e);
        }
    }
    public static Connection getConnection() throws SQLException {
    	
        String fullUrl = URL + "?useSSL=false&serverTimezone=UTC";
        return DriverManager.getConnection(fullUrl, USERNAME, PASSWORD);
    }
}