package ch.vinnol.rickrollgenerator.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MariaDBConnection {

    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            String url = "jdbc:mariadb://localhost:3306/rickrollgeneratorm151";
            String username = "root";
            String password = "1234";
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException | ClassNotFoundException e) {
            throw new Error("Problem", e);
        }
        return conn;
    }
}
