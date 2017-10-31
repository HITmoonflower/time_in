package database;

import java.sql.*;

public class DataOperation {
	private static DataOperation instance = null;
	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;
	private DataOperation() {
	}
	public static DataOperation getInstance() {
		if (null == instance){
			instance = new DataOperation();
		}
		return instance;
	}

	public ResultSet query(String sql) {
		resultSet = null;
		connection = getConnection();
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}
	public int delete_save_updata(String sql) {
		int result = 0;
		connection = getConnection();
		try {
			statement = connection.createStatement();
			result = statement.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	private Connection getConnection() {
//		DbPool db = new DbPool();
//		Connection conn = db.getDbConnection();
		DataConn jd = new DataConn();
		Connection conn = jd.getConnection();
		return conn;
	}
	private void close() {
		if (null != statement) {
			try {
				statement.close();
				statement = null;
			}catch (SQLException e) {
				e.printStackTrace();
			}
			statement = null;
		}
		if (null != connection) {
			try {
				connection.close();
				connection = null;
			}catch (Exception e) {
				e.printStackTrace();
			}
			connection = null;
		}
	}
}
