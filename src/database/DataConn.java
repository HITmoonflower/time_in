package database;


import java.sql.DriverManager;
import java.sql.Connection;

public class DataConn {
private static Connection connection;
private static final String driver = "com.mysql.jdbc.Driver";
//private static final String url = "jdbc:mysql://vbjdohencpml.mysql.sae.sina.com.cn:10630/lab2_data";
private static final String url = "jdbc:mysql://localhost:3306/pdo";
private static final String username = "root";
private static final String password = "11321x";
public Connection getConnection() {
  try {
    Class.forName(driver);
  }catch (ClassNotFoundException el) {
  }
  try {
    connection =  DriverManager.getConnection(url,username,password);
    System.out.println("link success");
  }catch (Exception e) {
    e.printStackTrace();
  }
  return connection;
}
}
