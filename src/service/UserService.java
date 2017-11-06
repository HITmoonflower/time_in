package service;

import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import model.UserModel;
import database.DataConn;

public class UserService{  
	public int register(UserModel user) {
		PreparedStatement pst = null;
		Connection conn = null;
		int res = -1;
		try {
			conn = DataConn.getConnection();
			String sql = "insert into tableuser values(?,?)";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user.getUserId());
			pst.setString(2, user.getPassword());
			res = pst.executeUpdate();
			if(pst != null)
				pst.close();
			if(conn != null)
				conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	public int login(UserModel user) {
		PreparedStatement pst = null;
		Connection conn = null;
		ResultSet rs = null;
		int res = -1;
		try {
			conn = DataConn.getConnection();
			String sql = "select * from tableuser where userId = ? and password = ? limit 1";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user.getUserId());
			pst.setString(2, user.getPassword());
			rs = pst.executeQuery();
			if(rs.next()) {
				res = 1;
			}
			if(conn != null)
				conn.close();
			if(pst != null)
				pst.close();
			if(rs != null)
				rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
}  
