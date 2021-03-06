package com.java.levo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.ietf.jgss.Oid;



public class Account {
   private Connection connection;

   public Account(Connection connection) {
	  super();
	  this.connection = connection;
   }
 
   public void registerAccount(String user_email, String password, String account_role, String user_name, String user_address, String user_phone) throws SQLException {
       String sql = "INSERT INTO shopingphone.account (user_email, password, account_role, user_name, user_address, user_phone) VALUES (?, ?, ?, ?, ?, ?)";
       PreparedStatement preparedStatement = connection.prepareStatement(sql);
	   preparedStatement.setString(1, user_email);
	   preparedStatement.setString(2, password);
	   preparedStatement.setString(3, account_role);
	   preparedStatement.setString(4, user_name);
	   preparedStatement.setString(5, user_address);
	   preparedStatement.setString(6, user_phone);
	   preparedStatement.executeUpdate();
	   preparedStatement.close();
   }
   
	public String getNameAccount(String email) throws SQLException {
		String sql = "SELECT * FROM shopingphone.account where user_email = \""+email+"\"";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		String textString = "";
		while (rs.next()) {
			User user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			textString += user.getUser_name();
		}
		preparedStatement.close();
		return textString;
	}
   
   public boolean login(String user_email, String password) throws SQLException {
	    String sql = "SELECT COUNT(*) as count FROM shopingphone.account where user_email = ? and password = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, user_email);
		preparedStatement.setString(2, password);
		ResultSet resultSet = preparedStatement.executeQuery();
		int count = 0;
		if (resultSet.next()) {
			 count = resultSet.getInt("count");
		}
		resultSet.close();
		if (count == 0) {
			return false;
		}else {
			return true;
		}
   } 
   
   public void updateAccount(String user_email, String password, String account_role, String user_name ,String user_address, String user_phone, String key) throws SQLException {
	    String sql ="UPDATE shopingphone.account SET user_email = ?, password = ?, account_role = ?, user_name = ?, user_address = ?, user_phone= ? WHERE shopingphone.account.user_email = ?";
	    PreparedStatement preparedStatement = connection.prepareStatement(sql);
	    preparedStatement.setString(1, user_email);
	    preparedStatement.setString(2, password);
	    preparedStatement.setString(3, account_role);
	    preparedStatement.setString(4, user_name);
	    preparedStatement.setString(5, user_address);
	    preparedStatement.setString(6, user_phone);
	    preparedStatement.setString(7, key);
	    preparedStatement.executeUpdate();
		preparedStatement.close();
   }
   
   public boolean checkEmail(String email) throws SQLException {
	    String sql = "SELECT COUNT(*) as count FROM shopingphone.account where user_email = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, email);
		ResultSet resultSet = preparedStatement.executeQuery();
		int count = 0;
		if (resultSet.next()) {
			 count = resultSet.getInt("count");
		}
		resultSet.close();
		if (count == 0) {
			return false;
		}else {
			return true;
		}
   }
   public String getEmailAccount(String user_name) throws SQLException {
		String sql = "SELECT * FROM shopingphone.account where user_name = \""+user_name+"\"";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		String textString = "";
		while (rs.next()) {
			User user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			textString += user.getUser_email();
		}
		preparedStatement.close();
		return textString;
	}
   
   public void bookPhone(String phone_product_id) throws SQLException {
	   String sql = "DELETE FROM shopingphone.cart WHERE product_id = ?";
	   PreparedStatement preparedStatement = connection.prepareStatement(sql);
	   preparedStatement.setString(1, phone_product_id);
	   preparedStatement.executeUpdate();
	   preparedStatement.close();
   }
  
   
   public void addItems(String product_id, String user_email) throws SQLException {
       String sql = "INSERT INTO shopingphone.cart(product_id, user_email) VALUES (?, ?)";
       PreparedStatement preparedStatement = connection.prepareStatement(sql);
	   preparedStatement.setString(1, product_id);
	   preparedStatement.setString(2, user_email);
	   preparedStatement.executeUpdate();
	   preparedStatement.close();
   }
   
   public int getNumber(String email) throws SQLException {
		String sql = "SELECT * FROM shopingphone.cart where user_email = \""+email+"\"";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		int counter = 0;
		while (rs.next()) {
			counter++;
		}
		preparedStatement.close();
		return counter;
	}
   
   
}
