package Dao;

import Model.UserLogin;
import util.DBConnection;

import java.sql.*;

public class UserLoginDao {
    public static boolean validate(UserLogin userLogin) throws ClassNotFoundException {



        try {
            Connection connection = DBConnection.createConnection();
            String dBQuery = "select username , password from userlogin";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(dBQuery);

          while (rs.next()){
              if (rs.getString("username").equals(userLogin.getUserName()) && rs.getString("password").equals(userLogin.getPassword())){
                  String userData ="select * from partyuser natural join userlogin where username=?";
                  PreparedStatement preparedStatement=connection.prepareStatement(userData);
                  preparedStatement.setString(1,userLogin.getPassword());
                  ResultSet resultSet=preparedStatement.executeQuery();
                  return true;
              }

          }


            } catch (Exception e) {
          e.printStackTrace();
      }
    return false;
    }
}