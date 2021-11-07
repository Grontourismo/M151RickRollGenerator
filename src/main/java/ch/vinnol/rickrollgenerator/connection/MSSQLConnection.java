package ch.vinnol.rickrollgenerator.connection;

import java.sql.*;

public class MSSQLConnection {

    public static Connection getConnection(){
        Connection conn = null;
        try {
            String url = "jdbc:sqlserver://LAPTOP-9IMNPBH8\\SQLEXPRESS;database=RickRollGeneratorM151;integratedSecurity=true";
            String username = "";
            String password = "";
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            throw new Error("Problem", e);
        }
        return conn;
    }
}
