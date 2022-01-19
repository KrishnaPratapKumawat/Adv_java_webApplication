package Dao;
import Model.Party;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class PartyUserDao {
    public static int userID() {
        int primaryKey = 0;
        Connection conn;
        try {
            conn = DBConnection.createConnection();
            PreparedStatement ps = conn.prepareStatement("select Max(partyId) as pk from userapp.partyuser");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                primaryKey = rs.getInt(1);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return primaryKey + 1;

    }

    public static Boolean ValidateUser(Party party) throws ClassNotFoundException {
        boolean result = true;
        int partyId = userID();
        try {
            Connection conn = DBConnection.createConnection();
            String dataInsertQuery = "INSERT INTO partyuser(partyid, firstname, lastname, address, city, zip, state, country, phone)VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(dataInsertQuery);
            statement.setInt(1, partyId);
            statement.setString(2, party.getFirstName());
            statement.setString(3, party.getLastname());
            statement.setString(4, party.getAddress());
            statement.setString(5, party.getCity());
            statement.setString(6, party.getZip());
            statement.setString(7, party.getState());
            statement.setString(8, party.getCountry());
            statement.setString(9, party.getPhone());
            String query="INSERT INTO userapp.userlogin"+"(username,password,partyid) values"+"(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, party.getUserName());
            ps.setString(2, party.getPassword());
            ps.setInt(3,partyId);
            statement.executeUpdate();
            statement.close();

            ps.executeUpdate();
            ps.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    return result;
    }
}


