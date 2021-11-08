package ch.vinnol.rickrollgenerator.service;

import ch.vinnol.rickrollgenerator.connection.MSSQLConnection;
import ch.vinnol.rickrollgenerator.entity.Prank;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;

public class PrankService {

    public Connection connection = MSSQLConnection.getConnection();
    public Statement statement;

    public PrankService() {
        try {
            this.statement = connection.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Prank newPrank(Prank prank){
        ResultSet set = null;
        Prank returnPrank = null;
        try {
            set =statement.executeQuery("INSERT INTO Pranks (uid, title, description, imageURL, createDate, active, count) " +
                    "VALUES (" + prank.getUid() + " " + prank.getTitle() + " " + prank.getDescription() + " " + prank.getImageURL() + " " + prank.getCreateDate() + " " + prank.isActive() + " " + prank.getCount() + ")");
            returnPrank = setPrank(set.getLong("id"), set.getString("uid"), set.getString("title"), set.getString("description"), set.getString("imageURL"), LocalDateTime.parse(set.getString("createDate")), set.getBoolean("active"), set.getInt("count"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return returnPrank;
    }

    public Prank getPrankByUID(String uid) {
        Prank returnPrank = null;
        try {
            ResultSet set = statement.executeQuery("SELECT * FROM Pranks WHERE uid='" + uid + "'");
            returnPrank = setPrank(set.getLong("id"), set.getString("uid"), set.getString("title"), set.getString("description"), set.getString("imageURL"), LocalDateTime.parse(set.getString("createDate")), set.getBoolean("active"), set.getInt("count"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return returnPrank;
    }

    public void clicked(String uid) {
        try {
            // MSSQL  statement.executeQuery("EXEC IncreasCount @UID='" + uid + "'");
            statement.executeQuery("CAL IncreasCount('" + uid + "')");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Prank setPrank(Long id, String uid, String title, String description, String imageURL, LocalDateTime createDate, boolean active, int count){
        Prank prank = new Prank();
        prank.setId(id);
        prank.setUid(uid);
        prank.setTitle(title);
        prank.setDescription(description);
        prank.setImageURL(imageURL);
        prank.setCreateDate(createDate);
        prank.setActive(active);
        prank.setCount(count);
        return prank;
    }
}
