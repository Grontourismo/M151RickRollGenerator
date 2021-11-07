package ch.vinnol.rickrollgenerator.connection;

import java.sql.*;

public class MSSQLConnection {

    public static Connection getConnection(){
        Connection conn = null;
        try {
            String url = "jdbc:sqlite:path-to-db-file/chinook/chinook.db";
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            throw new Error("Problem", e);
        }
        return conn;
    }
}
