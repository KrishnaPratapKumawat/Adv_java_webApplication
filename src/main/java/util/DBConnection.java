package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

     public static Connection createConnection() {
            Connection conn = null;
            String url = "jdbc:mysql://localhost:3306/userapp";
            String UserName = "root";
            String password = "123456";
            try {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                } catch (Exception e) {
                    e.printStackTrace();

                }
                conn = DriverManager.getConnection(url, UserName, password);
                System.out.println("Connection Established");
            }catch (Exception e){
                e.printStackTrace();
            }
            return conn;
        }
    }


